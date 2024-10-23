//CAT8900P JOB (BP0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMP,                                                      
//             CLASS=1,MSGCLASS=W,USER=BP0P,                                    
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
//             HNB=BPPP,                                                        
//             PLAN='ACTBTCH',                                                  
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM1=P                                                          
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
//             CL=P,                                                            
//             HNB=BPPP,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             HNO=SP,                                                          
//             HNO2=SP,                                                         
//             STRM=PPP,                                                        
//             STRM2=PPP,                                                       
//             NAV=BNAPPP,                                                      
//             SPADFL='SP.PPP.CMT01.SPADFL',                                    
//             RUNDATE='RERUN.EARLY.'                                           
//CAT892.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//CAT892.POSVSAM1 DD DUMMY                                                      
//CAT892.POSVSAM2 DD DSN=SP.PPP.OMG27.DPHLD1AL,DISP=SHR                         
//CAT31.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                  
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
