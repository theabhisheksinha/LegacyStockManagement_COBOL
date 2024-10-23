//CAT5700J JOB (BJ0P,DY00),'ACATS NA PURGE LKUP',CLASS=1,MSGCLASS=W,            
//         SCHENV=STREAMJ,                                                      
//         USER=BJ0P,SECLABEL=BISG                                              
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* DROP N/A PURGE RCORDS WHEN ACTIVE ACAT FOUND                      *         
//*********************************************************************         
//STEP20  EXEC CAT570,                                                          
//             HNB='PBSJ'                 *I/P .BNU080.DELETE     GDG *         
