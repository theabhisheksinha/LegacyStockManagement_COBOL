//CAT8160N JOB (BN1P,DAC0),'WITHHELD ASSETS RPT ',CLASS=3,MSGCLASS=W,           
//         SCHENV=STREAMN,                                                      
//         USER=BN1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//STEP10  EXEC CAT816,                    *JOB STREAM                 *         
//             BYP1=1,                    *O/P &HNB1.CAT816.WHDPI  GDG*         
//             BYP2=0,                                                          
//             B1HDR='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             GDG='GDG,',                                                      
//             GENP1A='(+1)',                                                   
//             HNB1='BNNN',                                                     
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PERMUN='BATCH',                                                  
//             PLAN='ACTBTCH',                                                  
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(1,1),RLSE)',                                        
//             STREAM=N                                                         
//CAT816.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
