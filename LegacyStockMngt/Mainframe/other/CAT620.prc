//CAT620  PROC DUMP=Y,                                                          
//          HNB=,                      * QSAM FEED TO ZIFP                      
//          HNB1=,                     * BACKUP FILE FOR VSAM                   
//          VSAMFEE=,                  * PAPER FEE VSAM DSN                     
//          REG=8M,                    *                                        
//          DB2SYS='DB2PROD',          * DB2PROD/DB2TEST                        
//          DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *            
//          CARDLIB='BISG.CARDLIB',                                             
//          PLAN='ACTBTCH',                                                     
//          SPACE='(CYL,(2,5),RLSE)',  *O/P .CAT620.PAPER      GDG *            
//          GENP='(+1)',               *O/P                        *            
//          UNIT='BATCH',                                                       
//          GDG='GDG,',                                                         
//          RUNDATE=                                                            
//*                                                                             
//*********************************************************************         
//* SELECT FULL RECEIVES IN REVIEW AND PTR DELIVERY TRANSERS IN MEMO  *         
//* REQUEST, WHICH WERE FOUND BY BATCH TO HAVE AN ACCOUNT FREEZE.     *         
//* WHEN A REJECT ROW EXISTS ON HOLD, UPD IT TO BE ELIGABLE TO SUBMIT,*         
//* AND WILL GO OUT ON CYCLE 1 OF NEXT BUSINESS DAY.                  *         
//* THIS IS AN UPDATE JOB AND IS RESTARTABLE.                         *         
//*********************************************************************         
//STEP10  EXEC IDCAMS                                                           
//DD1     DD DSN=&VSAMFEE,DISP=SHR                                              
//DD2     DD DSN=&HNB1..CAT620.PAPER.STMNT.FEE&GENP,                            
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=85)                            
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN   DD DSN=&CARDLIB(REPRO),DISP=SHR                                       
//*                                                                             
//CAT620  EXEC PGM=CAT620,                                                      
//             REGION=&REG                                                      
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//PAPERFEE DD  DSN=&VSAMFEE,DISP=SHR                                            
//PAPEROUT DD  DSN=&HNB..CAT620.PAPER.STMNT.FEE&GENP,                           
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=85)                            
//SYSOUT   DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
