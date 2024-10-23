//CAT7120F JOB (BF0P,DY00),'PURGE PEND TO HIST',CLASS=1,MSGCLASS=W,             
//  SECLABEL=BISG,                                                              
//             USER=BF0P,                                                       
//             SCHENV=STREAMF                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* PURGE SETTLED/REJECTED TRANSFER FROM ACTIVE TABLE AND             *         
//* ADD TO HISTORY                                                    *         
//*********************************************************************         
//STEP10  EXEC CAT712,                                                          
//             STREAM=F,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT712.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
