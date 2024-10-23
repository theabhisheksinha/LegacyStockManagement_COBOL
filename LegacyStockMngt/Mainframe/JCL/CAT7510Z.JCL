//CAT7510Z JOB (BP00,DY00),'ACATS MARGIN EXTR',CLASS=1,MSGCLASS=W,              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCED                                                              
//*JOBAFF BALANCED                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* EXTRACT ACATS DETAILS FOR SPECIAL MARGIN CALCULATION.  THIS FILE            
//* CONTAINS ACAT RECEIVER DETAILS IN REVEIW DAY 1 STATUS.                      
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.                        
//*********************************************************************         
//STEP10  EXEC CAT650DB,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BZZZ',                *O/P .CAT650DB.ACATMRGN GDG *         
//             EXTR=ACATMRGN,             *EXTRACT SPECIAL MRGN FILE            
//             RUNDATE=                                                         
//CAT650DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//SORT10.SYSIN DD DSN=BISG.CARDLIB(CAT751S1),DISP=SHR                           
//*                                                                             
//*-------------------------------------------------------------------*         
//*  OMIT FUND ASSETS MARKED FOR DELETE FROM SPECIAL MARGIN CALC FILE *         
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT751,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BZZZ',                *O/P .CAT650DB.ACATMRGN GDG *         
//             EXTR=ACATMRGN,             *EXTRACT SPECIAL MRGN FILE            
//             RUNDATE=                                                         
//CAT751.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
