//CAT661MN JOB (BN1P,DAC0),'ACAT FS RPT TRAC',CLASS=U,                          
//         SCHENV=STREAMN,                                                      
//             MSGCLASS=W,USER=BN1P,                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP01  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT661.ACTPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE,AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=                                                            
//STEP20  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT650.XSTLPI(0)',                                     
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP30  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT650.RPTPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
