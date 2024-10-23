//CAT950A PROC CARDLIB='BISG.CARDLIB',                                          
//             CL=,                                                             
//             STREAM=Z,                  * CAT950A PARM BATCH STREAM *         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             DB2SYS='DB2PROD',                   DB2PROD/DB2TEST              
//             DB2SYS1='DB2PROD',                                               
//             BYPASS=,                            BYPASS DATE ABEND            
//             DISP='(,CATLG,DELETE)',                                          
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GEN='(0)',                                                       
//             GENP='(+1)',                                                     
//             HNB=,                                                            
//             NAV=,                                                            
//             PLAN='ACTBTCH',                                                  
//             REG=6M,                                                          
//             RUNDATE=,                                                        
//             UNIT=BATCH                                                       
//*                                                                             
//**********************************************************************        
//*CAT950A: READ ASCENDIS TRANSACTION FILE AND UPDATE OUR DATABASE     *        
//**********************************************************************        
//*                                                                             
//CAT950A  EXEC PGM=CAT950A,                                                    
//         REGION=&REG,                                                         
//         PARM='&CL&STREAM&BYPASS'                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//INPACAT  DD  DSN=&HNB..C&CL..INPACAT.ASCENDIS&GEN,                            
//             DISP=SHR                                                         
//OUTACAT  DD  DSN=&HNB..CAT950A.ECHO.C&CL..ASCENDIS&GENP,                      
//             DISP=&DISP,                                                      
//             DCB=(&GDG.RECFM=FB,LRECL=2000),                                  
//             SPACE=(CYL,(5,10),RLSE),                                         
//             UNIT=&UNIT                                                       
//NAUPDTE  DD  DSN=&HNB..CAT950A.C&CL..NAUPD&GENP,                              
//             DISP=&DISP,                                                      
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(2,5),RLSE),                                          
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=255)                           
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
