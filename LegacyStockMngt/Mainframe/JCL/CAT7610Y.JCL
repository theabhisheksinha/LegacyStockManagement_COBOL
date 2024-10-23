//CAT7610Y JOB (BY0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BY0P,SCHENV=STREAMY,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=Y,                  *JOB STREAM                 *         
//             HNB1='BYYY',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BYYY'                *O/P &HNB1.CAT761.ACTPI  GDG*         
