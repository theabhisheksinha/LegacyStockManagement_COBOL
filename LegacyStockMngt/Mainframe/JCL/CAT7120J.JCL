//CAT7120J JOB (BJ0P,DY00),'PURGE PEND TO HIST  ',CLASS=1,MSGCLASS=W,           
//  SECLABEL=BISG,                                                              
//             USER=BJ0P,                                                       
//             SCHENV=STREAMJ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* PURGE SETTLED/REJECTED TRANSFER FROM ACTIVE TABLE AND             *         
//* ADD TO HISTORY                                                    *         
//*********************************************************************         
//STEP10  EXEC CAT712,                                                          
//             STREAM=J,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT712.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
