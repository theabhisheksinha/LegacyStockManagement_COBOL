//CAT900   PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *        
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='SYS1',                                                  
//             DSNLOAD='SDSNLOAD',                                              
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN='(0)',                 *I/P .CATEXTR.EXTRACT       *         
//             HNB='BZZZ',                *I/P .CAT650.EXTRACT    GDG *         
//             MSDFIL='POVZ.PMSD.BMS90.MSDFILE',                                
//             MSDXRF='POVZ.PMSD.BMS90.MSDXRF',                                 
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* UPLOAD  ACATS DB2 RECORDS FROM CATEXTR FILE.                      *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT900    EXEC PGM=CAT900,                                                    
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..DSNEXIT,                                            
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..&DSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//EXTR      DD DSN=&HNB..CATEXTR.CAT500.DB2FLAT&GEN,            I/P             
//             DISP=SHR                                                         
//FIDMSD   DD  DSN=&MSDFIL,                                                     
//             DISP=SHR,                                                        
//             AMP='BUFNI=20,BUFND=5'                                           
//*                                                                             
//FIDXRF   DD  DSN=&MSDXRF,                                                     
//             DISP=SHR,                                                        
//             AMP='BUFNI=20,BUFND=5'                                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
