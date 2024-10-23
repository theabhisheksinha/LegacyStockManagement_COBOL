//CAT7610S JOB (BS0P,0000),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BS0P,SCHENV=STREAMS,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=S,                  *JOB STREAM                 *         
//             HNB1='BSSS',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BSSS'                *O/P &HNB1.CAT761.ACTPI  GDG*         
