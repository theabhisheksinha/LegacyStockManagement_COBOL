//CAT6600T JOB (BT0P,DY00),'ACATS MFRS MF TRAN',CLASS=O,MSGCLASS=W,             
//         SCHENV=STREAMT,                                                      
//        USER=BT0P,PRTY=9,                                                     
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//JOBLIB DD DSN=BTTT.ADP.DATELIB,DISP=SHR                                       
//PROCLIB DD DSN=BISG.T3.PROCLIB,DISP=SHR                                       
//CA11    EXEC CA11                                                             
//BR14    EXEC IEFBR14                                                          
