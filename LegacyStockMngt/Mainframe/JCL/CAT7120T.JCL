//CAT7120T JOB (BT0P,DY00),'PURGE PEND TO HIST  ',CLASS=O,MSGCLASS=W,           
//         SECLABEL=BISG,                                                       
//         PRTY=9,USER=BT0P,                                                    
//         SCHENV=STREAMT                                                       
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* PURGE SETTLED/REJECTED TRANSFER FROM ACTIVE TABLE AND             *         
//* ADD TO HISTORY                                                    *         
//*********************************************************************         
//STEP10  EXEC CAT712,                                                          
//             STREAM=T,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT712.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
