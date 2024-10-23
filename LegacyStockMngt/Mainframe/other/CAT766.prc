//CAT766   PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *        
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P .CAT766.ACATPEND       *         
//             GENP1='(+1)',              *O/P .CAT766.ACATPEND       *         
//             HNB='BZZZ',                *O/P .CAT766.ACATPEND   GDG *         
//             STREAM=ZZZ,                *O/P .CAT766.MSDCUSIP.TMP GDG         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             MSDISIN='BB.ZZZ.BDV03.MSDISIN.DUPE',                             
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             SPACE1='(CYL,(100,50),RLSE)', *O/P .CAT766.CUSIP.TMP GDG*        
//             SPACE2='(CYL,(50,10),RLSE)',  *O/P .CAT766.ACATPEND GDG *        
//             TMP='TMP',                                                       
//             RUNDATE=                                                         
//*                                                                             
//*-------------------------------------------------------------------*         
//* EXTRACT RECIEVER SIDE ASSETS AND TRANSFERS FROM THE DATABASE      *         
//*-------------------------------------------------------------------*         
//CAT766    EXEC PGM=CAT766,                                                    
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//ACATPEND DD  DSN=&HNB..CAT766.ACATPEND&GENP1,            O/P                  
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=504,RECFM=VB,BLKSIZE=27998)             
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//*-------------------------------------------------------------------*         
//* SORT MSDISIN FILE INTO CUSIP SEQUENCE                             *         
//*-------------------------------------------------------------------*         
//SORT10  EXEC PGM=SORT,                                                        
//             REGION=4M,                                                       
//             PARM='SIZE=4M,MSG=AP'                                            
//SORTIN   DD  DSN=&MSDISIN,                                                    
//             DISP=SHR                                                         
//SORTOUT  DD  DSN=&HNB..CAT766.MSDCUSIP.&TMP&GENP1,                            
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE1,                                                   
//             DCB=(&GDG.LRECL=21,RECFM=FB)                                     
//SORTLIST DD  SYSOUT=*                                                         
//*                                                                             
//* SORT FIELDS=(3,19,CH,A)                                                     
//* SUM FIELDS=NONE                                                             
//SYSIN    DD  DSN=BISG.CARDLIB(CAT766S1),                                      
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//*                                                                             
//*-------------------------------------------------------------------*         
//*IDCAM20: COPY SORTED MSDISIN FILE INTO VSAM                        *         
//*-------------------------------------------------------------------*         
//IDCAM20  EXEC PGM=FASTVSAM,                                                   
//             REGION=4096K                                                     
//DD1      DD DSN=&HNB..CAT766.MSDCUSIP.&TMP&GENP1,                             
//             DISP=SHR                                                         
//DD2      DD  DSN=BB.&STREAM..CAT766.MSDCUSIP,                                 
//             DISP=SHR,                                                        
//             AMP=('BUFNI=50,BUFND=20')                                        
//SYSIN    DD  DSN=BISG.CARDLIB(REPRO),                                         
//             DISP=SHR                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//*                                                                     00521000
//*-------------------------------------------------------------------*         
//* FORMAT MULTIPLE MSD MATCHING REPORT                               *         
//*-------------------------------------------------------------------*         
//CAT766A EXEC PGM=CAT766A                                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//IPEND    DD  DSN=&HNB..CAT766.ACATPEND&GENP1,                   I/P           
//             DISP=SHR                                                         
//MSDISIN  DD  DSN=&MSDISIN,                                      I/P           
//             DISP=SHR,                                                        
//             AMP=('BUFNI=50,BUFND=20')                                        
//MSDCUSIP DD  DSN=BB.&STREAM..CAT766.MSDCUSIP,                   I/P           
//             DISP=SHR,                                                        
//             AMP=('BUFNI=50,BUFND=20')                                        
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                 I/P           
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                  I/P           
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                       I/P           
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//B1FIL    DD  DSN=&B1HDR,                                        I/P           
//             DISP=SHR                                                         
//REPORT   DD  DSN=&HNB..CAT766A.MSPI&GENP1,DISP=(,CATLG,DELETE),  O/P          
//    UNIT=&UNIT,SPACE=(CYL,(2,5),RLSE),DCB=GDG                                 
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*-------------------------------------------------------------------*         
//*******DELETE TEMP DATASETS*******                                            
//*-------------------------------------------------------------------*         
//BR140101 EXEC PGM=IEFBR14                                                     
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSUT001 DD DSN=&HNB..CAT766.MSDCUSIP.&TMP&GENP1,                             
//             DISP=(MOD,DELETE)                                                
//*** EDN OF PROC                                                               
