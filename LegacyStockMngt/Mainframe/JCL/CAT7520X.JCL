//CAT7520X JOB (BX0P,DAC0),'ACATS MRGN SHADOW',CLASS=3,MSGCLASS=W,              
//         SCHENV=STREAMX,                                                      
//        USER=BX0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE SHADOW POSTING BOOKING FILE.                               *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//*********************************************************************         
//*                                                                             
//STEP01  EXEC CAT650,                                                          
//             STREAM=X,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=XXX,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BXXX',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATSHAD GDG *         
//             NAV=BNAXXX,                                                      
//             EXTR=ACATSHAD,             *USE ACAT SHADOW EXTRACT FILE         
//             IPT=SHD,                   *SPECIAL SHADOW P2 FILE               
//             RPTPI=XSHDPI,              *CREATE SHADOW EXCP REPORT            
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE FILES               
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
//CAT650.IMFPEND DD DUMMY                                                       
//CAT650.BILLFL  DD DUMMY                                                       
//CAT650.BILLOG  DD DUMMY                                                       
