//CAT8200X JOB (BX0P,DY00),'ACATS FEE LIQUID',CLASS=1,MSGCLASS=W,               
//         USER=BX0P,SECLABEL=BISG,SCHENV=STREAMX                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
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
//             STREAM=X,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BXXX',                *O/P .CAT820.FILES      GDG *         
//             HNB2='BRRR',               *I/P .CAT810.FILES RRR  GDG *         
//             DUMMY=,                                                          
//             NAV=BNAXXX,                                                      
//             SRMAS='BB.XXX.BSU40.SRMAS',                                      
//             REGOPV='S2.XXX.BNW50.NTWREGOP',                                  
//             RESTART='NO ',             *RESTART DB2 ABEND YES NO             
//             RSKEY='00012345678901234'  *RESTART KEY - CLIENT CNTL  *         
//*                                                                             
