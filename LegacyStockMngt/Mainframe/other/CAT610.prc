//CAT610  PROC ABND='Y',                  *USE 'N' TO BYPASS USER ABEND         
//             ACCTDEL=,                  *INTRADAY NOT NEEDED DUMMY  *         
//             B1FIL='BZZZ.B1FL',         *B1 VSAM FILE               *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             CAT610='CAT610',           *INTRADAY OVERRIDE          *         
//             CL='T',                    * CLIENT STREAM             *         
//             CYCLRUN='N',               *USE 'Y' TO RUN AFTER CYCLE 1         
//             CYCLNBR='00',              *FOR INTRA DAY USE          *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM                 *         
//             DISP='(NEW,CATLG,DELETE)', *CAT610 FILES           GDG *         
//             DUMMY=,                    *INTRADAY NOT NEEDED DUMMY  *         
//             DUMMY2='DUMMY,',           *INTRADAY ALT BR REPORT     *         
//             DUMMYO='DUMMY,',           *CAT610 ALTERNATE BRANCH VSM*         
//             DUMMYNQ='DUMMY,',          *NAME&ADDR ACTIVITY FILE VSM*         
//             DUMMYWR='DUMMY,',          *AUTO WIRES OUTPUT FILE     *         
//             GDG='GDG,',                *CAT610 FILES           GDG *         
//             GEN='(0)',                 *CAT714.ACCTDEL         GDG *         
//             GENP='(+1)',               *CAT610 FILES           GDG *         
//             HNB=,                      *CAT610 FILES           GDG *         
//             HNB2=BZZZ,                 *CAT714.ACCTDEL         GDG *         
//             HNO=SZ.ZZZ,                *CAT610 ALTERNATE BRANCH VSM*         
//             NAUPI='NAUPI',             *INTRADAY OVERRIDE          *         
//             ALTPI='ALTPI',             *INTRADAY ALTBR REP OVERRIDE*         
//             NAV=,                      *NAME/ADDRESS VSAM FILE     *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                  *JOB CAN RUN BEFORE DATE CHG*         
//             SPACE='(CYL,(15,5),RLSE)',                                       
//             SPACE1='(CYL,(5,2),RLSE)',                                       
//             SRTSPACE='(CYL,(15,5),RLSE)',                                    
//             UNIT=BATCH                                                       
//******************************************************************            
//*  CAT610 REPLACES CAT25                                                      
//*                                                                             
//*     READS DB2 TRANSFER(ACTIVE) TABLE RATHER THAN SIAC103 FILE               
//*     READS CURRENT ACAT B1 FILE                                              
//*     WRITES (1) NAME AND ADDRESS UPDATE RECORDS                              
//*            (2) DB2 KEY SAVE RECORDS (TO UPDATE ACAT DB2 TBL)                
//*            (3) MARGIN INTEREST RECORDS                                      
//*            (4) PERIODIC PAYMENT RECORDS                                     
//*                                                                             
//*  CAT612 (SPLITTED FROM CAT610)                                              
//*                                                                             
//*     READS DB2 KEY SAVE FILE                                                 
//*     UPDATES ACTIVE TRANSFER TABLE VIA DB2 KEY SAVE FILE                     
//*                                                                             
//* *********************************************************                   
//* * CAT25 IS DRIVEN BY CL= EXEC PARM VALUE                                    
//* *                                                                           
//* *   READS CURRENT DAYS ACAT FILE (SIAC103) FROM NSCC/SIAC                   
//* *   READS CURRENT B1 FILE                                                   
//* *   WRITES NAME AND ADDRESS UPDATE RECORDS                                  
//* *                                                                           
//* *********************************************************                   
//*                                                                             
//******************************************************************            
//CAT610  EXEC PGM=CAT610,                                                      
//             PARM='&CL&ABND&CYCLRUN&CYCLNBR',                                 
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
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//NAFILEAQ DD  &DUMMYNQ.DSN=&HNB..CAT610.NA.ACTIVITY(+1),       I/P             
//             DISP=SHR                                                         
//ALTBR    DD  &DUMMYO.DSN=&HNO..CAT610.ACATAB,                 I/P             
//             DISP=SHR                                                         
//ACCTDEL  DD  &ACCTDEL.DSN=&HNB2..CAT714.ACCTDEL&GEN,          I/P             
//             DISP=SHR                                                         
//NAWRAP   DD  &DUMMY.DSN=&HNB..CAT610.NAUP.WRAP.EOD&GEN,       I/P             
//             DISP=SHR                                                         
//NACCTDEL DD  &ACCTDEL.DSN=&HNB..CAT610.ACCTDEL&GENP,          O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=30)                            
//NAUPDTE  DD  DSN=&HNB..&CAT610..NAUPD&GENP,                   O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=255)                           
//DBSAVE   DD  DSN=&HNB..&CAT610..DBSAVE&GENP,                  O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=30)                            
//MGNINT   DD  &DUMMY.DSN=&HNB..CAT610.MGNINT&GENP,             O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=30)                            
//PPMNT    DD  &DUMMY.DSN=&HNB..CAT610.PPMNT&GENP,              O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=80)                            
//REPORT   DD  &DUMMY.DSN=&HNB..CAT610.PNDPI&GENP,              O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FBA,LRECL=143)                          
//REPORT2  DD  DSN=&HNB..&CAT610..&NAUPI&GENP,                  O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FBA,LRECL=143)                          
//ALTBREP  DD  &DUMMY2.DSN=&HNB..CAT611.&ALTPI&GENP,            O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FBA,LRECL=143)                          
//WIRES    DD  &DUMMYWR.DSN=&HNB..CAT611.WIRES&GENP,             O/P            
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=700)                           
//NAWRAPO  DD  DSN=&HNB..&CAT610..NAUP.WRAP&GENP,               O/P             
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=40)                            
//TEMP     DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE,                                                 
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)                                 
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=&SRTSPACE                                                  
//SYSOUT   DD SYSOUT=&PRTCL1                                                    
//SYSPRINT DD SYSOUT=&PRTCL1                                                    
//SYSUDUMP DD SYSOUT=&PRTCL2                                                    
//SYSABOUT DD SYSOUT=&PRTCL2                                                    
//*                                                                             
//CAT612  EXEC PGM=CAT612,                                                      
//             PARM='&CL',                                                      
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
//DBSAVE   DD  DSN=&HNB..&CAT610..DBSAVE&GENP,                  I/P             
//             DISP=SHR                                                         
//SYSOUT   DD SYSOUT=&PRTCL1                                                    
//SYSPRINT DD SYSOUT=&PRTCL1                                                    
//SYSUDUMP DD SYSOUT=&PRTCL2                                                    
//SYSABOUT DD SYSOUT=&PRTCL2                                                    
