//CAT6201Y JOB (BY0P,DY00),'ACATS PAPER FEE',CLASS=1,MSGCLASS=W,                
//         USER=BY0P,SECLABEL=BISG,SCHENV=STREAMY                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* SORT AND REPRO PAPER FEE FILE FROM ZIFP INTO BATCH VSAM FILE.     *         
//* THIS WILL BE USED BY CAT820 INTRADAY AND AT NIGHT.                *         
//*                                                                   *         
//*  THIS JOB IS RESTARTABLE.                                         *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT6201,                                                         
//             HNB='PBSY',                *I/P ZIFP FILE          GDG *         
//             HNB2='BYYY',               *O/P .CAT620.PARPERFEE  GDG *         
//             OUTFILE='BB.YYY.CAT620.PAPER.STMNT.FEE'                          
