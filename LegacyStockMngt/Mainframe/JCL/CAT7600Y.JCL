//CAT7600Y JOB (BY0P,DY00),'ACAT REVIEW RPT',USER=BY0P,CLASS=1,                 
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG,PRTY=13                                                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT760  EXEC CAT760,                                                          
//             HNB=BYYY,                  *STREAM IND                 *         
//             CL=Y,                      *STREAM IND                 *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH'             *DB2 PLAN CARDLIB MEMBER    *         
//CAT760.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
