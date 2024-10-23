//CAT7610B JOB (BB0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BB0P,SCHENV=STREAMB,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=B,                  *JOB STREAM                 *         
//             HNB1='BBBB',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BBBB'                *O/P &HNB1.CAT761.ACTPI  GDG*         
