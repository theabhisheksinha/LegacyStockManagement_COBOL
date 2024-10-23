//CAT788  PROC STREAM='Z',                                                      
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='SYS1',            *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN='(0)',                 *I/P BZZZ.SIAC0264.NDMS     *         
//             GENP1='(+1)',              *O/P B***.CAT788.TAXLOT     *         
//             HNB1='BZZZ',               *I/P BZZZ.SIAC0264.NDMS     *         
//             HNB2='BAAA',               *O/P B***.CAT788.TAXLOT     *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX            *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             GDG='GDG,',                                                      
//             UNIT='BATCH',                                                    
//             B1HDR='BZZZ.B1FL',                                               
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE='(CYL,(10,10),RLSE)',                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//*   ACCEPT ACAT COST BASIS TRANSACTION INPUT FILE FROM NSCC,        *         
//*   THEN SPLIT IT INTO STREAM FILE.                                 *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT788  EXEC PGM=CAT788,                                                      
//             REGION=&REGSIZE,PARM='&STREAM&BYP1'                              
//STEPLIB  DD DSN=&RUNDATE.ADP.DATELIB,                                         
//            DISP=SHR                                                          
//         DD DSN=DBSYS.CAF.LOADLIB,                                            
//            DISP=SHR                                                          
//         DD DSN=&DB2SYS..DSNEXIT,                                             
//            DISP=SHR                                                          
//         DD DSN=&DB2SYS1..SDSNLOAD,                                           
//            DISP=SHR                                                          
//AFFOPCA  DD DSN=OPCA.AFFCARD,                                *FOR DB2         
//            DISP=SHR                                                          
//DSNPLAN  DD DSN=&CARDLIB(&PLAN),                             *FOR DB2         
//            DISP=SHR                                                          
//B1FIL    DD DSN=&B1HDR,                                       I/P             
//            DISP=SHR                                                          
//INFILE   DD DSN=&HNB1..SIAC0264.NDMS&GEN,                     I/P             
//            DISP=SHR                                                          
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,               I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                     I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//MSDISIN  DD  DSN=BB.ZZZ.BDV03.MSDISIN.DUPE,DISP=SHR,          I/P             
//             AMP='BUFND=180,BUFNI=3'                                          
//MSDISXF  DD  DSN=POVZ.PMSD.BDV03.MSDISXF,DISP=SHR,            I/P             
//             AMP='BUFND=180,BUFNI=3'                                          
//OUTFILE  DD DSN=&HNB2..CAT788.TAXLOT&GENP1,                   O/P             
//            DISP=(NEW,CATLG,DELETE),                                          
//            SPACE=&SPACE,                                                     
//            UNIT=&UNIT,                                                       
//            DCB=(&GDG.DSORG=PS,LRECL=1600,RECFM=FB)                           
//OUTDROP  DD DSN=&HNB2..CAT788.DROP&GENP1,                     O/P             
//            DISP=(NEW,CATLG,DELETE),                                          
//            SPACE=&SPACE,                                                     
//            UNIT=&UNIT,                                                       
//            DCB=(&GDG.DSORG=PS,LRECL=1600,RECFM=FB)                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
