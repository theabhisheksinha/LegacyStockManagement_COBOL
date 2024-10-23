//CAT784MJ JOB (BJ0P,DY00),'ACAT TLE RPT ',CLASS=U,MSGCLASS=W,                  
//         USER=BJ0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BJJJ.CAT784R.TLPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
