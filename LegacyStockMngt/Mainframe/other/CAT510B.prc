//CAT510B PROC STREAM='T',                * CLIENT STREAM             *         
//             CYCLE='0',                 * 0=USE CYCLE ON FILE       *         
//*------------CYCLE='1',-----------------* 1,2,3,4,5 = USE THIS CYCLE*         
//             DATESW='0',                * 1=USE PROC DATE           *         
//*------------DATESW='1',----------------* 2=USE PARM DATE           *         
//             DATEPARM='CCYYMMDD',       * DATE TO OVERRIDE PROC-DATE*         
//             DB2CARD='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2PLAN='ACTBTCH',         *DB2 PLAN CARDLIB MEMBER    *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             INF='BZZZ.CAT510.ACATTRAN(+0)',    *I/P FROM NSCC/SIAC *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=6M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//* SET STATUS ON DATABASE TO INDICATE THAT THIS JOB/STREAM/CYCLE     *         
//* THIS JOB/STREAM/CYCLE HAS FINISHED                                *         
//*********************************************************************         
//*                                                                             
//CAT510B EXEC PGM=CAT510B,                                                     
//             PARM='&STREAM&CYCLE&DATESW&DATEPARM',                            
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
//DSNPLAN   DD DSN=&DB2CARD(&DB2PLAN),                         *FOR DB2         
//             DISP=SHR                                                         
//INFILE    DD DSN=&INF,                                            I/P         
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
