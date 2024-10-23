//CAT581   PROC B1FIL='BZZZ.B1FL.PROD',                                         
//             STREAM=,                   *1 BYTE STREAM              *         
//             CLIENT=,                   *3 BYTE CLIENT NUMBER       *         
//             FUNDTYP=PNC,               *3 PNC OR DST=SCHWAB        *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             HNB=BZZZ,                                                        
//             HNB1=,                     *I/P NTWREGOP, NTWMAST,MFEXBR         
//             UNIT=BATCH,                                                      
//             GENP='(+1)',                                                     
//             INF='BZZZ.SIAC0720.ACAT.FUND(0)',  *I/P FROM NSCC/SIAC *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*-------------------------------------------------------------------*         
//* EXTRACT PNC/SURPASS DETAILS FROM SIAC0720 FILE                    *         
//*-------------------------------------------------------------------*         
//CAT581 EXEC PGM=CAT581,                                                       
//             PARM='&BYP1&BYP2&STREAM&CLIENT&FUNDTYP',                         
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
//B1FIL    DD  DSN=&B1FIL,                                          I/P         
//             DISP=SHR                                                         
//INFILE   DD  DSN=&INF,                                            I/P         
//             DISP=SHR                                                         
//NTWREGOP DD  DSN=&HNB1..BNW50.NTWREGOP,                                       
//             AMP=('BUFNI=2,BUFND=12'),                                        
//             DISP=SHR                                                         
//OPNC     DD  DSN=&HNB..CAT581.&FUNDTYP&GENP,                      O/P         
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(GDG,RECFM=VB,LRECL=4004)                                    
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//*********************************************************************         
//*  SORT10: COPY EXTRACT FILE TO BIOS FOR TRANSMISSION               *         
//*********************************************************************         
//SORT10  EXEC PGM=SORT,                                                        
//             REGION=4M,                                                       
//             PARM='SIZE=4M,MSG=AP'                                            
//SORTIN    DD DSN=&HNB..CAT581.&FUNDTYP&GENP,                                  
//             DISP=SHR                                                         
//SORTOUT   DD DSN=BIOS.C425.OUTPN720.C006&GENP,                                
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(GDG,RECFM=VB,LRECL=4004)                                    
//SORTLIST  DD SYSOUT=&PRTCL1                                                   
//*                                                                             
//* SORT FIELDS=COPY                                                            
//SYSIN     DD DSN=BISG.CARDLIB(COPY),                                          
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
