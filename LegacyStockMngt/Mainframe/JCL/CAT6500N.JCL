//CAT6500N JOB (BN1P,DAC0),'ACATS P2 CREATE',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMN,                                                      
//        USER=BN1P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//*                                                                             
//*********************************************************************         
//* CREATE P2 INFERFACE FILE.                                         *         
//* THIS IS A NON-UPDATE JOB AND MAY BE RESTARTED/RERAN.              *         
//* THE CAGE EXTRACTS ARE DUMMY IN THE RUN; SEE JOB CAT7500Q          *         
//*********************************************************************         
//*                                                                             
//STEP10  EXEC CAT650,                    *1 BYTE BATCH STREAM ID     *         
//             BILFIL='BB.ZZZ.XBILL.BILLFL', *I/P 3 BYTE STREAM MEMO FI         
//             BILLOG='BB.ZZZ.XBILL.BILLOG', *O/P .CAT650.FILES      GD         
//             BRKRFL='SZ.ZZZ.CMT07.BROKER', *I/P .CAT650DB.ACATPEND GD         
//             B1FIL='BZZZ.B1FL',           *RETAIN SPLIT ACATPEND FILE         
//             CAGEFL='DUMMY,',              *DONT CREATE CAGE EXTRACTS         
//             OFUND=,                    *CREATE FUNDSERV UPD FILE             
//             ROLLOVR=,                  *CREATE ROLLOVER EXTRACT              
//             TYP2CSH=,                  *CREATE TYPE2 CASH REPORT FLE         
//             CAGEHDR=Y,                                                       
//             EXTR=ACATPEND,                                                   
//             GDG='GDG,',                                                      
//             GEN='(0)',                                                       
//             GENP1='(+1)',                                                    
//             HNB='BNNN',                                                      
//             HNB1='BZZZ',                                                     
//             MSDFIL='POVZ.PMSD.BMS90.MSDFILE',                                
//             MSDXRF='POVZ.PMSD.BMS90.MSDXRF',                                 
//             NAV=BNANNN,                                                      
//             NTWRGFL='SN.NNN.BNW50.NTWREGOP',                                 
//             OVRDPRM=N,                                                       
//             PRNGFL='NULLFILE',                                               
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             P2FL=,                                                           
//             REGSIZE=8M,                                                      
//             RPTPI=RPTPI,                                                     
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(5,10),RLSE)',                                      
//             SPACE2='(CYL,(5,10),RLSE)',                                      
//             SPACE3='(CYL,(5,10),RLSE)',                                      
//             SPACE4='(CYL,(5,10),RLSE)',                                      
//             SPACE5='(CYL,(5,10),RLSE)',                                      
//             SPACE6='(CYL,(5,10),RLSE)',                                      
//             STREAM=N,                                                        
//             STREAM2=NNN,                                                     
//             TMP=,                                                            
//             UNIT='BATCH'                                                     
//*                                                                             
//CAT650.NTWMASTV DD DSN=SN.NNN.BNW50.NTWMAST,DISP=SHR                          
//CAT650.NTWTRANV DD DSN=SN.NNN.BNW50.NTWTRAN,DISP=SHR                          
//CAT650.NTWPENDV DD DSN=SN.NNN.MFRS.MFPEND,DISP=SHR                            
//*                                                                             
//BR140101.SYSUT001 DD DUMMY                                                    
