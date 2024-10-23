//CAT7540A JOB (BA0P,DY00),'ACATS SPAD MESSAGE  ',CLASS=1,MSGCLASS=W,           
//         SCHENV=STREAMA,                                                      
//         USER=BA0P,SECLABEL=BISG                                              
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CREATE SPAD MESSAGE FILE                                          *         
//*********************************************************************         
//STEP10  EXEC CAT754,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB=BAAA,                                                        
//             STREAM=A                                                         
//CAT754.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
