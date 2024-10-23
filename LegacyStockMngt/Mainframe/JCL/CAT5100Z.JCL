//CAT5100Z JOB (BP00,DY00),'ACATS NSCC/SIAC TRAN',CLASS=2,MSGCLASS=W,           
//        PRTY=15,                                                              
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMD                                                               
//*JOBNOT SYSTEMD                                                               
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB RUNS FIVE TIMES A DAY TRIGGERED BY NDM FROM NSCC/SIAC    *         
//*********************************************************************         
//*********************************************************************         
//* CAT510A CHECK STATUS ON DATABASE TO INDICATE THAT ALL JOB/STREAM  *         
//*         HAS FINISHED FROM THE PREVIOUS CYCLE                      *         
//*********************************************************************         
//STEP10  EXEC CAT510A,                                                         
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             CYCLE='0'                  * N=BYPASS CYCLE/DATE CHECK *         
//CAT510A.STEPLIB  DD                                                           
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//*                                                                             
//*********************************************************************         
//* COPY ALL OR SPECIFIC CLIENTS FROM ALL OR SPECIFY ACAT DB2 TABLES. *         
//* THIS IS NOT AN UPDATE JOB AND MAY BE RESTARTED/RERAN FROM THE TOP.*         
//*********************************************************************         
//STEP20  EXEC CATEXTR,                                                         
//             HNB=BZZZ,                                                        
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PARMCL='ALL ',             *CLIENT '0096','ALL '                 
//             VINITRNF='A',              *VINITRNF A=ALL, S=SPECIFIED          
//             IFRRCV='0000',             *VINITRNF FROM RCV-NBR                
//             IFRRAC='00000000000000000000',        FROM ACCT-RCV              
//             ITORCV='9999',             *VINITRNF TO   RCV-NBR                
//             ITORAC='99999999999999999999',        TO   ACCT-RCV              
//             VTRNFR='N',                *VTRNFR   A=ALL, S=SPECIFIED          
//             FRCNTL='19980000000000',   *VTRNFR  FROM CONTROL NBR             
//             TOCNTL='19989999999999',   *VTRNFR  TO   CONTROL NBR             
//             VTRNHSTY='N',              *VTRNHSTY A=ALL                       
//             VRSN='CAT510.',            *DSN NODE FOR EXTRACT                 
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M                                                       
//CATEXTR.STEPLIB DD DSN=ADP.DATELIB,                                           
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
//*********************************************************************         
//* INPUT='BZZZ.SIAC0716.ACAT.TRAN(0)'                                *         
//* EDIT NSCC/SIAC ACATS MULTI-CYCLE TRANSACTION MRO (M FILE)         *         
//* CHECK HEADERS AND TRAILERS.  MAKE SURE IT'S THE RIGHT CYCLE.      *         
//* MAKE SURE RECORD COUNT IS GOOD                                    *         
//*********************************************************************         
//STEP30  EXEC CAT510,                                                          
//             BYP1=0,                    * BYP1=1= BYPASS CYCLE CHECK*         
//*                                       * BYP1=2= USE PREV CYCLE NBR*         
//*                                       * BYP1=3= USE NSCC CYCLE NBR*         
//             BYP2=0,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=0,                    * BYP3=1= BYPASS FILE CHECK *         
//             BYP4=0                     * BYP4=1= RECORD COUNT<100  *         
