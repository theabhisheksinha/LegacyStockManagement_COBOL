//CAT814DB PROC BYP1=0,                   * BYP1=1 BYPASS DATE CHECK  *         
//             BYP2=0,                    * BYP2=1 BYPASS FILE CHECK  *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GDGA='GDG,',               *O/P .CAT814DB.ACATBNK      *         
//             GEN00A='(+0)',             *I/P .BAC19.BNKMAST         *         
//             GENP1A='(+1)',             *O/P .CAT814DB.ACATBNK      *         
//             GETBNKM='3',               * GETBNKM=1 CURRENT-DATE    *         
//*------------GETBNKM                    * GETBNKM=2 PREVIOUS-DATE   *         
//*------------GETBNKM                    * GETBNKM=3 DETERMINE-DATE  *         
//             HNB1='BAAA',               *I/P .BAC19.BNKMAST     GDG *         
//             HNB2='S1.AAA',             *I/P .MGR35.CUSBAL     VSAM *         
//             HNB3='BAAA',               *O/P .CAT814DB.ACATBNK  GDG *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1='*',                *                           *         
//             PRTCL2='Y',                *                           *         
//             REGSIZE=8M,                *                           *         
//             RUNDATE=,                  *                           *         
//             SPACE1='(CYL,(1,1),RLSE)', *O/P .CAT814.ACATBNK GDG    *         
//             STREAM=A,                  * STREAM=? CLIENT STREAM IND*         
//             TEST=N,                    * TEST=Y PROGRAM TEST MODE  *         
//             UNIT='BATCH'                                                     
//*                                                                             
//*********************************************************************         
//* CAT814DB - CONVENIENCE ACCOUNTS PROCESSING                        *         
//*          - EXTRACT FULL DELIVER TRANSFER REQUESTS                 *         
//*          - THAT HAVE OUTSTANDING PAYMENTS ON THE BANK MASTER      *         
//*********************************************************************         
//CAT814DB EXEC PGM=CAT814DB,                                                   
//             PARM='&STREAM&BYP1&BYP2&GETBNKM&TEST',                           
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//BNKMASTI  DD DSN=&HNB1..BAC19.BNKMAST&GEN00A,             GETBNKM I/P         
//             DISP=SHR                                                         
//BNKMASTO  DD DUMMY                                        GETBNKM O/P         
//CUSBALV  DD  DSN=&HNB2..MGR35.CUSBAL,                                         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//ACATBNK   DD DSN=&HNB3..CAT814DB.ACATBNK&GENP1A,                  O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=600,RECFM=FB,BLKSIZE=27600)            
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
