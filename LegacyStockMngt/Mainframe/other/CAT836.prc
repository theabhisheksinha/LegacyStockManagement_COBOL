//CAT836  PROC CL=' ',                                                          
//             ABND='N',                  USE 'N' TO BYPASS USER ABEND          
//             REG=2M,                                                          
//             RUNDATE=,                  JOB CAN RUN BEFORE DATE CHNG          
//             HNB=,                                                            
//             NAV=,                                                            
//             B1FIL='BZZZ.B1FL',                                               
//             UNIT=BATCH,                                                      
//             SPACE='(CYL,(15,5),RLSE)',                                       
//             GENP='(+1)',                                                     
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             DUMP=Y                                                           
//*                                                                             
//******************************************************************            
//*  CAT836 REPLACES CAT36                                                      
//*                                                                             
//*     READS DB2 TRANSFER(ACTIVE) TABLE RATHER THAN SIAC103 FILE               
//*     READS CURRENT ACAT B1 FILE                                              
//*     CREATE RR NOTIFICATION IN RR SEQUENCE                                   
//* *********************************************************                   
//* *CAT836 IS DRIVEN BY CL= EXEC PARM VALUE                                    
//* *********************************************************                   
//*                                                                             
//******************************************************************            
//CAT836  EXEC PGM=CAT836,                                                      
//             PARM='&CL&ABND',                                                 
//             REGION=&REG                                                      
//*                                                                             
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
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//*                                                                             
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//*                                                                             
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//*                                                                             
//REPORT   DD  DSN=&HNB..CAT836.RPTPI&GENP,                     O/P             
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=GDG                                                          
//*                                                                             
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK05 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK06 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTLIST DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
