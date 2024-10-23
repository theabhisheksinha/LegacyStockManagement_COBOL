//CAT950AN JOB (BN1P,DAC0),'ACATS: ASCENDIS IN',CLASS=2,MSGCLASS=W,             
//        USER=BN1P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMD                                                               
//*JOBNOT SYSTEMD                                                               
//CA11STEP EXEC CA11                                                            
//STEP10  EXEC CAT950A,                                                         
//             RUNDATE='RERUN.EARLY.',                                          
//             CL=080,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             HNB=BNNN,                                                        
//             NAV=BNANNN,                                                      
//             PLAN='ACTBTCH'                                                   
//CAT950A.STEPLIB DD DSN=&RUNDATE.ADP.DATELIB,                                  
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//CAT950A.NAUPDTE DD DUMMY                                                      
