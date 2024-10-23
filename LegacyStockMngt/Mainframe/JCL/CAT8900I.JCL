//CAT8900I JOB (BI0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMI,                                                      
//             CLASS=1,MSGCLASS=W,USER=BI0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//STEP1   EXEC CAT890,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             HNB=BIII,                                                        
//             PLAN='ACTBTCH',                                                  
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM1=I                                                          
//CAT890.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//**********************************************************************        
//STEP2   EXEC CAT31,                                                           
//             GEN='(+1)',                                                      
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             CL=I,                                                            
//             HNB=BIII,                                                        
//             HNO=SI,                                                          
//             STRM=III,                                                        
//             HNO2=SI,                                                         
//             STRM2=III,                                                       
//             NAV=BNAIII,                                                      
//             SPADFL='SI.III.CMT01.SPADFL',                                    
//             RUNDATE='RERUN.EARLY.'                                           
//CAT892.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//CAT31.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                  
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
