//CAT510A PROC STREAM='Z',                * CLIENT STREAM             *         
//             CYCLE='0',                 * 0=USE CYCLE ON FILE       *         
//*------------CYCLE='N',-----------------* N=BYPASS CYCLE CHECK      *         
//*------------CYCLE='1',-----------------* 1,2,3,4,5 = USE THIS CYCLE*         
//             DATESW='0',                * 1=USE PROC DATE           *         
//*------------DATESW='1',----------------* 2=USE PARM DATE           *         
//             DATEPARM='CCYYMMDD',       * DATE TO OVERRIDE PROC-DATE*         
//             CARD='CAT5100Z',           *CARDLIB MEMBER             *         
//             CARDLIB='BISG.CARDLIB',    *CARDLIB LIBRARY            *         
//             DB2CARD='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2PLAN='ACTBTCH',         *DB2 PLAN CARDLIB MEMBER    *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYS1                   *         
//             INF='BZZZ.SIAC0716.ACAT.TRAN(0)',  *I/P FROM NSCC/SIAC *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=6M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//* CHECK STATUS ON DATABASE TO INDICATE THAT ALL  JOB/STREAM         *         
//* HAS FINISHED FOR PREVIOUS CYCLE                                   *         
//*********************************************************************         
//*                                                                             
//CAT510A EXEC PGM=CAT510A,                                                     
//             PARM='&STREAM&CYCLE&DATESW&DATEPARM',                            
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
//DSNPLAN   DD DSN=&DB2CARD(&DB2PLAN),                         *FOR DB2         
//             DISP=SHR                                                         
//INFILE    DD DSN=&INF,                                            I/P         
//             DISP=SHR                                                         
//CARDLIB   DD DSN=&CARDLIB(&CARD),                                             
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
