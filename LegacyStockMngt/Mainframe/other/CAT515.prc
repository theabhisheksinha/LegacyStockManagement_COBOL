//CAT515  PROC BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN00A='(+1)',             *I/P .CAT511.ACATTRNS       *         
//             HNB1='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='S1.AAA',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB3='S1.AAA',             *I/P .MFRS.MFOPBR      VSAM *         
//             STREAM=Z,                  *BATCH STREAM Q/Z ONLY      *         
//             WM=,                       * WM FOR WEALTH MNGT RUN    *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX            *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PRNGFL='M13C.ZZZ.PRNG.PRNGFL',                                   
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* PROCESS "AT" ASSET RECORDS FROM NSCC M FILE.                      *         
//* OUTPUT = DB2 ACATS TRANSFER TABLES.                               *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT515  EXEC PGM=CAT515,                                                      
//             PARM='&BYP1&BYP2&RERUN&STREAM',                                  
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
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                   I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                    I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                         I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//MSDISIN  DD  DSN=BB.ZZZ.BDV03.MSDISIN.DUPE,DISP=SHR,              I/P         
//             AMP='BUFND=180,BUFNI=3'                                          
//MSDISXF  DD  DSN=POVZ.PMSD.BDV03.MSDISXF,DISP=SHR,                I/P         
//             AMP='BUFND=180,BUFNI=3'                                          
//PRNGFL   DD  DSN=&PRNGFL,                                         I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//INFILE   DD  DSN=&HNB1..CAT511.&WM.ACATTRNS&GEN00A,               I/P         
//             DISP=SHR                                                         
//BNWREGOP DD  DSN=&HNB2..BNW50.NTWREGOP,                           I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MFOPBR   DD  DSN=&HNB3..MFRS.MFOPBR,                              I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
