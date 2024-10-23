//CAT51OPC JOB (BP00,DY00),'POST LATE ALT',MSGCLASS=W,CLASS=1,                  
//    SECLABEL=BISG                                                             
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**NON-CA11-JOB *                                                              
//STEP01 EXEC PGM=CSYUEV2,                                                      
//       PARM='COMM,CAT5100Z,C'                                                 
