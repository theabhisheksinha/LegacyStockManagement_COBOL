//CAT6113Y JOB (BY0P,DY00),'ACAT NA UPD INTRADAY',CLASS=1,MSGCLASS=W,           
//         SCHENV=STREAMY,                                                      
//         USER=BY0P,SECLABEL=BISG                                              
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//*     INTRADAY NAME/ADDRESS UPDATE FILE AND REPORT CYCLE 3                    
//*                                                                             
//STEP10  EXEC CAT610,                                                          
//             CL=Y,                      * CLIENT STREAM             *         
//             HNB=BYYY,                                                        
//             NAV=BNAYYY,                                                      
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
