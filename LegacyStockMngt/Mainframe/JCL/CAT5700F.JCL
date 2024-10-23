//CAT5700F JOB (BF0P,DY00),'ACATS NA PURGE LKUP',CLASS=1,MSGCLASS=W,            
//       SCHENV=STREAMF,USER=BF0P,SECLABEL=BISG                                 
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* DROP N/A PURGE RCORDS WHEN ACTIVE ACAT FOUND                      *         
//*********************************************************************         
//STEP20  EXEC CAT570,                                                          
//             HNB='PBSF'                 *I/P .BNU080.DELETE     GDG *         
