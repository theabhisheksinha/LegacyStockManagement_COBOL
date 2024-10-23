//CAT7600L JOB (BL0P,DY00),'ACAT REVIEW RPT',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAML,                                                      
//        USER=BL0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT760  EXEC CAT760,                                                          
//             HNB=BLLL,                  *STREAM IND                 *         
//             CL=L,                      *STREAM IND                 *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH'             *DB2 PLAN CARDLIB MEMBER    *         
//CAT760.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
