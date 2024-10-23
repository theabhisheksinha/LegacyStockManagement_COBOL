//CAT7610L JOB (BL0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BL0P,SCHENV=STREAML,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=L,                  *JOB STREAM                 *         
//             HNB1='BLLL',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BLLL'                *O/P &HNB1.CAT761.ACTPI  GDG*         
