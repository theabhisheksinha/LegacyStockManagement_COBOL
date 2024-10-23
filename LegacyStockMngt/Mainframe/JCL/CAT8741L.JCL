//CAT8741L JOB (BL0P,DY00),'ACAT: SET FAILS',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAML,                                                      
//         USER=BL0P,                                                           
//  SECLABEL=BISG                                                               
//*                                                                             
//*NODAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*JOBAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*                                                                             
//CA11STEP EXEC CA11                                                            
//*                                                                             
//STEP10  EXEC CAT874,                                                          
//             CLNT=LLL,                                                        
//             HNB=BLLL,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
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
