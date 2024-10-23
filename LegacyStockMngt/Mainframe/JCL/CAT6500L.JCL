//CAT6500L JOB (BL0P,DY00),'ACATS P2 CREATE',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAML,                                                      
//        USER=BL0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//* CREATE P2 INFERFACE FILE.                                         *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//* THE CAGE EXTRACTS ARE DUMMY IN THE RUN; SEE JOB CAT7500Q          *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT650,                                                          
//             STREAM=L,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=LLL,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BLLL',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATPEND GDG *         
//             TMP=,                      *RETAIN SPLIT ACATPEND FILE           
//             NAV=BNALLL,                                                      
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE EXTRACTS            
//             OFUND=,                    *CREATE FUNDSERV UPD FILE             
//             ROLLOVR=,                  *CREATE ROLLOVER EXTRACT              
//             TYP2CSH=,                  *CREATE TYPE2 CASH REPORT FLE         
//             B1FIL='BZZZ.B1FL',                                               
//             NTWRGFL='SL.LLL.BNW50.NTWREGOP',                                 
//             BILFIL='BB.ZZZ.XBILL.BILLFL',                                    
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//CAT650.NTWMASTV DD DSN=SL.LLL.BNW50.NTWMAST,DISP=SHR                          
//CAT650.NTWTRANV DD DSN=SL.LLL.BNW50.NTWTRAN,DISP=SHR                          
//CAT650.NTWPENDV DD DSN=SL.LLL.MFRS.MFPEND,DISP=SHR                            
//*                                                                             
//BR140101.SYSUT001 DD DUMMY                                                    
