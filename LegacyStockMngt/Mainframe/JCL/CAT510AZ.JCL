//CAT510AZ JOB (BP00,DY00),'ACATS UBS TRAN',CLASS=1,MSGCLASS=W,                 
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB RUNS FIVE TIMES A DAY TRIGGERED BY NDM FROM UBS          *         
//*********************************************************************         
//*********************************************************************         
//* CAT510A CHECK STATUS ON DATABASE TO INDICATE THAT ALL JOB/STREAM  *         
//*         HAS FINISHED FROM THE PREVIOUS CYCLE                      *         
//*********************************************************************         
//STEP10  EXEC CAT510A,                                                         
//             CYCLE='0',                 * N=BYPASS CYCLE/DATE CHECK *         
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             CARD='CAT510AZ',           *CARDLIB MEMBER             *         
//             STREAM='W',                * WEALTH MANAGEMENT STREAM  *         
//             INF='BIOS.C235.INPZ.WM0716.ACAT.TRAN(0)'  I/P FROM WM  *         
//CAT510A.STEPLIB  DD                                                           
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//*********************************************************************         
//* INPUT=BIOS.C235.INPZ.ACAT.TRAN(0)                                 *         
//* EDIT UBS (VIA WEALTH MANAGEMENT) NSCC/SIAC ACATS MULTI-CYCLE      *         
//* TRANSACTION MRO (M FILE). CHECK HEADERS AND TRAILERS.             *         
//* MAKE SURE IT'S THE RIGHT CYCLE.  MAKE SURE RECORD COUNT IS GOOD.  *         
//*********************************************************************         
//STEP20  EXEC CAT510,                                                          
//             BYP1=0,                    * BYP1=1= BYPASS CYCLE CHECK*         
//*                                       * BYP1=2= USE PREV CYCLE NBR*         
//*                                       * BYP1=3= USE NSCC CYCLE NBR*         
//             BYP2=0,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=0,                    * BYP3=1= BYPASS FILE CHECK *         
//             WM='WM.',                  * WM FOR WEALTH MNGT RUN    *         
//             INF='BIOS.C235.INPZ.WM0716.ACAT.TRAN(0)', I/P FROM WM  *         
//             CLT='235'                * CLT=235 PROCESS CLT 235 ONLY          
