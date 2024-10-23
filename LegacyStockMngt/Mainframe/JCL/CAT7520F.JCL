//CAT7520F JOB (BF0P,DAC0),'ACATS MRGN SHADOW',CLASS=3,MSGCLASS=W,              
//         SCHENV=STREAMF,                                                      
//        USER=BF0P,                                                            
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
//             STREAM=F,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=FFF,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BFFF',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATSHAD GDG *         
//             NAV=BNAFFF,                                                      
//             EXTR=ACATSHAD,             *USE ACAT SHADOW EXTRACT FILE         
//             IPT=SHD,                   *SPECIAL SHADOW P2 FILE               
//             RPTPI=XSHDPI,              *CREATE SHADOW EXCP REPORT            
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE FILES               
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
//CAT650.IMFPEND DD DUMMY                                                       
//CAT650.BILLFL  DD DUMMY                                                       
//CAT650.BILLOG  DD DUMMY                                                       
