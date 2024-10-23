//CAT7190Z JOB (BZ0P,0000),'PURGE INIT REQUEST  ',CLASS=5,MSGCLASS=W,           
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* DELETE INIT ASSETS FOR FULL TRANSFERS IN REQUEST STATUS           *         
//*********************************************************************         
//STEP10  EXEC CAT719,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT719.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
