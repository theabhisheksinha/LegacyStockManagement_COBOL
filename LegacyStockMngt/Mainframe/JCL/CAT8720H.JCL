//CAT8720H JOB (BH0P,DY00),'ACATS ACTIVITY ',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMH,                                                      
//         USER=BH0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//*                                                                             
//STEP10  EXEC CAT872,                    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             B1HDR='BZZZ.B1FL',         *DB2 PLAN CARDLIB MEMBER    *         
//             CARDLIB='BISG.CARDLIB',                                          
//             CAT872=,                                                         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GEN='(0)',                                                       
//             GENP='(+1)',                                                     
//             HNB=BHHH,                                                        
//             HNB1=PBSH,                                                       
//             PARM872='N',                                                     
//             PLYD='Y',                                                        
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STREAM=H,                                                        
//             TMP=TMP,                                                         
//             UNIT=BATCH                                                       
//CAT872.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
