//CAT8020U JOB (BU1P,DY00),'ACAT PENDING DVND',CLASS=3,MSGCLASS=W,              
//         USER=BU1P,SECLABEL=BISG                                              
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//*                                                                             
//*********************************************************************         
//* SORT/SUM PENDING DIVIDEND FILE AND REPRO TO VSAM.                 *         
//* THIS JOB MAY BE RESTARTED/RERAN.                                  *         
//*********************************************************************         
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT802,                                                          
//        HNB=BUUU,                 * DIVIDEND FEED/SORT FILE                   
//        STREAM=UUU                * BATCH VSAM STREAM                         
