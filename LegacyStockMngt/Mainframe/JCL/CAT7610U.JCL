//CAT7610U JOB (BU1P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BU1P,SCHENV=STREAMU,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=U,                  *JOB STREAM                 *         
//             HNB1='BUUU',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BUUU'                *O/P &HNB1.CAT761.ACTPI  GDG*         
