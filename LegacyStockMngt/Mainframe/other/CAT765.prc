//CAT765  PROC STREAM='Z',                * STREAM INDICATOR          *         
//             BYP1=1,                    * 1=BYPASS CYCLE NBR CHECK  *         
//             BYP2=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP3=1,                    * 1=BYPASS FILE CHECK       *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 DB2PROD/DB2TEST        *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDGA='GDG,',               *O/P .CAT765.ACATTRNS       *         
//             GENP1A='(+1)',             *O/P .CAT765.ACATTRNS       *         
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BZZZ',               *O/P .CAT765.ACATTRNS   GDG *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                                                        
//             SPACE1='(CYL,(30,30),RLSE)', *O/P .CAT765.ACATTRNS GDG *         
//             UNIT='BATCH'                                                     
//*                                                                             
//CAT765  EXEC PGM=CAT765,                                                      
//             PARM='&STREAM&BYP1&BYP2&BYP3',                                   
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB1..CAT510.ACATTRAN(-4),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(-3),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(-2),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(-1),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(+0),DISP=SHR                          
//OUTFILE  DD  DSN=&HNB2..CAT765.ACATTRNS&GENP1A,                               
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=0800,RECFM=FB)                         
//OREPORT  DD  DSN=&HNB2..CAT765.TRNPI&GENP1A,                                  
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=0143,RECFM=FB)                         
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
//*                                                                             
//*-------------------------------------------------------------------*         
//* PRODUCE CONVERSION EXCEPTION REPORT FOR CLIENT 10                           
//*-------------------------------------------------------------------*         
//CAT765CV EXEC PGM=CAT765CV,                                                   
//             PARM='&STREAM&BYP1&BYP2&BYP3',                                   
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB1..CAT510.ACATTRAN(-4),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(-3),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(-2),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(-1),DISP=SHR                          
//         DD  DSN=&HNB1..CAT510.ACATTRAN(+0),DISP=SHR                          
//OUTFILE  DD  DSN=&HNB2..CAT765CV.ACATTRNS&GENP1A,                             
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=0800,RECFM=FB)                         
//OREPORT  DD  DSN=&HNB2..CAT765CV.CPI&GENP1A,                                  
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=0143,RECFM=FB)                         
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
