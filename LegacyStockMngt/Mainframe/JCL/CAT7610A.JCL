//CAT7610A JOB (BA0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BA0P,SCHENV=STREAMA,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=A,                  *JOB STREAM                 *         
//             HNB1='BAAA',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BAAA'                *O/P &HNB1.CAT761.ACTPI  GDG*         
