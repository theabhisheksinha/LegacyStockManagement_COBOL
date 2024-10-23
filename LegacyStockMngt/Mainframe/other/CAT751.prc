//CAT751  PROC CARDLIB='BISG.CARDLIB',      *DB2 PLAN CARDLIB          *        
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P .CAT650.ACATMRGN       *         
//             GENP1='(+1)',              *I/P .CAT650.ACATMRGN       *         
//             GENP2='(+2)',              *O/P .CAT650.ACATMRGN       *         
//             HNB='BZZZ',                *    .CAT650.ACATMRGN   GDG *         
//             B1FIL='BZZZ.B1FL',                                               
//             UNIT='BATCH',                                                    
//             EXTR=ACATMRGN,             *ACATMRGN                             
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT650.ACATMRGN GDG *          
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//* OMIT MUTUAL FUND ASSETS MARKED AS DELETE ON VINITAST.             *         
//*********************************************************************         
//*                                                                             
//CAT751    EXEC PGM=CAT751,                                                    
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
//B1FIL    DD  DSN=&B1FIL,                                    I/P               
//             DISP=SHR                                                         
//IPEND    DD  DSN=&HNB..CAT650DB.&EXTR&GENP1,                 I/P              
//             DISP=SHR                                                         
//OPEND    DD  DSN=&HNB..CAT650DB.&EXTR&GENP2,                 O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=1004,RECFM=VB,BLKSIZE=27998)            
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
