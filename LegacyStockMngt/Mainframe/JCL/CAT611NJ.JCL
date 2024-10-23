//CAT611NJ JOB (BJ0P,DY00),'ACATS NA SPCL',CLASS=1,MSGCLASS=W,                  
//         SCHENV=STREAMJ,                                                      
//        USER=BJ0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*******         BNA400 - CREATE NA ONL TIF GDG FILE          ********         
//*********************************************************************         
//BNA400  EXEC BNA400,                                                          
//             UNIT=BATCH,                                                      
//             CARDSIN='BISG.CARDLIB(CAT611NJ)',                                
//             HNBO=PBSJ                                                        
