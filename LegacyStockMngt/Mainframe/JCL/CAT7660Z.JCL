//CAT7660Z JOB (BP00,DY00),'ACATS MSD MATCH RPT',CLASS=1,MSGCLASS=W,            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCED                                                              
//*JOBAFF BALANCED                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* READ-ONLY PROCESSING WHICH MAY BE RESTARTED/RERUN                 *         
//* CREATES A REPORT OF RECEIVER SIDE ASSETS WHICH HAVE FUZZY MATCHES *         
//* TO MSD.                                                           *         
//*********************************************************************         
//STEP10  EXEC CAT766,                                                          
//        RUNDATE=                                                              
