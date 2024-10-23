//CAT660P PROC BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             STREAM=Z,                  * EXTRACT STREAM            *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             GDGC='GDG,',               *O/P .CAT660P.BNWTRAN       *         
//             GEN00A='(0)',              *I/P .CAT650DB.ACATSHAD     *         
//             GENP1C='(+1)',             *O/P .CAT660P.BNWTRAN       *         
//             HNB3='BXXX',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BXXX',               *I/P .CAT650DB.ACATSHAD GDG *         
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
//             RUNDATE=,                                                        
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
//CAT660P EXEC PGM=CAT660P,                                                     
//             PARM='&STREAM&BYP1',                                             
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
//IPEND    DD  DSN=&HNB4..CAT650DB.ACATSHAD&GEN00A,                 I/P         
//             DISP=SHR                                                         
//NSCCIN   DD  DSN=&HNB3..CAT502.NSCCFL(0),DISP=SHR                 I/P         
//         DD  DSN=&HNB3..CAT502.NSCCFL(-1),DISP=SHR                            
//         DD  DSN=&HNB3..CAT502.NSCCFL(-2),DISP=SHR                            
//         DD  DSN=&HNB3..CAT502.NSCCFL(-3),DISP=SHR                            
//         DD  DSN=&HNB3..CAT502.NSCCFL(-4),DISP=SHR                            
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
//BNWTRANO DD  DSN=&HNB3..CAT660P.BNWTRAN&GENP1C,                   O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE3,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGC.DSORG=PS,LRECL=1160,RECFM=FB)                         
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
//*********************************************************************         
//*  SORT10: COPY/CONCAT CAT660P.BNWTRAN TO CAT660.BNWTRAN            *         
//*********************************************************************         
//SORT10  EXEC PGM=SORT,                                                        
//             REGION=4M,                                                       
//             PARM='SIZE=4M,MSG=AP'                                            
//SORTIN    DD DSN=&HNB3..CAT660.BNWTRAN&GEN00A,                                
//             DISP=SHR                                                         
//          DD DSN=&HNB3..CAT660P.BNWTRAN&GENP1C,                               
//             DISP=SHR                                                         
//SORTOUT   DD DSN=&HNB3..CAT660.BNWTRAN&GENP1C,                                
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE3,                                                   
//             DCB=(&GDGC.DSORG=PS,LRECL=1160,RECFM=FB)                         
//SORTLIST  DD SYSOUT=&PRTCL1                                                   
//*                                                                             
//* SORT FIELDS=COPY                                                            
//SYSIN     DD DSN=BISG.CARDLIB(COPY),                                          
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
