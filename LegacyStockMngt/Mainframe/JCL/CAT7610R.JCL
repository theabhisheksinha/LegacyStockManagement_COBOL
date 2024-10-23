//CAT7610R JOB (BR0P,0000),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BR0P,SCHENV=STREAMR,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=R,                  *JOB STREAM                 *         
//             HNB1='BRRR',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BRRR'                *O/P &HNB1.CAT761.ACTPI  GDG*         
