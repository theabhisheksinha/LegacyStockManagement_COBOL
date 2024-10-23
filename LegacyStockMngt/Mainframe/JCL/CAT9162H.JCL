//CAT9162H JOB (BH0P,DY00),'ACATS CVRT HST NA',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMH,                                                      
//         USER=BH0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF DB2NMSTR                                                              
//*JOBAFF DB2NMSTR                                                              
//*********************************************************************         
//* THIS JOB CREATES NA TIF FILES AND IS RESTARTABLE.                 *         
//*********************************************************************         
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//STEP10  EXEC CAT916H2,                                                        
//             HNB=BHHH,                                                        
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             B1FIL='BQQQ.B1FL',         *USE QA B1; PRODUCTION NG             
//             NAV='BNAHHH',              *I/P .BNA34.NAFILEA    VSAM *         
//             PLAN='ACTBMK',             *TEMPORARY TEST MOCK PLAN             
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             CL=Q                       * STREAM INDICATOR          *         
//CAT916H2.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                               
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
