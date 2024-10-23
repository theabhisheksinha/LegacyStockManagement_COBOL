//CAT992RZ JOB (BZ0P,0000),'ACATS: NSCC REJ RPT',CLASS=1,MSGCLASS=W,            
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
//        RPTID=REJ,                                                            
//        PM992='S',                                                            
//        INFILE='BZZZ.SIAC0763.ACAT.REJ.RPT(0)',                               
//        COND=(2,EQ,STEPBANK)                                                  
//*-------------------------------------------------------------------*         
//*  SPLIT NSCC REPORT FILE IN SAME FORMAT FOR A SPECIFIC CLIENT                
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=REJ,                                                            
//        PM992='S',                                                            
//        CL992='CL237',                                                        
//        DUMREG='DUMMY,',                                                      
//        DUMCLT=,                                                              
//        INFILE='BZZZ.SIAC0763.ACAT.REJ.RPT(0)',                               
//        COND=(2,EQ,STEPBANK)                                                  
//CAT992.OUTCLT  DD DSN=BIOS.C237.OUT.SIAC0763.ACATREJ(+1)                      
//*                                                                             
//BMT7105 EXEC BMT71,DD='02',                                                   
//             COND=(2,NE,STEPBANK)                                             
//BMT71.DD01  DD  DSN=BZZZ.CAT992.REJPI(+1),DISP=(NEW,CATLG),                   
//    UNIT=BATCH,DCB=(GDG,LRECL=143,RECFM=FB),SPACE=(CYL,(1,1),RLSE)            
//BMT71.DD02  DD  DSN=BZZZ.CAT992.CL237.REJPI(+1),DISP=(NEW,CATLG),             
//    UNIT=BATCH,DCB=(GDG,LRECL=133,RECFM=FB),SPACE=(CYL,(1,1),RLSE)            
