//CAT6500Y JOB (BY0P,DY00),'ACATS P2 CREATE',USER=BY0P,CLASS=1,                 
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,                                                      
//         PRTY=15,                                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE P2 INFERFACE FILE.                                         *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//* THE CAGE EXTRACTS ARE DUMMY IN THE RUN; SEE JOB CAT7500Q          *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT650,                                                          
//             STREAM=Y,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=YYY,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BYYY',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATPEND GDG *         
//             TMP=,                      *RETAIN SPLIT ACATPEND FILE           
//             NAV=BNAYYY,                                                      
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE EXTRACTS            
//             OFUND=,                    *CREATE FUNDSERV UPD FILE             
//             ROLLOVR=,                  *CREATE ROLLOVER EXTRACT              
//             TYP2CSH=,                  *CREATE TYPE2 CASH REPORT FLE         
//             B1FIL='BZZZ.B1FL',                                               
//             NTWRGFL='S3.YYY.BNW50.NTWREGOP',                                 
//             BILFIL='BB.ZZZ.XBILL.BILLFL',                                    
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//CAT650.NTWMASTV DD DSN=S3.YYY.BNW50.NTWMAST,DISP=SHR                          
//CAT650.NTWTRANV DD DSN=S3.YYY.BNW50.NTWTRAN,DISP=SHR                          
//CAT650.NTWPENDV DD DSN=S3.YYY.MFRS.MFPEND,DISP=SHR                            
//*                                                                             
//BR140101.SYSUT001 DD DUMMY                                                    
