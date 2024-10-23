//CAT5070F JOB (BF0P,DY00),'ACATS CBRS CONFIRM',CLASS=1,MSGCLASS=W,             
//         USER=BF0P,SECLABEL=BISG                                              
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* READ SIAC CONFIRM FILE. CHECK IF TRANSFERS WENT OUT ON TIME.      *         
//* IF NOT, SET CC=04 TO CAUSE EMAIL STEP TO RUN.                     *         
//*********************************************************************         
//STEP10  EXEC CAT507,                                                          
//             STREAM='F',                         * STREAM INDICATOR *         
//             INF='SIAC.CONFIRM.CADPF.S36708(0)', * I/P FROM SIAC    *         
//             OUTF='BFFF.CAT507.CBRS.EMAIL'       * I/P FROM SIAC    *         
//*                                                                             
//*********************************************************************         
//* CONDITIONAL BASED ON RC=04, SEND EMAIL WITH PROGRAM GENERATED     *         
//* MESSAGE TO THE ADDRESSES DEFINED IN THE CARDLIB.                  *         
//*********************************************************************         
//EMAIL   EXEC SORT,COND=(4,NE,STEP10.CAT507)                                   
//SORTIN  DD DISP=SHR,DSN=BISG.CARDLIB(CAT507EM)                                
//        DD DISP=SHR,DSN=BFFF.CAT507.CBRS.EMAIL                                
//SORTOUT DD SYSOUT=B,DEST=(ADPJSP1,SMTP1)                                      
//SYSOUT  DD SYSOUT=*                                                           
//SORTLIST DD SYSOUT=*                                                          
//SYSIN   DD DSN=BISG.CARDLIB(COPY),DISP=SHR                                    
