//CAT611NF JOB (BF0P,DY00),'ACATS NA SPCL',CLASS=1,MSGCLASS=W,                  
//         SCHENV=STREAMF,                                                      
//        USER=BF0P,                                                            
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
//             CARDSIN='BISG.CARDLIB(CAT611NF)',                                
//             HNBO=PBSF                                                        
