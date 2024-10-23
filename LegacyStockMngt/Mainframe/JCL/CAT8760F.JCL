//CAT8760F JOB (BF0P,DY00),'ACATS MF BALC  ',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMF,                                                      
//         USER=BF0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//STEP10  EXEC CAT876,                                                          
//             B1HDR='BZZZ.B1FL',                                               
//             HNB=BFFF                                                         
