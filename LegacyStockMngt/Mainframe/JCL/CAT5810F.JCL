//CAT5810F JOB (BF0P,DY00),'ACAT PNC EXTRACT',CLASS=1,MSGCLASS=W,               
//       SCHENV=STREAMF,USER=BF0P,                                              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//* READ FUNDSERV FEED SIAC0720 AND EXTRACT FILE HEADER, CLIENT HEADER          
//* CLIENT DETAILS FOR PNC FUNDS ONLY, AND CLIENT TRAILER TO PASS TO            
//* SURPASS.  THIS IS A READ ONLY JOB / CAN BE RESTARTED AS NEEDED.             
//*-------------------------------------------------------------------*         
//CAT581  EXEC CAT581,                                                          
//             STREAM=Z,                  * Q CAUSES QA DATE CHECK              
//             CLIENT=006,                * 3 BYTE CLIENT NUMBER                
//             HNB=BFFF,                  * EXTRACT               GDG           
//             HNB1='SF.FFF',             *BNWREGOP                             
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP'    *DB2 SYSTEM DB2PROD/DB2TEST *         
//CAT581.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
