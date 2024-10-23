//CAT8140I JOB (BI0P,DY00),'CONVENIENCE ACCOUNTS',CLASS=1,MSGCLASS=W,           
//         SCHENV=STREAMI,                                                      
//         USER=BI0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB READS DB2 DATABASE.  THIS JOB CAN BE RERAN AT ANY STEPS. *         
//*********************************************************************         
//*********************************************************************         
//* CAT814DB - EXTRACT FULL DLVR REQUESTS FOR CONVENIENCE ACCOUNTS DB2*         
//*********************************************************************         
//STEP10  EXEC CAT814DB,                                                        
//             STREAM=I,                  * STREAM=? CLIENT STREAM IND*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
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
//             HNB1='BIII',               *I/P .BAC19.BNKMAST     GDG *         
//             HNB2='SI.III',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB3='BIII',               *O/P .CAT814DB.ACATBNK  GDG *         
//             PRTCL1='*',                *                           *         
//             PRTCL2='Y',                *                           *         
//             REGSIZE=8M,                *                           *         
//             RUNDATE=,                  *                           *         
//             SPACE1='(CYL,(1,1),RLSE)',    *O/P .CAT814.ACATBNK GDG *         
//             UNIT='BATCH'                                                     
//CAT814DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*********************************************************************         
//* CAT814 - CHECK BALNC AND CREATE BKPPG AND ADJUSTMENTS      NON-DB2*         
//*********************************************************************         
//STEP20  EXEC CAT814,                                                          
//             STREAM=I,                  * STREAM=? CLIENT STREAM IND*         
//             BYP1=0,                    * BYP1=1 BYPASS DATE CHECK  *         
//             BYP2=0,                    * BYP2=1 BYPASS FILE CHECK  *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P .CAT814.ACATCSH        *         
//             GDGB='GDG,',               *O/P .CAT814.BKPPG          *         
//             GEN00A='(+1)',             *I/P .CAT814DB.ACATBNK      *         
//             GENP1A='(+1)',             *O/P .CAT814.ACATCSH        *         
//             GENP1B='(+1)',             *O/P .CAT814.BKPPG          *         
//             HNB1='BIII',               *I/P .CAT814DB.ACATBNK  GDG *         
//             HNB2='BIII',               *O/P .CAT814.ACATCSH    GDG *         
//             HNB3='BIII',               *O/P .CAT814.BKPPG      GDG *         
//             PRTCL1='*',                *                           *         
//             PRTCL2='Y',                *                           *         
//             REGSIZE=8M,                *                           *         
//             RUNDATE=,                  *                           *         
//             SPACE1='(CYL,(1,1),RLSE)',    *O/P .CAT814.ACATCSH GDG *         
//             SPACE2='(CYL,(1,1),RLSE)',    *O/P .CAT814.BKPPG   GDG *         
//             UNIT='BATCH'                                                     
