//CAT8741T JOB (BT0P,DY00),'ACAT: SET FAILS',CLASS=O,MSGCLASS=W,                
//         SCHENV=STREAMT,                                                      
//         USER=BT0P,PRTY=9,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//*                                                                             
//CA11STEP EXEC CA11                                                            
//*                                                                             
//STEP10  EXEC CAT874,                                                          
//             CLNT=TTT,                                                        
//             HNB=BTTT,                                                        
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
