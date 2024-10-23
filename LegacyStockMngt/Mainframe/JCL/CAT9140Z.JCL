//CAT9140Z JOB (BZ0P,0000),'DAY1 CONVERSION',CLASS=1,MSGCLASS=W,                
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                      REQUIRED FOR Q STREAM ONLY              
//*JOBAFF BALANCE1                      REQUIRED FOR Q STREAM ONLY              
//CA11STEP EXEC CA11                                                            
//S103    EXEC CAT914,HNB=BZZZ                                                  
//STEP10  EXEC CAT710,                                                          
//             ACATPOSN='BZZZ.NSCC.PMRO',                     * INPUT *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             MSDSUF=                    *MSD FILE SUFFIX .DUPE/BLANK*         
//CAT710.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//CATMMF.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
