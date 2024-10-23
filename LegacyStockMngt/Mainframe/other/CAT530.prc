//CAT530  PROC CL=' ',                                                          
//             ABND='N',                  USE 'N' TO BYPASS USER ABEND          
//             REG=2M,                                                          
//             RUNDATE=,                  JOB CAN RUN BEFORE DATE CHNG          
//             HNB=,                                                            
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             UNIT=BATCH,                                                      
//             SPACE='(CYL,(15,5),RLSE)',                                       
//             GENP='(+1)',                                                     
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             DUMP=Y                                                           
//**                                                                            
//******************************************************************            
//** CAT530 -                                                                   
//**                                                                            
//**    READS DB2 TRANSFER(ACTIVE) TABLE, CREATES REPORT FOR ASSET              
//**    REVIEW ERROR AFTER EACH CYCLE                                           
//***********************************************************                   
//***CAT530 IS DRIVEN BY CL= EXEC PARM VALUE                                    
//***********************************************************                   
//**                                                                            
//******************************************************************            
//CAT530  EXEC PGM=CAT530,                                                      
//             PARM='&CL&ABND',                                                 
//             REGION=&REG                                                      
//**                                                                            
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNLOAD,                                           
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//**                                                                            
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//**                                                                            
//REPORT   DD  DSN=&HNB..CAT530.RVEPI&GENP,                     O/P             
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE,                                                    
//             DCB=GDG                                                          
//**                                                                            
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK05 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTWK06 DD  UNIT=SYSDA,                                                      
//             SPACE=&SPACE                                                     
//SORTLIST DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//**                                                                            
