//CAT8740Y JOB (BY0P,0000),'ACAT: SET FAILS',USER=BY0P,CLASS=1,                 
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG                                                               
//*                                                                             
//*NODAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*JOBAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*                                                                             
//CA11STEP EXEC CA11                                                            
//*                                                                             
//STEP10  EXEC CAT874,                                                          
//             CLNT=YYY,                                                        
//             HNB=BYYY,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT874.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
