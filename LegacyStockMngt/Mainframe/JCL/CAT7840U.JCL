//CAT7840U JOB (BU1P,DY00),'ACAT TLE EDIT',CLASS=1,MSGCLASS=W,                  
//         SCHENV=STREAMU,                                                      
//        USER=BU1P,                                                            
//  SECLABEL=BISG                                                               
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
//             HNB='BUUU',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=U,                  * 1 BYTE BATCH STREAM       *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
