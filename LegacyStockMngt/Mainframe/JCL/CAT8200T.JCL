//CAT8200T JOB (BT0P,DY00),'ACATS FEE LIQUID',CLASS=O,MSGCLASS=W,               
//         USER=BT0P,SECLABEL=BISG,SCHENV=STREAMT,PRTY=9                        
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* CREATE ACATS FEES, LIQUIDATE PRIVATE FUNDS AND FRACTIONAL QTYS.   *         
//* THIS IS AN UPDATE JOB AND MUST BE RESTARTED CAREFULLY:            *         
//* ABENDS IN STEPS SORT10, CAT820, AND CAT820MG MAY BE RESTARTED     *         
//* IN THE ABENDING STEP.                                             *         
//* ABENDS IN STEP CAT820DB MUST BE RESEARCHED.  IF THE CAT820DB      *         
//* SYSOUT CONTAINS ONE OR MORE OF THE FOLLOWING COMMIT MESSAGES, THE *         
//* RESTART PARMS MUST BE CHANGED AND THE JOB RESTARTED IN THIS STEP. *         
//*                                                                   *         
//*    CAT820DB: SQL COMMIT OK. INP-CNT= 000000010 PREV-CNT=          *         
//*     LAST CASH KEY PROCESSED 04219992070006972023312107900         *         
//*                                                                   *         
//*    CHANGE RESTART='YES' AND RSKEY TO HAVE FIRST 17 BYTES OF THE   *         
//*    LAST OCCURANCE OF SYSOUT MSG "LAST CASH KEY PROCESSED".        *         
//*           RSKEY='04219992070006972',                              *         
//*                                                                   *         
//*   ABENDS IN CAT820DB NOT CONTAINING THE COMMIT MSG, LEAVE PARM    *         
//*            RESTART='NO ' AND RESTART IN THIS STEP.                *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT820,                                                          
//             STREAM=T,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BTTT',                *O/P .CAT820.FILES      GDG *         
//             NAV=BNATTT,                                                      
//             SRMAS='BB.TTT.BSU40.SRMAS',                                      
//             REGOPV='S1.TTT.BNW50.NTWREGOP',                                  
//             RESTART='NO ',             *RESTART DB2 ABEND YES NO             
//             RSKEY='00012345678901234'  *RESTART KEY - CLIENT CNTL  *         
//*                                                                             
//*-------------------------------------------------------------------*         
//* THE FOLLOWING STEP ADDED TO COPY CLIENT 63 QA P2 RECS TO CLIENT 166         
//*    IN THE T STREAM.                                                         
//*-------------------------------------------------------------------*         
//CAT901BK  EXEC CAT901BK                                                       
//INP2FROM DD  DSN=BQQQ.CAT820.P2FEE(0),                       I/P              
//             DISP=SHR                                                         
//INP2ORIG DD  DSN=BTTT.CAT820.P2FEE(+1),                      I/P              
//             DISP=SHR                                                         
//OUTP2    DD  DSN=BTTT.CAT820.P2FEE(+2),                      O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(DSORG=PS,RECFM=FB,LRECL=120)                                
//*-------------------------------------------------------------------*         
//* THE FOLLOWING STEP ADDED TO COPY CLIENT 63 QA P2 RECS TO CLIENT 166         
//*    IN THE T STREAM.                                                         
//*-------------------------------------------------------------------*         
//CAT901TA  EXEC CAT901TA                                                       
//ITACFROM DD  DSN=BQQQ.CAT820.TACTL(0),                       I/P              
//             DISP=SHR                                                         
//ITACORIG DD  DSN=BTTT.CAT820.TACTL(+1),                      I/P              
//             DISP=SHR                                                         
//OUTTACT  DD  DSN=BTTT.CAT820.TACTL(+2),                      O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(DSORG=PS,RECFM=VB,LRECL=8004)                               
