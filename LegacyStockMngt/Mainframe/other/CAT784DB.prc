//CAT784DB PROC CARDLIB='BISG.CARDLIB',     *DB2 PLAN CARDLIB         *         
//             BYP1=0,                    * 1=BYPASS DATE,IGNORE DATA *         
//             INTDY=0,                   * 0=NIGHTLY, 1=INTRA DAY RUN*         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN='(0)',                 *I/P CBRS PARTICIPANT       *         
//             GDG='GDG,',                *O/P .CAT784DB.TAXLOT       *         
//             GENP1='(+1)',              *O/P .CAT784DB.TAXLOT       *         
//             HNB='BZZZ',                *O/P .CAT784DB.TAXLOT   GDG *         
//             HNB1='BZZZ',               *I/P CBRS.PARTICIPANT       *         
//             STREAM=,                   *1 BYTE BATCH STREAM/CLIENT *         
//             SPLITCL=,                  *SINGLE CLIENT EXTR 'CL###.'          
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             UNIT='BATCH',                                                    
//             B1FIL='BZZZ.B1FL',                                               
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT784DB.NSCCFL  GDG *         
//             SPACE2='(CYL,(5,10),RLSE)', *O/P .CAT784DB.ERROR   GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*-------------------------------------------------------------------*         
//* VERIFY TAX LOT DETAILS AND CREATE FEED TO NSCC COST BASIS SYSTEM  *         
//*-------------------------------------------------------------------*         
//CAT784DB  EXEC PGM=CAT784DB,PARM='&STREAM&BYP1&BYPFL&INTDY&SPLITCL',          
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
//CBRSBRKR  DD DSN=&HNB1..SIAC1666.NDMS&GEN,                    I/P             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//INFILE    DD DSN=&HNB..BTL605.ACAT&GEN,                       I/P             
//             DISP=SHR                                                         
//NSCCFL    DD DSN=&HNB..CAT784DB.&SPLITCL.NSCCFL&GENP1,        O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=1004,RECFM=VB)                          
//TLERROR   DD DSN=&HNB..CAT784DB.&SPLITCL.ERROR&GENP1,         O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=1000,RECFM=FB)                          
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//*-------------------------------------------------------------------*         
//* CREATE ERROR REPORT                                                         
//*-------------------------------------------------------------------*         
//CAT784R   EXEC PGM=CAT784R,PARM=&STREAM                                       
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//INFILE    DD DSN=&HNB..CAT784DB.&SPLITCL.ERROR&GENP1,         I/P             
//             DISP=SHR                                                         
//REPORT    DD DSN=&HNB..CAT784R.&SPLITCL.TLPI&GENP1,           O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=143,RECFM=FB)                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
