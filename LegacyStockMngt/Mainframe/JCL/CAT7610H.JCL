//CAT7610H JOB (BH0P,DY00),'AUDIT CONTROL REPORT',CLASS=1,MSGCLASS=W,           
//         USER=BH0P,SCHENV=STREAMH,SECLABEL=BISG                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT761,                                                          
//             STREAM=H,                  *JOB STREAM                 *         
//             HNB1='BHHH',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BHHH'                *O/P &HNB1.CAT761.ACTPI  GDG*         
