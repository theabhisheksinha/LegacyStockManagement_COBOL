//CAT7230Z JOB (BZ0P,0000),'PURGE INIT NON ACTIV',CLASS=5,MSGCLASS=W,           
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* DELETE INIT ASSETS AND INIT TRANSFERS IF ACAT CONTROL NUMBER      *         
//* IS POPULATED AND NOT FOUND ON ACTIVE TRANSFER TABLE.              *         
//* CAT730 IS TO DELETE SECURITY FROM VRSDSEC IF NOT ON MSD                     
//* THIS IS AN UPDATE JOB AND IS RESTARTABLE.                                   
//*********************************************************************         
//STEP10  EXEC CAT723,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT723.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//STEP20  EXEC CAT730,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT730.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
