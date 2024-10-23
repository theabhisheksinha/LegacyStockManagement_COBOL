//CAT6111H JOB (BH0P,DY00),'ACAT NA UPD INTRADAY',CLASS=1,MSGCLASS=W,           
//         SCHENV=STREAMH,                                                      
//         USER=BH0P,SECLABEL=BISG                                              
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//*     INTRADAY NAME/ADDRESS UPDATE FILE AND REPORT CYCLE 1                    
//*                                                                             
//STEP10  EXEC CAT610,                                                          
//             CL=H,                      * CLIENT STREAM             *         
//             HNB=BHHH,                                                        
//             NAV=BNAHHH,                                                      
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             CYCLRUN='Y',               *INTRADAY CYCLRUN PARM = 'Y'*         
//             CAT610=CAT611,             *INTRADAY FILE NAME         *         
//             NAUPI='NA1PI',             *INTRADAY CYCLE REPORT NAME *         
//             DUMMY='DUMMY,',            *INTRADAY NO FEEDS REQUIRED *         
//             ACCTDEL='DUMMY,',          *INTRADAY FILE NOT NEEDED   *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT610.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT612.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
