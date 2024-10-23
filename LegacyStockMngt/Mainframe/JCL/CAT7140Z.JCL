//CAT7140Z JOB (BZ0P,0000),'PURGE HISTORY       ',CLASS=5,MSGCLASS=W,           
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CAT714 - PURGE ASSET    HISTORY 30 DAYS OLD                       *         
//*          PURGE TRANSFER HISTORY 6 MONTH OLD                       *         
//*********************************************************************         
//STEP10  EXEC CAT714,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT714.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
