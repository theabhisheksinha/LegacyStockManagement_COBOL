//CAT500R PROC B1FIL='BZZZ.B1FL.PROD',                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             CAT500=R,                                                        
//             DB2SYS='DB2PROD',                   DB2PROD/DB2TEST              
//             DB2SYS1='DB2PROD',                  DB2PROD/DB2TEST              
//             DISP1='(,CATLG,DELETE)',                                         
//             DISP2='(OLD,KEEP,KEEP)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GEN0='(0)',                                                      
//             GEN00='(0)',                                                     
//             GENP='(+1)',                                                     
//             HNB=,                                                            
//             NAV=,                                                            
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STRM=,                                                           
//             UNIT=BATCH                                                       
//*                                                                             
//**********************************************************************        
//*SORT10: SORT NSCC INPUT FILE BY RECEIVER NUMBER, ACAT CONTROL       *        
//*        NUMBER AND ASSET SEQUENCE NUMBER, EXCLUDING RECORDS FOR     *        
//*        DELIVERER SIDE                                              *        
//**********************************************************************        
//*                                                                             
//SORT10  EXEC PGM=IERRCO00,                                                    
//             REGION=&REG                                                      
//SORTIN   DD  DSN=&HNB..CAT500&STRM..NSCCIN&GEN0,                              
//             DISP=SHR                                                         
//SORTOUT  DD  DSN=&HNB..CAT500&CAT500&STRM..NSCCIN.SORTED&GENP,                
//             DISP=&DISP1,                                                     
//             SPACE=(CYL,(30,30),RLSE),                                        
//             DCB=(RECFM=VB,LRECL=2995,BLKSIZE=27998),                         
//             UNIT=&UNIT                                                       
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SYSIN    DD  DSN=BISG.CARDLIB(CAT500&CAT500),                                 
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SORTLIST DD  SYSOUT=*                                                         
//SORTMSG  DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//**********************************************************************        
//*CAT500R: CREATES A REPORT OF FUND REGISTRATIONS FOR RECEIVER SIDE   *        
//**********************************************************************        
//*                                                                             
//CAT500R EXEC PGM=CAT500&CAT500,                                               
//             REGION=&REG,                                                     
//             PARM=&STRM                                                       
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//FRINPUT  DD  DSN=&HNB..CAT500&CAT500&STRM..NSCCIN.SORTED&GENP,                
//             DISP=&DISP2                                                      
//FREPORT  DD  DSN=&HNB..CAT500&CAT500&STRM..RPTPI&GENP,                        
//             DISP=&DISP1,                                                     
//             DCB=(&GDG.RECFM=FB,LRECL=143),                                   
//             SPACE=(CYL,(20,10),RLSE),                                        
//             UNIT=&UNIT                                                       
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=&DUMP                                                     
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//**********************************************************************        
//* MERGE REPORT FILE WITH WRAP AROUND REPORT FILE BY CLIENT, CYCLE    *        
//**********************************************************************        
//*                                                                             
//SORT20  EXEC PGM=IERRCO00,                                                    
//             REGION=&REG                                                      
//SORTIN01 DD  DSN=&HNB..CAT500&CAT500&STRM..RPTPI&GENP,                        
//             DISP=SHR                                                         
//SORTIN02 DD  DSN=&HNB..CAT500&CAT500&STRM..TRAC&GEN00,                        
//             DISP=SHR                                                         
//SORTOUT  DD  DSN=&HNB..CAT500&CAT500&STRM..TRAC&GENP,                         
//             DISP=&DISP1,                                                     
//             DCB=(&GDG.RECFM=FB,LRECL=143),                                   
//             SPACE=(CYL,(20,10),RLSE),                                        
//             UNIT=&UNIT                                                       
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(10,20),RLSE)                              
//SYSIN    DD  DSN=BISG.CARDLIB(CAT500TR),                                      
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SORTLIST DD  SYSOUT=*                                                         
//SORTMSG  DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
