//CAT916  PROC STRM=,                                                           
//             CL=,                                                             
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',                                               
//             DSNLOAD='SDSNLOAD',                                              
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             DUMP=Y,                                                          
//             NAV=,                                                            
//             HNB=,                                                            
//             GEN='(0)',                                                       
//             REG=2M,                                                          
//             RUNDATE=                                                         
//*                                                                             
//CAT916  EXEC PGM=CAT916,                                                      
//             PARM='&STRM&CL',                                                 
//             REGION=&REG                                                      
//*                                                                             
//SYSOUT   DD  SYSOUT=*                                                         
//*                                                                             
//STEPLIB  DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                 
//         DD DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                    
//         DD DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                    
//         DD DSN=&DB2SYS1..&DSNLOAD,DISP=SHR                                   
//AFFOPCA  DD DSN=OPCA.AFFCARD,DISP=SHR                                         
//DSNPLAN  DD DSN=&CARDLIB(&PLAN),DISP=SHR                    *FOR DB2          
//*                                                                             
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                                         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=15,BUFND=200')                                       
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                                         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=15,BUFND=200')                                       
//PSDR     DD  DSN=&HNB..CAT20.ACATPSD.BKUP&GEN,                                
//             DISP=SHR                                                         
//*                                                                             
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//                                                                              
