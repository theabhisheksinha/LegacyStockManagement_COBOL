//CAT992SZ JOB (BZ0P,0000),'ACATS: REPORT SPLIT',CLASS=1,MSGCLASS=W,            
//             USER=BZ0P,SECLABEL=BISG,                                         
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEPBANK EXEC PGM=BANKHOL,                                                    
//             PARM='DATE=999999,DISP=P001,RC=0002'                             
//SYSOUT  DD SYSOUT=*                                                           
//*-------------------------------------------------------------------*         
//*  APPEND TRACK SUFFIX TO NSCC REPORT FILE                                    
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=STL,                                                            
//        PM992='S',                                                            
//        INFILE='BZZZ.SIAC0712.ACAT.STL.RPT(0)',                               
//        COND=(2,EQ,STEPBANK)                                                  
//*-------------------------------------------------------------------*         
//*  SPLIT NSCC REPORT FILE IN SAME FORMAT FOR A SPECIFIC CLIENT                
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=STL,                                                            
//        PM992='S',                                                            
//        CL992='CL237',                                                        
//        DUMREG='DUMMY,',                                                      
//        DUMCLT=,                                                              
//        INFILE='BZZZ.SIAC0712.ACAT.STL.RPT(0)',                               
//        COND=(2,EQ,STEPBANK)                                                  
//CAT992.OUTCLT  DD DSN=BIOS.C237.OUT.SIAC0712.ACATSTL(+1)                      
