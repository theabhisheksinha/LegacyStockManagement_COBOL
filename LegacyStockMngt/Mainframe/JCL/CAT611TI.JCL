//CAT611TI JOB (BI0P,DY00),'NA INTRA DAY RPTPT ',CLASS=U,MSGCLASS=W,            
//         SCHENV=STREAMI,                                                      
//         USER=BI0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BIII.CAT611.NA1PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
