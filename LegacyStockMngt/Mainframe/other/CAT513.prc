//CAT513  PROC BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN00A='(+1)',             *I/P .CAT511.ACATTRNS       *         
//             HNB1='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='S1.AAA',             *I/P .BNADT05.ADTCUS   VSAM *         
//             DUMADT=,                   *I/P .BNADT05.ADTCUS  DUMMY *         
//             WM=,                       * WM FOR WEALTH MNGT RUN    *         
//             NAV='BNAAAA',              *I/P .BNA34.NAFILEA    VSAM *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* PROCESS "TI" TRANSFER RECORDS FROM NSCC M FILE.                   *         
//* OUTPUT = DB2 ACATS TRANSFER ACTIVE TABLE AND INIT TABLE           *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT513  EXEC PGM=CAT513,                                                      
//             PARM='&BYP1&BYP2&RERUN',                                         
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//NAFILEA   DD DSN=&NAV..BNA34.NAFILEA,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NAFILEI   DD DSN=&NAV..BNA34.NAFILEI,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//AUXFILE  DD  DSN=NULLFILE                                         I/P         
//INFILE   DD  DSN=&HNB1..CAT511.&WM.ACATTRNS&GEN00A,               I/P         
//             DISP=SHR                                                         
//ADTCUS   DD  &DUMADT.DSN=&HNB2..BNADT05.ADTCUS,                   I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
