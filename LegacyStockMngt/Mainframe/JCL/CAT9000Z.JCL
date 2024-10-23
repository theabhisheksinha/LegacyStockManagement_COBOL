//CAT9000Z JOB (BP00,DY00),'ACAT VRSTSEC CONV',CLASS=1,MSGCLASS=W,              
//         PRTY=15,                                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* EXTRACT ACATS DETAILS THAT ARE PENDING BOOKING TONIGHT OR TOMORROW*         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//*********************************************************************         
//STEP10  EXEC CAT900,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BZZZ',                *O/P .CAT650DB.ACATPEND GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT900.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
