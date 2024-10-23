//CAT6500T JOB (BT0P,DY00),'ACATS P2 CREATE',CLASS=O,MSGCLASS=W,PRTY=9,         
//         SCHENV=STREAMT,                                                      
//        USER=BT0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
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
//             STREAM=T,                  *1 BYTE BATCH STREAM ID     *         
//             STREAM2=TTT,               *I/P 3 BYTE STREAM MEMO FILE*         
//             HNB='BTTT',                *O/P .CAT650.FILES      GDG *         
//             HNB1='BZZZ',               *I/P .CAT650DB.ACATPEND GDG *         
//             TMP=,                      *RETAIN SPLIT ACATPEND FILE           
//             NAV=BNATTT,                                                      
//             CAGEFL='DUMMY,',           *DONT CREATE CAGE EXTRACTS            
//             OFUND=,                    *CREATE FUNDSERV UPD FILE             
//             ROLLOVR=,                  *CREATE ROLLOVER EXTRACT              
//             TYP2CSH=,                  *CREATE TYPE2 CASH REPORT FLE         
//             B1FIL='BZZZ.B1FL',                                               
//             NTWRGFL='S1.TTT.BNW50.NTWREGOP',                                 
//             BILFIL='BB.ZZZ.XBILL.BILLFL',                                    
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//CAT650.NTWMASTV DD DSN=S1.TTT.BNW50.NTWMAST,DISP=SHR                          
//CAT650.NTWTRANV DD DSN=S1.TTT.BNW50.NTWTRAN,DISP=SHR                          
//CAT650.NTWPENDV DD DSN=S1.TTT.MFRS.MFPEND,DISP=SHR                            
//*                                                                             
//BR140101.SYSUT001 DD DUMMY                                                    
//*-------------------------------------------------------------------*         
//* THE FOLLOWING STEP ADDED TO COPY CLIENT 63 QA P2 RECS TO CLIENT 166         
//*    IN THE T STREAM.                                                         
//*-------------------------------------------------------------------*         
//CAT901BK  EXEC CAT901BK                                                       
//INP2FROM DD  DSN=BQQQ.CAT650.P2IPT(0),                       I/P              
//             DISP=SHR                                                         
//INP2ORIG DD  DSN=BTTT.CAT650.P2IPT(+1),                      I/P              
//             DISP=SHR                                                         
//OUTP2    DD  DSN=BTTT.CAT650.P2IPT(+2),                      O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(DSORG=PS,RECFM=FB,LRECL=120)                                
