//CAT500A PROC B1FIL='BZZZ.B1FL.PROD',                                          
//             CAT500=A,                        * PROGRAM VERSION     *         
//             CAT501=,                         * PROGRAM VERSION     *         
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             DISP='(,CATLG,DELETE)',                                          
//             DUMMY=,                   *&STRM3..CYCLELOG.BKUP&GENP  *         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GDGB='GDG,',              *CAT500.ACATACTF             *         
//             GENP='(+1)',              *&STRM3..NSCCIN&GENP,        *         
//             GENP1B='(+1)',            *CAT500.ACATACTF             *         
//             HNB=,                                                            
//             HNB1=,                    *I/P NTWREGOP, NTWMAST,MFEXBR*         
//             HNB2=,                    *O/P CAT500.ACATACTF.ASCENDIS*         
//             HNO=BB,                   *VSM &STRM2.CYCLELOG.ASCENDIS*         
//             MSDPRE='BB.ZZZ',          *MSD FILE PREFIX BB/QSYAV    *         
//             MSDSUF='.DUPE',           *MSD FILE SUFFIX .DUPE/BLANK *         
//             REG=4M,                                                          
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM1=,                                                          
//             STRM2=,                                                          
//             STRM3=CAT500A,                                                   
//             UNIT=BATCH,                                                      
//*** BELOW ARE THE CUTOFF TIMES IN HHMM FORMAT ************                    
//*** NO CUTOFF TIME FOR ASCENDIS FEEDS  24 X 7          ***                    
//             TIA=2400,                        ==> TI ADD                      
//             TIC=2400,                        ==> TI CHANGE                   
//             TIRD=2400,                       ==> TI REJECT DELIVERER         
//             TIRR=2400,                       ==> TI REJECT RECEIVER          
//             TIX=2400,                        ==> TI ACCELERATE               
//             ATA=2400,                        ==> AT ADD                      
//             ATCD=2400,                       ==> AT CHANGE/DELETE            
//             ATRD=2400,                       ==> AT DELETE RECEIVER          
//             FRA=2400,                        ==> FR ADD                      
//             ASCENDIS='ASCENDIS',             ==> ASCENDIS RUN                
//             ASCENEOD='CYC'                   ==> ASCEND EODRUN = EOD         
//**********************************************************************        
//*CAT500: UPDATES VINITRNF, VINITAST, VFNDRGST OF NSCC_ACK_IND        *        
//**********************************************************************        
//CAT500A  EXEC PGM=CAT500&CAT500,                                              
//         REGION=&REG,                                                         
//      PARM=('&STRM1','TIA=&TIA','TIC=&TIC','TIRD=&TIRD','TIRR=&TIRR',         
//      'TIX=&TIX','ATA=&ATA','ATCD=&ATCD','ATRD=&ATRD','FRA=&FRA')             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//CYCLELOG DD  DSN=&HNO..&STRM2..CAT500.CYCLELOG.ASCENDIS,                      
//             DISP=SHR,                                                        
//             AMP=('BUFNI=4,BUFND=12')                                         
//NTWREGOP DD  DSN=&HNB1..BNW50.NTWREGOP,                                       
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NTWMAST  DD  DSN=&HNB1..BNW50.NTWMAST,                                        
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//MFMSD    DD  DSN=SZ.ZZZ.MFRS.MFMSD,DISP=SHR                                   
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                               
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                                
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDPRE..BMS90.MSDCLT&MSDSUF,                                
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//MFEXBR   DD  DSN=&HNB1..MFRS.MFEXBR,                                          
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//ACATACTF DD  DSN=&HNB2..&STRM3..ACATACTF.ASCENDIS&GENP1B,        O/P          
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=(CYL,(10,10),RLSE),                                        
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGB.DSORG=PS,LRECL=200,RECFM=FB,BLKSIZE=27800)            
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//SYSABOUT DD  SYSOUT=&DUMP                                                     
//**********************************************************************        
//*CAT501: WRITES A FILE WITH TI, AT AND FR RECORDS FOR NSCC           *        
//**********************************************************************        
//CAT501   EXEC PGM=CAT501&CAT501,                                              
//         REGION=&REG,                                                         
//      PARM=('&STRM1','TIA=&TIA','TIC=&TIC','TIRD=&TIRD','TIRR=&TIRR',         
//      'TIX=&TIX','ATA=&ATA','ATCD=&ATCD','ATRD=&ATRD','FRA=&FRA',             
//       &ASCENDIS.&ASCENEOD)                                                   
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//CYCLELOG DD  DSN=&HNO..&STRM2..CAT500.CYCLELOG.ASCENDIS,                      
//             DISP=SHR,                                                        
//             AMP=('BUFNI=4,BUFND=12')                                         
//NSCCIN   DD  DSN=&HNB..&STRM3..NSCCIN.ASCENDIS&GENP,                          
//             DISP=&DISP,                                                      
//             DCB=(&GDG.RECFM=VB,LRECL=2995,BLKSIZE=27998),                    
//             SPACE=(CYL,(30,30),RLSE),                                        
//             UNIT=&UNIT                                                       
//NTWREGOP DD  DSN=&HNB1..BNW50.NTWREGOP,                                       
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//NTWMAST  DD  DSN=&HNB1..BNW50.NTWMAST,                                        
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//MFMSD    DD  DSN=SZ.ZZZ.MFRS.MFMSD,DISP=SHR                                   
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                               
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                                
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDPRE..BMS90.MSDCLT&MSDSUF,                                
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//SYSABOUT DD  SYSOUT=&DUMP                                                     
//**********************************************************************        
//*IDCAM10: CREATES A GDG BACKUP COPY OF THE CYCLE LOG FILE            *        
//**********************************************************************        
//IDCAM10  EXEC PGM=FASTVSAM,                                                   
//             REGION=&REG                                                      
//DD1      DD  &DUMMY.DSN=&HNO..&STRM2..CAT500.CYCLELOG.ASCENDIS,               
//             DISP=SHR,                                                        
//             AMP=('BUFNI=4,BUFND=12')                                         
//DD2      DD  &DUMMY.DSN=&HNB..&STRM3..CYCLELOG.BKUP&GENP,                     
//             DISP=&DISP,                                                      
//             DCB=(&GDG.RECFM=FB,LRECL=200,BLKSIZE=32600),                     
//             SPACE=(CYL,(30,30),RLSE),                                        
//             UNIT=&UNIT                                                       
//SYSIN    DD  &DUMMY.DSN=BISG.CARDLIB(CAT500RP),                               
//             DISP=SHR                                                         
//SYSPRINT DD  SYSOUT=*                                                         
