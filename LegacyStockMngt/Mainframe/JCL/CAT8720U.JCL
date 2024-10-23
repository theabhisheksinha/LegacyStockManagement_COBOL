//CAT8720U JOB (BU1P,DY00),'ACATS ACTIVITY ',CLASS=3,MSGCLASS=W,                
//         SCHENV=STREAMU,                                                      
//         USER=BU1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT872,                                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             B1HDR='BZZZ.B1FL',                                               
//             HNB=BUUU,                                                        
//             HNB1=PBSU,                                                       
//             STREAM=U,                                                        
//             RUNDATE=                                                         
//CAT872.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
