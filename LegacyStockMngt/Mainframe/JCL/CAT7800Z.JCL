//CAT7800Z JOB (BP00,DY00),'ACATS TAXLOT EXT',CLASS=1,MSGCLASS=W,               
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//* EXTRACT ACATS DELIVERY DETAILS TO PASS TO TAX LOT ENGINE(S).      *         
//* CAT780DB IS A NON-UPDATE DB2 PROGRAM AND MAY BE RESTARTED/RERAN.  *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT780DB,                                                        
//             BYP1=1,                    * 1=BYPASS DATE CHECK 1666  *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BZZZ',                *I/P .CATPPL.BROKER     GDG *         
//             RUNDATE=                                                         
//CAT780DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
