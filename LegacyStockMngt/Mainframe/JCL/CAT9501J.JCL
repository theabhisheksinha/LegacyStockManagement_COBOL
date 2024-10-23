//CAT9501J JOB (BJ0P,DY00),'ACATS: JJJ FTP INPUT',CLASS=3,MSGCLASS=W,           
//        USER=BJ0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//CA11STEP EXEC CA11                                                            
//STEP10  EXEC CAT950,                                                          
//             RUNDATE='RERUN.EARLY.',                                          
//             CL=063,                                                          
//             CYCLE=1,                   * CAT950 BATCH CYCLE NUMBER           
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DUMMY1=,                                                         
//             DUMMY2=,                                                         
//             HNB=BJJJ,                                                        
//             NAV=BNAJJJ,                                                      
//             PLAN='ACTBTCH'                                                   
//CAT950.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//GENER10.SYSUT1 DD DSN=BIOS.C063.INPACAT.TRAN1,DISP=SHR                        
//GENER20.SYSUT2 DD DSN=BIOS.C063.OUTACAT.TRAN1.CNF,DISP=SHR                    
