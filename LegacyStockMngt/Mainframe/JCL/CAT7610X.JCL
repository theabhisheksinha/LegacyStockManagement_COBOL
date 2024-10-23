//CAT7610X JOB (BX0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BX0P,SCHENV=STREAMX,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=X,                  *JOB STREAM                 *         
//             HNB1='BXXX',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BXXX'                *O/P &HNB1.CAT761.ACTPI  GDG*         
