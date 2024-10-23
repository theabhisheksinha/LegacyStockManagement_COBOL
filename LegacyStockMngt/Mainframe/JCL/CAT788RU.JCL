//CAT788RU JOB (BU1P,DY00),'TAXLOT FL CNVRSN',CLASS=1,MSGCLASS=W,               
//         SCHENV=STREAMU,                                                      
//         USER=BU1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//BR14  EXEC IEFBR14                                                            
//                                                                              
//STEP10  EXEC CAT788CV,                                                        
//             HNB2='BUUU',               *I/P BUUU.CAT788SP          *         
//             HNB3='BUUU'                *O/P B***.CAT788CV.TAXLOT   *         
