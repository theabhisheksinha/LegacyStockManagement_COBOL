//CAT6700T JOB (BT0P,DY00),'ACATS BOOK FEES',CLASS=O,MSGCLASS=W,                
//         SCHENV=STREAMT,                                                      
//     PRTY=9,USER=BT0P,                                                        
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE P2 FEE, FRACTIONAL QTY AND TYPE3 BALANCE MOVEMENT TIF FILES.         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT670,                                                          
//             HNB='BTTT',                *O/P .CAT670.FILES      GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             RUNDATE=                                                         
//SORT05.SORTIN DD DUMMY,DCB=(LRECL=644,RECFM=VB)                               
//CAT670.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//*********************************************************************         
//* CREATE P2 FEES FOR NON STANDARD (NON FULL) DELIVERIES.            *         
//*********************************************************************         
//STEP20  EXEC CAT670NS,                                                        
//             HNB='BTTT',                *O/P .CAT670NS.FEE      GDG *         
//             STREAM=T,                  *1 BYTE STREAM ID                     
//             SRMAS='BB.TTT.BSU40.SRMAS',                                      
//             NAV=BNATTT,                                                      
//             RUNDATE=                                                         
//*-------------------------------------------------------------------*         
//* THE FOLLOWING STEP ADDED TO COPY CLIENT 63 QA P2 RECS TO CLIENT 166         
//*    IN THE T STREAM.                                                         
//*-------------------------------------------------------------------*         
//CAT901BK  EXEC CAT901BK                                                       
//INP2FROM DD  DSN=BQQQ.CAT670.P2FEE(0),                       I/P              
//             DISP=SHR                                                         
//INP2ORIG DD  DSN=BTTT.CAT670.P2FEE(+1),                      I/P              
//             DISP=SHR                                                         
//OUTP2    DD  DSN=BTTT.CAT670.P2FEE(+2),                      O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(DSORG=PS,RECFM=FB,LRECL=120)                                
