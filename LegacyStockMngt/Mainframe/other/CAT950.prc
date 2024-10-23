//CAT950  PROC CARDLIB='BISG.CARDLIB',                                          
//             CL=,                                                             
//             STREAM=Z,                  * CAT950 PARM BATCH STREAM *          
//             CYCLE=,                    * CAT950 BATCH CYCLE NUMBER           
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             DB2SYS='DB2PROD',                   DB2PROD/DB2TEST              
//             DB2SYS1='DB2PROD',                                               
//             BYPASS='      ',                    BYPASS DATE ABEND            
//             DISP='(,CATLG,DELETE)',                                          
//             DUMMY1=,                                                         
//             DUMMY2=,                                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             HNB=,                                                            
//             HNO1=BIOS,                                                       
//             NAV=,                                                            
//             PLAN='ACTBTCH',                                                  
//             REG=6M,                                                          
//             RUNDATE=,                                                        
//             UNIT=BATCH                                                       
//*                                                                             
//**********************************************************************        
//*GENER10: COPY BIOS FILE INTO A GDG INPACAT FILE                     *        
//**********************************************************************        
//*                                                                             
//GENER10  EXEC PGM=IEBGENER                                                    
//SYSUT1   DD  &DUMMY1.DSN=&HNO1..C&CL..INPACAT,                                
//             DISP=SHR                                                         
//SYSUT2   DD  DSN=&HNB..CAT950.INPACAT&CYCLE&GENP,                             
//             DISP=&DISP,                                                      
//             DCB=(&GDG.RECFM=VB,LRECL=2995,BLKSIZE=27998),                    
//             SPACE=(CYL,(30,30),RLSE),                                        
//             UNIT=&UNIT                                                       
//SYSIN    DD  DUMMY,DCB=BLKSIZE=80                                             
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//**********************************************************************        
//*CAT950: READ INPACAT FILE AND UPDATE OUR DATABASE                   *        
//**********************************************************************        
//*                                                                             
//CAT950   EXEC PGM=CAT950,                                                     
//         REGION=&REG,                                                         
//         PARM='&CL&STREAM&BYPASS&CYCLE'                                       
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
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//INPACAT  DD  DSN=&HNB..CAT950.INPACAT&CYCLE&GENP,                             
//             DISP=SHR                                                         
//OUTACAT  DD  DSN=&HNB..CAT950.OUTACAT&CYCLE&GENP,                             
//             DISP=&DISP,                                                      
//             DCB=(&GDG.RECFM=VB,LRECL=2995,BLKSIZE=27998),                    
//             SPACE=(CYL,(30,30),RLSE),                                        
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//**********************************************************************        
//*GENER20: COPY OUTACAT FILE INTO A BIOS FILE                         *        
//**********************************************************************        
//*                                                                             
//GENER20  EXEC PGM=IEBGENER                                                    
//SYSUT1   DD  DSN=&HNB..CAT950.OUTACAT&CYCLE&GENP,                             
//             DISP=SHR                                                         
//SYSUT2   DD  &DUMMY2.DSN=&HNO1..C&CL..OUTACAT,                                
//             DISP=OLD                                                         
//SYSIN    DD  DUMMY,DCB=BLKSIZE=80                                             
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
