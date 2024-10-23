//CAT5700T JOB (BT0P,DY00),'ACATS NA PURGE LKUP',CLASS=O,MSGCLASS=W,            
//         SCHENV=STREAMT,                                                      
//         USER=BT0P,SECLABEL=BISG                                              
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* DROP N/A PURGE RCORDS WHEN ACTIVE ACAT FOUND                      *         
//*********************************************************************         
//STEP20  EXEC CAT570,                                                          
//             HNB='PBST'                 *I/P .BNU080.DELETE     GDG *         
