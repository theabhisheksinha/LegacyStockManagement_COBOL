//CAT950AY JOB (BY0P,DAC0),'ACATS: ASCENDIS IN',CLASS=2,MSGCLASS=W,             
//         SCHENV=STREAMY,                                                      
//         USER=BY0P,PRTY=15,                                                   
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMD                                                               
//*JOBNOT SYSTEMD                                                               
//CA11STEP EXEC CA11                                                            
//STEP10  EXEC CAT950A,                                                         
//             RUNDATE='RERUN.EARLY.',                                          
//             CL=313,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             HNB=BYYY,                                                        
//             NAV=BNAYYY,                                                      
//             PLAN='ACTBTCH'                                                   
//CAT950A.STEPLIB DD DSN=&RUNDATE.ADP.DATELIB,                                  
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
