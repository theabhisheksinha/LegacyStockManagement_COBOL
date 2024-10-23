//CAT5810Y JOB (BY0P,DY00),'ACAT DST EXTRACT',CLASS=1,MSGCLASS=W,               
//       SCHENV=STREAMF,USER=BY0P,                                              
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
//             CLIENT=313,                * 3 BYTE CLIENT NUMBER                
//             FUNDTYP=DST,               * FUND TYPE                           
//             HNB=BYYY,                  * EXTRACT               GDG           
//             HNB1='S3.YYY',             *BNWREGOP                             
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
//CAT581.OPNC      DD  DSN=&HNB..CAT581.CL313.DST&GENP                          
//SORT10.SORTIN    DD  DSN=&HNB..CAT581.CL313.DST&GENP                          
//SORT10.SORTOUT   DD  DSN=BIOS.C855.OUTMF720.C313(+1)                          
