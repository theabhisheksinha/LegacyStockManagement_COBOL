//CAT500TN JOB (BN1P,DAC0),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMN,                                                      
//             CLASS=U,MSGCLASS=W,USER=BN1P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**********************************************************************        
//**NON-CA11-JOB   BTR004/BTR06                                                 
//**********************************************************************        
//BTR0410 EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT500R.TRAC(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE',                                            
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=                                                            
//**********************************************************************        
//BTR0420 EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT500D.TRAC(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE',                                            
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=                                                            
