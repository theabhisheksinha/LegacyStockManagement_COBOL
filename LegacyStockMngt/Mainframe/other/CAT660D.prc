//CAT660D PROC BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             HNB='BZZZ',                *I/P SIAC 0720 FILE         *         
//             HNB2='BLLL',               *O/P CAT660.MFDST           *         
//             HNO1='SL.LLL',             *I/P .BNW50.NTWREGOP    VSAM*         
//             UNIT='BATCH',                                                    
//             SPACE1='(CYL,(5,2),RLSE)', *O/P CAT660.MFDST           *         
//             GEN='(0)',                                                       
//             GENP='(+1)',                                                     
//             GDG='GDG,',                                                      
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//* CREATE ACAT DST FUND STATUS EXTRACT                               *         
//*********************************************************************         
//*                                                                             
//CAT660D EXEC PGM=CAT660D,                                                     
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
//INFILE   DD  DSN=&HNB..SIAC0720.ACAT.FUND&GEN,                 I/P            
//             DISP=SHR                                                         
//IREG     DD  DSN=&HNO1..BNW50.NTWREGOP,                        I/P            
//             DISP=SHR                                                         
//ACATDST  DD  DSN=&HNB2..CAT660.ACATDST&GENP,                   O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=180,RECFM=FB)                           
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
