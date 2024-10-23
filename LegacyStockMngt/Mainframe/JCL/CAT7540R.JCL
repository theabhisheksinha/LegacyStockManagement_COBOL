//CAT7540R JOB (BR0P,0000),'ACATS SPAD MESSAGE  ',CLASS=1,MSGCLASS=W,           
//             PRTY=15,SECLABEL=BISG,                                           
//             USER=BR0P                                                        
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CREATE SPAD MESSAGE FILE                                          *         
//*********************************************************************         
//STEP10  EXEC CAT754,                                                          
//             HNB=BRRR,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=R                                                         
//CAT754.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
