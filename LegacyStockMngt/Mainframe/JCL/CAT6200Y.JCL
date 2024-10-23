//CAT6200Y JOB (BY0P,DY00),'ACATS PAPER FEE',CLASS=1,MSGCLASS=W,                
//         USER=BY0P,SECLABEL=BISG,SCHENV=STREAMY                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* UPDATE BATCH ZIPF PAPER FEE (VSAM VERSION) AFTER CYCLE 5 USING    *         
//* VTRNFR STATUS.  TRANSFERS WHERE ASSETS WERE SUBMITTED TODAY,      *         
//* REVIEW+ AND NOT REJECTED, WHICH ARE MARKED WITH ACAT CONTROL NBR  *         
//* ON THE ZIPF RECORD, UPDATE THE ACAT-IND TO Y.                     *         
//*                                                                   *         
//* THIS JOB IS RESTARTABLE.                                          *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT620,                                                          
//             HNB='PBSY',                *I/P ZIFP FILE          GDG *         
//             HNB1='BYYY',               *O/P VSAM BACKUP FILE   GDG *         
//             VSAMFEE='BB.YYY.CAT620.PAPER.STMNT.FEE'                          
