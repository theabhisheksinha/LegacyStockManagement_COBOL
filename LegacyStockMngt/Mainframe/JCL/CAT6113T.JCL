//CAT6113T JOB (BT0P,DY00),'ACAT NA UPD INTRADAY',CLASS=O,MSGCLASS=W,           
//         USER=BT0P,SECLABEL=BISG,SCHENV=STREAMT,PRTY=9                        
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//*     INTRADAY NAME/ADDRESS UPDATE FILE AND REPORT CYCLE 3                    
//*                                                                             
//STEP10  EXEC CAT610,                                                          
//             CL=T,                      * CLIENT STREAM             *         
//             HNB=BTTT,                                                        
//             NAV=BNATTT,                                                      
//             CYCLRUN='Y',               *INTRADAY CYCLRUN PARM = 'Y'*         
//             CAT610=CAT611,             *INTRADAY FILE NAME         *         
//             NAUPI='NA3PI',             *INTRADAY CYCLE REPORT NAME *         
//             DUMMY='DUMMY,',            *INTRADAY NO FEEDS REQUIRED *         
//             ACCTDEL='DUMMY,',          *INTRADAY FILE NOT NEEDED   *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             RUNDATE='RERUN.EARLY.'                                           
//CAT610.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT612.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
