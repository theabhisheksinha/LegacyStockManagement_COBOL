//CAT7610I JOB (BI0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BI0P,SCHENV=STREAMI,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=I,                  *JOB STREAM                 *         
//             HNB1='BIII',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BIII'                *O/P &HNB1.CAT761.ACTPI  GDG*         
