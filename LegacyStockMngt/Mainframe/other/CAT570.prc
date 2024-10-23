//CAT570  PROC HNB='PBSA',                *I/P .BNU080.DELETE     GDG *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN='(0)',                 *I/P .BNU080.DELETE         *         
//             GENP='(+1)',               *O/P .CAT570.DELETE         *         
//             GDG='GDG,',                                                      
//             UNIT=BATCH,                                                      
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* LOOKUP N/A PURGE RECORDS ON ACATS ACTIVE TABLE AND OMIT MATCHES.  *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT570  EXEC PGM=CAT570,                                                      
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//NAINPUT  DD  DSN=&HNB..BNU080.DELETE&GEN,                         I/P         
//             DISP=SHR                                                         
//NAOUTPUT DD  DSN=&HNB..CAT570.DELETE&GENP,DISP=(NEW,CATLG),       O/P         
//             UNIT=&UNIT,SPACE=(CYL,(2,5),RLSE),                               
//             DCB=(&GDG.LRECL=80,RECFM=FB)                                     
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
