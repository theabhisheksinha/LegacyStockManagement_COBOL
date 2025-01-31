//CAT890  PROC B1FIL='BZZZ.B1FL',                                               
//             BRKRFL='SZ.ZZZ.CMT07.BROKER',                                    
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD',                   DB2PROD/DB2TEST              
//             DB2SYS1='DB2PROD',                                               
//             DISP1='(,CATLG,DELETE)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             HNB=,                                                            
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM1=,                                                          
//             UNIT=BATCH                                                       
//**********************************************************************        
//CAT890   EXEC PGM=CAT890,                                                     
//         REGION=&REG,                                                         
//         PARM=&STRM1                                                          
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
//BRKRFL   DD  DSN=&BRKRFL,                                                     
//             DISP=SHR                                                         
//ACATDEL  DD  DSN=&HNB..CAT890.ACATDEL&GENP,                                   
//             DCB=(&GDG.DSORG=PS,RECFM=VB,LRECL=304),                          
//             DISP=&DISP1,                                                     
//             SPACE=(CYL,(15,5),RLSE),                                         
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
