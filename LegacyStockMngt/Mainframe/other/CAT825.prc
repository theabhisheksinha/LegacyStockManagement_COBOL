//*********************************************************************         
//* ACATS ASCENDIS FILE SPLIT PROGRAM - EXTRACT BY CLIENT/CLEARING NBR*         
//* FOR JOB CAT5250*, JOBNAME='CAT525   ',                            *         
//* FOR JOB CAT8250*, JOBNAME='CAT825   ',                            *         
//*********************************************************************         
//CAT825  PROC CLIENT='0096',             *CLIENT NUMBER (4 BYTES)    *         
//             CLEARNO='0969',            *NSCC BROKER CLEARING NBR   *         
//             JOBNAME='CAT525  ',        *JOBNAME=CAT525   /CAT825   *         
//             BYP1=1,                    *1=BYPASS DATE CHECK        *         
//             BYP2=1,                    *1=BYPASS FILE CHECK        *         
//             GDGA='GDG,',               *O/P WHLD                   *         
//             GDGB='GDG,',               *O/P EXCP                   *         
//             GDGC='GDG,',               *O/P MATH                   *         
//             GDGD='GDG,',               *O/P NSCC                   *         
//             DUMWHLD=,          'DUMMY,',                           *         
//             DUMEXCP=,          'DUMMY,',                           *         
//             DUMMATH=,          'DUMMY,',                           *         
//             DUMNSCC=,          'DUMMY,',                           *         
//             DUMEXCP2='DUMMY,', 'DUMMY,',                           *         
//             DUMEXCP3='DUMMY,', 'DUMMY,',                           *         
//             INWHLD='DUMMY',    'B***.CAT810.WHLD(+0)',             *         
//             INEXCP='DUMMY',    'B***.CAT825.EXCP(+1)',             *         
//             INEXCP2=NULLFILE,  'B***.CAT518.EXCP(+0)',             *         
//             INEXCP3=NULLFILE,  'B***.CAT519.EXCP(+0)',             *         
//             INMATH='DUMMY',    'B***.CAT821.MATH(+0)',             *         
//             INNSCC='DUMMY',    'B***.CAT500A.NSCCIN.ASCENDIS(+1)', *         
//             OTWHLD='DUMMY',    'B***.CAT825.WHLD.C***.ASCENDIS(+1)'*         
//             OTEXCP='DUMMY',    'B***.CAT825.EXCP.C***.ASCENDIS(+1)'*         
//             OTMATH='DUMMY',    'B***.CAT825.MATH.C***.ASCENDIS(+1)'*         
//             OTNSCC='DUMMY',    'B***.CAT825.NSCC.C***.ASCENDIS(+1)'*         
//             PRTCL1='*',                                            *         
//             PRTCL2='Y',                                            *         
//             REGSIZE=8M,                                            *         
//             RUNDATE='RERUN.EARLY.',                                *         
//             SPACE1='(CYL,(01,01),RLSE)',   *O/P WHLD               *         
//             SPACE2='(CYL,(01,01),RLSE)',   *O/P EXCP               *         
//             SPACE3='(CYL,(01,01),RLSE)',   *O/P MATH               *         
//             SPACE4='(CYL,(01,01),RLSE)',   *O/P NSCC               *         
//             UNIT='BATCH'                                           *         
//CAT825  EXEC PGM=CAT825,                                                      
//             PARM='&CLIENT&CLEARNO&JOBNAME&BYP1&BYP2',                        
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INWHLD   DD  &DUMWHLD.DSN=&INWHLD,                                            
//             DISP=SHR                                                         
//INEXCP   DD  &DUMEXCP.DSN=&INEXCP,                                            
//             DISP=SHR                                                         
//INEXCP2  DD  &DUMEXCP2.DSN=&INEXCP2,                                          
//             DISP=SHR                                                         
//         DD  &DUMEXCP3.DSN=&INEXCP3,                                          
//             DISP=SHR                                                         
//INMATH   DD  &DUMMATH.DSN=&INMATH,                                            
//             DISP=SHR                                                         
//INNSCC   DD  &DUMNSCC.DSN=&INNSCC,                                            
//             DISP=SHR                                                         
//OTWHLD   DD  &DUMWHLD.DSN=&OTWHLD,                                            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=62,RECFM=FB)                           
//OTEXCP   DD  &DUMEXCP.DSN=&OTEXCP,                                            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGB.DSORG=PS,LRECL=120,RECFM=FB)                          
//OTMATH   DD  &DUMMATH.DSN=&OTMATH,                                            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE3,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGC.DSORG=PS,LRECL=100,RECFM=FB)                          
//OTNSCC   DD  &DUMNSCC.DSN=&OTNSCC,                                            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE4,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGD.DSORG=PS,LRECL=2995,RECFM=VB)                         
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
