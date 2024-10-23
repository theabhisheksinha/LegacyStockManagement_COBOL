//CAT7610N JOB (BN1P,DAC0),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BN1P,SCHENV=STREAMN,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=N,                  *JOB STREAM                 *         
//             HNB1='BNNN',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BNNN'                *O/P &HNB1.CAT761.ACTPI  GDG*         
