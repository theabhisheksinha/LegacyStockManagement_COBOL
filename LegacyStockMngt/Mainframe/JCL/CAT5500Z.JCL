//CAT5500Z JOB (BZ0P,0000),'ACAT CLT PROFILE',CLASS=5,MSGCLASS=W,               
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* UPDATE DB2 ACAT CLIENT PROFILE (VCLNTPRO) USING B1                *         
//*********************************************************************         
//STEP10  EXEC CAT550,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT550.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
