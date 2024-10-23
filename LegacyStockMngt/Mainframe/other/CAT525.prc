//*********************************************************************         
//* ACATS ASCENDIS EXCEPTION FILE                                     *         
//* FOR CYCLE RUN IN CAT5250*, CAT525='CAT525', INPUT=CAT511.ACATTRNS *         
//* FOR NIGHT RUN IN CAT8250*, CAT525='CAT825', INPUT=DUMMY           *         
//*********************************************************************         
//CAT525  PROC STREAM='Z',                * STREAM INDICATOR          *         
//             CAT525='CAT525',           *JOB NAME CAT525/CAT825     *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             DUMMY=,                    *I/P .CAT511.ACATTRNS       *         
//             GDGA='GDG,',               *O/P .CAT525.EXCP           *         
//             GEN00A='(+0)',             *I/P .CAT511.ACATTRNS       *         
//             GENP1A='(+1)',             *O/P .CAT525.EXCP           *         
//             HNB1='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='BAAA',               *O/P .CAT525.EXCP       GDG *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(1,1),RLSE)',  *O/P .CAT525.EXCP     GDG *          
//             UNIT=BATCH                                                       
//CAT525  EXEC PGM=CAT525,                                                      
//             PARM='&STREAM&BYP1&BYP2',                                        
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//INFILE   DD  &DUMMY.DSN=&HNB1..CAT511.ACATTRNS&GEN00A,            I/P         
//             DISP=SHR                                                         
//CATEXCP  DD  DSN=&HNB2..&CAT525..EXCP&GENP1A,                     O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=120,RECFM=FB)                          
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//*                                                                             
