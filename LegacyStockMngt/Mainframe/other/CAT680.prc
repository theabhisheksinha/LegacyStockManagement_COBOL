//CAT680  PROC DUMP=Y,                   USE 'N' TO BYPASS USER ABEND           
//          B1HDR='BZZZ.B1FL',                                                  
//          DB2SYS='DB2PROD',                                                   
//          DB2SYS1='SYS1',            *DB2 SYSTEM DB2PROD/DB2TEST *            
//          CARDLIB='BISG.CARDLIB',                                             
//          PLAN='ACTBTCH',                                                     
//          REG=2M,                                                             
//          BRKRFL='SZ.ZZZ.CMT07.BROKER',                                       
//          RUNDATE=,                  JOB CAN RUN BEFORE DATE CHNG             
//          STREAM=,                                                            
//          HNB=,                                                               
//          GDG='GDG,',                                                         
//          UNIT=BATCH,                                                         
//          GENP='(+1)'                                                         
//*                                                                             
//CAT680  EXEC PGM=CAT680,                                                      
//             PARM='&STREAM',                                                  
//             REGION=&REG                                                      
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                I/P             
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..DSNEXIT,DISP=SHR                                    
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//B1FIL    DD DSN=&B1HDR,DISP=SHR                                               
//*                                                                             
//BRKRFL   DD DSN=&BRKRFL,DISP=SHR                                              
//*                                                                             
//SPADFL   DD  DSN=&HNB..CAT680.SPADFL&GENP,                     O/P            
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(10,5),RLSE),                                         
//             DCB=(&GDG.DSORG=PS,RECFM=VB,LRECL=92)                            
//*                                                                             
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(10,10),RLSE)                                         
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(10,10),RLSE)                                         
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(10,10),RLSE)                                         
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(10,10),RLSE)                                         
//SORTWK05 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(10,10),RLSE)                                         
//SORTWK06 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(10,10),RLSE)                                         
//SORTLIST DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//****   END OF PROC                                                            
