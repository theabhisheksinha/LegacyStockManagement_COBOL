//CAT8720I JOB (BI0P,DY00),'ACATS ACTIVITY ',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMI,                                                      
//         USER=BI0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT872,                                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             B1HDR='BZZZ.B1FL',                                               
//             HNB=BIII,                                                        
//             HNB1=PBSI,                                                       
//             STREAM=I,                                                        
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
