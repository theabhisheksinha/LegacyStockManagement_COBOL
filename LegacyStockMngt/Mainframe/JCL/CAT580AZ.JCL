//CAT580AZ JOB (BP00,DY00),'ACATS VFNDSRVS WM',CLASS=1,MSGCLASS=W,              
//        PRTY=15,                                                              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT580  EXEC CAT580,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//           INF='BIOS.C235.INPZ.SIAC0720.ACAT.FUND(0)'  *I/P FROM WM*          
//CAT580.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*-------------------------------------------------------------------*         
//* EXTRACT POST SETTLEMENT DETAILS FROM SIAC0720 FILE                *         
//*-------------------------------------------------------------------*         
//CAT580PS EXEC CAT580PS,                                                       
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//           INF='BIOS.C235.INPZ.SIAC0720.ACAT.FUND(0)'  *I/P FROM WM*          
//CAT580PS.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
