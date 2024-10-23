//CAT7540T JOB (BT0P,DY00),'ACATS SPAD MESSAGE  ',CLASS=O,MSGCLASS=W,           
//         USER=BT0P,PRTY=9,SECLABEL=BISG,SCHENV=STREAMT                        
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CREATE SPAD MESSAGE FILE                                          *         
//*********************************************************************         
//STEP10  EXEC CAT754,                                                          
//             HNB=BTTT,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=T                                                         
//CAT754.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
