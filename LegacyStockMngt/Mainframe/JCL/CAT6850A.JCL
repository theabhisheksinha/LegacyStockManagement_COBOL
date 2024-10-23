//CAT6850A JOB (BA0P,DY00),'ACAT: CRE RESCIND',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMA,                                                      
//         USER=BA0P,                                                           
//  SECLABEL=BISG                                                               
//*                                                                             
//*NODAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*JOBAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*                                                                             
//CA11STEP EXEC CA11                                                            
//*                                                                             
//STEP10  EXEC CAT685,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB=BAAA                                                         
//CAT685.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
