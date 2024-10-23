//CAT7610F JOB (BF0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BF0P,SCHENV=STREAMF,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=F,                  *JOB STREAM                 *         
//             HNB1='BFFF',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BFFF'                *O/P &HNB1.CAT761.ACTPI  GDG*         
