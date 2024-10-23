//CAT661ML JOB (BL0P,0000),'ACAT FS REPORT',CLASS=U,MSGCLASS=W,                 
//         SCHENV=STREAML,                                                      
//             REGION=4M,USER=BL0P,                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             DSN='BLLL.CAT661.ACTPI(0)',                                      
//             PARAM='TRMX,REPLACE,AC=BP'                                       
//STEP20    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BLLL.CAT650.XSTLPI(0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//STEP30    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BLLL.CAT650.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
