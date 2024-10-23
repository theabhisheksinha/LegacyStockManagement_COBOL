//CAT7540S JOB (BS0P,0000),'ACATS SPAD MESSAGE  ',CLASS=1,MSGCLASS=W,           
//        SECLABEL=BISG,                                                        
//             USER=BS0P                                                        
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CREATE SPAD MESSAGE FILE                                          *         
//*********************************************************************         
//STEP10  EXEC CAT754,                                                          
//             HNB=BSSS,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=S                                                         
//CAT754.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
