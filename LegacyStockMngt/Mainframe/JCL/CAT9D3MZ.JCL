//CAT9D3MZ JOB (BP00,DY00),'ACATS: REPORT SPLIT',CLASS=U,MSGCLASS=W,            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//CA11    EXEC CA11                                                             
//BTR0405  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BZZZ.CAT992.TR3PI(+0)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//BTR0405  EXEC  BTR004,                                                        
//            UNIT=BATCH,                                                       
//            DSN='BZZZ.CAT530.RVEPI(0)',                                       
//            PARM='AUTO,REPLACE.AC=BP'                                         
