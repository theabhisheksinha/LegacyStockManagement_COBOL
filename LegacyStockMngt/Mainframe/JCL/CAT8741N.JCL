//CAT8741N JOB (BN1P,DAC0),'ACAT: SET FAILS',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMN,                                                      
//         USER=BN1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11STEP EXEC CA11,                                                           
//             RMSPARM=P                                                        
//*                                                                             
//STEP10  EXEC CAT874,                                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             CLNT=NNN,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DUMP=Y,                                                          
//             HNB=BNNN,                                                        
//             PARM874='BYPASS',                                                
//             RUNDATE='RERUN.EARLY.'                                           
//CAT874.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//CAT874.T3RDFL DD DSN=VPB.&CLNT..VPACRV01.ID.ACATTAG&GEN0                      
//CAT874.IPEND  DD DUMMY                                                        
//CAT874.IFUND  DD DUMMY                                                        
//CAT874.ROLL866 DD DUMMY                                                       
//CAT874.RPTPI DD DSN=&HNB..CAT874.IDRPT&GENP                                   
