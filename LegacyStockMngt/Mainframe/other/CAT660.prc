//CAT660  PROC BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P .CAT660.ACATPEND       *         
//             GDGB='GDG,',               *O/P .CAT660.ACATPENS       *         
//             GDGC='GDG,',               *O/P .CAT660.BNWTRAN        *         
//             GEN00A='(+0)',             *I/P .CAT659.ACATPEND       *         
//             GENP1A='(+1)',             *O/P .CAT660.ACATPEND       *         
//             GENP1B='(+1)',             *O/P .CAT660.ACATPENS       *         
//             GENP1C='(+1)',             *O/P .CAT660.BNWTRAN        *         
//             HNB1='BXXX',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BXXX',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BXXX',               *O/P .CAT660.BNWTRAN    GDG *         
//****                                    *O/P .CAT660.ACATMFNL       *         
//             HNB4='BXXX',               *I/P .CAT650DB.ACATPEND GDG *         
//             HNB5='BB.ZZZ',             *I/P .CAT580.STAT      VSAM *         
//             HNO1='S2.XXX',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAXXX',             *I/P .BNA34.NAFILE      VSAM*         
//             HNO3='S2.XXX',             *I/P .MFRS.MFRRNM       VSAM*         
//             UNIT='BATCH',                                                    
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',  *DB2 SYSTEM DB2PROD/DB2TEST *          
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(30,30),RLSE)', *O/P .CAT660.ACATPEND GDG *         
//             SPACE2='(CYL,(30,30),RLSE)', *O/P .CAT660.ACATPENS GDG *         
//             SPACE3='(CYL,(20,10),RLSE)'  *O/P .CAT660.BNWTRAN  GDG *         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* PROCESS CAT650DB.ACATPEND AND CREATES UPDATED ACATPEND, ACATPEND  *         
//* EXTRACT AND NETWORKING TRANSACTION FILE.  READS VFNDRGST AND      *         
//* VFNDRGST TABLES.                                                  *         
//*                                                                   *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT660  EXEC PGM=CAT660,                                                      
//             PARM='&BYP1',                                                    
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
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
//NAFILEA  DD  DSN=&HNO2..BNA34.NAFILEA,DISP=SHR,                   I/P         
//             AMP='BUFND=50,BUFNI=60'                                          
//NAFILEI  DD  DSN=&HNO2..BNA34.NAFILEI,DISP=SHR,                   I/P         
//             AMP='BUFND=50,BUFNI=60'                                          
//STATFL   DD  DSN=&HNB5..CAT580.STAT,DISP=SHR                    I/P           
//IPEND    DD  DSN=&HNB4..CAT659.ACATPEND&GEN00A,                 I/P           
//             DISP=SHR                                                         
//IREG     DD  DSN=&HNO1..BNW50.NTWREGOP,                           I/P         
//             DISP=SHR                                                         
//NTWMASTV DD  DSN=&HNO1..BNW50.NTWMAST,DISP=SHR,                   I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWTRANV DD  DSN=&HNO1..BNW50.NTWTRAN,DISP=SHR,                   I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWPENDV DD  DSN=&HNO1..MFRS.MFPEND,DISP=SHR,                     I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//RRMA     DD  DSN=&HNO3..MFRS.MFRRNM,                              I/P         
//             DISP=SHR                                                         
//BSKST    DD  DSN=&HNO1..BSK1CP.STREG,DISP=SHR,                    I/P         
//         AMP=('BUFNI=10,BUFND=30')                                            
//BSKRR    DD  DSN=&HNO1..BSK1CP.REGRR,DISP=SHR,                    I/P         
//         AMP=('BUFNI=10,BUFND=30')                                            
//BSKREG   DD  DUMMY                                                            
//MFMSD    DD  DSN=BB.ZZZ.MFRS.MFMSD,DISP=SHR                       I/P         
//OPEND    DD  DSN=&HNB1..CAT660.ACATPEND&GENP1A,                   O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=1004,RECFM=VB,BLKSIZE=27998)           
//ACATPENS DD  DSN=&HNB2..CAT660.ACATPENS&GENP1B,                   O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGB.DSORG=PS,LRECL=300,RECFM=FB,BLKSIZE=27900)            
//BNWTRANO DD  DSN=&HNB3..CAT660.BNWTRAN&GENP1C,                    O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE3,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGC.DSORG=PS,LRECL=1160,RECFM=FB)                         
//MFNLFL   DD  DSN=&HNB3..CAT660.ACATMFNL&GENP1C,                               
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE3,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGC.DSORG=PS,LRECL=160,RECFM=FB)                          
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
