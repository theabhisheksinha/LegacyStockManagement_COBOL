//CAT760MP JOB (BP0P,0000),'ACAT RV REPORT',CLASS=U,MSGCLASS=W,                 
//         SCHENV=STREAMP,                                                      
//             REGION=4M,USER=BP0P,                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             DSN='BPPP.CAT760.RPTPI(0)',                                      
//             PARAM='AUTO,REPLACE,AC=BP'                                       
