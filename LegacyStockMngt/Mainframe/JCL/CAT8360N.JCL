//CAT8360N JOB (BN1P,DAC0),'ACATS RR NOTIF ',CLASS=3,MSGCLASS=W,                
//         SCHENV=STREAMN,                                                      
//         USER=BN1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//*                                                                             
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//*                                                                             
//STEP10  EXEC CAT836,                    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             ABND='N',                  *DB2 PLAN CARDLIB MEMBER    *         
//             B1FIL='BZZZ.B1FL',          * CLIENT STREAM            *         
//             CARDLIB='BISG.CARDLIB',                                          
//             CL=N,                                                            
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DUMP=Y,                                                          
//             GENP='(+1)',                                                     
//             HNB=BNNN,                                                        
//             NAV=BNANNN,                                                      
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             SPACE='(CYL,(15,5),RLSE)',                                       
//             UNIT=BATCH                                                       
//CAT836.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
