//CAT7610J JOB (BJ0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BJ0P,SCHENV=STREAMJ,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=J,                  *JOB STREAM                 *         
//             HNB1='BJJJ',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BJJJ'                *O/P &HNB1.CAT761.ACTPI  GDG*         
