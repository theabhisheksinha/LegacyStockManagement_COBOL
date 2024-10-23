//CAT874  PROC CARDLIB='BISG.CARDLIB',                                          
//             CLNT=,                                                           
//             DB2SYS='DB2PROD',                   DB2PROD/DB2TEST              
//             DB2SYS1='DB2PROD',                  DB2PROD/DB2TEST              
//             DISP1='(,CATLG,DELETE)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GEN0='(0)',                                                      
//             GENP='(+1)',                                                     
//             HNB=,                                                            
//             PLAN='ACTBTCH',                                                  
//             PARM874='      ',               USE BYPASS                       
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             UNIT=BATCH                                                       
//*                                                                             
//**********************************************************************        
//*CAT874:                                                                      
//**********************************************************************        
//*                                                                             
//CAT874  EXEC PGM=CAT874,                                                      
//             REGION=&REG,PARM='&PARM874'                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//T3RDFL   DD  DSN=VPB.&CLNT..VPACRV01.ACATTAG&GEN0,                            
//             DISP=SHR                                                         
//IPEND    DD  DSN=&HNB..CAT650SP.ACATPEND&GEN0,                                
//             DISP=SHR                                                         
//IFUND    DD  DSN=&HNB..CAT650.ACATFUND&GEN0,                                  
//             DISP=SHR                                                         
//ROLL866  DD  DSN=&HNB..CAT650.ROLLOVER&GEN0,                                  
//             DISP=SHR                                                         
//RPTPI    DD  DSN=&HNB..CAT874.RPTPI&GENP,                                     
//             DISP=&DISP1,                                                     
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143),                          
//             SPACE=(CYL,(20,10),RLSE),                                        
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=&DUMP                                                     
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
