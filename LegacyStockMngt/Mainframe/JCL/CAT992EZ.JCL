//CAT992EZ JOB (BZ0P,0000),'ACATS: REPORT SPLIT',CLASS=1,MSGCLASS=W,            
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP10  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=EOD,                                                            
//        INFILE='BZZZ.SIAC0711.ACAT.EOD.RPT(0)'                                
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
//        INFILE='BZZZ.SIAC0711.ACAT.EOD.RPT(0)'                                
//CAT992.OUTCLT  DD DSN=BIOS.C237.OUT.SIAC0711.ACATEOD(+1)                      
