//CAT7560F JOB (BF0P,DY00),'ACATS EOD AUTOWIRES',CLASS=1,MSGCLASS=W,            
//         SCHENV=STREAMF,                                                      
//         USER=BF0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*CAT756: EXTRACT AUTOWIRES DETAILS FROM ACATS DATABASE              *         
//*        FOR ACTIVE TRANSFERS                                       *         
//*        CONTAINS DB2 UPDATE, AND THIS STEP IS RESTARTABLE.         *         
//*********************************************************************         
//STEP10  EXEC CAT756,                                                          
//             STREAM=F,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             B1FIL='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB='BFFF',                *O/P .CAT756.WIRES      GDG *         
//             NAV='BNAFFF',              *I/P .BNA34.NAFILEA    VSAM *         
//             RUNDATE=                                                         
//CAT756.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*--------------------------------------------------------------------         
//*    UPLOAD ACAT WIRE MESSAGES TO CONFIGURATION DATABASE                      
//*--------------------------------------------------------------------         
//BDFWORI EXEC BDFWORI,                                                         
//             DB2ENV=P,                       * T-TEST, Q-QA, P-PROD *         
//             BDFDSN='BFFF.CAT756.WIRES(+1)',                                  
//             CATG=CTGRYC1,                   * BDF WORK CATEGORY    *         
//             DTYP=WIREREC,                   * BDF WORK DATA TYPE   *         
//             HCHK=BR14,                      * BDF DATA HEADER CHECK*         
//             TRACE=OF                        * ON TO TRACE          *         
//ADDWORK.DSNEXIT  DD   DISP=SHR,DSN=DB2PROD.GROUP.SDSNEXIT                     
//DSNLOAD  DD   DISP=SHR,DSN=DB2PROD.GROUP.SDSNLOAD                             
