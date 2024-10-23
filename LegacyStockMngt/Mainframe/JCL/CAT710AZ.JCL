//CAT710AZ JOB (BP00,DY00),'WM ACAT POSN',CLASS=5,MSGCLASS=W,                   
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* PROCESS ACATS POSITION FILE FROM WEALTH MANAGEMENT.               *         
//* INSERT/UPDATE TRANSFER DB2 TABLE WITH END-OF-DAY STATUS.          *         
//*********************************************************************         
//STEP10  EXEC CAT710WM,                                                        
//             ACATPOSN='BIOS.C235.WM0718.ACAT.POSN(0)',                        
//             STREAM=Z,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             RUNID=WM            * WEALTH MNGT PROCESSING *                   
//CAT710.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CATMMF.MMFFL DD DUMMY                                                         
//*                                                                             
//*********************************************************************         
//* PROCESS ACATS FUND SERVE FILE FROM WEALTH MANAGEMENT.             *         
//*********************************************************************         
//CAT580  EXEC CAT580,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             INF='BIOS.C235.WM0720.ACAT.FUND(0)'   *I/P FROM WM   *           
//CAT580.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
