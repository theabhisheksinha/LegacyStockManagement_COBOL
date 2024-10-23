//CAT754  PROC B1HDR='BZZZ.B1FL',                                               
//             BRKRFL='SZ.ZZZ.CMT07.BROKER',                                    
//             CARDLIB='BISG.CARDLIB',   *DB2 PLAN CARDLIB            *         
//             DB2SYS='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST  *         
//             DB2SYS1='DB2PROD',       *DB2 &DB2SYS1..SDSNLOAD      *          
//             PLAN='ACTBTCH',           *DB2 PLAN CARDLIB MEMBER     *         
//             DUMP=Y,                   *DUMP OUTPUT CLASS                     
//             GDG='GDG,',               *O/P .CAT754.SPADFL       GDG*         
//             GENP='(+1)',              *O/P .CAT754.SPADFL       GDG*         
//             HNB=,                     *O/P .CAT754.SPADFL       GDG*         
//             REG=4M,                   *REGION SIZE                           
//             RUNDATE=,                 *PROCESS DATE                          
//             STREAM=,                  *CLIENT STREAM INDICATOR               
//             UNIT=BATCH                *O/P .CAT754.SPADFL       GDG*         
//*                                                                             
//* CREATE SPAD(SCRATCH PAD) RECORDS FOR ACAT ACTIVITIES                        
//*                                                                             
//CAT754  EXEC PGM=CAT754,                                                      
//             PARM='&STREAM',                                                  
//             REGION=&REG                                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//B1FIL    DD  DSN=&B1HDR,DISP=SHR                               I/P            
//BRKRFL   DD  DSN=&BRKRFL,DISP=SHR                              I/P            
//SPADFL   DD  DSN=&HNB..CAT754.SPADFL&GENP,                     O/P            
//             DISP=(,CATLG,DELETE),                                            
//             SPACE=(CYL,(10,5),RLSE),                                         
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,RECFM=VB,LRECL=92)                            
//SORTLIB  DD  DSN=SYS1.SORTLIB,                                                
//             DISP=SHR                                                         
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
//$ORTPARM  DD DSN=BISG.CARDLIB(SRTEQUAL),DISP=SHR                              
//SORTLIST DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//SYSABOUT DD  SYSOUT=&DUMP                                                     
