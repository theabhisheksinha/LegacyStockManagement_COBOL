//CAT7610P JOB (BP0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BP0P,SCHENV=STREAMP,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=P,                  *JOB STREAM                 *         
//             HNB1='BPPP',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BPPP'                *O/P &HNB1.CAT761.ACTPI  GDG*         
