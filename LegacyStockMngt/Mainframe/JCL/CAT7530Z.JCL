//CAT7530Z JOB (BP00,DY00),'ACATS FNDSRV EXTR',CLASS=1,MSGCLASS=W,              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* EXTRACT ACATS DETAILS FOR ACATS FUNDSERV PROCESING AFTER CYCLE 5.           
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.                        
//*********************************************************************         
//STEP10  EXEC CAT650DB,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BZZZ',                *O/P .CAT650DB.ACATFNDS GDG *         
//             EXTR=ACATFNDS,             *EXTRACT FUNDSERV FILE                
//             RUNDATE=                                                         
//CAT650DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
