//CAT814TN JOB (BN1P,DAC0),'LQR/ACT/RR/BAL RPT ',CLASS=U,MSGCLASS=W,            
//         SCHENV=STREAMN,                                                      
//         USER=BN1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT820.LQRPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP20  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT836.RPTPI(0)',                                      
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
//             DSN='BNNN.CAT872.ACTPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP40  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT880.RPTPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP45  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT880C.CSPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP47  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT880E.CSPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP50  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT610.NAUPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP60  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT610.PNDPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=BATCH                                                       
//STEP70  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BNNN.CAT31.RPRTPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE',                                            
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=                                                            
