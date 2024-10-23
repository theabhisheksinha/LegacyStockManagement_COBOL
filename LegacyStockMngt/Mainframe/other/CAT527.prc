//CAT527   PROC STREAM=Z,                 * STREAM INDICATOR          *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PRROD',        *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P .CAT527.ACATPEND       *         
//             GENP1='(+1)',             *O/P .CAT527.ACATPEND        *         
//             HNB='BZZZ',                *O/P .CAT527.ACATPEND   GDG *         
//             B1FIL='BZZZ.B1FL',                                               
//             MSDFIL='POVZ.PMSD.BMS90.MSDFILE',  REAL-TIME MSD FILE            
//             MSDXRF='POVZ.PMSD.BMS90.MSDXRF',   REAL-TIME MSD XRF             
//             MSDINF='CM1.ZZZ.IDCAMS.MSDINF',                                  
//             MSDIDX='POVZ.PMSD.BMS90.MSDXRF',                                 
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PRNGFL='M13C.ZZZ.PRNG.PRNGFL',                                   
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE='(CYL,(2,5),RLSE)', *O/P .CAT527DB.MSDEXCP  GDG *          
//             SPACE2='(CYL,(2,5),RLSE)', *O/P .CAT527.REPORT    GDG *          
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* EXTRACT EXCEPTION BOOKING RECORDS FROM DATABASE.                  *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT527DB  EXEC PGM=CAT527DB,                                                  
//             PARM=&STREAM,                                                    
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
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//FIDMSD   DD  DSN=&MSDFIL,                                     I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=20,BUFND=5'                                           
//FIDXRF   DD  DSN=&MSDXRF,                                     I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=20,BUFND=5'                                           
//FIDCLT    DD DSN=&MSDCLT,                                     I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//MSDINF   DD  DSN=&MSDINF,                                     I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MSDIDX   DD  DSN=&MSDIDX,                                     I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MSDISIN  DD  DSN=BB.ZZZ.BDV03.MSDISIN.DUPE,DISP=SHR,          I/P             
//             AMP='BUFND=180,BUFNI=3'                                          
//MSDISXF  DD  DSN=POVZ.PMSD.BDV03.MSDISXF,DISP=SHR,            I/P             
//             AMP='BUFND=180,BUFNI=3'                                          
//PRNGFL   DD  DSN=&PRNGFL,                                     I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//*                                                                             
//MSDEXCP DD   DSN=&HNB..CAT527DB.MSDEXCP&GENP1,                O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=350,RECFM=FB)                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//CAT527    EXEC PGM=CAT527,                                                    
//             PARM=&STREAM                                                     
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//MSDEXCP   DD  DSN=&HNB..CAT527DB.MSDEXCP&GENP1,               I/P             
//             DISP=SHR                                                         
//*                                                                             
//REPORT   DD  DSN=&HNB..CAT527.MSDPI&GENP1,                    O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=&UNIT,                                                      
//             SPACE=&SPACE2,                                                   
//             DCB=(&GDG.DSORG=PS,RECFM=FBA,LRECL=143)                          
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
