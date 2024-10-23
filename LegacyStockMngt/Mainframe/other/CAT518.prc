//CAT518  PROC BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDGA='GDG,',               *O/P .CAT518.ACATDLVF       *         
//             GEN='(0)',                 *I/P .CATMMF.LIQUID         *         
//             GEN00A='(+1)',             *I/P .CAT511.ACATTRNS       *         
//             GENP1A='(+1)',             *O/P .CAT518.ACATDLVF       *         
//             HNB1='S1.AAA',             *I/P .MGR35.CUSBAL     VSAM *         
//             HNB2='S1.AAA',             *I/P .MGR25.CUSHOL     VSAM *         
//             HNB3='S1.AAA',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S1.AAA',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S1.AAA',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB8='BZZZ',               *I/P .CATMMF.LIQID      GDG *         
//             HNB9='S1.AAA',             *I/P .BNAT42.NACTAF    VSAM *         
//             HNBA='BAAA',               *O/P .CAT518.ACATDLVF   GDG *         
//             STREAM=Z,                  *BATCH STREAM Q/Z ONLY      *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX            *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             NAV='BNAAAA',              *I/P .BNA34.NAFILEA    VSAM *         
//             PRNGFL='M13C.ZZZ.PRNG.PRNGFL',                                   
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(1,1),RLSE)',  *O/P .CAT518.ACATDLVF GDG *          
//             UNIT=BATCH                                                       
//*                                                                             
//*********************************************************************         
//* LOAD ASSETS FOR PTR  DELIVERY TRANSFER REQUESTS                   *         
//* OUTPUT = DB2 ACATS TABLES                                         *         
//*********************************************************************         
//*                                                                             
//CAT518  EXEC PGM=CAT518,                                                      
//             PARM='&BYP1&BYP2&RERUN&STREAM',                                  
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                   I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                    I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                         I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//PRNGFL   DD  DSN=&PRNGFL,                                         I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NAFILEA   DD DSN=&NAV..BNA34.NAFILEA,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NAFILEI   DD DSN=&NAV..BNA34.NAFILEI,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//CUSBALV  DD  DSN=&HNB1..MGR35.CUSBAL,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//CUSHOLV   DD DSN=&HNB2..MGR25.CUSHOL,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MRGIMM   DD  DSN=&HNB3..BSU40.MRGIMM,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//BNWMAST  DD  DSN=&HNB4..BNW50.NTWMAST,                            I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//BNWREGOP DD  DSN=&HNB4..BNW50.NTWREGOP,                           I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MFEXBR   DD  DSN=&HNB4..MFRS.MFEXBR,                              I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NTWMASTV DD  DSN=&HNB5..BNW50.NTWMAST,DISP=SHR,                   I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWTRANV DD  DSN=&HNB5..BNW50.NTWTRAN,DISP=SHR,                   I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWPENDV DD  DSN=&HNB5..MFRS.MFPEND,DISP=SHR,                     I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//MFMSD    DD  DSN=&HNB6..MFRS.MFMSD,                               I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//INFILE   DD  DSN=&HNB7..CAT511.ACATTRNS&GEN00A,                   I/P         
//             DISP=SHR                                                         
//MMFFL    DD  DSN=&HNB8..CATMMF.LIQUID&GEN,                        I/P         
//             DISP=SHR                                                         
//NACTFL   DD  DSN=&HNB9..BNAT42.NACTAF,                            I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NACTFL1  DD  DSN=&HNB9..BNAT42.NACTAP1,        * ALTERNATE INDEX KEY *        
//             DISP=SHR,                         * FILE OF NACTFL      *        
//             AMP='BUFNI=50,BUFND=90'                                          
//ACATDLVF DD  DSN=&HNBA..CAT518.ACATDLVF&GENP1A,                   O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=200,RECFM=FB,BLKSIZE=27800)            
//ACATPTRF DD  DSN=&HNBA..CAT518.ACATPTRF&GENP1A,                   O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=1245,RECFM=FB)                         
//CATEXCP  DD  DSN=&HNBA..CAT518.EXCP&GENP1A,                                   
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=120,RECFM=FB)                          
//ACATPTRP DD  DUMMY                                                O/P         
//ACATPTRR DD  DUMMY                                                O/P         
//SORTLIB   DD DSN=SYS1.SORTLIB,                                                
//             DISP=SHR                                                         
//SORTWK01  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK02  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK03  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK04  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK05  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTLIST  DD SYSOUT=*                                                         
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
