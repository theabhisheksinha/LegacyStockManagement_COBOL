//CAT7520P JOB (BP0P,DAC0),'ACATS MRGN SHADOW',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMP,                                                      
//        USER=BP0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE SHADOW POSTING BOOKING FILE.                               *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//*********************************************************************         
//*                                                                             
//STEP01  EXEC CAT650,                                                          
//             STREAM=P,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=PPP,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BPPP',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATSHAD GDG *         
//             NAV=BNAPPP,                                                      
//             EXTR=ACATSHAD,             *USE ACAT SHADOW EXTRACT FILE         
//             IPT=SHD,                   *SPECIAL SHADOW P2 FILE               
//             RPTPI=XSHDPI,              *CREATE SHADOW EXCP REPORT            
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE FILES               
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
//CAT650.IMFPEND DD DUMMY                                                       
//CAT650.BILLFL  DD DUMMY                                                       
//CAT650.BILLOG  DD DUMMY                                                       
