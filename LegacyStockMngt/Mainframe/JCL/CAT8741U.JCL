//CAT8741U JOB (BU1P,DY00),'ACAT: SET FAILS',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMU,                                                      
//         USER=BU1P,                                                           
//  SECLABEL=BISG                                                               
//*                                                                             
//*NODAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*JOBAFF BALANCE1                            REQUIRED FOR PROD ONLY            
//*                                                                             
//CA11STEP EXEC CA11                                                            
//*                                                                             
//STEP10  EXEC CAT874,                                                          
//             CLNT=UUU,                                                        
//             HNB=BUUU,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
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
