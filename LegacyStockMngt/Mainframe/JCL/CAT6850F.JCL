//CAT6850F JOB (BF0P,DY00),'ACAT: CRE RESCIND',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMF,                                                      
//         USER=BF0P,                                                           
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
//             HNB=BFFF                                                         
//CAT685.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
