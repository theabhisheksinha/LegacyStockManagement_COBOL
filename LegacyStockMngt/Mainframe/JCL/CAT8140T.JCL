//CAT8140T JOB (BT0P,DY00),'CONVENIENCE ACCOUNTS',CLASS=O,MSGCLASS=W,           
//         SCHENV=STREAMT,                                                      
//         USER=BT0P,PRTY=9,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB READS DB2 DATABASE.  THIS JOB CAN BE RERAN AT ANY STEPS. *         
//*********************************************************************         
//*********************************************************************         
//* CAT814DB - EXTRACT FULL DLVR REQUESTS FOR CONVENIENCE ACCOUNTS DB2*         
//*********************************************************************         
//STEP10  EXEC CAT814DB,                                                        
//             STREAM=T,                  * STREAM=? CLIENT STREAM IND*         
//             BYP1=0,                    * BYP1=1 BYPASS DATE CHECK  *         
//             BYP2=0,                    * BYP2=1 BYPASS FILE CHECK  *         
//             GETBNKM='3',               * GETBNKM=1 CURRENT-DATE    *         
//*------------                           * GETBNKM=2 PREVIOUS-DATE   *         
//*------------                           * GETBNKM=3 DETERMINE-DATE  *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDGA='GDG,',               *O/P .CAT814DB.ACATBNK      *         
//             GEN00A='(+0)',             *I/P .BAC19.BNKMAST         *         
//             GENP1A='(+1)',             *O/P .CAT814DB.ACATBNK      *         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             HNB1='BTTT',               *I/P .BAC19.BNKMAST     GDG *         
//             HNB2='S1.TTT',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB3='BTTT',               *O/P .CAT814DB.ACATBNK  GDG *         
//             PRTCL1='*',                *                           *         
//             PRTCL2='Y',                *                           *         
//             REGSIZE=8M,                *                           *         
//             RUNDATE=,                  *                           *         
//             SPACE1='(CYL,(1,1),RLSE)',    *O/P .CAT814.ACATBNK GDG *         
//             UNIT='BATCH'                                                     
//CAT814DB.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                               
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*********************************************************************         
//* CAT814 - CHECK BALNC AND CREATE BKPPG AND ADJUSTMENTS      NON-DB2*         
//*********************************************************************         
//STEP20  EXEC CAT814,                                                          
//             STREAM=T,                  * STREAM=? CLIENT STREAM IND*         
//             BYP1=0,                    * BYP1=1 BYPASS DATE CHECK  *         
//             BYP2=0,                    * BYP2=1 BYPASS FILE CHECK  *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P .CAT814.ACATCSH        *         
//             GDGB='GDG,',               *O/P .CAT814.BKPPG          *         
//             GEN00A='(+1)',             *I/P .CAT814DB.ACATBNK      *         
//             GENP1A='(+1)',             *O/P .CAT814.ACATCSH        *         
//             GENP1B='(+1)',             *O/P .CAT814.BKPPG          *         
//             HNB1='BTTT',               *I/P .CAT814DB.ACATBNK  GDG *         
//             HNB2='BTTT',               *O/P .CAT814.ACATCSH    GDG *         
//             HNB3='BTTT',               *O/P .CAT814.BKPPG      GDG *         
//             PRTCL1='*',                *                           *         
//             PRTCL2='Y',                *                           *         
//             REGSIZE=8M,                *                           *         
//             RUNDATE=,                  *                           *         
//             SPACE1='(CYL,(1,1),RLSE)',    *O/P .CAT814.ACATCSH GDG *         
//             SPACE2='(CYL,(1,1),RLSE)',    *O/P .CAT814.BKPPG   GDG *         
//             UNIT='BATCH'                                                     
//*-------------------------------------------------------------------*         
//* THE FOLLOWING STEP ADDED TO COPY CLIENT 63 QA P2 RECS TO CLIENT 166         
//*    IN THE T STREAM.                                                         
//*-------------------------------------------------------------------*         
//CAT901BK  EXEC CAT901BK                                                       
//INP2FROM DD  DSN=BQQQ.CAT814.BKPPG(0),                       I/P              
//             DISP=SHR                                                         
//INP2ORIG DD  DSN=BTTT.CAT814.BKPPG(+1),                      I/P              
//             DISP=SHR                                                         
//OUTP2    DD  DSN=BTTT.CAT814.BKPPG(+2),                      O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(DSORG=PS,RECFM=FB,LRECL=120)                                
