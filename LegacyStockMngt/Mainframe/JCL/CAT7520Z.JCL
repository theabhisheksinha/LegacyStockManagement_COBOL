//CAT7520Z JOB (BP00,DY00),'ACATS SHADOW EXTR',CLASS=1,MSGCLASS=W,              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCED                                                              
//*JOBAFF BALANCED                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* EXTRACT ACATS DETAILS FOR ACATS SHADOW POSTING.                             
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.                        
//*********************************************************************         
//STEP10  EXEC CAT650DB,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BZZZ',                *O/P .CAT650DB.ACATSHAD GDG *         
//             EXTR=ACATSHAD,             *EXTRACT SHADOW FILE                  
//             RUNDATE=                                                         
//CAT650DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
