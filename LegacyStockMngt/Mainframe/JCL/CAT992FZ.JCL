//CAT992FZ JOB (BZ0P,0000),'ACATS: FND RPT SPLT',CLASS=1,MSGCLASS=W,            
//        PRTY=15,                                                              
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//*  APPEND TRACK SUFFIX TO NSCC REPORT FILE                                    
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=FND,                                                            
//        PM992='F',                                                            
//        INFILE='BZZZ.SIAC0715.ACAT.FND.RPT(0)'                                
//*-------------------------------------------------------------------*         
//*  SPLIT NSCC REPORT FILE IN SAME FORMAT FOR A SPECIFIC CLIENT                
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=FND,                                                            
//        PM992='F',                                                            
//        CL992='CL237',                                                        
//        DUMREG='DUMMY,',                                                      
//        DUMCLT=,                                                              
//        INFILE='BZZZ.SIAC0715.ACAT.FND.RPT(0)'                                
//CAT992.OUTCLT  DD DSN=BIOS.C237.OUT.SIAC0715.ACATFND(+1)                      
