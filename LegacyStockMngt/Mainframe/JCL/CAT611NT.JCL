//CAT611NT JOB (BT0P,DY00),'ACATS NA SPCL',CLASS=O,MSGCLASS=W,                  
//         SCHENV=STREAMT,                                                      
//        PRTY=9,USER=BT0P,                                                     
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*******         BNA400 - CREATE NA ONL TIF GDG FILE          ********         
//*********************************************************************         
//BNA400  EXEC BNA400,                                                          
//             UNIT=BATCH,                                                      
//             CARDSIN='BISG.CARDLIB(CAT611NT)',                                
//             HNBO=PBST                                                        
