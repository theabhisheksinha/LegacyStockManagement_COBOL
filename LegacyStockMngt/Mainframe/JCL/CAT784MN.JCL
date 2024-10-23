//CAT784MN JOB (BN1P,DAC0),'ACAT TLE RPT ',CLASS=U,MSGCLASS=W,                  
//         USER=BN1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=MVSC,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT874R.TLPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE',                                            
//             Q=1,                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=                                                            
