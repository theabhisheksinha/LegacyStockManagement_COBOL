//CAT7540F JOB (BF0P,DY00),'ACATS SPAD MESSAGE  ',CLASS=1,MSGCLASS=W,           
//         USER=BF0P,SECLABEL=BISG,SCHENV=STREAMF                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CREATE SPAD MESSAGE FILE                                          *         
//*********************************************************************         
//STEP10  EXEC CAT754,                                                          
//             HNB=BFFF,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=F                                                         
//CAT754.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
