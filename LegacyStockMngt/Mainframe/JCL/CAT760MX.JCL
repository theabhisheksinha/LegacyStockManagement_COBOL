//CAT760MX JOB (BX0P,0000),'ACAT RV REPORT',USER=BX0P,CLASS=U,                  
//         SCHENV=STREAMX,                                                      
//             MSGCLASS=W,REGION=4M,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE,AC=BP',                                      
//             DSN='BXXX.CAT760.RPTPI(0)'                                       
