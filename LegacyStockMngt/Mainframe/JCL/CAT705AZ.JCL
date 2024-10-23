//CAT705AZ JOB (BP00,DY00),'ACAT POSN FROM WM',CLASS=5,MSGCLASS=W,              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* PRE EDIT ACATS EOD DETAILS RECEIVED INDIRECTLY FROM WEALTH MNGT   *         
//*********************************************************************         
//STEP10  EXEC CAT705,                                                          
//             INF='BIOS.C235.INP.WM0718.ACAT.POSN',  * INPUT *                 
//             HNB='BZZZ',                                                      
//             RUNDATE=                                                         
