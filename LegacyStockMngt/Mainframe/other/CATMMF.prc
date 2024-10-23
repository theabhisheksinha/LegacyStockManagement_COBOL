//CATMMF  PROC B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             PLAN='MMFBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB='BZZZ',                * .CATMMF.LIQUID     OUTPUT *         
//             GENP='(+1)',               * .CATMMF.LIQUID     OUTPUT *         
//             GDG='GDG,',                * .CATMMF.LIQUID     OUTPUT *         
//             UNIT=BATCH,                * .CATMMF.LIQUID     OUTPUT *         
//             REG=4M,                                                          
//             DUMP=Y,                                                          
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*  SAVE CAMS DB2 DATABASE OF MONEY MARKET FUNDS RECORDS TO GDG FILE *         
//*********************************************************************         
//CATMMF  EXEC PGM=CATMMF,REGION=&REG                                           
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
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                           *CAMS DB2         
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//MMFFL     DD DSN=&HNB..CATMMF.LIQUID&GENP,                                    
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=(CYL,(1,2),RLSE),                                          
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.BUFNO=5)                                               
//BDFFL     DD DSN=&HNB..CATMMF.BDF&GENP,                                       
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=(CYL,(1,2),RLSE),                                          
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.BUFNO=5)                                               
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//SYSABOUT  DD SYSOUT=&DUMP                                                     
//*                                                                             
//*********************************************************************         
//*  SAVE BANK DEPOSIT FUNDS ON RESTRICTED ASSET TABLE VRSTSEC                  
//*********************************************************************         
//CATMMDB EXEC PGM=CATMMDB,REGION=&REG                                          
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
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                           *CAMS DB2         
//             DISP=SHR                                                         
//BDFFL     DD DSN=&HNB..CATMMF.BDF&GENP,                                       
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//SYSABOUT  DD SYSOUT=&DUMP                                                     
//*                                                                             
