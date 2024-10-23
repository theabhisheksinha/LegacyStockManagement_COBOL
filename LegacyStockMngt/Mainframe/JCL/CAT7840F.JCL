//CAT7840F JOB (BF0P,DY00),'ACAT TLE EDIT',CLASS=1,MSGCLASS=W,                  
//         SCHENV=STREAMF,                                                      
//        USER=BF0P,SECLABEL=BISG                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*-------------------------------------------------------------------*         
//* VERIFY TLE DETAILS.  PROCUCE NSSC FEED AND ERROR REPORT.          *         
//* CAT784DB IS A UPDATE DB2 PROGRAM AND MAY BE RESTARTED/RERAN.      *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT784DB,                                                        
//             HNB='BFFF',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=F,                  * 1 BYTE BATCH STREAM       *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
