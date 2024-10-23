//CAT575  PROC B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             CYCLE=,                                                          
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             DISP='(,CATLG,DELETE)',                                          
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP1=,                             FREQUEST                     
//             GENP2=,                             FRFILE                       
//             GENPP='(+2)',                       FRFILE+2                     
//             HNB=,                                                            
//             HNO=,                                                            
//             HNB1=,                     *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             NAV=,                                                            
//             ID=,                       *INTRA-DAY FILES                      
//             DY=ID,                     *3PM RUN=DY, INTRA-DAY=ID             
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX            *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PLAN='ACTBTCH',                                                  
//             DUMADT=,                                                         
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STRM=,                                                           
//             UNIT=BATCH                                                       
//*                                                                             
//**********************************************************************        
//*CAT575B: READ FREQUEST, OBTAIN INFO FROM B1 , N&A, MFRRNM, NTWREGOP *        
//**********************************************************************        
//*                                                                             
//CAT575B EXEC PGM=CAT575B,                                                     
//             REGION=&REG                                                      
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//FREQUEST DD  DSN=&HNB..&CYCLE..&ID.FREQUEST&GENP1,                            
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//NTWMAST  DD  DSN=&HNB1..BNW50.NTWMAST,       I/P                              
//             AMP=('BUFNI=50,BUFND=90'),                                       
//             DISP=SHR                                                         
//NTWREGOP DD  DSN=&HNB1..BNW50.NTWREGOP,                                       
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NTWMASTV DD  DSN=&HNB1..BNW50.NTWMAST,DISP=SHR,                               
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWTRANV DD  DSN=&HNB1..BNW50.NTWTRAN,DISP=SHR,                               
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWPENDV DD  DSN=&HNB1..MFRS.MFPEND,DISP=SHR,                                 
//             AMP=('BUFND=2,BUFNI=15')                                         
//MFEXBR   DD  DSN=&HNB1..MFRS.MFEXBR,DISP=SHR,                                 
//             AMP=('BUFND=2,BUFNI=15')                                         
//MFMSD    DD  DSN=SZ.ZZZ.MFRS.MFMSD,                                           
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MFRRNM   DD  DSN=&HNO..&STRM..MFRS.MFRRNM,                                    
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//BMFSOCL  DD  DSN=&HNB1..MFRS.MFSOCL,                                          
//             AMP=('BUFND=30,BUFNI=4'),                                        
//             DISP=SHR                                                         
//BSKST    DD  DSN=&HNO..&STRM..BSK1CP.STREG,                                   
//             DISP=SHR                                                         
//BSKRR    DD  DSN=&HNO..&STRM..BSK1CP.REGRR,                                   
//             DISP=SHR                                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//FRFILE   DD  DSN=&HNB..&CYCLE..&ID.FRFILE&GENP2,                              
//             DISP=&DISP,                                                      
//             DCB=(&GDG.RECFM=FB,LRECL=750),                                   
//             SPACE=(CYL,(20,10),RLSE),                                        
//             UNIT=&UNIT                                                       
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                               
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                                
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                                     
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//SYSOUT   DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//**********************************************************************        
//*CAT575B2: APPLY W8 LOGIC VIA BNW58W8 MODULE                                  
//**********************************************************************        
//*                                                                             
//CAT575B2 EXEC PGM=CAT575B2,                                                   
//             REGION=&REG                                                      
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//BNWMAST  DD  DSN=&HNB1..BNW50.NTWMAST,       I/P                              
//             AMP=('BUFNI=50,BUFND=90'),                                       
//             DISP=SHR                                                         
//NTWREGOP DD  DSN=&HNB1..BNW50.NTWREGOP,                                       
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//MFRRNM   DD  DSN=&HNO..&STRM..MFRS.MFRRNM,                                    
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//BSKST    DD  DSN=&HNO..&STRM..BSK1CP.STREG,                                   
//             DISP=SHR                                                         
//BSKRR    DD  DSN=&HNO..&STRM..BSK1CP.REGRR,                                   
//             DISP=SHR                                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                                         
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NAYE     DD  DSN=&NAV..NAYE.NAFILE,                                           
//             DISP=SHR                                                         
//ADT1CUS  DD  &DUMADT.DSN=&HNB1..BNADT05.ADTCUS,                               
//             DISP=SHR                                                         
//IFRFILE  DD  DSN=&HNB..&CYCLE..&ID.FRFILE&GENP2,                              
//             DISP=SHR                                                         
//OFRFILE  DD  DSN=&HNB..&CYCLE..&ID.FRFILE&GENPP,                              
//             DISP=(NEW,CATLG),                                                
//             DCB=(&GDG.RECFM=FB,LRECL=750),                                   
//             SPACE=(CYL,(20,10),RLSE),                                        
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
//**********************************************************************        
//* CAT575C: READ FRFILE AND FORMAT VFNDRGST RECORD                    *        
//**********************************************************************        
//*                                                                             
//CAT575C EXEC PGM=CAT575C,                                                     
//             PARM=&DY,                                                        
//             REGION=&REG                                                      
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//FRFILE   DD  DSN=&HNB..&CYCLE..&ID.FRFILE&GENPP,                              
//             DISP=SHR                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//SYSOUT   DD  SYSOUT=*                                                         
//*                                                                             
