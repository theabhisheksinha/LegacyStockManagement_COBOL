//CAT875A PROC B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             CYCLE=CAT875A,                                                   
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             DISP='(,CATLG,DELETE)',                                          
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             HNB=,                                                            
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STRM=,                                                           
//             UNIT=BATCH                                                       
//*                                                                             
//**********************************************************************        
//*CAT875A: SELECTS RECORDS FROM VTRNFR AND VASSET TABLES INTO FREQUEST*        
//**********************************************************************        
//*                                                                             
//CAT875A EXEC PGM=CAT875A,                                                     
//             PARM='&STRM',                                                    
//             REGION=&REG                                                      
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//B1FIL    DD  DSN=&B1FIL,DISP=SHR                                              
//FREQUEST DD  DSN=&HNB..&CYCLE..FREQUEST&GENP,                                 
//             DISP=&DISP,                                                      
//             DCB=(&GDG.RECFM=FB,LRECL=310,BLKSIZE=32550),                     
//             SPACE=(CYL,(20,10),RLSE),                                        
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
