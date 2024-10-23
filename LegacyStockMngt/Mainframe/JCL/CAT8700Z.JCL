//CAT8700Z JOB (BP00,DY00),'UPD ORDER IND',CLASS=1,MSGCLASS=W,                  
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* UPDATE OPEN ORDERS ON THE ACTIVE TRANSFER TABLE                   *         
//*********************************************************************         
//STEP10  EXEC CAT870,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',                                                  
//             HNB='BZZZ',              UNIVERSAL STREAM PREFIX         00033000
//             GENP1='(+1)',            GDG 1                           00036000
//             OUT='*',                 SYSOUT MSGCLASS                 00038000
//             PARM870=N,                                                       
//             BATCH=BATCH,             DISK AREA                       00031000
//             DUMP=Y                                                           
//CAT870.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
