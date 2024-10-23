//CAT916HH JOB (BH0P,DY00),'ACATS COVERT HIST',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMH,                                                      
//         USER=BH0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF DB2NMSTR                                                              
//*JOBAFF DB2NMSTR                                                              
//*********************************************************************         
//* THIS JOB UPDATES DB2. IT IS RESTARTABLE.                          *         
//*********************************************************************         
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//*********************************************************************         
//*CAT810: LOAD LEHMAN ACATS SETTLED FULL DELIVERY TIFS INTO          *         
//*        ACAT DATABASE                                              *         
//*********************************************************************         
//STEP10  EXEC CAT916H,                                                         
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             NAV='BNAHHH',              *I/P .BNA34.NAFILEA    VSAM *         
//             PLAN='ACTBMK',             *TEMPORARY TEST MOCK PLAN             
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                                                        
//             STREAM=H                   * STREAM INDICATOR          *         
//CAT916H.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
