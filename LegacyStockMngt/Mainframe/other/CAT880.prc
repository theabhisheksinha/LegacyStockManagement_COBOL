//CAT880  PROC B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD',                   DB2PROD/DB2TEST              
//             DB2SYS1='DB2PROD',                                               
//             DISP1='(,CATLG,DELETE)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GEN='(0)',                                                       
//             GENP='(+1)',                                                     
//             HNB=,                                                            
//             HNB1=,                              I/P: MGR35.CUSBAL            
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STREAM=,                                                         
//             UNIT=BATCH                                                       
//*                                                                             
//CAT880   EXEC PGM=CAT880,                                                     
//         PARM=&STREAM,                                                        
//         REGION=&REG                                                          
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
//CUSBALV  DD  DSN=&HNB1..MGR35.CUSBAL,                                         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=50,BUFND=90')                                        
//RPTPI    DD  DSN=&HNB..CAT880.RPTPI&GENP,                                     
//             DISP=&DISP1,                                                     
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143),                          
//             SPACE=(CYL,(10,20),RLSE),                                        
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//*-------------------------------------------------------------------*         
//*  CREATE REPORT OF TYPE2 DEBITS BOOKED INTO TYPE1 DUE TO B1 434734           
//*      THESE ARE FOR CASH BALANCES ONLY.                                      
//*-------------------------------------------------------------------*         
//CAT880C  EXEC PGM=CAT880C                                                     
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB..CAT650.TYPE2.CASH&GEN,                                 
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//RPTPI    DD  DSN=&HNB..CAT880C.CSPI&GENP,                                     
//             DISP=&DISP1,                                                     
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143),                          
//             SPACE=(CYL,(2,5),RLSE),                                          
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//*-------------------------------------------------------------------*         
//*  CREATE REPORT OF TYPE2 SHORTS BOOKED INTO TYPE1 DUE TO B1 434734           
//*      THESE ARE FOR NON CASH BALANCES ONLY.                                  
//*-------------------------------------------------------------------*         
//CAT880E  EXEC PGM=CAT880E                                                     
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB..CAT650.TYPE2.CASH&GEN,                                 
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//RPTPI    DD  DSN=&HNB..CAT880E.CSPI&GENP,                                     
//             DISP=&DISP1,                                                     
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143),                          
//             SPACE=(CYL,(2,5),RLSE),                                          
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
