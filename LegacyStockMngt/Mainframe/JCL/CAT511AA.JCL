//CAT511AA JOB (BA0P,DY00),'ACATS WM/SIAC TRAN',CLASS=1,MSGCLASS=W,             
//         USER=BA0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* ---- SPECIAL RUN FOR CLIENT 235 (WEALTH MNGT) FEED --------       *         
//* THIS JOB RUNS FIVE TIMES A DAY TRIGGERED BY CAT510ZA              *         
//*********************************************************************         
//*********************************************************************         
//*CAT511:EXTRACT NSCC/SIAC ACATS MULTI-CYCLE TRANSACTION MRO (M FILE)*         
//*         FOR CLIENTS IN THIS STREAM                                *         
//*********************************************************************         
//STEP10  EXEC CAT511,                                                          
//             STREAM='A',                * STREAM INDICATOR          *         
//             BYP1=0,                    * BYP1=1= BYPASS CYCLE CHECK*         
//*                                       * BYP1=2= USE PREV CYCLE NBR*         
//*                                       * BYP1=3= USE NSCC CYCLE NBR*         
//             BYP2=0,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=0,                    * BYP3=1= BYPASS FILE CHECK *         
//*                                                                   *         
//             GEN00A='(+0)',             *I/P .CAT510.WM.ACATTRAN    *         
//             HNB1='BZZZ',               *I/P .CAT510.WM.ACATTRAN GDG*         
//             HNB2='BAAA',               *I/P .CAT511.WM.CYCLELOG GDG*         
//             HNB3='BAAA',               *O/P .CAT511.WM.ACATTRNS GDG*         
//             HNB4='BAAA',               *O/P .CAT511.WM.CYCLELOG GDG*         
//             WM='WM.'                   * WM FOR WEALTH MNGT RUN    *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEP20  EXEC CAT513,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BAAA',               *I/P .CAT511.WM.ACATTRNS    *         
//             WM='WM.',                  * WM FOR WEALTH MNGT RUN    *         
//             NAV='BNAAAA'               *I/P .BNA34.NAFILEA    VSAM *         
//CAT513.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEP30  EXEC CAT515,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BAAA',               *I/P .CAT511.WM.ACATTRNS    *         
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             WM='WM.'                   * WM FOR WEALTH MNGT RUN    *         
//CAT515.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEP40  EXEC CAT517,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             WM='WM.'                   * WM FOR WEALTH MNGT RUN    *         
//CAT517.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEP50  EXEC CAT519,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S1.AAA',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S1.AAA',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S1.AAA',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S1.AAA',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S1.AAA',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BAAA',               *I/P .CAT511.WM.ACATTRNS GDG*         
//             HNB9='S1.AAA',             *I/P .BNAT42.NACTAF    VSAM *         
//             WM='WM.',                  * WM FOR WEALTH MNGT RUN    *         
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             NAV='BNAAAA'               *I/P .BNA34.NAFILEA    VSAM *         
//CAT519.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT519.ACATDLVF DD DUMMY                                                      
//*********************************************************************         
//* CAT510B SET STATUS ON DATABASE TO INDICATE THAT                   *         
//*         THIS JOB/STREAM/CYCLE HAS FINISHED                        *         
//*********************************************************************         
//CAT510B EXEC CAT510B,                                                         
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             STREAM='W',                * WEALTH MANAGEMENT STREAM  *         
//             INF='BZZZ.CAT510.WM.ACATTRAN(+0)'                                
//CAT510B.STEPLIB  DD                                                           
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
