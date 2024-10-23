000001* PDX    - CAT810   C0360671 02/23/15 11:22:40 TBLAMUR            00001000
      * LRM058 SSR# 99150 MARK CONTRA CUSIP POSN AS WHI-STTS-CD = C TO          
      *   CAUSE ONLINE DSPLY WARNING WHEN CLIENT REMOVES THE WITHHELD.          
      *   ADD SETTLE LOC 35 TO BYPASS CONTRA CUSIP TEST.                        
000001* PDX    - CAT810   C0355480 06/12/14 11:55:24 TBLAMUR            00001000
      * CSG001 SSR 101121 REPLACE ILLEGAL CHARS IN MSD-DESC WITH SPACES.        
      * LRM056 SSR# 95308 USE EXPANDED MSD OPTION FACTOR                        
000001* PDX    - CAT810   C0353648 04/11/14 11:41:30 TBLAMUR            00001000
      * LRM055 SSR# 100417 SET FUND AGENT CODE NEW COL ON ACTIMF.               
000001* PDX    - CAT810   C0352986 03/20/14 01:54:44 TBLAMUR            00001000
000001* LRM054 CORRECT RETURN CODE 46 ABEND                                     
000001* PDX    - CAT810   C0346158 10/14/13 08:42:49 TBLAMUR            00001000
000001* LRM053 SSR 83186 MMF NOT VALUED AT $1.00 PER SHARE, USE                 
000001*   THE MARKET VALUE, NOT THE QTY ON THESE POSITIONS.  CHANGE TO          
000001*   USE COPYBOOK CUSHOL (FROM HOLDAVSM) TO OBTAIN THE MMF CENTS.          
000001* PDX    - CAT810   C0344128 09/16/13 09:28:53 TBLAMUR            00001000
000001* LRM052 SSR 94296 RECOMPILE FOR EXPANDED BNWMASTW AND                    
      *    NEW COPYBOOK VERSION FOR NTWIOREC.                                   
000001* PDX    - CAT810   C0342332 07/23/13 13:59:21 TBLAMUR            00001000
000001* LRM051 SSR 90984 PASSS ORIG ACCT FLAT TO ACENDIS BY CAUSING             
      * THE ACCOUNT FLAT EDIT.                                                  
000001* PDX    - CAT810   C0336625 06/17/13 09:11:29 TBLAMUR            00001000
000001* LRM050 SSR 85742 DST/SCHWAB SUPER OMNI FUNDS.                           
000001*  NTWMAST VALUE 5 USE WAIVE ACCOUNT.                                     
000001* PDX    - CAT810   C0336021 06/13/13 09:09:05 TBLAMUR            00001000
000001* LRM049 SSR 80735 MMF SWEEP CODE EXPAND TO 999.                          
      *  NO CHANGES TO ICTL TABLE AT THIS TIME; SEPERATE SSR TO FOLLOW.         
000001* PDX    - CAT810   C0335509 04/02/13 13:51:00 TBLAMUR            00001000
000001* LRM042 SSR 83475 SEND SPAD EXCPTIONS TO ASCENDIS BY WRITING             
      *   OUT ON CATEXCP FILE.  FIX FOR OPTION SYMBOL LOW-VALUES.               
000001* SSR 88342 REMOVE TEMP LINES TO CAUSE FCUR BALS TO BE CREATED            
000001*   FOR ASCENDIS CLIENTS.                                                 
000001* PDX    - CAT810   C0332648 11/26/12 14:10:27 TBLAMUR            00001000
000001* LRM048 SSR 86111 CONSIDER SINGLE FUND ACCOUNT B1 WHEN                   
      *   READING NETWORK MASTER.                                               
000001* PDX    - CAT810   C0333590 11/12/12 09:36:10 TBLAMUR            00001000
      * LRM047 SSR 86856 PP BYPASS CURRENCY 254.                                
000001* PDX    - CAT810   C0331869 10/15/12 08:19:05 TBLAMUR            00001000
000001* LRM046 SSR 86655 CAUSE NON PRICED ASSETS TO BY .01 PER SHARE            
      *   NOT 1.00 (WAS MOVING QTY TO AMT); IF THE AMT IS LESS THAN             
      *   $1.00, TO USE $1.00.                                                  
000001* PDX    - CAT810   C0329036 10/10/12 15:36:03 TBLAMUR            00001000
000001* PDX    - CAT810   C0329036 09/12/12 14:12:58 TBLAMUR                    
      * LRM045 SSR 85105 CHANGE FOREIGN ASSET LOGIC TO MOVE THE                 
      * MSD ISIN (ALL 12 BYTES) WHEN THE CUSIP IS MISSING.                      
000001* LRM044 SSR 86856 INCLUDE BALS HELD IN FOREIGN CURRENCY                  
      * DELIVERY AS SLOC=50, XSET, FCUR WITH COMMENT.                           
000001* LRM043 SSR 84763 INCLUDE POSN HELD IN FOREIGN CURRENCY IN THE           
      * DELIVERY AS SLOC=50, XSET WITH COMMENT; NEW B1 434763.                  
000001* PDX    - CAT810   C0326246 05/31/12 11:03:46 TBLAMUR            00001000
000001* LRM041 SSR 83441 FULL-PRTL CODE SHOULD ALWAYS BE 2 PARTIAL.             
000001*  ADDITIONAL CHANGE FOR PENDING DIV NOTFOUND BUG.                        
000001* PDX    - CAT810   C0319859 03/27/12 09:16:01 TBLAMUR            00001000
      * LRM040 SSR 79096 ADDITIONAL CHANGE, HANDLE MULTI PEND DIV               
      *    CURRENCIES BY BYPASSING NON 000 AND 001 IN THE ACCOUNT.              
000001* PDX    - CAT810   C0324522 03/22/12 10:27:45 TBLAMUR            00001000
      * LRM039 COMMENT OUT TYPE4 CHANGE.                                        
000001* PDX    - CAT810   C0321761 02/20/12 09:23:28 TBLAMUR            00001000
      * LRM039 SSR 79558 CLIENT 10 INCLUDE TYPE4 MEMOS AS 50 SFK FOR            
      *   RS,PP,R7,CJ,TL,SK IN THE DELIVERY.                                    
000001* PDX    - CAT810   C0319859 02/17/12 09:22:03 TBLAMUR            00001000
      * LRM038 SSR 79096 ADDITIONAL CHANGE, USE INCLUDE PEND DIV ONLY           
      *   WHEN PAY-DATE > TODAY; OTHERWISE DIV WAS ALREADY BOOKED.              
      *   ALSO INITIALIZE WK-MS-ASSET-TYPE IN REGT RTN TO RESOLVE               
      *    PROBLEM IN ASCENDIS AND LATER CAT950A WITH REC LENGTH.               
000001* PDX    - CAT810   C0321444 01/13/12 14:18:47 TBLAMUR            00001000
      * LRM037 SSR 81018 USE 'OR' LOGIC TO COVER NON MMFVALID A000*.            
000001* PDX    - CAT810   C0321184 01/09/12 11:46:33 TBLAMUR            00001000
000001* PDX    - CAT810   C0317345 12/28/11 09:44:46 TBLAMUR            00001000
      * LRM033 SSR 79096 WITHHOLD BAL TO COVER PENDING DIVIDEND DEBIT           
      * LRM034 SSR 80728 WITHHOLD MUTUAL FUND WITH NTW LVL=4 WHEN               
      *   B1 434743 = 0, WHICH IS THE DEFAULT TO WITHHOLD, VALUE 1 MEANS        
      *   TO DELIVER.  INSERT AUDIT ROW WITH CLIENT L### INTO ACTIAST           
      *   TO CAUSE CAT770 TO CREATE Y SCREEN UPDATE.                            
      * LRM035 SSR 81018 UPGRADE MMF A000* LOOKUP TO COPYBOOK MMFVALID          
      * LRM036 SSR 81391 UPGRADE IRA 866 SECURITY RANGES                        
000001* PDX    - CAT810   C0311358 05/03/11 14:27:59 TBLAMUR            00001000
      * LRM027 SSR 76911 CORRECT B1 434517=3 TO CONSIDER 090 SUFFIX             
000001* PDX    - CAT810   C0306932 01/21/11 15:02:21 TBLAMUR            00001000
      * LRM026 SSR TBD   CORRECT SPAD-SECURITY GETTING DELIVERED                
000001* PDX    - CAT810   C0302557 12/09/10 15:14:27 TBLAMUR            00001000
000001* PDX    - CAT810   C0296621 09/21/10 10:25:46 TBLAMUR            00001000
      * LRM025 SSR 71810 CREATE FOREIGN FEE ASSET RECORD ON ACATDLVF            
      *   WHEN ISIN(1:2) NOT 'US', AND NOT DTC OR CNS.                          
000001* PDX    - CAT810   C0299269 08/16/10 16:18:47 TBLAMUR            00001000
      * LRM024 SSR 62889 CONTINUED... ADD PARTIALLY CALLED BOND LOOKUP          
000001* PDX    - CAT810   C0295620 06/11/10 13:39:34 TBLAMUR            00001000
      * LRM023 SSR 62889 WITHHOLD MATURING OR CALLED BONDS; CREATE              
      *  MEMO RATHER THAN DELIVERY ASSET. B1 434748 HAS 3 SETTINGS,             
      *   1 - BYPASS SEC, 2 - CREATE MEMO, 3 MEMO AND (ADD TO X SCREEN          
      *   INSERT ACTIAST ROW CLIENT= W### TO DRIVE X SCREEN UPDATE).            
000001* PDX    - CAT810   C0292845 04/06/10 11:10:45 TBLAMUR            00001000
      * LRM022 SSR 67411 PNC SURPAS FUNDS                                       
000001* PDX    - CAT810   C0293243 03/04/10 07:53:27 TBLAMUR            00001000
      * LRM021 SSR 59603 OLD STRIKE PRICE IF MSD EXP PRICE IS ZERO              
000001* PDX    - CAT810   C0288347 01/07/10 14:13:14 TBLAMUR            00001000
      * LRM020 SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM                  
000001* PDX    - CAT810   C0287084 11/03/09 07:56:21 TBLAMUR            00001000
      * LRM019 SSR 66946 CAMS THRESHOLD FUND EXPANSION.                         
000001* PDX    - CAT810   C0286143 10/30/09 09:59:42 TBLAMUR            00001000
      * LRM018 SSR 59603 OPTION SYMBOLOGY CHANGES.                              
      *   USE PARM-STREAM = Q HARD CODE AT THIS TIME.                           
      *   CHANGE ASSET DESC FORMATTING WHEN MSD NOTFND FOR OPTIONS.             
      *   USE EXPANDED STRIKE PRICE FROM MSD.  CHANGE OPT SYMBOL TO USE         
      *   MSD-OCC-OPTN-SYM-ID, AND WHEN MISSING, CALL MSD TO                    
      *   OBTAIN THE UNDERLYING SEC SYMBOL; REMOVE OPRA CODE LOGIC.             
000001* PDX    - CAT810   C0278316 04/13/09 11:23:17 TBDOJUN            00001000
      * DJ0017 SSR 61075 FRACTIONAL SHARES ON MUNI TAX EXEMPT UNITS             
      * DJ0017 SSR 61867 USE ADP-NO TO READ VRSTSEC(NO MORE CUSIP)              
000001* PDX    - CAT810   C0275568 03/09/09 09:56:24 TBDOJUN            00001000
      * DJ0016 SSR 61065 BH-MF-EXBR-OPTION(537483)=1,USE MF EXBR TABLE          
      * DJ0016 FOR THE MUTUAL FUND EXECUTING BROKER NUMBER                      
000001* PDX    - CAT810   C0273186 11/24/08 17:32:07 TBDOJUN            00001000
      * DJ0015 SSR 59508 FOR SMA,CASH, ADD TO MEMO COUNT.                       
      * DJ0015 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN. FIX SYNTAX.           
000001* PDX    - CAT810   C0269375 10/20/08 14:45:52 TBDOJUN            00001000
      * DJ0014 SSR 59508 IF TRANSFER HAS ONLY MEMO ASSETS, REJECT               
      * DJ0014 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN                        
000001* PDX    - CAT810   C0266770 07/14/08 08:43:21 TBDOJUN                    
      * DJ0013 SSR 55171 READ ACTRBSC TABLE FOR MMF DELIVER AS CASH             
      * DJ0013 SSR 55766 ASCENDIS(WORKFLOW) SET ASCENDIS INDICATOR              
      * DJ0013 FOR FUL,PTR,PTD ONLY AND BH-ACAT-ASCENDIS-USER = '1'             
      * DJ0013 ASCENDIS - CREATE WITHHOLD FILE                                  
      * LRM013 ASCENDIS - PASS MMF DELIVERED AS CASH ON ACATDLVF.               
000001* PDX    - CAT810   C0258402 12/18/07 10:32:29 TBLAMUR                    
      * LRM012 SSR 55746 ASSET SUBMIT BUG ON H SCREEN, WIPE NSCC-PEND.          
000001* PDX    - CAT810   C0254567 09/21/07 08:54:27 TBLAMUR                    
000001* PDX    - CAT810   C0249658 07/09/07 08:30:29 TBDOJUN                    
      * DJ0011 SSR 51567 SIAC SHORTEN CYCLES. REMOVE SUBMIT LOGIC.              
000001* PDX    - CAT810   C0249006 06/29/07 12:33:24 TBDOJUN                    
      * DJ0010 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
      * DJ0010           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT810   C0245386 03/28/07 12:08:07 TBDOJUN                    
      * DJ0009 - SSR 49202 CREATE '45' MEMO FOR REGT, 90DR                      
000001* PDX    - CAT810   C0235973 07/10/06 10:07:11 TBDOJUN                    
      * DJ0008 - SSR 44420 USE MSD PRICE MULTIPLIER                             
000001* PDX    - CAT810   C0236617 06/28/06 13:42:01 TBLAMUR                    
      * LRM009 - SSR 47984 BUG FIX GETNA NOTFND CAUSED PRIMARY MMF              
      *        - TO NOT DLVR AS CASH                                            
000001* PDX    - CAT810   C0233823 05/08/06 13:30:10 TBLAMUR                    
      * ET0006 - CREATE A NEW CHANGE RECORD FOR A FLAT ACCOUNT IF               
      *          THE ACCOUNT WAS TRANSFERED INTERNALLY TO A NON FLAT AC         
000001* PDX    - CAT810   C0231736 04/13/06 15:12:36 TBDOJUN                    
      * DJ0007 - SSR# 44629 - MAINTAIN ONE MF NETWORK LEVEL                     
      * DJ0007 - B1#537486: 1=ONE NETWORK-LEVEL 3 FUND ACCOUNT                  
      * DJ0007 - IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                             
000001* PDX    - CAT810   C0230098 02/16/06 10:28:35 TBDOJUN                    
      * LRM008 - SSR 45101 DELIVER CAMS THRESHOLD FUNDS AS CASH.                
      * LRM008 - TREATED LIKE PRIMARY FUNDS.                                    
000001* PDX    - CAT810   C0227894 12/12/05 10:47:19 TBDOJUN                    
      * DJ0006 - SSR# 42122 RESCIND BLOCK FIX. USE BRN/ACCT IN LOOKUP           
000001* PDX    - CAT810   C0218155 03/17/05 10:56:47 TBDOJUN                    
      * DJ0005 - SSR# 38793 ADD IRA SECURITY RANGE 8667304-8667310              
      * DJ0005 - SSR# XXXXX DO NOT POPULATE TRANS-RFRN-ID-CD                    
000001* PDX    - CAT810   C0215363 02/14/05 08:02:38 TBDOJUN                    
      * DJ0004 - SSR# 38793 EXPAND IRA SECURITY RANGE FOR BYPASSING             
      * DJ0004 - SSR# 40042 NEW DB2 INIT TBL: ACTI***,NEW KEY STRUCTURE         
      * DJ0004 - SSR# 40173 ALLOW MSD SEC NO ALPHANUMERIC                       
      * DJ0004 - SSR# 40271 FIX UNITS RANGE                                     
      * DJ0004 - MIPS REDUCTION: CHG TO PIC 9 COMP-3.                           
      * PDX    - CAT810   C0183314 02/12/04 12:23:18 TBLAMUR                    
      * LRM007 - SSR 0024803 DECIMAL STRIKE PRICE                               
      * PDX    - CAT810   C0197442 10/27/03 12:35:06 TBLAMUR                    
      * PDX    - CAT810   C0196644 10/06/03 11:32:20 TBLAMUR                    
      * PDX    - CAT810   C0194849 08/25/03 10:10:42 TBLAMUR                    
      * PDX    - CAT810   C0182051 02/12/03 15:45:11 TBLAMUR                    
      * ET0005 - MARGIN RETOOL - CALL NEW I/O MODULES GETVBAL & GETVHOL         
      * PDX    - CAT810   C0179727 10/28/02 10:50:58 TBLAMUR                    
      * LRM005 - SSR 0026952 RESCIND BLOCK                                      
      * PDX    - CAT810   C0179270 10/08/02 08:35:47 TBLAMUR                    
      * LRM004 - SSR 0029440 MUTUAL FUND DST/MFE CHANGE                         
      * PDX    - CAT810   C0179392 09/06/02 15:10:29 TBEDTAK                    
      * ET0004 - FOR PRIVATE RANGE FUNDS, SET STTL LOCATION TO '50' AND         
      *          STTL REASON CODE TO 'XSET' FOR CLIENT 39 (BERNSTEIN).          
      * PDX    - CAT810   C0179141 08/23/02 14:07:18 TBLAMUR                    
      * LRM003 - CHANGE ET0002 TO TRANSFER MMF FUNDS AS ASSETS WHEN             
      *          434510 = 2,3 AND NOT MATCHED TO CAMS LIQ.                      
      * PDX    - CAT810   C0176254 07/31/02 15:51:18 TBEDTAK                    
      * ET0003 - REMOVE FRACTIONAL QTY FROM CNS ELIGIBLE ADRS                   
      * ET0002 - MODIFY MMF PROCESS BY ADDITIONAL B1(434510) VALUES             
      * PDX    - CAT810   C0176431 07/01/02 14:51:12 TBLAMUR                    
      * LRM002 - SSR# 0029188 MULTI PLATFORM O-NSCC                             
      * PDX    - CAT810   C0173277 05/13/02 09:16:43 TBEDTAK                    
      * ET0001 - ADJUST CASH AMT BY PENDING AMOUNT                              
      * PDX    - CAT810   C0171522 04/04/02 11:14:46 TBLAMUR                    
      * PDX    - CAT810   C0158046 05/29/01 09:52:52 TBLAMUR                    
      * LRM001 - R5762700 OVERRIDES TO FNBR ON DELVR FOR O-NSCC                 
      * LRM001 - INCLUDE A000015,17,26,27,28,29,31 IN MONEY MKT RANGE           
      * PDX    - CAT810   C0155408 03/07/01 16:35:51 TBLAMUR                    
      * PDX    - CAT810   C0152145 01/16/01 16:42:07 TBDOJUN                    
      * DJ0002 - USE B1 434608 FOR FUND ACCOUNT NUMBER                          
      * DJ0002 - SSR# R162800 FIX WITHHOLD LOGIC. COBOL LE                      
      *          IF SK,SN,TL,TL IS ON B1 434533, WITHHOLD THE ASSETS            
      * PDX    - CAT810   C0139071 03/03/00 08:50:16 TBLAMUR                    
      * PDX    - CAT810   C0128921 08/16/99 10:07:10 TBDOJUN                    
      * DJ0001 - BYPASS IF QTY < 0 AND ORIG-QTY > 0                             
      * DJ0001 - ALPHA BRANCH - CHANGE ACBALVSM TO ACBALALP                     
      * DJ0001 - ALPHA BRANCH - CHANGE HOLDNVSM TO HOLDAVSM                     
      * DJ0001 - DELETE COPYBOOK POSRECOB                                       
      * DJ0001 - LIQUIDATE FRACTIONS FOR CNS ELIGIBLE UNITS                     
      * PDX    - CAT810   C0125737 06/21/99 14:57:16 TBDOJUN                    
      * DJ     - USE MRGIMM FILE FOR MEMO LOOKUP. REMOVE SRMAS.                 
      * DJ     - INCLUDE A000039 IN MONEY MARKET RANGE                          
      * PDX    - CAT810   C0124764 05/06/99 10:41:23 TBDOJUN                    
      * DJ     - USE TRNFR-TYPE-RJC2-CD = 'F' TO FLAG FLAT ACCOUNT              
      *          REMOVE TRNFR_TYPE_CD = 'FUL' FROM WHERE CLAUSE                 
      * PDX    - CAT810   C0123087 04/12/99 10:34:38 TBDOJUN                    
      * PDX    - CAT810   C0123099 03/13/99 10:04:53 TBDOJUN                    
      * PDX    - CAT810   C0122736 03/11/99 20:03:50 TBDOJUN                    
      * PDX    - CAT810   C0122310 02/25/99 12:42:16 TBDOJUN                    
      * PDX    - CAT810   C0122248 02/24/99 15:49:15 TBDOJUN                    
      * PDX    - CAT810   C0122194 02/23/99 11:51:16 TBDOJUN                    
      * PDX    - CAT810   C0122134 02/22/99 15:15:15 TBDOJUN                    
      * PDX    - CAT810   C0122069 02/21/99 15:25:40 TBDOJUN                    
      * PDX    - CAT810   C0121541 02/14/99 22:48:36 TBDOJUN                    
      * PDX    - CAT810   C0121508 02/08/99 23:05:40 TBDOJUN                    
      * PDX    - CAT810   C0121209 02/05/99 22:29:10 TBDOJUN                    
      * PDX    - CAT810   C0121087 02/01/99 10:14:14 TBDOJUN                    
      * PDX    - CAT810   C0120784 01/29/99 12:10:10 TBDOJUN                    
      * PDX    - CAT810   C0120573 01/21/99 13:43:31 TBDOJUN                    
      * PDX    - CAT810   C0119405 01/06/99 16:17:53 TBDOJUN                    
      * PDX    - CAT810   C0118401 12/10/98 15:49:35 TBDOJUN                    
      * PDX    - CAT810   C0109316 11/13/98 13:19:00 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT810.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT810 - RELOAD  ASSETS FOR NEW FULL DELIVER TO INIT TABLES.  *         
      *                                                               *         
      * SELECT FULL TRANSFER DELIVERY REQUESTS ON ACTIVE DB2 TABLE,   *         
      * WHERE STATUS = 100(REQUEST) OR 110(REQUEST ADJUST).           *         
      *                                                               *         
      * IF DAYS-IN-STATUS = B1#434516 DAYS, MOVE ' ' TO NSCC-PEND-CD. *         
      *                                                               *         
      * IF  STATUS = 130(REQUEST-PAST), AUTO SUBMIT.                  *         
      *                                                               *         
      * IF (STATUS = 100(REQUEST) OR 110(REQUEST ADJUST) AND          *         
      *     # OF DAYS > B1 ),                                         *         
      * OR (STATUS = 120(REQUEST-ADJUST-PAST) OR 130(REQUEST-PAST)),  *         
      *    IF THERE ARE INIT ASSETS, SUBMIT,                          *         
      *    ELSE RELOAD AND SUBMIT.                                    *         
      *                                                               *         
      * READ BPS VSAM BALANCE, POSITIONS, MRGIMM MEMO  FILES TO       *         
      * CREATE THE ASSETS AND LOAD TO THE INIT TABLES.                *         
      * IF OPTIONS, ALSO LOAD TO INIT OPTION TABLE.                   *         
      * IF MUTUAL FUNDS, ALSO LOAD TO THE INIT MUTUAL FUND TABLE.     *         
      * SUBTRACT MEMO-QTY FROM POS-QTY BASED ON B1 AND SK,SN.         *         
      * IF SAFEKEEPING MEMO (SN,SK), CREATE A MEMO ASSET.             *         
      *                                                               *         
      * IF IT IS A MUTUAL FUND NETWORKING LEVEL 4,                    *         
      *    AND B1# 511220 IS ON, IGNORE THE SK QTY. SEND AS FUND/SERV.*         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - VTRNFR - ACATS ACTIVE TRANFER DB2 TABLE              *         
      *        - BALANCE FILE                                         *         
      *        - POSITION FILE                                        *         
      *        - MRGIMM MEMO  FILE                                    *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - DB2 DATABASE                                         *         
      *        - ACATDLVF TRANSFER FEE FILE                           *         
      *                                                               *         
      * REJECT FULL TRANSFER DELIEVER IF THE FOLLOWING B1 EQUAL '1'   *         
      * BH-ACAT-REJ-PEND-FULL-REC-AMT  (434556)                       *         
      * BH-ACAT-REJ-DEL-MARGIN-DEBIT                                  *         
      * BH-ACAT-REJ-DEL-ASSET-VALUE                                   *         
      * BH-ACAT-REJ-DEL-TOTL-ACT-VAL                                  *         
      * BH-ACAT-REJ-PEND-DEL-SPAD-NO   (434557)                       *         
      * BH-ACAT-REJ-PEND-DEL-SPADS     (434557)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-DUP  (434558)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-MM   (434559) CAT513                *         
      * BH-ACAT-REJ-PEND-FULL-DEL-NTS  (434560)         CAT810        *         
      * BH-ACAT-REJ-PEND-FULL-DEL-FLAT (434561)         CAT810        *         
      * BH-ACAT-REJ-PEND-FULL-DEL-LP   (434562)         CAT810        *         
      * BH-ACAT-REJ-PEND-FULL-DEL-QRP  (434564)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-SP   (434565) CAT513                *         
      * BH-ACAT-REJ-PEND-FULL-DEL-CNTR (434566)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-PRIV (434567)         CAT810        *         
      * BH-ACAT-REJ-PEND-FULL-DEL-SS   (434568) CAT513                *         
      *                                                               *         
      *****************************************************************         
      * 07/30/98 DJ    NEW PROGRAM                                    *         
      * 04/20/99 - USE TRNFR-TYPE-RJC2-CD = 'F' TO FLAG FLAT ACCOUNT  *         
      *                                                               *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
ET0002     SELECT MMF-FILE          ASSIGN TO MMFFL.                            
ET0002                                                                          
           SELECT MRGIMM            ASSIGN TO MRGIMM                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MRGIMM-SEQ-KEY                              
                  FILE STATUS IS    MRGIMM-STATUS.                              
                                                                                
           SELECT PRNGFL            ASSIGN TO PRNGFL                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     PRNGKEY                                     
                  FILE STATUS IS    PRNGFL-STATUS.                              
                                                                                
           SELECT MFMSD             ASSIGN TO MFMSD                             
                  ACCESS            RANDOM                                      
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MAIN-KEY                                    
                  FILE STATUS IS    MFMSD-STATUS.                               
                                                                                
LRM033     SELECT DVNDFL            ASSIGN TO DVNDFL                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     DVND-KEY                                    
                  FILE STATUS IS    DVNDFL-STATUS.                              
                                                                                
           SELECT BNWMAST           ASSIGN TO BNWMAST                           
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MAST-KEY-AREA                               
                  FILE STATUS IS    BNWMAST-STATUS.                             
                                                                                
           SELECT BNWREGOP          ASSIGN TO BNWREGOP                          
                  ACCESS            RANDOM                                      
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     REG-OPT-KEY-AREA                            
                  FILE STATUS IS    BNWREGOP-STATUS.                            
                                                                                
DJ0016     SELECT MFEXBR            ASSIGN TO MFEXBR                            
DJ0016            ACCESS            RANDOM                                      
DJ0016            ORGANIZATION      INDEXED                                     
DJ0016            RECORD KEY IS     EXBR-KEY                                    
DJ0016            FILE STATUS IS    MFEXBR-STATUS.                              
                                                                                
           SELECT ACATDLVF         ASSIGN      TO ACATDLVF                      
                                   FILE STATUS IS ACATDLVF-FILE-STATUS.         
                                                                                
DJ0013     SELECT CATWHLD          ASSIGN      TO CATWHLD                       
DJ0013                             FILE STATUS IS CATWHLD-FILE-STATUS.          
LRM042     SELECT CATEXCP          ASSIGN      TO CATEXCP                       
LRM042                             FILE STATUS IS CATEXCP-FILE-STATUS.          
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
ET0002 FD  MMF-FILE                                                             
ET0002     LABEL RECORDS ARE STANDARD                                           
ET0002     RECORDING MODE IS V                                                  
ET0002     BLOCK CONTAINS 0 RECORDS.                                            
ET0002     COPY CATMMF  REPLACING ==:CAT:== BY ==I==.                           
ET0002                                                                          
      /                                                                         
       FD  MRGIMM.                                                              
           COPY  POSMEMOR REPLACING ==:POSMEMO:== BY ==MRGIMM==.                
      /                                                                         
       FD  PRNGFL.                                                              
           COPY PRNGRECC.                                                       
      /                                                                         
LRM033 FD  DVNDFL.                                                              
LRM033     COPY ACATDIVI  REPLACING ==:FMT:== BY ==DVND==.                      
      /                                                                         
       FD  MFMSD.                                                               
       01  MFMSD-REC.                                                           
           COPY MFMSDREC.                                                       
      /                                                                         
       FD  BNWMAST.                                                             
       01  BNWMAST-REC.                                                         
           COPY BNWMASTW.                                                       
      /                                                                         
       FD  BNWREGOP.                                                            
       01  BNWREGOP-RECORD.                                                     
           COPY BNWREGOP.                                                       
      /                                                                         
DJ0016 FD  MFEXBR.                                                              
DJ0016 01  MFEXBR-REC.                                                          
DJ0016     COPY MFEXBR.                                                         
      /                                                                         
       FD  ACATDLVF                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
           COPY ACATDLVF REPLACING ==:FMT:== BY ==ACATDLVF==.                   
      /                                                                         
DJ0013 FD  CATWHLD                                                              
DJ0013     RECORDING MODE IS F                                                  
DJ0013     BLOCK CONTAINS 0 RECORDS.                                            
DJ0013     COPY CATWHLD REPLACING ==:CATWHLD:== BY ==CATWHLD==.                 
      /                                                                         
LRM042 FD  CATEXCP                                                              
LRM042     RECORDING MODE IS F                                                  
LRM042     BLOCK CONTAINS 0 RECORDS.                                            
LRM042     COPY CATEXCP REPLACING ==:CATEXCP:== BY ==CATEXCP==.                 
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT810'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.                 
               88 NOT-FIRST-TIME                     VALUE '1'.                 
           05  NTW-NSCCSRC-ACCT-FLAG        PIC  X(01)  VALUE SPACES.           
               88  NTW-NSCCSRC-ACCT                     VALUE 'Y'.              
               88  NTW-NOT-NSCCSRC-ACCT                 VALUE 'N'.              
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
ET0002     05  EOF-MMF-SW                PIC  X(001) VALUE '0'.                 
ET0002         88 EOF-MMF                            VALUE '1'.                 
LRM042     05  W-SPAD-FND-SW             PIC X(01).                             
LRM042         88  W-SPAD-FOUND                      VALUE 'Y'.                 
           05  INFILE-FILE-STATUS        PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  BALNC-STATUS              PIC X(002).                            
               88 BALNC-OKAY             VALUE '00' THRU '09', '97'.            
LRM054         88 BALNC-END-OF-FILE      VALUE '10' '46'.                       
               88 BALNC-NOT-FOUND        VALUE '23'.                            
               88 BALNC-EMPTY-MISSING    VALUE '35'.                            
           05  POSVSAM-STATUS            PIC X(002).                            
               88 POSVSAM-OKAY           VALUE '00' THRU '09', '97'.            
               88 POSVSAM-END-OF-FILE    VALUE '10'.                            
               88 POSVSAM-NOT-FOUND      VALUE '23'.                            
               88 POSVSAM-EMPTY-MISSING  VALUE '35'.                            
           05  PRNGFL-STATUS             PIC X(002).                            
               88 VALID-PRNGFL-STATUS    VALUE '00' '04' '10' '23'.             
               88 PRNGFL-OKAY            VALUE '00' THRU '09', '97'.            
               88 PRNGFL-END-OF-FILE     VALUE '10'.                            
               88 PRNGFL-NOT-FOUND       VALUE '23'.                            
               88 PRNGFL-EMPTY-MISSING   VALUE '35'.                            
LRM033     05  DVNDFL-STATUS             PIC X(002).                            
               88 VALID-DVNDFL-STATUS    VALUE '00' '04' '10' '23'.             
               88 DVNDFL-OKAY            VALUE '00' THRU '09', '97'.            
               88 DVNDFL-END-OF-FILE     VALUE '10'.                            
               88 DVNDFL-NOT-FOUND       VALUE '23'.                            
               88 DVNDFL-EMPTY-MISSING   VALUE '35'.                            
           05  MFMSD-STATUS              PIC X(002).                            
               88 VALID-MFMSD-STATUS     VALUE '00' '04' '10' '23'.             
               88 MFMSD-OKAY             VALUE '00' THRU '09', '97'.            
               88 MFMSD-END-OF-FILE      VALUE '10'.                            
               88 MFMSD-NOT-FOUND        VALUE '23'.                            
               88 MFMSD-EMPTY-MISSING    VALUE '35'.                            
           05  BNWMAST-STATUS            PIC X(002).                            
               88 VALID-BNWMAST-STATUS   VALUE '00' '04' '10' '23'.             
               88 BNWMAST-OKAY           VALUE '00' THRU '09', '97'.            
               88 BNWMAST-END-OF-FILE    VALUE '10'.                            
               88 BNWMAST-NOT-FOUND      VALUE '23'.                            
               88 BNWMAST-EMPTY-MISSING  VALUE '35'.                            
           05  BNWREGOP-STATUS           PIC X(002).                            
               88 VALID-BNWREGOP-STATUS  VALUE '00' '04' '10' '23'.             
               88 BNWREGOP-OKAY          VALUE '00' THRU '09', '97'.            
               88 BNWREGOP-END-OF-FILE   VALUE '10'.                            
               88 BNWREGOP-NOT-FOUND     VALUE '23'.                            
               88 BNWREGOP-EMPTY-MISSING VALUE '35'.                            
DJ0016     05  MFEXBR-STATUS             PIC X(002).                            
DJ0016         88 VALID-MFEXBR-STATUS    VALUE '00' '04' '10' '23'.             
DJ0016         88 MFEXBR-OKAY            VALUE '00' THRU '09', '97'.            
DJ0016         88 MFEXBR-END-OF-FILE     VALUE '10'.                            
DJ0016         88 MFEXBR-NOT-FOUND       VALUE '23'.                            
DJ0016         88 MFEXBR-EMPTY-MISSING   VALUE '35'.                            
           05  POSIT-STATUS              PIC  X(002).                           
               88 POSIT-OKAY             VALUE '00' THRU '09', '97'.            
               88 POSIT-END-OF-FILE      VALUE '10'.                            
               88 POSIT-EMPTY-MISSING    VALUE '35'.                            
           05  ACATDLVF-FILE-STATUS      PIC  X(002).                           
               88 ACATDLVF-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATDLVF-END-OF-FILE   VALUE '10'.                            
               88 ACATDLVF-EMPTY-MISSING VALUE '35'.                            
DJ0013     05  CATWHLD-FILE-STATUS       PIC  X(002).                           
DJ0013         88 CATWHLD-OKAY           VALUE '00' THRU '09', '97'.            
DJ0013         88 CATWHLD-END-OF-FILE    VALUE '10'.                            
DJ0013         88 CATWHLD-EMPTY-MISSING VALUE '35'.                             
LRM042     05  CATEXCP-FILE-STATUS       PIC  X(002).                           
LRM042         88 CATEXCP-OKAY           VALUE '00' THRU '09', '97'.            
LRM042         88 CATEXCP-END-OF-FILE    VALUE '10'.                            
LRM042         88 CATEXCP-EMPTY-MISSING VALUE '35'.                             
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-DATE.                                                      
               10  W-UPD-DATE            PIC  X(006).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-TIME.                                                      
               10  W-UPD-TIME            PIC  X(006).                           
               10  W-UPD-TIME-MS         PIC  X(002).                           
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
           05  W-PROC-DT.                                                       
               10 W-PROC-DT-YEAR         PIC  X(004).                           
               10 W-PROC-DT-D1           PIC  X(001) VALUE '-'.                 
               10 W-PROC-DT-MM           PIC  X(002).                           
               10 W-PROC-DT-D2           PIC  X(001) VALUE '-'.                 
               10 W-PROC-DT-DD           PIC  X(002).                           
ET0004     05 W-PRIVATE-RANGE.                                                  
ET0004         10 W-PRIVATE-RANGE-FUNDS  PIC  X(007).                           
ET0004            88 W-PRIV-RANGE-SECURITY    VALUE '8022143'                   
ET0004                                         THRU '8022152',                  
ET0004                                              '8022159',                  
ET0004                                              '8864350'.                  
           05  W-EXP-OPT-ACT             PIC  X(001) VALUE '0'.                 
           05  W-NUM-TO-EXP              PIC  9(003) VALUE 000.                 
LRM023     05  W-BOND-EXP-ACT            PIC  X(001) VALUE '0'.                 
LRM023     05  W-NUM-BOND-TO-EXP         PIC  9(003) VALUE 0.                   
LRM023     05  W-CLIENT-NBR-AUD          PIC  X(004).                           
LRM023     05  FILLER REDEFINES W-CLIENT-NBR-AUD.                               
LRM023         10  W-CLIENT-NBR-AUD-PFX  PIC  X(001).                           
LRM023         10  W-CLIENT-NBR-AUD-SFX  PIC  X(003).                           
LRM043     05  WK-BPD-PROC-DATE          PIC  9(008).                           
           05  W-TODAY-DATE              PIC  9(008) VALUE 0.                   
           05  W-OPT-EXP-DATE            PIC  9(008) VALUE 0.                   
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.                 
               88 BRK-FOUND                          VALUE 'Y'.                 
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
ET0002     05  W-GETNA-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
ET0002     05  W-GETNA-NOTFND-CNT        PIC  9(009) COMP-3 VALUE 0.            
ET0002     05  W-MMF-FOUND               PIC  X(001) VALUE ' '.                 
ET0002     05  FILLER                    PIC  X(008) VALUE 'MMFFLCNT'.          
ET0002     05  W-MMF-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'ACATDLVF'.          
           05  W-ACATDLVF-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0013     05  FILLER                    PIC  X(008) VALUE 'CATWHLD'.           
DJ0013     05  W-CATWHLD-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM042     05  W-CATEXCP-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'UNMATCHC'.          
           05  W-UNMATCH-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATF-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-SQL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-ADD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-ADD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-DEL-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-DEL-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-DEL-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-DEL-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-ADD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-ADD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-POSIT-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  W-POS-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-BAL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-PRNGFL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-PRNGFL-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM033     05  W-DVNDFL-CNT              PIC  9(009) COMP-3 VALUE 0.            
LRM033     05  W-DVNDFL-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM023     05  W-MATURE-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM023     05  W-VBNDDT-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM023     05  W-VBNDDT-NOTFND-CNT       PIC  9(009) COMP-3 VALUE 0.            
LRM024     05  W-VBNDFTRV-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM024     05  W-VBNDFTRV-NOTFND         PIC  9(009) COMP-3 VALUE 0.            
LRM023     05  W-BOND-AUDIT-ADD          PIC  9(009) COMP-3 VALUE 0.            
LRM023     05  W-BOND-AUDIT-NOTADD       PIC  9(009) COMP-3 VALUE 0.            
LRM034     05  W-LVL4-AUDIT-ADD          PIC  9(009) COMP-3 VALUE 0.            
LRM034     05  W-LVL4-AUDIT-NOTADD       PIC  9(009) COMP-3 VALUE 0.            
           05  W-WHEN-ISSUE-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-RESTRICTED-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-REJECT-SWITCHES.                                               
               07  W-REJ-MARGIN-DEBIT    PIC  X(001) VALUE ' '.                 
               07  W-REJ-ASSET-VALUE     PIC  X(001) VALUE ' '.                 
               07  W-REJ-TOTL-ACT-VAL    PIC  X(001) VALUE ' '.                 
LRM042         07  W-REJ-SPAD            PIC  X(001) VALUE ' '.                 
               07  W-REJ-NTS             PIC  X(001) VALUE ' '.                 
               07  W-REJ-FLAT            PIC  X(001) VALUE ' '.                 
               07  W-REJ-LP              PIC  X(001) VALUE ' '.                 
               07  W-REJ-PRIV            PIC  X(001) VALUE ' '.                 
LRM042         07  W-REJ-SPAD-CODE       PIC  X(002) VALUE ' '.                 
               07  W-EXP-OPT-POSN        PIC  X(001) VALUE ' '.                 
           05  W-REJECT-AUTO-SW          PIC  X(001) VALUE ' '.                 
           05  W-FLAT-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-ACTITRF-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTITRF-FOUND                    VALUE 'Y'.                 
           05  W-PRNGFL-SW               PIC  X(001) VALUE ' '.                 
               88 W-PRNGFL-FOUND                     VALUE 'Y'.                 
LRM023     05  W-MATURE-CALLED-BOND-SW   PIC  X(001) VALUE ' '.                 
           05  W-VRSTSEC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSTSEC-FOUND                    VALUE 'Y'.                 
LRM005     05  W-VRSDBLK-SEC-FND-CNT     PIC  9(009) COMP-3 VALUE 0.            
LRM005     05  W-VRSDBLK-SEC-FND-SW      PIC  X(001) VALUE ' '.                 
           05  W-VRSTBRKR-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-NOTFND-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-VRSTBRKR-FOUND                   VALUE 'Y'.                 
           05  W-VRSTBRKR-ROW-CNT        PIC S9(4) COMP VALUE +0.               
           05  W-VRSDACC-INSERT-CNT      PIC  9(011) COMP-3 VALUE 0.            
           05  W-VRSDACC-NOT-INSERT-CNT  PIC  9(011) COMP-3 VALUE 0.            
           05  W-VRSDSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSDSEC-FOUND                    VALUE 'Y'.                 
           05  W-VRSDSEC-INSERT-CNT      PIC  9(011) COMP-3 VALUE 0.            
           05  W-VRSDSEC-NOT-INSERT-CNT  PIC  9(011) COMP-3 VALUE 0.            
           05  W-VRSDSEC-DUPE-CNT        PIC  9(011) COMP-3 VALUE 0.            
           05  W-VRSDSEC-FOREIGN-KY-CNT  PIC  9(011) COMP-3 VALUE 0.            
           05  W-VRSDSEC-ROW-CNT         PIC S9(4) COMP VALUE +0.               
DJ0013     05  W-ACTRBSC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
DJ0013     05  W-ACTRBSC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
DJ0013     05  W-ACTRBSC-FND-SW          PIC  X(001) VALUE ' '.                 
DJ0013         88 W-ACTRBSC-FOUND                    VALUE 'Y'.                 
                                                                                
           05  W-POS-FND-SW              PIC  X(001) VALUE ' '.                 
               88 W-POS-FOUND                        VALUE 'Y'.                 
           05  W-BAL-FND-SW              PIC  X(001) VALUE ' '.                 
               88 W-BAL-FOUND                        VALUE 'Y'.                 
           05  W-ASSET-ADDED-FOR-THIS-ACCT-SW PIC X(01).                        
               88  W-ASSET-ADDED-FOR-THIS-ACCT       VALUE 'Y'.                 
           05  W-REMOVE-FRACTION-SW           PIC X(01).                        
               88  W-REMOVE-FRACTION                 VALUE 'Y'.                 
ET0006     05  WS-INTNL-TRNFR-MODE-SW    PIC  X(001).                           
ET0006         88  WS-INTNL-TRNFR-MODE               VALUE 'Y'.                 
ET0006     05  WS-BALANCE-FOUND-SW       PIC  X(001).                           
ET0006         88  WS-BALANCE-FOUND                  VALUE 'Y'.                 
ET0006     05  WS-POSITION-FOUND-SW      PIC  X(001).                           
ET0006         88  WS-POSITION-FOUND                 VALUE 'Y'.                 
ET0006     05  WS-TYPE1-BALANCE-FOUND-SW PIC  X(001).                           
ET0006         88  WS-TYPE1-BALANCE-FOUND            VALUE 'Y'.                 
ET0006     05  WS-INTERNALY-TRANSFERED-IND PIC X(01).                           
ET0006     05  CATNACT                   PIC X(08)   VALUE 'CATNACT'.           
           05  W-SUB1                    PIC  9(03) COMP-3 VALUE 0.             
           05  W-LOAD-ONLY-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-AUTO-SUBMIT-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-SUBMIT-ONLY-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-LOAD-AND-SUBMIT-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-REMOVE-FRACTION-CNT     PIC  9(009) COMP-3 VALUE 0.            
DJ0013     05  W-ASCENDIS-WHLD-CNT       PIC  9(009) COMP-3 VALUE 0.            
DJ0013     05  W-ASCENDIS-WHLD-REASON    PIC  X(007).                           
DJ0013         88  W-ASCENDIS-ANNUITY                VALUE 'ANNU'.              
DJ0013         88  W-ASCENDIS-CURR-CODE              VALUE 'CURR'.              
DJ0013         88  W-ASCENDIS-IRA                    VALUE 'IRAA'.              
DJ0013         88  W-ASCENDIS-OPEN-ORDER             VALUE 'OPOR'.              
DJ0013         88  W-ASCENDIS-QTY-ZERO               VALUE 'QTY0'.              
DJ0013         88  W-ASCENDIS-QTY-LT-ZERO            VALUE 'QTL0'.              
DJ0013         88  W-ASCENDIS-QTY-LT-0001            VALUE 'QTL1'.              
DJ0013         88  W-ASCENDIS-SPAD                   VALUE 'SPAD'.              
DJ0013         88  W-ASCENDIS-TYPE-NOT-1-2-3-5       VALUE 'TYPE'.              
DJ0013         88  W-ASCENDIS-WHEN-ISSUED            VALUE 'WHIS'.              
LRM034         88  W-ASCENDIS-NTW-LVL4               VALUE 'LVL4'.              
DJ0014     05  W-MEMO-ONLY-SW            PIC  X(001).                           
DJ0014         88  W-MEMO-ONLY-FOUND                 VALUE 'Y'.                 
DJ0014     05  W-NOT-MEMO-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0014     05  W-IS-MEMO-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM025     05  W-ACATDLVF-TYPE-SW        PIC  X(001).                           
LRM025         88  ACATDLVF-FRAC-QTY-REC             VALUE 'Q'.                 
LRM025         88  ACATDLVF-FRGN-FEE-REC             VALUE 'F'.                 
LRM039         88  ACATDLVF-TYPE4-AS-TYPE1           VALUE '4'.                 
LRM025     05  W-FOREIGN-FEE-SW          PIC  X(001).                           
LRM025         88  FOREIGN-FEE-ELIGIBLE              VALUE 'E'.                 
LRM025         88  FOREIGN-FEE-NOT-APPLY             VALUE 'N'.                 
LRM043     05  WK-ASSET-SEQ-NBR.                                                
LRM043         07  WK-ASSET-SEQ-NBR-9    PIC 9(003).                            
CSG001*                                                                         
CSG001     05  W-EDIT-ASSET-DESC-TXT-AREA.                                      
CSG001         10 W-SUB2                       PIC S9(03) COMP-3.               
CSG001         10 W-ASSET-DESC-TXT.                                             
CSG001            15 W-ASSET-DESC1-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC2-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC3-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC4-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC5-TXT         PIC X(20) VALUE SPACES.          
CSG001         10 W-ASSET-DESC-TMP             PIC X(30) VALUE SPACES.          
CSG001         10 W-JUST-LEFT-FLAG             PIC X(01).                       
CSG001            88 W-JUST-LEFT-DONE          VALUE 'Y'.                       
CSG001            88 W-JUST-LEFT-NOT-DONE      VALUE 'N'.                       
CSG001         10 W-EDIT-ASSET-DESC-TXT-FLAG   PIC X(01).                       
CSG001            88 W-EDIT-ASSET-DESC-TXT-Y   VALUE 'Y'.                       
CSG001            88 W-EDIT-ASSET-DESC-TXT-N   VALUE 'N'.                       
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.           
       01  W-WORK-FIELDS.                                                       
           05  W-DATE.                                                          
               07  W-DATE-YEAR.                                                 
                   09  W-DATE-CC         PIC X(2) VALUE ' '.                    
                   09  W-DATE-YY         PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-MM             PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-DD             PIC X(2) VALUE ' '.                    
           05  W-ASSET-SEQ-NBR           PIC S9(004) COMP.                      
           05  W-AT-ASSET-SEQ-NBR        PIC S9(004) COMP.                      
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.                   
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.                   
           05  W-INT-PTR                 PIC  9(002) VALUE 0.                   
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.                   
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.                 
                                                                                
           05  W-QTY-X.                                                         
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.                 
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                             
                                                                                
           05  W-QTY-N                   PIC 9(13)V9(4).                        
           05  FILLER REDEFINES W-QTY-N.                                        
               07  W-QTY-INT             PIC 9(13).                             
               07  W-QTY-DEC             PIC 9(04).                             
                                                                                
           05  W-INT                     PIC 9(17).                             
           05  W-INT-X REDEFINES W-INT.                                         
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.                 
                                                                                
           05  W-DEC                     PIC 9(04).                             
           05  W-DEC-X REDEFINES W-DEC.                                         
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.                 
                                                                                
           05  W-POS-DESC1               PIC X(30)     VALUE SPACE.             
           05  W-POS-DESC2               PIC X(30)     VALUE SPACE.             
           05  W-POS-DESC3               PIC X(30)     VALUE SPACE.             
           05  W-POS-MEMO-QTY-EXCLUDED   PIC S9(12)V9(5) COMP-3.                
LRM039     05  W-POS-MEMO-TYPE4-QTY      PIC S9(12)V9(5) COMP-3.                
LRM039     05  W-POS-MEMO-TYPE4-AMT      PIC S9(15)V9(2) COMP-3.                
           05  W-POS-QTY                 PIC S9(12)V9(5) COMP-3.                
DJ0009     05  W-POS-QTY-X.                                                     
DJ0009         10 W-POS-QTY-UNPACKED     PIC 9(12)V9(5).                        
DJ0009     05  W-NAPPA-DATE-90DAY        PIC 9(08).                             
DJ0009     05  W-LAST-ACTIVITY-DATE-X.                                          
DJ0009         10 W-LAST-ACTIVITY-DATE   PIC 9(07).                             
                                                                                
CSG001*    05  W-TXT.                                                           
CSG001*        10  W-TXT-BYTE            PIC X OCCURS 140 TIMES.                
DJ0009     05  W-ASSET-CMNT-TXT          PIC X(50).                             
                                                                                
           05  SUB1                      PIC 9(03) COMP-3 VALUE 0.              
ET0002     05  OCR-SUB                   PIC 9(04) COMP-3 VALUE 0.              
LRM019     05  TH-SUB                    PIC 9(05) COMP-3 VALUE 0.              
ET0002     05  TBL-SUB                   PIC 9(04) COMP-3 VALUE 0.              
ET0002     05  MM-SUB                    PIC 9(04) COMP-3 VALUE 0.              
           05  W-HEX                     PIC S9(04) COMP SYNC VALUE +0.         
           05  FILLER REDEFINES W-HEX.                                          
               10  FILLER                PIC X(01).                             
               10  W-HEX-X               PIC X(01).                             
           05  WORK-POS-QTY-ORIG         PIC S9(12)V9(5) COMP-3.                
           05  WORK-POS-QTY              PIC S9(12)V9(5) COMP-3.                
           05  WORK-POS-QTY-SIGNED-INTEGER PIC S9(12)    COMP-3.                
           05  WORK-POS-QTY-DECIMAL      PIC V9(5).                             
           05  WORK-POS-QTY-LEFT         PIC S9(12)V9(5).                       
           05  W-QTY-DISPLAY             PIC 999999999.99999-.                  
           05  W-QTY-DISPLAY-2           PIC 999999999.99999-.                  
           05  W-AMT-DISPLAY             PIC 999999999.99-.                     
           05  W-ASSET-QTY-SIGN          PIC S9(12)V9(5) COMP-3.                
           05  W-ASSET-QTY-UNSIGN        PIC  9(12)V9(5) COMP-3.                
           05  WORK-POS-VALUE            PIC S9(12)V9(5) COMP-3.                
           05  WORK-MEMOS                OCCURS 4 TIMES.                        
               10  WORK-MEMO-CODE        PIC 9(02).                             
               10  WORK-MEMO-QTY-X.                                             
                   15  WORK-MEMO-QTY     PIC S9(12)V9(5) COMP-3.                
                   15  WORK-MEMO-FRAC-QTY REDEFINES WORK-MEMO-QTY               
                                         PIC S9(10)V9(7) COMP-3.                
           05  WORK-SN-MEMO-QTY          PIC S9(12)V9(5) COMP-3.                
           05  WORK-SFK-MEMO-QTY         PIC S9(12)V9(5) COMP-3.                
           05  WORK-WHOLD-MEMO-QTY       PIC S9(12)V9(5) COMP-3.                
           05  W-WI                      PIC 9  COMP-3 VALUE 1.                 
           05  W-MEMO-IND                PIC X(01).                             
               88  MEMO-NOT-FOUND        VALUE ' '.                             
               88  MEMO-FOUND            VALUE '1'.                             
           05  W-ASSET-PRC-CTGY-CD       PIC X(04).                             
           05  W-ACTIAST-INSERT-SW       PIC X(01).                             
               88  W-ACTIAST-INSERT-OKAY VALUE 'Y'.                             
           05  W-BH-ACAT-SUBMIT-ASSETS   PIC X(01).                             
           05  W-BH-ACAT-SUBMIT-ASSETS-N REDEFINES                              
               W-BH-ACAT-SUBMIT-ASSETS   PIC 9(01).                             
           05  W-BH-DAYS-STTS-QTY        PIC S9(4) USAGE COMP.                  
           05  W-BH-NSCC-PEND-CD         PIC X(01).                             
ET0006     05  W-CHANGED-DLVR-NBR.                                              
ET0006         07  W-CHANGED-BRANCH      PIC X(03).                             
ET0006         07  W-CHANGED-ACCT        PIC X(05).                             
ET0006         07  FILLER                PIC X(12).                             
ET0006     05  WS-FROM-ACCOUNT.                                                 
ET0006         07  WS-FROM-CLT           PIC X(03).                             
ET0006         07  WS-FROM-BR            PIC X(03).                             
ET0006         07  WS-FROM-ACCT          PIC X(05).                             
                                                                                
ET0002 01  WS-MONEY-MKT-FUND-AREA.                                              
ET0002     05  W-MMF-TABLE-AREA.                                                
ET0002         07 W-MMF-TBL             OCCURS 999 TIMES.                       
ET0002            09 W-MMF-CLT           PIC 9(03).                             
ET0002            09 W-MMF-SEC           PIC X(07).                             
LRM049            09 W-MMF-SWEEP-CD      PIC 9(04).                             
ET0002            09 W-MMF-REDMPT-IND    PIC X(01).                             
LRM019            09 W-THRESHOLD-TBL-CNT PIC 9(05).                             
LRM019            09 W-MMF-THRESHOLD-TBL   OCCURS 999 TIMES.                    
LRM019               11 W-MMF-THRESHOLD-FUND    PIC X(07).                      
ET0002         07 W-REDMPT-TBL          OCCURS 999 TIMES.                       
ET0002            09 W-REDMPT-SEC        PIC X(07).                             
ET0002     05  W-MMF-TBL-CNT             PIC 9(04)  COMP-3 VALUE 0.             
ET0002     05  W-REDMPT-TBL-CNT          PIC 9(04)  COMP-3 VALUE 0.             
ET0006 01  INTERNAL-TRANSFER-PARM.                                              
ET0006     03  INTNL-PASSING-INFO.                                              
ET0006         05  INTNL-FROM-ACCOUNT.                                          
ET0006             07  INTNL-FROM-CLT       PIC X(03).                          
ET0006             07  INTNL-FROM-BR        PIC X(03).                          
ET0006             07  INTNL-FROM-ACCT      PIC X(05).                          
ET0006     03  INTNL-RETURN-INFO.                                               
ET0006         05  INTNL-TO-ACCOUNT.                                            
ET0006             07  INTNL-TO-CLT         PIC X(03).                          
ET0006             07  INTNL-TO-BR          PIC X(03).                          
ET0006             07  INTNL-TO-ACCT        PIC X(05).                          
ET0006         05  INTNL-RETURN-CODE        PIC X(01).                          
ET0006             88  INTNL-ACCT-FND                 VALUE '0'.                
ET0006             88  INTNL-ACCT-NOT-FND             VALUE '1'.                
ET0006             88  INTNL-INVALID-INPUT            VALUE '2'.                
ET0006             88  INTNL-ERROR                    VALUE '3'.                
       01  W-MF-AREA.                                                           
           05  W-CKDIGIT-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWMAST-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWMAST-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWREGOP-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWREGOP-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-MFMSD-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  W-MFMSD-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0016     05  W-MFEXBR-CNT              PIC  9(009) COMP-3 VALUE 0.            
DJ0016     05  W-MFEXBR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-LEGG-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-OMNIBUS-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM025     05  W-FRGN-ASSET-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM004     05  W-DST-MFE-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM022     05  W-PNC-SURPAS-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-FUND-SERV-ELIGIBLE-SW    PIC X(01).                            
               88  IS-FUND-SERV-ELIGIBLE            VALUE 'Y'.                  
           05  W-BNWREGOP-FND-SW          PIC X(01).                            
               88  W-BNWREGOP-FOUND                 VALUE 'Y'.                  
           05  W-LEGG-MASON-FUND-SW       PIC X(01).                            
               88  IS-LEGG-MASON-FUND               VALUE 'Y'.                  
           05  W-BNWMAST-FND-SW           PIC X(01).                            
               88  W-BNWMAST-FOUND                  VALUE 'Y'.                  
           05  W-BH-MF3-SEBR-CLEAR-SW     PIC  X(001).                          
               88 W-BH-MF3-SEBR-CLEAR-FOUND          VALUE 'Y'.                 
           05  W-BH-MF3-SEBR-CLEAR       PIC X(4).                              
           05  WK-BR                     PIC X(3).                              
           05  NTW-HOUSE-ACCOUNT          PIC  X(20)  VALUE ' '.                
           05  NTW-HOUSE-ACCT-SW          PIC  X(01)  VALUE 'N'.                
               88  NTW-HOUSE-ACCT                     VALUE 'Y'.                
           05  NTW-OMNIBUS-ACCT-SW        PIC  X(01)  VALUE 'N'.                
               88  NTW-OMNIBUS-ACCT                   VALUE 'Y'.                
LRM004         88  NTW-DST-MFE-ACCT                   VALUE 'D'.                
LRM022         88  NTW-PNC-SURPAS-ACCT                VALUE 'P'.                
LRM050     05  NTW-SHWB-ACCT-FLAG         PIC  X(01)  VALUE SPACES.             
LRM050         88  NTW-SHWB-ACCT                      VALUE 'Y'.                
LRM050         88  NTW-NOT-SHWB-ACCT                  VALUE 'N'.                
DJ0016     05  W-MFMSD-FND-SW             PIC X(01).                            
DJ0016         88  W-MFMSD-FOUND                    VALUE 'Y'.                  
DJ0016         88  W-MFMSD-NOT-FOUND                VALUE 'N'.                  
DJ0016     05  W-MFEXBR-FND-SW            PIC X(01).                            
DJ0016         88  W-MFEXBR-FOUND                   VALUE 'Y'.                  
DJ0016         88  W-MFEXBR-NOT-FOUND               VALUE 'N'.                  
                                                                                
           05  NS-BRCH-ACCT-TC.                                                 
               10  NS-BRCH-ACCT-T        PIC  X(09).                            
               10  NS-CK                 PIC  X(01).                            
           05  WS-DST-BOX-ACCT-TC.                                              
               10  WS-DST-BOX-ACCT-T         PIC  X(09).                        
               10  WS-DST-BOX-CK             PIC  X(01).                        
LRM022     05  WS-PNC-SURPAS-BOX-TC.                                            
LRM022         10  WS-PNC-SURPAS-BOX-T       PIC  X(09).                        
LRM022         10  WS-PNC-SURPAS-CK          PIC  X(01).                        
                                                                                
       01  W-CKDIGIT.                                                           
           03 W-CKDIGIT-PARM.                                                   
              05 W-CKDIGIT-LEN               PIC 9(02) VALUE 9.                 
              05 W-CKDIGIT-ACCT-TC.                                             
                 07 W-CKDIGIT-ACCT-T.                                           
                    09 W-CKDIGIT-BRN-ACCT    PIC X(08) VALUE ' '.               
                    09 W-CKDIGIT-TYPE        PIC X(01) VALUE ' '.               
DJ0007           07 W-CKDIGIT-CK             PIC X(01) VALUE ' '.               
DJ0007        05 W-CKDIGIT-ACCT-TC-1.                                           
DJ0007           07 W-CKDIGIT-ACCT-T-1.                                         
DJ0007              09 W-CKDIGIT-BRN-ACCT-1  PIC X(08) VALUE ' '.               
DJ0007              09 W-CKDIGIT-TYPE-1      PIC X(01) VALUE ' '.               
DJ0007           07 W-CKDIGIT-CK-1           PIC X(01) VALUE ' '.               
                                                                                
       01  W-BNWMAST-KEY.                                                       
           05  W-BNWMAST-CLT-NO             PIC 9(3).                           
           05  W-BNWMAST-CUSIP-15.                                              
               10  W-BNWMAST-CUSIP-CNTRY-CD PIC X(2).                           
               10  W-BNWMAST-CUSIP          PIC X(9).                           
               10  W-BNWMAST-CUSIP-CHK-DGT  PIC X.                              
               10  W-BNWMAST-CUSIP-EXT      PIC X(3).                           
           05  W-BNWMAST-ACCT-ID.                                               
               10  W-BNWMAST-CLT            PIC 9(3).                           
               10  W-BNWMAST-BRN-5.                                             
                   15  W-BNWMAST-BRN-1-2    PIC X(2).                           
                   15  W-BNWMAST-BRN-3      PIC X(3).                           
               10  W-BNWMAST-ACCT-10.                                           
                   15  W-BNWMAST-ACCT-1-5   PIC X(5).                           
                   15  W-BNWMAST-ACCT-5     PIC X(5).                           
               10  W-BNWMAST-ACCT-TC.                                           
                   15  W-BNWMAST-TYPE       PIC X.                              
                   15  W-BNWMAST-CHK        PIC X.                              
           05  W-BNWMAST-PAYABLE-SEQ-NO     PIC 9(1).                           
      /                                                                         
       01  W-BAL-FIELDS.                                                        
           05  W-BAL-KEY.                                                       
             07  W-BAL-KEY-A.                                                   
               10  W-BAL-CLT                PIC 9(05)     COMP-3.               
               10  W-BAL-BR                 PIC X(03).                          
               10  W-BAL-ACCT               PIC X(05).                          
               10  W-BAL-REC-TYPE           PIC X(02).                          
             07  W-BAL-KEY-B.                                                   
               10  W-BAL-CUR                PIC X(06).                          
             07  W-BAL-KEY-C                PIC X(01).                          
                                                                                
           05  W-BAL-TYPE1                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE2                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE3                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE5                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-SMA                    PIC S9(9)V99 VALUE 0.               
LRM033     05  W-BAL-PEND-DVND              PIC S9(15)V99 VALUE 0.              
           05  W-BAL-REGT                   PIC S9(15)V99 VALUE 0.              
           05  W-BAL-MMKT                   PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TOTAL-MARKET-VALUE     PIC S9(17) COMP-3.                  
           05  W-BAL-TOTL-LIQDATNG-EQUITY   PIC S9(17) COMP-3.                  
ET0001     05  W-BAL-PENDING-AMOUNT         PIC S9(9)V99 COMP-3.                
           05  W-CASH-SMA                   PIC X(04).                          
           05  W-WORK-BAL                   PIC S9(9)V99 VALUE 0.               
           05  W-WORK-BAL-UNSIGN            PIC  9(9)V99.                       
           05  W-CSH-MGN-SHT                PIC X(01).                          
           05  W-BAL-TYPE1-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-TYPE2-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-TYPE3-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-TYPE5-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-SMA-DISPLAY            PIC 999999999.99-.                  
           05  W-BAL-REGT-DISPLAY           PIC 999999999.99-.                  
      /                                                                         
LRM043 01  CURRATE-COMMAREA.                                                    
LRM043     COPY CURPARMC  REPLACING ==:CURR:==  BY ==CURR==.                    
LRM043                                                                          
LRM043 01  CURRENCY-RECORD.                                                     
LRM043     COPY RECCURRC.                                                       
      /                                                                         
      ******************************************************************        
      * P2HDRTRL COMMAREA - USED TO CREATE HEADER AND TRAILER RECORDS  *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.           
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.                  
                                                                                
           COPY CP2WS.                                                          
      /                                                                         
ET0005 01  GETVBAL                          PIC X(08) VALUE 'ZGETVBAL'.         
ET0005     COPY GETVBALC REPLACING ==:GETVBAL:== BY ==GETVBAL==.                
ET0005     COPY CUSBALRE REPLACING ==:BAL:==     BY ==BAL==.                    
ET0005     COPY ACBALALP.                                                       
ET0005     COPY BVHEADER.                                                       
ET0005     COPY BVTRILER.                                                       
ET0005 01 GETVOL-AREA.                                                          
ET0005   05  W-CUSHOL-KEY.                                                      
ET0005        15  W-CUSHOL-CLIENT              PIC X(03).                       
ET0005        15  W-CUSHOL-CLIENT-N REDEFINES                                   
ET0005            W-CUSHOL-CLIENT              PIC 9(03).                       
ET0005        15  W-CUSHOL-BRANCH              PIC X(03).                       
ET0005        15  W-CUSHOL-ACCOUNT             PIC X(05).                       
ET0005        15  W-CUSHOL-FRGN-CURR-CODE      PIC 9(03).                       
ET0005        15  W-CUSHOL-FILLER              PIC X(31).                       
ET0005 01  GETVHOL                PIC X(008) VALUE  'ZGETVHOL'.                 
ET0005     COPY GETVHOLC REPLACING ==:GETVHOL:== BY ==GETVHOL==.                
LRM053*01  FILLER                        PIC X(08) VALUE 'HOLDAVSM'.            
LRM053*****COPY HOLDAVSM.                                                       
LRM053 01  FILLER                        PIC X(08) VALUE 'CUSHOL  '.            
LRM053 01  WS-CUSHOL-AREA.                                                      
LRM053     COPY CUSHOL REPLACING ==:CUSHOL:== BY ==CUSHOL==.                    
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'POSRECOB'.            
           COPY POSRECOB.                                                       
      /                                                                         
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      * * *  MEMO ENTRY MUST BE IN POS-MEMO-CODE (HEX) ASCENDING SEQ            
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *01  MEMO-TABLE.            'SBSDTMTFTRTLSKSNODORB C '                    
      *    05 FIL PIC X(30) VALUE '1  SEG MEMO                   '.             
      *    05 FIL PIC X(30) VALUE '2 MSOLD OUT OF SEG MEMO       '.             
      *    05 FIL PIC X(30) VALUE '3 MIN TRANSIT MEMO            '.             
      *    05 FIL PIC X(30) VALUE '4 MTRANSFER MEMO (AT AGENT)   '.             
      *    05 FIL PIC X(30) VALUE '5 MTRANSFER TO MATCH MEMO     '.             
      *    05 FIL PIC X(30) VALUE '6 MLEGAL TRANSFER MEMO        '.             
      *    05 FIL PIC X(30) VALUE '7 5SAFEKEEPING MEMO (UNSIGNED)'.             
      *    05 FIL PIC X(30) VALUE '8 5SAFEKEEPING MEMO (SIGNED)  '.             
      *    05 FIL PIC X(30) VALUE '9 MCOD MEMO                   '.             
      *    05 FIL PIC X(30) VALUE 'A MCOR MEMO                   '.             
      *    05 FIL PIC X(30) VALUE 'B MMEMO B (CLIENT DEFINED)    '.             
      *    05 FIL PIC X(30) VALUE 'C MMEMO C (CLIENT DEFINED)    '.             
      *                                                                         
       01  FILLER                        PIC X(008) VALUE 'W-MRGIMM'.           
       01  W-MRGIMM-FIELDS.                                                     
           05  MRGIMM-STATUS             PIC X(002).                            
               88 VALID-MRGIMM-STATUS    VALUE '00' '04' '10' '23'.             
               88 MRGIMM-OKAY            VALUE '00' THRU '09', '97'.            
               88 MRGIMM-END-OF-FILE     VALUE '10'.                            
               88 MRGIMM-NOT-FOUND       VALUE '23'.                            
               88 MRGIMM-EMPTY-MISSING   VALUE '35'.                            
           05  W-MRGIMM-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-MRGIMM-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-MRGIMM-NOTFND-CNT       PIC  9(009) COMP-3 VALUE 0.            
           05  W-MRGIMM-FND-SW           PIC X(01).                             
               88  W-MRGIMM-FOUND                    VALUE 'Y'.                 
           05  W-MRGIMM-MEMO-FND-SW      PIC X(01).                             
               88  W-MRGIMM-MEMO-FOUND               VALUE 'Y'.                 
           05  W-MRGIMM-N4-FND-SW        PIC X(01).                             
               88  W-MRGIMM-N4-FOUND                 VALUE 'Y'.                 
LRM039     05  W-MRGIMM-TYPE4-FND-SW     PIC X(01).                             
LRM039         88  W-MRGIMM-TYPE4-FOUND              VALUE 'Y'.                 
           05  W-MM-SUB           PIC 9(03) COMP-3 VALUE 0.                     
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'POSMEMO='.            
           COPY  POSMEMOR REPLACING ==:POSMEMO:== BY ==MRGI==.                  
      /                                                                         
ET0002     COPY GETNACOB.                                                       
ET0002     EJECT                                                                
ET0002 01  GETNA-SEGMENT-INCLUDES.                                              
ET0002     COPY NASEGPPA.                                                       
ET0002     COPY NASEGEND.                                                       
ET0002     EJECT                                                                
LRM049*****COPY MMFSUB.                                                         
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
       01  WK-MS-INFO-AREA.                                                     
           05  WK-MS-SEC               PIC X(7).                                
           05  FILLER REDEFINES WK-MS-SEC.                                      
               10  WK-MS-SEC-1         PIC X.                                   
               10  WK-MS-SEC-2-7       PIC X(6).                                
           05  WK-MS-SEC-ID            PIC X         VALUE ' '.                 
               88  WK-MS-STOCK         VALUE 'S'.                               
               88  WK-MS-BOND          VALUE 'B'.                               
               88  WK-MS-OPTION        VALUE 'O'.                               
           05  WK-MS-ASSET-TYPE        PIC X         VALUE '0'.                 
               88  WK-MS-NON-OPT       VALUE '0'.                               
               88  WK-MS-EQUITY-OPT    VALUE '1'.                               
               88  WK-MS-NON-EQU-OPT   VALUE '2'.                               
           05  WK-MS-BOND-IND          PIC X         VALUE ' '.                 
               88  WK-MS-BEARER-BOND   VALUE 'B'.                               
               88  WK-MS-REGISTER-BOND VALUE 'R'.                               
           05  WK-MS-SYMBOL-9                        VALUE ' '.                 
               10  WK-MS-SYMBOL        PIC X(6).                                
               10  WK-FILLER           PIC X(3).                                
           05  WK-MS-CUSIP             PIC X(9)      VALUE SPACE.               
LRM025     05  WK-MS-CUSIP-10-12       PIC X(3)      VALUE SPACE.               
LRM025     05  WK-MSD-ISIN             PIC X(12)     VALUE SPACE.               
           05  WK-MS-OPT-MMY                         VALUE ZERO.                
               10  WK-MS-OPT-MM        PIC X(2).                                
               10  WK-MS-OPT-Y         PIC X(1).                                
           05  WK-MS-EXP-DATE          PIC 9(8)      VALUE ZERO.                
           05  FILLER                  REDEFINES WK-MS-EXP-DATE.                
               10  FILLER              PIC 9(3).                                
               10  WK-MS-EXP-Y         PIC X(1).                                
               10  WK-MS-EXP-MM        PIC X(2).                                
               10  FILLER              PIC 9(2).                                
LRM018     05  FILLER REDEFINES WK-MS-EXP-DATE.                                 
LRM018         10  WK-MS-EXP-CC-NEW    PIC X(2).                                
LRM018         10  WK-MS-EXP-YY-NEW    PIC X(2).                                
LRM018         10  WK-MS-EXP-MM-NEW    PIC X(2).                                
LRM018         10  WK-MS-EXP-DD-NEW    PIC X(2).                                
LRM023     05  WK-BOND-EXP-DATE        PIC 9(8).                                
LRM023     05  WK-MS-BOND-EXP-DATE-DB2.                                         
LRM023         10  WK-MS-BOND-EXP-CCYY   PIC X(4).                              
LRM023         10  FILLER                PIC X(1) VALUE '-'.                    
LRM023         10  WK-MS-BOND-EXP-MM     PIC X(2).                              
LRM023         10  FILLER                PIC X(1) VALUE '-'.                    
LRM023         10  WK-MS-BOND-EXP-DD     PIC X(2).                              
                                                                                
LRM024     05  WK-TODAY-DB2              PIC X(10).                             
LRM024     05  FILLER REDEFINES WK-TODAY-DB2.                                   
LRM024         10  WK-TODAY-DB2-CCYY     PIC X(4).                              
LRM024         10  WK-TODAY-DB2-DASH1    PIC X(1).                              
LRM024         10  WK-TODAY-DB2-MM       PIC X(2).                              
LRM024         10  WK-TODAY-DB2-DASH2    PIC X(1).                              
LRM024         10  WK-TODAY-DB2-DD       PIC X(2).                              
LRM038     05  WK-PROJECTED-SETTLE-DATE PIC X(8)   VALUE SPACES.                
           05  WK-MS-OPT-PRICE         PIC S9(4)V9(5) VALUE ZERO.               
           05  FILLER                  REDEFINES WK-MS-OPT-PRICE.               
               10  WK-MS-OPT-PRC       PIC 9(4).                                
               10  WK-MS-OPT-FRAC      PIC 9(5).                                
           05  WK-MS-OPT-FRAC-6        PIC 9(6) VALUE ZEROS.                    
           05  FILLER REDEFINES    WK-MS-OPT-FRAC-6.                            
               10  WK-MS-OPT-FRAC-1    PIC 9.                                   
               10  FILLER              PIC 9(5).                                
LRM018     05  WK-MS-OPT-PRICE-NEW     PIC S9(5)V9(3) VALUE ZERO.               
LRM018     05  FILLER                  REDEFINES WK-MS-OPT-PRICE-NEW.           
LRM018         10  WK-MS-OPT-PRC-NEW   PIC 9(5).                                
LRM018         10  WK-MS-OPT-FRAC-NEW  PIC 9(3).                                
LRM007     05  WK-MS-OPT-DECI-ROUNDED  PIC 9(2).                                
LRM056     05  WK-MS-OPTION-FACTOR     PIC S9(7)V9(8)  COMP-3.                  
           05  WK-MS-XREF-NO           PIC X(07).                               
           05  WK-MS-WI-CODE           PIC X(01).                               
           05  WK-MS-BOND-REG-CODE     PIC X(01).                               
           05  WK-CNS-IND              PIC X(01)  VALUE 'N'.                    
           05  WK-DTC-IND              PIC X(01)  VALUE 'N'.                    
LRM034     05  WK-NTWRK-LVL4-IND       PIC X(01)  VALUE 'N'.                    
           05  WK-MS-CLASS.                                                     
               10  WK-MS-CLASS-1       PIC 9.                                   
               10  WK-MS-CLASS-2-5     PIC 9(4).                                
               10  WK-MS-CLASS-6-7     PIC 9(2).                                
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  WK-MS-CLASS-1-2-3   PIC 9(3).                                
               10  WK-MS-CLASS-4       PIC 9.                                   
               10  WK-MS-CLASS-5-7     PIC 9(3).                                
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  FILLER              PIC 9.                                   
               10  WK-MS-CLASS-2       PIC 9.                                   
               10  WK-MS-CLASS-3-4     PIC 9(2).                                
               10  WK-MS-CLASS-5       PIC 9.                                   
               10  WK-MS-CLASS-6       PIC 9.                                   
               10  WK-MS-CLASS-7       PIC 9.                                   
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  WK-MS-CLASS-1-2     PIC 9(2).                                
               10  FILLER              PIC 9(2).                                
               10  WK-MS-CLASS-5-6-7   PIC 9(3).                                
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  FILLER              PIC 9(3).                                
               10  WK-MS-CLASS-4-5     PIC 9(2).                                
               10  FILLER              PIC 9(2).                                
           05  WK-MS-SEC-TYPE-P        PIC 9(5)   COMP-3  VALUE 0.              
           05  FILLER                  REDEFINES WK-MS-SEC-TYPE-P.              
               10  WK-MS-SEC-TYPE-X    PIC X(2).                                
               10  FILLER              PIC 9.                                   
           05  WK-MS-SEC-TYPE-N        PIC 9(5)   VALUE 0.                      
           05  FILLER                  REDEFINES WK-MS-SEC-TYPE-N.              
               10  WK-MS-SEC-TYPE      PIC 9(4).                                
               10  FILLER              PIC 9.                                   
                                                                                
DJ0017     05  W-FRACTION-EQUITY-IND   PIC X(1) VALUE ' '.                      
DJ0017         88  W-FRACTION-EQUITY            VALUE 'Y'.                      
DJ0017         88  W-NOT-FRACTION-EQUITY        VALUE 'N'.                      
                                                                                
           05  WK-MS-DESC1                           VALUE SPACE.               
               10  WK-MS-PUT-CALL      PIC X(4).                                
               10  FILLER              PIC X(26).                               
           05  WK-MS-DESC2             PIC X(30)     VALUE SPACE.               
           05  WK-MS-DESC3             PIC X(30)     VALUE SPACE.               
DJ0008     05  WK-MS-CLOSING-PRICE     PIC 9(8)V9(7) COMP-3 VALUE ZERO.         
           05  WK-POS-DESC4            PIC X(30)     VALUE SPACE.               
           05  WK-POS-DESC5.                                                    
               10  FILLER              PIC X(08) VALUE 'ADP-SEC:'.              
               10  WK-POS-DESC5-SEC    PIC X(07) VALUE ' '.                     
               10  WK-POS-DESC5-FIL    PIC X(05) VALUE ' '.                     
           05  W-STPRC-INTEGER-AMT       PIC 9(05).                             
           05  W-STPRC-FRCTN.                                                   
               07  W-STPRC-FRCTN-AMT     PIC 9(02).                             
           05  W-OPT-DESC.                                                      
               07  W-OPT-BUY-SELL        PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-CALL-PUT        PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-OPEN-CLOSE      PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-SYMBOL          PIC X(06) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-MS-SYMBOL       PIC X(08) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-EXPTN-MM        PIC X(02) VALUE ' '.                   
               07  W-OPT-EXPTN-S1        PIC X(01) VALUE ' '.                   
               07  W-OPT-EXPTN-CC        PIC X(02) VALUE ' '.                   
               07  W-OPT-EXPTN-YY        PIC X(02) VALUE ' '.                   
               07  FILLER                PIC X(02) VALUE ' '.                   
               07  W-OPT-STRIKE-PRIC     PIC ZZZZ9.                             
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-STRIKE-FRAC     PIC X(01) VALUE ' '.                   
               07  W-OPT-SLASH-8         PIC X(02) VALUE ' '.                   
               07  FILLER                PIC X(11) VALUE ' '.                   
LRM018     05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
LRM018         07  FILLER                PIC X(22).                             
LRM018         07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
LRM018         07  FILLER                PIC X(02).                             
LRM018         07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
LRM018         07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
LRM018         07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
LRM018         07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
LRM018         07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
LRM018         07  FILLER                PIC X(01).                             
LRM018         07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
LRM018         07  FILLER                PIC X(01).                             
LRM018         07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
LRM018         07  FILLER                PIC X(12).                             
       01  OPT-WORK-AREA.                                                       
           05  SUB2               PIC 9(03).                                    
           05  SUB3               PIC 9(03).                                    
           05  OPT-SYMBOL         PIC X(03).                                    
           05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                             
                                  PIC X(01) OCCURS 3 TIMES.                     
           05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.                     
           05  OPT-WORK1          PIC X(12).                                    
           05  OPT-WORK2   REDEFINES  OPT-WORK1.                                
             10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.                    
                                                                                
DJ0004 01  W-SEC-TO-BYPASS.                                                     
DJ0004     05 W-SEC-TO-BYPASS-FIELD   PIC  X(007).                              
DJ0004        88 W-IRA-SECURITY          VALUE '8660000' THRU '8661299',        
LRM036                                         '8667000' THRU '8668799'.        
DJ0004********                                 '8667003' THRU '8667010',        
DJ0004********                                 '8667101' THRU '8667125',        
DJ0004********                                 '8667203' THRU '8667250',        
DJ0005********                                 '8667304' THRU '8667310',        
DJ0004********                                 '8667338' THRU '8667339',        
DJ0004********                                 '8667800' THRU '8668799'.        
DJ0004        88 W-ANNUITY-SECURITY      VALUE '8S15113'.                       
DJ0004        88 W-SPAD-SECURITY         VALUE '9997292' THRU '9999999'.        
DJ0004        88 W-MONEY-MARKET-SECURITY VALUE 'A000015',     'A000017',        
DJ0004                                         'A000026' THRU 'A000029',        
DJ0004                                         'A000031',     'A000039',        
DJ0004                                         'A000046' THRU 'A000999'.        
LRM035 COPY MMFVALID.                                                           
                                                                                
      ** SAVE IMPORTANT FIELDS HERE SO THE LOGIC CAN BE GENERIC.                
       01  W-FETCH-AREA.                                                        
           05  WF-CLIENT-NBR          PIC X(4).                                 
           05  WF-ACAT-CONTROL-NBR    PIC X(14).                                
           05  WF-SBMTG-PRTCP-NBR     PIC X(4).                                 
           05  WF-DLVR-NBR            PIC X(4).                                 
           05  WF-ACCT-DLVR-NBR       PIC X(20).                                
           05  WF-RCV-NBR             PIC X(4).                                 
           05  WF-ACCT-RCV-NBR        PIC X(20).                                
           05  WF-TRNFR-TYPE-CD       PIC X(3).                                 
           05  WF-TRANS-TYPE-CD       PIC X(1).                                 
           05  WF-PRCS-DT             PIC X(10).                                
           05  WF-STTS-CD             PIC X(3).                                 
           05  WF-NSCC-PEND-CD        PIC X(1).                                 
           05  WF-TRANS-RFRN-ID-CD    PIC X(20).                                
           05  WF-DSTBN-SIDE-CD       PIC X(1).                                 
           05  WF-ACCT-EQUITY-AMT     USAGE COMP-2.                             
DJ0007     05  WF-BRANCH-ACCT         PIC X(8).                                 
DJ0007     05  FILLER REDEFINES WF-BRANCH-ACCT.                                 
DJ0007         07  WF-BRANCH-CD       PIC X(3).                                 
DJ0007         07  WF-ACCT-CD         PIC X(5).                                 
                                                                                
       01  WF-AREA.                                                             
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
           05  W-CURRENT-BROKER          PIC X(004).                            
           05  W-CURRENT-STREAM          PIC X(001).                            
           05  WF-ISIN-CNTRY-CD        PIC X(2).                                
           05  WF-ISIN-SEC-ISSUE-CD    PIC X(9).                                
           05  WF-ISIN-SEC-CDG-CD      PIC X(1).                                
           05  WF-STTLM-LCTN-CD        PIC X(2).                                
           05  WF-CSH-MGN-SHRT-CD      PIC X(1).                                
                                                                                
       01  W-ACTITRF-SELECT-FIELDS.                                             
           05 W-ACTITRF-ACAT-CONTROL-NO     PIC  X(014).                        
           05 W-ACTITRF-NSCC-PEND-CD        PIC  X(001).                        
           05 W-ACTITRF-PRCS-DT             PIC  X(010).                        
           05 W-ACTITRF-PRGM-NM             PIC  X(008).                        
           05 W-ACTITRF-UPDT-TMSTP          PIC  X(026).                        
           05 W-ACTITRF-TRNFR-TYPE-RJCT-CD PIC   X(001).                        
                                                                                
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-ADP-CL-NO             PIC 9(04).                          
               05  B1-CLI-NAME              PIC X(30).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-STREAM                PIC X(01).                          
               05  B1-STATUS                PIC X(01).                          
               05  B1-ACAT-STATUS           PIC X(01).                          
       01  B1-WORK-FIELEDS.                                                     
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.                  
           03  B1-SUB                       PIC 9(03) VALUE 0.                  
           03  B1-STREAM-CNT                PIC 9(03) VALUE 0.                  
                                                                                
LRM043    COPY CURLOOK.                                                         
CSG001/                                                                         
CSG001******************************************************************        
CSG001* ACATS VALID CHARACTER SET FROM "ACATS USER GUIDE (SECTION 19)" *        
CSG001******************************************************************        
CSG001 01  FILLER                        PIC X(08) VALUE 'CATVCHAR'.            
CSG001     COPY CATVCHAR.                                                       
      /                                                                         
      ******************************************************************        
      * B1 HEADER                                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.            
           COPY BHINFO.                                                         
      /                                                                         
      ******************************************************************        
      * B1 ACAT SECTION                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.            
           COPY BHACAT.                                                         
      /                                                                         
      ******************************************************************        
      * B1 BTS2 SECTION - OLD ACATS B1                                 *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHBTS2  '.            
           COPY BHBTS2.                                                         
      /                                                                         
      ******************************************************************        
      * B1 MF   SECTION - MUTUAL FUNDS                                 *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHMF    '.            
           COPY BHMF.                                                           
      /                                                                         
           COPY BHMF3.                                                          
      /                                                                         
      ******************************************************************        
      * B1 REQ  SECTION -                                              *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHREQ   '.            
           COPY BHREQ.                                                          
      /                                                                         
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      ***--->COBOL LE                                                           
       01  W-ABEND-AREA.                                                        
           03  ABEND-CODE                PIC S9(04) COMP SYNC.                  
                                                                                
           COPY STUBCPY.                                                        
           03  CKDIGIT                   PIC X(008) VALUE 'CKDIGIT'.            
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.            
LRM002     03  BNWNTWIO                  PIC X(008) VALUE 'BNWNTWIO'.           
      ***<---COBOL LE                                                           
      /                                                                         
      ******************************************************************        
      * ASSET    INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIAST'.            
           EXEC SQL INCLUDE ACTIAST      END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTIONS  INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIOPN'.            
           EXEC SQL INCLUDE ACTIOPN      END-EXEC.                              
                                                                                
      ******************************************************************        
      * MUTUAL FUNDS INIT   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIMF'.             
           EXEC SQL INCLUDE ACTIMF       END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESTRICTED SECURITY TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTSEC '.           
           EXEC SQL INCLUDE VRSTSEC      END-EXEC.                              
                                                                                
LRM005******************************************************************        
LRM005* RESTRICTED SECURITY BLOCK TABLE                                *        
LRM005******************************************************************        
LRM005 01  FILLER                        PIC X(008) VALUE 'VRSDBLK '.           
LRM005     EXEC SQL INCLUDE VRSDBLK      END-EXEC.                              
    10                                                                          
      ******************************************************************        
      * RESTRICTED BROKER   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTBRKR'.           
           EXEC SQL INCLUDE VRSTBRKR     END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESIDUAL CREDIT RESTRICTION TABLE                              *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSDACC '.           
           EXEC SQL INCLUDE VRSDACC      END-EXEC.                              
                                                                                
       01  FILLER                        PIC X(008) VALUE 'VRSDSEC '.           
           EXEC SQL INCLUDE VRSDSEC      END-EXEC.                              
                                                                                
DJ0013******************************************************************        
DJ0013* ASSET DELIVERY RULE - MMF DELIVER AS CASH                      *        
DJ0013******************************************************************        
DJ0013 01  FILLER                        PIC X(008) VALUE 'ACTRBSC '.           
DJ0013     EXEC SQL INCLUDE ACTRBSC      END-EXEC.                              
                                                                                
LRM023******************************************************************        
LRM023* MSD MATURITY DATE LOOKUP                                       *        
LRM023******************************************************************        
LRM023 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM023     EXEC SQL INCLUDE VBNDDT       END-EXEC.                              
                                                                                
LRM024******************************************************************        
LRM024* MSD CALLED BOND LOOKUP                                         *        
LRM024******************************************************************        
LRM024 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM024     EXEC SQL INCLUDE VBNDFTRV     END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  W-COMMIT-CNT              PIC  9(009) VALUE 0.                   
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-SQLERRD-3                   PIC  S9(9).                        
DJ0011     05  W-SQL-UPDATE-COUNT            PIC  9(009) VALUE 0.               
           05  W-AST-SUBMIT-COUNT            PIC  9(009) VALUE 0.               
           05  W-AST-AUTO-COUNT              PIC  9(009) VALUE 0.               
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *        
      * TO GET ALL FULL DELIVER TRANSFERS IN REQ OR REQ-ADJ STATUS     *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'CURSOR'.             
           EXEC SQL                                                             
                DECLARE VTRNFR_CURSOR CURSOR WITH HOLD FOR                      
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR                                                    
                   ,DLVR_NBR_STTS_CD                                            
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_DLVR_STTS_CD                                           
                   ,RCV_NBR                                                     
                   ,RCV_NBR_STTS_CD                                             
                   ,ACCT_RCV_NBR                                                
                   ,ACCT_RCV_STTS_CD                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,RCV_CUST_NM                                                 
                   ,RCV_CUST_NM_STS_CD                                          
                   ,RCV_SS_PRIM_NBR                                             
                   ,RCV_SS_PRIM_STS_CD                                          
                   ,RCV_SS_SCNDY_NBR                                            
                   ,RCV_SS_SCDY_STS_CD                                          
                   ,RCV_ACCT_TYPE_CD                                            
                   ,RCV_ACT_TYP_STS_CD                                          
                   ,RCV_OCC_BRKR_NBR                                            
                   ,RCV_OCC_STTS_CD                                             
                   ,RCV_CRSPN_NBR                                               
                   ,RCV_CRSPN_STTS_CD                                           
                   ,ACAT_CNTL_ASTD_NBR                                          
                   ,CNTL_ASTD_STTS_CD                                           
                   ,CMNT_TXT                                                    
                   ,CMNT_STTS_CD                                                
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,STTLM_TM_CD                                                 
                   ,VAL_FREE_CD                                                 
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,DB_CR_CD                                                    
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,TRN_TYP_RJC_STS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,RR_CD                                                       
                   ,BRANCH_CD                                                   
                   ,DVDND_NAA_CD                                                
                   ,SELL_INSTN_NAA_CD                                           
                   ,CASH_SWEEP_NAA_CD                                           
                   ,PRTCP_CONTRA_CD                                             
                   ,ACM_HOLDER_NAA_CD                                           
                   ,ACCT_ACTIVITY_IND                                           
                   ,ACCT_ORDERS_IND                                             
                   ,ACCT_RJCT_RSBM_IND                                          
                   ,ACCT_DB_BAL_T1_IND                                          
                   ,ACCT_MRGN_DB_IND                                            
                   ,ACCT_SHRT_PSTN_IND                                          
                   ,ACCT_SEC_RSTRD_IND                                          
                   ,ACCT_AST_EXCS_IND                                           
                   ,ACCT_OPTN_PSTN_IND                                          
                   ,ACCT_LTD_PRTNR_IND                                          
                   ,ACCT_TIN_MSMTH_IND                                          
                   ,ACCT_DPLCT_TRN_IND                                          
                   ,ACCT_CUST_70_IND                                            
                   ,ACCT_QULFD_PLN_IND                                          
                   ,ACCT_MNGD_IND                                               
                   ,ACCT_PRVT_RNG_IND                                           
                   ,ACCT_BRKR_TIF_IND                                           
                   ,NSCC_NON_ADP_IND                                            
                   ,CYCLE_CD                                                    
                   ,DAYS_STTS_QTY                                               
                   ,STTLM_DT                                                    
                   ,ACCT_NA_UPDT_IND                                            
                   ,ACCT_TRNFR_FEE_AMT                                          
                   ,ACCT_IRA_TRMNT_AMT                                          
                   ,ACCT_IRA_MAINT_AMT                                          
                   ,ACCT_DLRV_PRGR_IND                                          
                   ,ACCT_CD                                                     
                   ,STTLM_ASCTD_DT                                              
                   ,STTLM_ASCTD_STS_CD                                          
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ACCT_EQUITY_AMT                                             
                FROM    VTRNFR                                                  
                                                                                
                WHERE   CLIENT_NBR    = :W-CURRENT-CLIENT    AND                
                        DLVR_NBR      = :W-CURRENT-BROKER    AND                
                        TRNFR_TYPE_CD = 'FUL'                AND                
                       (STTS_CD IN ('100', '110', '120', '130')) AND            
                       (TRANS_TYPE_CD      <> 'R')           AND                
                       (ACCT_DPLCT_TRN_IND <> 'Y')                              
                                                                                
                FOR UPDATE OF                                                   
                        CICS_TERM_ID_CD                                         
                       ,UPDT_TMSTP                                              
                       ,PRGM_NM                                                 
                       ,ACCT_MRGN_DB_IND                                        
                       ,ACCT_AST_EXCS_IND                                       
                       ,ACCT_LTD_PRTNR_IND                                      
                       ,ACCT_PRVT_RNG_IND                                       
                       ,ACCT_SEC_RSTRD_IND                                      
                       ,ACCT_OPTN_PSTN_IND                                      
                       ,ACCT_EQUITY_AMT                                         
                       ,TRNFR_TYPE_RJC2_CD                                      
LRM005                 ,ACCT_RB_SEC_IND                                         
LRM012                 ,NSCC_PEND_CD                                            
LRM033                 ,PEND_DVDND_DB_AMT                                       
LRM034                 ,NTWRK_LVL4_FND_IND                                      
           END-EXEC.                                                            
                                                                                
LRM002     COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.                    
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
               88  L-ALL-STREAM                      VALUE 'Z'.                 
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
           05  L-RERUN-SW                PIC  X(001).                           
               88  L-RERUN                           VALUE '1'.                 
           05  L-TEST-SW                 PIC  X(001).                           
               88  L-TEST                            VALUE '1'.                 
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT810 - CREATE ASSETS FOR FULL TRANSFER DELIVERS'.         
           DISPLAY '         UPDATE INIT ASSET, OPTION, MF TABLES'.             
           DISPLAY '         UPDATE TRANSFER ROW FOR EXCEPTIONS'.               
           DISPLAY '         UPDATE RSD ACCOUNT SECURITY TABLES'.               
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT810: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT810: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT810: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY 'CAT810: L-STREAM         = '                                
                            L-STREAM                                            
           DISPLAY 'CAT810: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT810: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT810: L-RERUN-SW       = '                                
                            L-RERUN-SW                                          
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOTFNDS.)'                     
           DISPLAY 'CAT810: L-TEST-SW        = '                                
                            L-TEST-SW                                           
           ' (1=THIS IS A TEST. PROC-DATE WILL BE COMPARED.)'                   
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT810: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT810: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT810: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT810: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT810: THIS IS A RERUN.'                               
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
           IF  L-TEST                                                           
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT810: THIS IS A TEST.'                                
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT810'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
LRM043     MOVE BPD-PROC-DATE             TO WK-BPD-PROC-DATE                   
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
           MOVE BPD-PROC-DATE(1:4)        TO W-PROC-DT-YEAR.                    
           MOVE BPD-PROC-DATE(5:2)        TO W-PROC-DT-MM.                      
           MOVE BPD-PROC-DATE(7:2)        TO W-PROC-DT-DD.                      
           MOVE BPD-PROC-DATE             TO W-TODAY-DATE.                      
LRM024     MOVE BPD-PROC-DATE(1:4)        TO WK-TODAY-DB2-CCYY.                 
LRM024     MOVE BPD-PROC-DATE(5:2)        TO WK-TODAY-DB2-MM.                   
LRM024     MOVE BPD-PROC-DATE(7:2)        TO WK-TODAY-DB2-DD.                   
LRM024     MOVE '-'                       TO WK-TODAY-DB2-DASH1                 
LRM024                                       WK-TODAY-DB2-DASH2.                
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT810:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT810: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.         
           DISPLAY 'CAT810:         W-PROC-DT  = ' W-PROC-DT                    
           DISPLAY ' '.                                                         
                                                                                
LRM038     MOVE W-TODAY-DATE              TO BPDATES-BASE-DATE                  
LRM038     SET BPD-DISPLACEMENT-DATE-INFO TO TRUE                               
LRM038     SET BPD-DISP-PLUS              TO TRUE                               
LRM038     SET BPD-DISP-SETTL-DATE        TO TRUE                               
LRM038     MOVE 4                         TO BPDATES-DTSEARCH-DISP              
LRM038     MOVE '  '                      TO BPDATES-CALENDAR-TYPE              
LRM038     CALL  BPDATES  USING BPDATES-PARAMETERS                              
LRM038     IF NOT BPD-VALID-RETURN                                              
LRM038        DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                    
LRM038        DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE                  
LRM038        DISPLAY 'ATTEMPTING TO GET PROJECTED S/D'                         
LRM038        DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                   
LRM038        DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                    
LRM038     ELSE                                                                 
LRM038        MOVE BPD-DT-CALDATE TO WK-PROJECTED-SETTLE-DATE                   
LRM038        DISPLAY '    PROJECTED-SETTLE-DATE '                              
LRM038                                       WK-PROJECTED-SETTLE-DATE           
LRM038     END-IF.                                                              
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
ET0002     OPEN INPUT MMF-FILE.                                                 
ET0002     PERFORM 2600-READ-MMF-FILE                                           
ET0002        THRU 2600-EXIT.                                                   
                                                                                
ET0005     MOVE 'O'    TO GETVBAL-FILE                                          
ET0005     MOVE 'O'    TO GETVBAL-FUNC                                          
ET0005     PERFORM CALL-GETVBAL                                                 
           DISPLAY 'CAT810: BALNC    OPENED FOR INPUT.  STATUS = '              
                                              BALNC-STATUS                      
                                                                                
           IF  BALNC-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING BALNC'                            
               DISPLAY 'CAT810: OPEN STATUS = ' BALNC-STATUS                    
               DISPLAY 'CAT810: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
ET0005     MOVE LOW-VALUES TO GETVHOL-PARM                                      
ET0005     MOVE 'CAT810'   TO GETVHOL-CALLING-PROGRAM                           
LRM053     MOVE 'N'        TO GETVHOL-FILE                                      
ET0005     MOVE 'O'        TO GETVHOL-FUNC                                      
ET0005     PERFORM CALL-GETVHOL                                                 
           DISPLAY 'CAT810: POSVSAM  OPENED FOR INPUT.  STATUS = '              
                                              POSVSAM-STATUS                    
                                                                                
           IF  POSVSAM-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING POSVSAM'                          
               DISPLAY 'CAT810: OPEN STATUS = ' POSVSAM-STATUS                  
               DISPLAY 'CAT810: U3002 - ABENDING ON BAD FILE STATUS'            
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT MRGIMM.                                                   
           DISPLAY 'CAT810: MRGIMM   OPENED FOR INPUT.  STATUS = '              
                                              MRGIMM-STATUS                     
                                                                                
           IF  MRGIMM-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING MRGIMM'                           
               DISPLAY 'CAT810: OPEN STATUS = ' MRGIMM-STATUS                   
               DISPLAY 'CAT810: U3003 - ABENDING ON BAD FILE STATUS'            
               MOVE +3003    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT PRNGFL.                                                   
           DISPLAY 'CAT810: PRNGFL   OPENED FOR INPUT.  STATUS = '              
                                              PRNGFL-STATUS                     
                                                                                
           IF  PRNGFL-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING PRNGFL'                           
               DISPLAY 'CAT810: OPEN STATUS = ' PRNGFL-STATUS                   
               DISPLAY 'CAT810: U3004 - ABENDING ON BAD FILE STATUS'            
               MOVE +3004    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
LRM033     OPEN INPUT DVNDFL.                                                   
LRM033     DISPLAY 'CAT810: DVNDFL   OPENED FOR INPUT.  STATUS = '              
LRM033                                        DVNDFL-STATUS                     
LRM033                                                                          
LRM033     IF  DVNDFL-OKAY                                                      
LRM033         CONTINUE                                                         
LRM033     ELSE                                                                 
LRM033         DISPLAY 'CAT810: ERROR OPENING DVNDFL'                           
LRM033         DISPLAY 'CAT810: OPEN STATUS = ' DVNDFL-STATUS                   
LRM033         DISPLAY 'CAT810: U3001 - ABENDING ON BAD FILE STATUS'            
LRM033         MOVE +3002    TO ABEND-CODE                                      
LRM033         CALL ABEND USING ABEND-CODE                                      
LRM033     END-IF.                                                              
                                                                                
           OPEN INPUT MFMSD.                                                    
           DISPLAY 'CAT810: MFMSD    OPENED FOR INPUT.  STATUS = '              
                                              MFMSD-STATUS                      
                                                                                
           IF  MFMSD-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING MFMSD'                            
               DISPLAY 'CAT810: OPEN STATUS = ' MFMSD-STATUS                    
               DISPLAY 'CAT810: U3005 - ABENDING ON BAD FILE STATUS'            
               MOVE +3005    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWMAST.                                                  
           DISPLAY 'CAT810: BNWMAST  OPENED FOR INPUT.  STATUS = '              
                                              BNWMAST-STATUS                    
                                                                                
           IF  BNWMAST-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING BNWMAST'                          
               DISPLAY 'CAT810: OPEN STATUS = ' BNWMAST-STATUS                  
               DISPLAY 'CAT810: U3006 - ABENDING ON BAD FILE STATUS'            
               MOVE +3006    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWREGOP.                                                 
           DISPLAY 'CAT810: BNWREGOP OPENED FOR INPUT.  STATUS = '              
                                              BNWREGOP-STATUS                   
                                                                                
           IF  BNWREGOP-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING BNWREGOP'                         
               DISPLAY 'CAT810: OPEN STATUS = ' BNWREGOP-STATUS                 
               DISPLAY 'CAT810: U3007 - ABENDING ON BAD FILE STATUS'            
               MOVE +3007    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
DJ0016     OPEN INPUT MFEXBR.                                                   
DJ0016     DISPLAY 'CAT810: MFEXBR   OPENED FOR INPUT.  STATUS = '              
DJ0016                                        MFEXBR-STATUS                     
DJ0016                                                                          
DJ0016     IF  MFEXBR-OKAY                                                      
DJ0016         CONTINUE                                                         
DJ0016     ELSE                                                                 
DJ0016         DISPLAY 'CAT810: ERROR OPENING MFEXBR'                           
DJ0016         DISPLAY 'CAT810: OPEN STATUS = ' MFEXBR-STATUS                   
DJ0016         DISPLAY 'CAT810: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0016         MOVE +3001    TO ABEND-CODE                                      
DJ0016         CALL ABEND USING ABEND-CODE                                      
DJ0016     END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATDLVF.                                                
           DISPLAY 'CAT810: ACATDLVF OPENED FOR OUTPUT. STATUS = '              
                                               ACATDLVF-FILE-STATUS.            
                                                                                
           IF  ACATDLVF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT810: ERROR OPENING ACATDLVF'                         
               DISPLAY 'CAT810: OPEN STATUS = ' ACATDLVF-FILE-STATUS            
                            '.  OUTPUT-CNT = ' W-ACATDLVF-CNT                   
               DISPLAY 'CAT810: U3008 - ABENDING ON BAD FILE STATUS'            
               MOVE +3008    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
DJ0013     OPEN OUTPUT CATWHLD.                                                 
DJ0013     DISPLAY 'CAT810: CATWHLD  OPENED FOR OUTPUT. STATUS = '              
DJ0013                                         CATWHLD-FILE-STATUS.             
DJ0013                                                                          
DJ0013     IF  CATWHLD-OKAY                                                     
DJ0013         CONTINUE                                                         
DJ0013     ELSE                                                                 
DJ0013         DISPLAY 'CAT810: ERROR OPENING CATWHLD'                          
DJ0013         DISPLAY 'CAT810: OPEN STATUS = ' CATWHLD-FILE-STATUS             
DJ0013                      '.  OUTPUT-CNT = ' W-CATWHLD-CNT                    
DJ0013         DISPLAY 'CAT810: U3008 - ABENDING ON BAD FILE STATUS'            
DJ0013         MOVE +3008    TO ABEND-CODE                                      
DJ0013         CALL ABEND USING ABEND-CODE                                      
DJ0013     END-IF.                                                              
                                                                                
LRM042     OPEN OUTPUT CATEXCP.                                                 
LRM042     DISPLAY 'CAT810: CATEXCP  OPENED FOR OUTPUT. STATUS = '              
LRM042                                         CATEXCP-FILE-STATUS.             
                                                                                
LRM042     IF  CATEXCP-OKAY                                                     
LRM042         CONTINUE                                                         
LRM042     ELSE                                                                 
LRM042         DISPLAY 'CAT810: ERROR OPENING CATEXCP'                          
LRM042         DISPLAY 'CAT810: OPEN STATUS = ' CATEXCP-FILE-STATUS             
LRM042                      '.  OUTPUT-CNT = ' W-CATEXCP-CNT                    
LRM042         DISPLAY 'CAT810: U3009 - ABENDING ON BAD FILE STATUS'            
LRM042         MOVE +3009    TO ABEND-CODE                                      
LRM042         CALL ABEND USING ABEND-CODE                                      
LRM042     END-IF.                                                              
                                                                                
           MOVE ' '                      TO ACATDLVF-HEADER-RECORD              
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            ACATDLVF.                           
           MOVE CP2-RETURN-RECORD        TO ACATDLVF-HEADER-RECORD              
DJ0013     MOVE LD-PROC-DATE             TO ACATDLVF-HDR-PROC-DATE              
DJ0013     MOVE 'CYCLE='                 TO ACATDLVF-HDR-CYCLE-LIT              
DJ0013     MOVE '00'                     TO ACATDLVF-HDR-CYCLE-NO               
           DISPLAY 'CAT810: ACATDLVF-HDR= ' ACATDLVF-HEADER-RECORD              
           WRITE ACATDLVF-RECORD.                                               
           DISPLAY 'CAT810: ACATDLVF HEADER WRITTEN.    STATUS = '              
                                               ACATDLVF-FILE-STATUS.            
                                                                                
DJ0013     MOVE ' '                      TO CATWHLD-HEADER-RECORD               
DJ0013     MOVE 'H'                      TO CP2-REQUEST-CODE.                   
DJ0013     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
DJ0013     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
DJ0013     CALL P2HDTR                USING CP2-AREA                            
DJ0013                                      CATWHLD.                            
DJ0013     MOVE CP2-RETURN-RECORD        TO CATWHLD-HEADER-RECORD               
DJ0013     MOVE LD-PROC-DATE             TO CATWHLD-HDR-PROC-DATE               
DJ0013     MOVE 'CYCLE='                 TO CATWHLD-HDR-CYCLE-LIT               
DJ0013     MOVE '00'                     TO CATWHLD-HDR-CYCLE-NO                
DJ0013     DISPLAY 'CAT810: CATWHLD-HDR= ' CATWHLD-HEADER-RECORD                
DJ0013                                                                          
DJ0013     WRITE CATWHLD-RECORD.                                                
DJ0013     DISPLAY 'CAT810: CATWHLD HEADER WRITTEN.    STATUS = '               
DJ0013                                         CATWHLD-FILE-STATUS.             
                                                                                
LRM042     MOVE ' '                      TO CATEXCP-HEADER-RECORD               
LRM042     MOVE 'H'                      TO CP2-REQUEST-CODE.                   
LRM042     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
LRM042     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
LRM042     CALL P2HDTR                USING CP2-AREA                            
LRM042                                      CATEXCP.                            
LRM042     MOVE CP2-RETURN-RECORD        TO CATEXCP-HEADER-RECORD               
LRM042     MOVE LD-PROC-DATE             TO CATEXCP-HDR-PROC-DATE               
LRM042     MOVE 'CYCLE='                 TO CATEXCP-HDR-CYCLE-LIT               
LRM042     MOVE '00'                     TO CATEXCP-HDR-CYCLE-NO                
LRM042     DISPLAY 'CAT810: CATEXCP-HDR= ' CATEXCP-HEADER-RECORD                
LRM042     WRITE CATEXCP-RECORD.                                                
LRM042     DISPLAY 'CAT810: CATEXCP HEADER WRITTEN.    STATUS = '               
LRM042                                         CATEXCP-FILE-STATUS.             
                                                                                
           PERFORM 1500-LOAD-B1          THRU 1500-EXIT.                        
                                                                                
LRM002     MOVE  SPACES      TO NTWIO-PARAMETERS.                               
LRM002     MOVE  'CAT810'    TO NTWIO-PGM-NAME.                                 
LRM002     MOVE  'O'         TO NTWIO-FUNCTION-CODE.                            
LRM002     MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                             
LRM002     CALL  BNWNTWIO USING NTWIO-PARAMETERS.                               
ET0002                                                                          
ET0002     MOVE SPACES                   TO   GETNA-PARAMETERS.                 
ET0002     MOVE 'CAT810 '                TO   GETNA-PGM-NAME.                   
ET0002     MOVE 'R'                      TO   GETNA-REQ-FUNC.                   
ET0002     MOVE 'R'                      TO   GETNA-REQ-FILE.                   
ET0002     MOVE 'R'                      TO   GETNA-REQ-FUNC2.                  
ET0002     MOVE 'N'                      TO   GETNA-REQ-YEAREND.                
ET0002                                                                          
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT810: 1500-LOAD-B1'.                                      
                                                                                
           MOVE SPACES                   TO  B1-TABLE-AREA.                     
           MOVE 0                        TO  B1-TBL-CNT.                        
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N                 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE             
             MOVE  '434500'              TO  BH-B2-INFO-ID                      
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             IF   BH-BROKER-ACTIVE                                              
             AND  BH-ACAT-ACTIVE                                                
                   ADD 1 TO B1-TBL-CNT                                          
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)          
                   MOVE  BH-BROKER-NAME                                         
                                         TO B1-CLI-NAME   (B1-TBL-CNT)          
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)          
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                       
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                        
                                         TO B1-STREAM     (B1-TBL-CNT)          
                   ELSE                                                         
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR                       
                                         TO B1-STREAM     (B1-TBL-CNT)          
                   END-IF                                                       
                   MOVE  BH-BROKER-STATUS                                       
                                         TO B1-STATUS     (B1-TBL-CNT)          
                   MOVE  BH-ACAT-STATUS                                         
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)          
                   IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                        
                       DISPLAY     'CNT=' B1-TBL-CNT                            
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)          
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)          
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)          
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)          
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)          
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)          
                       ADD 1 TO B1-STREAM-CNT                                   
                   END-IF                                                       
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1-STREAM-CNT  = ' B1-STREAM-CNT                           
                    ' # OF CLIENTS FOR THIS STREAM'                             
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT                              
                    ' # OF ADP CLIENTS THAT ARE ACATS CLIENTS'.                 
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  GET CLIENT FOR THIS STREAM, AND FETCH TRANSFERS                        
      ******************************************************************        
       2000-PROCESS-INPUT SECTION.                                              
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.                   
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1                                   
              UNTIL B1-SUB > 500                                                
                                                                                
              IF  B1-STREAM      (B1-SUB) = L-STREAM                            
              AND B1-STATUS      (B1-SUB) = 'A'                                 
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                                 
              AND B1-BKR-CLR-NO  (B1-SUB) > ' '                                 
                  MOVE B1-ADP-CL-NO  (B1-SUB) TO W-CURRENT-CLIENT-N             
                  MOVE B1-BKR-CLR-NO (B1-SUB) TO W-CURRENT-BROKER               
                  MOVE B1-STREAM     (B1-SUB) TO W-CURRENT-STREAM               
                  PERFORM 2500-GETB1         THRU 2500-EXIT                     
                  PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT                     
              END-IF                                                            
                                                                                
           END-PERFORM.                                                         
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
       2500-GETB1          SECTION.                                             
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                              BH-BTS2-INFO                      
                                              BH-MF-INFO                        
                                                                                
           MOVE W-CURRENT-CLIENT (2:3)     TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
                                                                                
           MOVE '511000'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-BTS2-INFO                      
           END-CALL.                                                            
                                                                                
           MOVE '537000'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-MF-INFO                        
           END-CALL.                                                            
                                                                                
           MOVE  ' '               TO  BH-MF3-INFO                              
           MOVE  '540000'          TO  BH-B2-INFO-ID                            
           CALL  GETB1V         USING  BH-BROKER-HEADER-INFO                    
                                       BH-MF3-INFO                              
           END-CALL.                                                            
                                                                                
DJ0007     MOVE ' '                TO  BH-REQ-INFO                              
DJ0007     MOVE ' '                TO  BH-B2-INFO-ID                            
DJ0007     MOVE '114'              TO  BH-LOGICAL-RECORD-CODE                   
DJ0007     CALL  GETB1V          USING BH-BROKER-HEADER-INFO                    
DJ0007                                 BH-REQ-INFO                              
DJ0007     END-CALL.                                                            
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT810: BH-ACAT-STATUS                 (434501) = '         
                            BH-ACAT-STATUS                                      
           DISPLAY 'CAT810: BH-ACAT-LIQUIDATE-MMF          (434510) = '         
                            BH-ACAT-LIQUIDATE-MMF                               
           DISPLAY 'CAT810: BH-ACAT-SUBMIT-ASSETS          (434516) = '         
                            BH-ACAT-SUBMIT-ASSETS                               
           DISPLAY 'CAT810: BH-ACAT-FRACT-ON-CNS-ELIG-SEC  (434521) = '         
                            BH-ACAT-FRACT-ON-CNS-ELIG-SEC                       
           DISPLAY 'CAT810: BH-ACAT-WHOLD-STK-REC-MEMO-NO  (434533) = '         
                            BH-ACAT-WHOLD-STK-REC-MEMO-NO                       
           DISPLAY 'CAT810: BH-ACAT-WHOLD-STK-REC-MEMO     (434533) = '         
                            BH-ACAT-WHOLD-STK-REC-MEMO (1:60)                   
                                                                                
           DISPLAY 'CAT810: BH-ACAT-TYPE-3-BALANCES        (434512) = '         
                            BH-ACAT-TYPE-3-BALANCES                             
           DISPLAY 'CAT810: BH-ACAT-WH-ASSET-CONTRA-CUSIP  (434517) = '         
                            BH-ACAT-WH-ASSET-CONTRA-CUSIP                       
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-REC-AMT  (434556) = '         
                            BH-ACAT-REJ-PEND-FULL-REC-AMT                       
           DISPLAY 'CAT810: BH-ACAT-REJ-DEL-MARGIN-DEBIT            = '         
                            BH-ACAT-REJ-DEL-MARGIN-DEBIT                        
           DISPLAY 'CAT810: BH-ACAT-REJ-DEL-ASSET-VALUE             = '         
                            BH-ACAT-REJ-DEL-ASSET-VALUE                         
           DISPLAY 'CAT810: BH-ACAT-REJ-DEL-TOTL-ACT-VAL            = '         
                            BH-ACAT-REJ-DEL-TOTL-ACT-VAL                        
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-DEL-SPAD-NO   (434557) = '         
                            BH-ACAT-REJ-PEND-DEL-SPAD-NO                        
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-DEL-SPADS     (434557) = '         
                            BH-ACAT-REJ-PEND-DEL-SPADS (1:60)                   
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-DUP  (434558) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-DUP                       
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-MM   (434559) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-MM                        
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-NTS  (434560) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-NTS                       
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-FLAT (434561) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-FLAT                      
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-LP   (434562) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-LP                        
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-QRP  (434564) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-QRP                       
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-SP   (434565) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-SP                        
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-CNTR (434566) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-CNTR                      
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-PRIV (434567) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-PRIV                      
           DISPLAY 'CAT810: BH-ACAT-REJ-PEND-FULL-DEL-SS   (434568) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-SS                        
           DISPLAY 'CAT810: BH-ACAT-MF-FUND-SERV-CLIENT    (434606) = '         
                            BH-ACAT-MF-FUND-SERV-CLIENT                         
           DISPLAY 'CAT810: BH-ACAT-MF-REG-FUND-ACCT       (434608) = '         
                            BH-ACAT-MF-REG-FUND-ACCT                            
           DISPLAY 'CAT810: BH-ACAT-MF-REG-DIVD-PAYEE-IND  (434619) = '         
                            BH-ACAT-MF-REG-DIVD-PAYEE-IND                       
           DISPLAY 'CAT810: BH-ACAT-MF-REGIST-RECEIVE-BKR  (434636) = '         
                            BH-ACAT-MF-REGIST-RECEIVE-BKR                       
           DISPLAY 'CAT810: BH-ACAT-MF-REG-DIVD-PAYEE-IND  (434619) = '         
                            BH-ACAT-MF-REG-DIVD-PAYEE-IND                       
ET0001     DISPLAY 'CAT810: BH-ACAT-BALANCE-ADJUSTMENT     (434675) = '         
ET0001                      BH-ACAT-BALANCE-ADJUSTMENT                          
LRM005     DISPLAY 'CAT810: BH-ACAT-BLOCK-SECURITY-IND     (434679) = '         
LRM005                      BH-ACAT-BLOCK-SECURITY-IND                          
DJ0013     DISPLAY 'CAT810: BH-ACAT-ASCENDIS-USER          (434735) = '         
DJ0013                      BH-ACAT-ASCENDIS-USER                               
           DISPLAY 'CAT810: BH-BTS2-ACAT-SK-MEMO-OVERRIDE  (511220) = '         
                            BH-BTS2-ACAT-SK-MEMO-OVERRIDE                       
           DISPLAY 'CAT810: BH-BTS2-ACAT-RESTRT-RN-RS-MEMO (511228) = '         
                            BH-BTS2-ACAT-RESTRT-RN-RS-MEMO                      
           DISPLAY 'CAT810: BH-MF-STATUS                   (537011) = '         
                            BH-MF-STATUS                                        
DJ0016     DISPLAY 'CAT810: BH-MF-EXBR-OPTION              (537483) = '         
DJ0016                      BH-MF-EXBR-OPTION                                   
DJ0007     DISPLAY 'CAT810: BH-MF-SINGLE-FUND-ACCOUNT      (537486) = '         
DJ0007                      BH-MF-SINGLE-FUND-ACCOUNT                           
           DISPLAY 'CAT810: BH-MFN-STATUS                  (537501) = '         
                            BH-MFN-STATUS                                       
           DISPLAY 'CAT810: BH-MFN-OMNIBUS-NSCC-BOX-ACCT   (537596) = '         
                            BH-MFN-OMNIBUS-NSCC-BOX-ACCT                        
LRM002     DISPLAY 'CAT810: BH-MFN-OMNIBUS-MULTI-PLAT-OPT  (537608) = '         
LRM002                      BH-MFN-OMNIBUS-MULTI-PLAT-OPT                       
LRM004     DISPLAY 'CAT810: BH-MFN-DST-MFE-NSCC-BOX-ACCT   (537601) = '         
LRM004                      BH-MFN-DST-MFE-NSCC-BOX-ACCT                        
           DISPLAY 'CAT810: BH-MF3-STATUS                  (540011) = '         
                            BH-MF3-STATUS                                       
           IF  BH-MF3-SUB-EXEC-BKR-REC-NO  NOT NUMERIC                          
               MOVE '0' TO BH-MF3-SUB-EXEC-BKR-REC-NO                           
           END-IF.                                                              
           DISPLAY 'CAT810: BH-MF3-SUB-EXEC-BKR-REC-NO     (540167) = '         
                            BH-MF3-SUB-EXEC-BKR-REC-NO                          
                                                                                
LRM022     DISPLAY 'CAT810: BH-MF3-PNC-SURPAS-BOX-ACCOUNT  (540238) = '         
LRM022                      BH-MF3-PNC-SURPAS-BOX-ACCOUNT                       
LRM026     DISPLAY 'CAT810: BH-MF3-PNC-SURPAS-BOX-ACCOUNT  (540238) = '         
LRM026                      BH-MF3-PNC-SURPAS-BOX-ACCOUNT                       
           DISPLAY 'CAT810: OPT EXP DATE WITHIN   = ' W-OPT-EXP-DATE            
                   ' STATUS = ' BH-ACAT-EXPIRING-OPT-ACT.                       
LRM023     DISPLAY 'CAT810: BOND EXP/CALLED DATE  = ' WK-BOND-EXP-DATE          
                                                                                
           IF  BH-ACAT-SUBMIT-ASSETS NOT NUMERIC                                
               MOVE '0' TO BH-ACAT-SUBMIT-ASSETS                                
           END-IF.                                                              
           MOVE BH-ACAT-SUBMIT-ASSETS TO W-BH-ACAT-SUBMIT-ASSETS.               
           MOVE W-BH-ACAT-SUBMIT-ASSETS-N TO W-BH-DAYS-STTS-QTY.                
           IF BH-MF-ACTIVE                                                      
           AND BH-MFN-OMNIBUS-NSCC-BOX-ACCT > SPACES                            
              MOVE BH-MFN-OMNIBUS-NSCC-BOX-ACCT TO NS-BRCH-ACCT-T               
              MOVE ' ' TO NS-CK                                                 
              CALL CKDIGIT USING NS-BRCH-ACCT-T                                 
                                 W-CKDIGIT-LEN                                  
                                 NS-CK                                          
           ELSE                                                                 
              MOVE SPACES     TO NS-BRCH-ACCT-TC                                
           END-IF.                                                              
                                                                                
           IF BH-MF3-ACTIVE                                                     
LRM022     AND BH-MF3-PNC-SURPAS-BOX-ACCOUNT NOT = SPACE                        
LRM022        MOVE BH-MF3-PNC-SURPAS-BOX-ACCOUNT TO WS-PNC-SURPAS-BOX-T         
LRM022        MOVE ' ' TO WS-PNC-SURPAS-CK                                      
LRM022        CALL  CKDIGIT  USING  WS-PNC-SURPAS-BOX-T                         
LRM022                              W-CKDIGIT-LEN                               
LRM022                              WS-PNC-SURPAS-CK                            
LRM022     ELSE                                                                 
LRM022        MOVE SPACES     TO WS-PNC-SURPAS-BOX-TC                           
LRM022     END-IF.                                                              
                                                                                
LRM004     IF BH-MF-ACTIVE                                                      
LRM004     AND BH-MFN-DST-MFE-NSCC-BOX-ACCT > SPACE                             
LRM004        MOVE BH-MFN-DST-MFE-NSCC-BOX-ACCT TO WS-DST-BOX-ACCT-T            
LRM004        MOVE ' ' TO WS-DST-BOX-CK                                         
LRM004        CALL CKDIGIT USING WS-DST-BOX-ACCT-T                              
LRM004                           W-CKDIGIT-LEN                                  
LRM004                           WS-DST-BOX-CK                                  
LRM004     ELSE                                                                 
LRM004        MOVE SPACES     TO WS-DST-BOX-ACCT-TC                             
LRM004     END-IF.                                                              
           DISPLAY 'CAT810:'                                                    
                          ' W-CURRENT-STREAM=' W-CURRENT-STREAM                 
                          ' W-CURRENT-CLIENT=' W-CURRENT-CLIENT                 
                          ' W-CURRENT-BROKER=' W-CURRENT-BROKER.                
      ********                                                                  
           IF  BH-ACAT-EXPIRING-OPT-DAYS  NOT NUMERIC                           
               MOVE '0000' TO BH-ACAT-EXPIRING-OPTION                           
           END-IF.                                                              
           MOVE  BH-ACAT-EXPIRING-OPT-DAYS TO W-NUM-TO-EXP.                     
           MOVE  BH-ACAT-EXPIRING-OPT-ACT TO W-EXP-OPT-ACT.                     
                                                                                
           MOVE 0              TO W-OPT-EXP-DATE                                
           IF W-NUM-TO-EXP > 0                                                  
             MOVE W-TODAY-DATE              TO BPDATES-BASE-DATE                
             SET BPD-DISPLACEMENT-DATE-INFO TO TRUE                             
             SET BPD-DISP-PLUS              TO TRUE                             
             SET BPD-DISP-CALENDAR          TO TRUE                             
             MOVE W-NUM-TO-EXP              TO BPDATES-DTSEARCH-DISP            
             MOVE '  '                      TO BPDATES-CALENDAR-TYPE            
             CALL  BPDATES  USING BPDATES-PARAMETERS                            
             IF NOT BPD-VALID-RETURN                                            
                DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                  
                DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE                
                DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                 
                DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                  
             ELSE                                                               
                MOVE BPD-DT-CALDATE TO W-OPT-EXP-DATE                           
             END-IF                                                             
           END-IF.                                                              
           DISPLAY 'CAT810: OPT EXP DATE WITHIN   = ' W-OPT-EXP-DATE            
                   ' STATUS = ' BH-ACAT-EXPIRING-OPT-ACT.                       
                                                                                
LRM023     IF BH-ACAT-MATUR-CALL-BOND-DAYS NOT NUMERIC                          
LRM023        MOVE 0 TO BH-ACAT-MATUR-CALL-BOND-DAYS                            
LRM023     END-IF.                                                              
LRM023     MOVE BH-ACAT-MATUR-CALL-BOND-DAYS   TO W-NUM-BOND-TO-EXP.            
LRM023     MOVE BH-ACAT-MATUR-CALL-BOND-ACTION TO W-BOND-EXP-ACT.               
LRM023     MOVE 99991231 TO WK-BOND-EXP-DATE                                    
LRM023     IF W-BOND-EXP-ACT NOT = '0'                                          
LRM023       MOVE W-TODAY-DATE              TO BPDATES-BASE-DATE                
LRM023       SET BPD-DISPLACEMENT-DATE-INFO TO TRUE                             
LRM023       SET BPD-DISP-PLUS              TO TRUE                             
LRM023       SET BPD-DISP-CALENDAR          TO TRUE                             
LRM023       MOVE W-NUM-BOND-TO-EXP         TO BPDATES-DTSEARCH-DISP            
LRM023       MOVE '  '                      TO BPDATES-CALENDAR-TYPE            
LRM023       CALL  BPDATES  USING BPDATES-PARAMETERS                            
LRM023       IF NOT BPD-VALID-RETURN                                            
LRM023           DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                 
LRM023           DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE               
LRM023           DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                
LRM023           DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                 
LRM023       ELSE                                                               
LRM023           MOVE BPD-DT-CALDATE TO WK-BOND-EXP-DATE                        
LRM023       END-IF                                                             
LRM023     END-IF.                                                              
LRM023     MOVE WK-BOND-EXP-DATE(1:4) TO  WK-MS-BOND-EXP-CCYY                   
LRM023     MOVE WK-BOND-EXP-DATE(5:2) TO  WK-MS-BOND-EXP-MM                     
LRM023     MOVE WK-BOND-EXP-DATE(7:2) TO  WK-MS-BOND-EXP-DD                     
LRM023     DISPLAY 'CAT810: BH-ACAT-MATUR-CALL-BOND-DAYS   (434748) = '         
LRM023                      BH-ACAT-MATUR-CALL-BOND-DAYS                        
LRM023     DISPLAY '        BH-ACAT-MATUR-CALL-BOND-ACTION (434748) = '         
LRM023                      BH-ACAT-MATUR-CALL-BOND-ACTION                      
LRM023     DISPLAY '        CALC MAT/CALL DATE ' WK-BOND-EXP-DATE               
LRM034     DISPLAY 'CAT810: BH-ACAT-DELIVER-NTW-LVL4-FUND  (434743) = '         
LRM034                      BH-ACAT-DELIVER-NTW-LVL4-FUND ' 0=WTHLD'.           
                                                                                
ET0002     MOVE SPACE TO W-MMF-TABLE-AREA.                                      
ET0002     MOVE ZERO  TO TBL-SUB                                                
ET0002                   W-MMF-TBL-CNT.                                         
ET0002     IF NOT EOF-MMF                                                       
ET0002        PERFORM UNTIL  I-MMF-CLIENT-NUM > W-CURRENT-CLIENT-N              
ET0002                   OR  EOF-MMF                                            
ET0002                   OR  TBL-SUB > 999                                      
ET0002           IF I-MMF-CLIENT-NUM = W-CURRENT-CLIENT-N                       
ET0002              IF I-MMF-REDMPT-REC                                         
ET0002                  MOVE I-MMF-REDMPT-COUNT TO W-REDMPT-TBL-CNT             
ET0002                  PERFORM VARYING OCR-SUB FROM 1 BY 1                     
ET0002                           UNTIL OCR-SUB > I-MMF-REDMPT-COUNT             
ET0002                      MOVE I-MMF-REDMPT-SECURITY (OCR-SUB)                
ET0002                        TO W-REDMPT-SEC          (OCR-SUB)                
ET0002                  END-PERFORM                                             
ET0002              ELSE                                                        
ET0002                  ADD  1    TO  TBL-SUB  W-MMF-TBL-CNT                    
ET0002                  MOVE I-MMF-CLIENT-NUM                                   
ET0002                            TO W-MMF-CLT        (TBL-SUB)                 
ET0002                  MOVE I-MMF-SECURITY                                     
ET0002                            TO W-MMF-SEC        (TBL-SUB)                 
ET0002                  MOVE I-MMF-SWEEP-CODE                                   
ET0002                            TO W-MMF-SWEEP-CD   (TBL-SUB)                 
ET0002                  MOVE I-MMF-REDMPT-HRCHY                                 
ET0002                            TO W-MMF-REDMPT-IND (TBL-SUB)                 
LRM019                  MOVE I-MMF-THRESHOLD-COUNT TO                           
LRM019                               W-THRESHOLD-TBL-CNT (TBL-SUB)              
LRM019                  PERFORM VARYING TH-SUB FROM 1 BY 1                      
LRM019                           UNTIL TH-SUB > I-MMF-THRESHOLD-COUNT           
LRM019                     MOVE I-MMF-THRESHOLD-FUND(TH-SUB) TO                 
LRM019                          W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)          
LRM019                  END-PERFORM                                             
ET0002              END-IF                                                      
ET0002           END-IF                                                         
ET0002           PERFORM 2600-READ-MMF-FILE THRU 2600-EXIT                      
ET0002        END-PERFORM                                                       
ET0002     END-IF.                                                              
ET0002     PERFORM VARYING TBL-SUB FROM 1 BY 1 UNTIL TBL-SUB > 999              
ET0002         IF W-MMF-SEC (TBL-SUB) > SPACE                                   
ET0002            IF TBL-SUB = 1                                                
ET0002               DISPLAY ' '                                                
ET0002               DISPLAY '** CLT=' BH-BROKER-NUMBER ' - CAMS MONEY'         
ET0002                       ' MKT FUNDS PRIMARY REDEMPTION LIST'               
ET0002            END-IF                                                        
ET0002            DISPLAY '   SECURITY = ' W-MMF-SEC (TBL-SUB)                  
ET0002                  '   SWEEP CODE = ' W-MMF-SWEEP-CD (TBL-SUB)             
LRM000                        ' REDMPT = ' W-MMF-REDMPT-IND (TBL-SUB)           
ET0002         ELSE                                                             
ET0002            MOVE 9000 TO TBL-SUB                                          
ET0002         END-IF                                                           
ET0002     END-PERFORM.                                                         
ET0002     PERFORM VARYING TBL-SUB FROM 1 BY 1 UNTIL TBL-SUB > 999              
ET0002         IF W-REDMPT-SEC (TBL-SUB) > SPACE                                
ET0002            IF TBL-SUB = 1                                                
ET0002               DISPLAY ' '                                                
ET0002               DISPLAY '** CLT=' BH-BROKER-NUMBER ' - CAMS MONEY'         
ET0002                       ' MKT FUNDS SECONDARY REDEMPTION LIST'             
ET0002            END-IF                                                        
ET0002            DISPLAY '   SECURITY = ' W-REDMPT-SEC (TBL-SUB)               
ET0002         ELSE                                                             
ET0002            MOVE 9000 TO TBL-SUB                                          
ET0002         END-IF                                                           
ET0002     END-PERFORM.                                                         
ET0002     DISPLAY ' '.                                                         
       2500-EXIT. EXIT.                                                         
      /                                                                         
ET0002 2600-READ-MMF-FILE.                                                      
ET0002     READ MMF-FILE                                                        
ET0002        AT END                                                            
ET0002           SET EOF-MMF  TO TRUE.                                          
ET0002     IF NOT EOF-MMF                                                       
ET0002        ADD 1 TO W-MMF-CNT.                                               
ET0002 2600-EXIT. EXIT.                                                         
ET0002/                                                                         
      ******************************************************************        
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,                    
      *     LOAD ASSETS                                                         
      ******************************************************************        
       3000-FETCH-TRANFER SECTION.                                              
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.                   
                                                                                
           EXEC SQL OPEN VTRNFR_CURSOR END-EXEC                                 
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'VTRNFR CURSOR OPEN ERROR '                               
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
                                                                                
              ADD 1 TO W-INFILE-CNT                                             
                                                                                
              EXEC SQL                                                          
                   FETCH VTRNFR_CURSOR                                          
               INTO                                                             
                    :DCLVTRNFR.CLIENT-NBR                                       
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                                 
                   ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                  
                   ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                               
                   ,:DCLVTRNFR.CONTROL-NBR-STS-CD                               
                   ,:DCLVTRNFR.DLVR-NBR                                         
                   ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                 
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                                    
                   ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                
                   ,:DCLVTRNFR.RCV-NBR                                          
                   ,:DCLVTRNFR.RCV-NBR-STTS-CD                                  
                   ,:DCLVTRNFR.ACCT-RCV-NBR                                     
                   ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                 
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                                    
                   ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                               
                   ,:DCLVTRNFR.TRANS-TYPE-CD                                    
                   ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                               
                   ,:DCLVTRNFR.RCV-CUST-NM                                      
                   ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                               
                   ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                  
                   ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                               
                   ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                 
                   ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                               
                   ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                 
                   ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                               
                   ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                 
                   ,:DCLVTRNFR.RCV-OCC-STTS-CD                                  
                   ,:DCLVTRNFR.RCV-CRSPN-NBR                                    
                   ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                
                   ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                               
                   ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                
                   ,:DCLVTRNFR.CMNT-TXT                                         
                   ,:DCLVTRNFR.CMNT-STTS-CD                                     
                   ,:DCLVTRNFR.PRCS-DT                                          
                   ,:DCLVTRNFR.STTS-CD                                          
                   ,:DCLVTRNFR.STTLM-TM-CD                                      
                   ,:DCLVTRNFR.VAL-FREE-CD                                      
                   ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                 
                   ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                               
                   ,:DCLVTRNFR.DB-CR-CD                                         
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                                    
                   ,:DCLVTRNFR.SYS-ACT-CD                                       
                   ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                  
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                               
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                               
                   ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                               
                   ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                               
                   ,:DCLVTRNFR.PHSCL-SEQ-NBR                                    
                   ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                
                   ,:DCLVTRNFR.LGCL-SEQ-NBR                                     
                   ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                               
                   ,:DCLVTRNFR.RR-CD                                            
                   ,:DCLVTRNFR.BRANCH-CD                                        
                   ,:DCLVTRNFR.DVDND-NAA-CD                                     
                   ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                
                   ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                
                   ,:DCLVTRNFR.PRTCP-CONTRA-CD                                  
                   ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                
                   ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                
                   ,:DCLVTRNFR.ACCT-ORDERS-IND                                  
                   ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                               
                   ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                               
                   ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                 
                   ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                               
                   ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                               
                   ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                
                   ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                               
                   ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                               
                   ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                               
                   ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                               
                   ,:DCLVTRNFR.ACCT-CUST-70-IND                                 
                   ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                               
                   ,:DCLVTRNFR.ACCT-MNGD-IND                                    
                   ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                
                   ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                
                   ,:DCLVTRNFR.NSCC-NON-ADP-IND                                 
                   ,:DCLVTRNFR.CYCLE-CD                                         
                   ,:DCLVTRNFR.DAYS-STTS-QTY                                    
                   ,:DCLVTRNFR.STTLM-DT                                         
                   ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                 
                   ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                               
                   ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                               
                   ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                               
                   ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                               
                   ,:DCLVTRNFR.ACCT-CD                                          
                   ,:DCLVTRNFR.STTLM-ASCTD-DT                                   
                   ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                               
                   ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                               
                   ,:DCLVTRNFR.RCRD-STTS-CD                                     
                   ,:DCLVTRNFR.NSCC-PEND-CD                                     
                   ,:DCLVTRNFR.NSCC-ACK-IND                                     
                   ,:DCLVTRNFR.CICS-TERM-ID-CD                                  
                   ,:DCLVTRNFR.PRGM-NM                                          
                   ,:DCLVTRNFR.CRT-TMSTP                                        
                   ,:DCLVTRNFR.UPDT-TMSTP                                       
                   ,:DCLVTRNFR.ACCT-EQUITY-AMT                                  
LRM005             ,:DCLVTRNFR.ACCT-RB-SEC-IND                                  
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 4000-LOAD     THRU 4000-EXIT                     
                  WHEN +100                                                     
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' VTRNFR CURSOR FETCH NOT FOUND '                 
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                  WHEN OTHER                                                    
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' VTRNFR CURSOR FETCH ERROR '                     
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE VTRNFR_CURSOR                                             
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF  SQLCODE NOT = +0                                                 
               DISPLAY 'INP= ' W-INFILE-CNT                                     
                      ' VTRNFR CURSOR CLOSE ERROR '                             
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  FOR FULL TRANSFER REQUEST TO DELIVER                                   
      *  GET BALANCES AND POSITIONS AND LOAD TO THE INIT ASSET TABLES           
      *  FLAG ANY ERROR AND UPDATE THE TRANFER TABLE                            
      *  IF AUTO-REJECT, UPDATE/ADD TO THE INIT TRANSFER TABLE                  
      ******************************************************************        
       4000-LOAD                SECTION.                                        
           MOVE '4000-LOAD            ' TO W-ROUTINE-1.                         
                                                                                
      *****IF  L-TEST                                                           
      *****02/02/99 DO NOT PROCESS NEXT DAY'S TRANSFERS IF RUNNING LATE.        
               IF  PRCS-DT OF DCLVTRNFR > W-PROC-DT                             
                   GO TO 4000-EXIT                                              
               END-IF                                                           
      *****END-IF                                                               
                                                                                
           MOVE ' ' TO W-REJECT-AUTO-SW                                         
           MOVE ' ' TO W-REJECT-SWITCHES                                        
           MOVE ' ' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                           
DJ0014     MOVE ' ' TO W-MEMO-ONLY-SW                                           
DJ0014     MOVE 0   TO W-NOT-MEMO-CNT                                           
DJ0014     MOVE 0   TO W-IS-MEMO-CNT                                            
LRM034     MOVE 'N' TO WK-NTWRK-LVL4-IND                                        
                                                                                
           MOVE CLIENT-NBR        OF DCLVTRNFR                                  
                                             TO  WF-CLIENT-NBR                  
           MOVE ACAT-CONTROL-NBR  OF DCLVTRNFR                                  
                                             TO  WF-ACAT-CONTROL-NBR            
           MOVE SBMTG-PRTCP-NBR   OF DCLVTRNFR                                  
                                             TO  WF-SBMTG-PRTCP-NBR             
           MOVE DLVR-NBR          OF DCLVTRNFR                                  
                                             TO  WF-DLVR-NBR                    
           MOVE ACCT-DLVR-NBR     OF DCLVTRNFR                                  
                                             TO  WF-ACCT-DLVR-NBR               
           MOVE RCV-NBR           OF DCLVTRNFR                                  
                                             TO  WF-RCV-NBR                     
           MOVE ACCT-RCV-NBR      OF DCLVTRNFR                                  
                                             TO  WF-ACCT-RCV-NBR                
           MOVE TRNFR-TYPE-CD     OF DCLVTRNFR                                  
                                             TO  WF-TRNFR-TYPE-CD               
           MOVE TRANS-TYPE-CD     OF DCLVTRNFR                                  
                                             TO  WF-TRANS-TYPE-CD               
           MOVE PRCS-DT           OF DCLVTRNFR                                  
                                             TO  WF-PRCS-DT                     
           MOVE STTS-CD           OF DCLVTRNFR                                  
                                             TO  WF-STTS-CD                     
           MOVE NSCC-PEND-CD      OF DCLVTRNFR                                  
                                             TO  WF-NSCC-PEND-CD                
                                                                                
           MOVE TRANS-RFRN-ID-CD  OF DCLVTRNFR                                  
                                             TO  WF-TRANS-RFRN-ID-CD            
                                                                                
           MOVE DSTBN-SIDE-CD     OF DCLVTRNFR                                  
                                             TO  WF-DSTBN-SIDE-CD               
           MOVE ACCT-EQUITY-AMT   OF DCLVTRNFR                                  
                                             TO  WF-ACCT-EQUITY-AMT             
DJ0007     MOVE WF-ACCT-DLVR-NBR(1:8)    TO WF-BRANCH-ACCT                      
                                                                                
      ***BYPASS REJECTED  TRANSFERS                                             
           PERFORM 6920-SELECT-ACTITRF THRU 6920-EXIT                           
           IF  W-ACTITRF-FND-SW = 'Y'                                           
               DISPLAY '   ACTITRF FOUND '                                      
                       ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF                
                       ' PEND=' NSCC-PEND-CD       OF DCLACTITRF                
                       ' PRGM=' PRGM-NM            OF DCLACTITRF                
                       ' UPDT=' UPDT-TMSTP         OF DCLACTITRF                
                       ' BYPASSED REJECT'                                       
               IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF = '  ' OR '00'              
                   CONTINUE                                                     
               ELSE                                                             
DJ0015           IF  (BH-ACAT-ASCENDIS-USER = '1' OR '2')                       
DJ0013           AND (TRNFR-TYPE-RJCT-CD OF DCLACTITRF NOT = '05')              
DJ0013                DISPLAY '   FOR ASCENDIS REJECTS,'                        
DJ0013                   ' EXCEPT FOR "05" (INVALID ACCOUNT NUMBER),'           
DJ0013                   ' LOAD BYPASSED HOLDERS RECORDS.'                      
DJ0013           ELSE                                                           
                       GO TO 4000-EXIT                                          
DJ0013           END-IF                                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
           MOVE 'H'             TO W-BH-NSCC-PEND-CD                            
                                                                                
      ***AUTO-SUBMIT IF REQUEST-PAST.                                           
           IF  STTS-CD OF DCLVTRNFR =  '120' OR '130'                           
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' AUTO-SUBMIT.'                                       
                          ' STA=' WF-STTS-CD                                    
                          ' DAYS=' DAYS-STTS-QTY OF DCLVTRNFR                   
                          ' PD=' WF-PRCS-DT                                     
                   ADD 1 TO W-AUTO-SUBMIT-CNT                                   
DJ0011*************MOVE ' '    TO W-BH-NSCC-PEND-CD                             
DJ0011*************PERFORM 6650-SUBMIT-ASSETS THRU 6650-EXIT                    
                   ADD W-SQL-UPDATE-COUNT TO W-AST-AUTO-COUNT                   
                   IF  W-SQL-UPDATE-COUNT > 0                                   
                       GO TO 4000-COMMIT                                        
                                                                                
                   ELSE                                                         
      ***------------(IF COUNT IS 0, TRY RELOADING AND SUBMITTING)              
DJ0011*************    MOVE ' '           TO W-BH-NSCC-PEND-CD                  
                       GO TO 4000-CONTINUE                                      
                   END-IF                                                       
           END-IF.                                                              
                                                                                
                                                                                
           IF  STTS-CD OF DCLVTRNFR =  '100' OR '110'                           
            IF (DAYS-STTS-QTY OF DCLVTRNFR = 1)                                 
                CONTINUE                                                        
            ELSE                                                                
                                                                                
      ***WHEN DAYS-IN-STATUS > 1, ASSETS SHOULD ALREADY BE LOADED               
      ***WHEN DAYS-IN-STATUS = B1-DAYS, SET NSCC-PEND TO ' ' TO SUBMIT          
               IF  W-BH-DAYS-STTS-QTY > 0                                       
               AND DAYS-STTS-QTY OF DCLVTRNFR >= W-BH-DAYS-STTS-QTY             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' SUBMIT.'                                            
                          ' DAYS(' DAYS-STTS-QTY OF DCLVTRNFR ')'               
                          '>=B1(' W-BH-DAYS-STTS-QTY ') '                       
                          ' STA=' WF-STTS-CD                                    
                          ' PD=' WF-PRCS-DT                                     
                   ADD 1 TO W-SUBMIT-ONLY-CNT                                   
DJ0011*************MOVE ' '    TO W-BH-NSCC-PEND-CD                             
DJ0011*************PERFORM 6650-SUBMIT-ASSETS THRU 6650-EXIT                    
LRM011*************ADD W-SQL-UPDATE-COUNT TO W-AST-SUBMIT-COUNT                 
LRM011*************IF  W-SQL-UPDATE-COUNT > 0                                   
                       GO TO 4000-COMMIT                                        
                                                                                
LRM011*************ELSE                                                         
      ***------------(IF COUNT IS 0, TRY RELOADING AND SUBMITTING)              
DJ0011*************    MOVE ' '           TO W-BH-NSCC-PEND-CD                  
LRM011*************    GO TO 4000-CONTINUE                                      
LRM011*************END-IF                                                       
               ELSE                                                             
                   GO TO 4000-EXIT                                              
               END-IF                                                           
            END-IF                                                              
           END-IF.                                                              
                                                                                
      ***ON DAY 1 OF REQ/REQ-ADJ, LOAD ASSETS                                   
      ***WHEN DAYS-IN-STATUS = B1-DAYS, SET NSCC-PEND TO ' ' TO SUBMIT          
           IF  W-BH-DAYS-STTS-QTY > 0                                           
           AND DAYS-STTS-QTY OF DCLVTRNFR = W-BH-DAYS-STTS-QTY                  
DJ0011*****    MOVE ' '             TO W-BH-NSCC-PEND-CD                        
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' LOAD AND SUBMIT.'                                   
                          ' DAYS(' DAYS-STTS-QTY OF DCLVTRNFR ')'               
                          '=B1(' W-BH-DAYS-STTS-QTY ') '                        
                          ' STA=' WF-STTS-CD                                    
                          ' PD=' WF-PRCS-DT                                     
                   ADD 1 TO W-LOAD-AND-SUBMIT-CNT                               
           ELSE                                                                 
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' LOAD ONLY.'                                         
                          ' DAYS(' DAYS-STTS-QTY OF DCLVTRNFR ')'               
                          '<>B1(' W-BH-DAYS-STTS-QTY ') '                       
                          ' STA=' WF-STTS-CD                                    
                          ' PD=' WF-PRCS-DT                                     
                   ADD 1 TO W-LOAD-ONLY-CNT                                     
           END-IF.                                                              
                                                                                
       4000-CONTINUE.                                                           
                                                                                
           ADD 1 TO W-LOAD-CNT.                                                 
                                                                                
           PERFORM 5000-GET-BALANCES  THRU 5000-EXIT.                           
                                                                                
           PERFORM 5100-GET-POSITIONS THRU 5100-EXIT.                           
                                                                                
           PERFORM 5300-LOAD-BALANCES THRU 5300-EXIT.                           
                                                                                
LRM044     PERFORM 5010-GET-FCURR-BALS THRU 5010-EXIT.                          
                                                                                
           IF  W-ASSET-ADDED-FOR-THIS-ACCT-SW = 'Y'                             
DJ0009         IF  GETNA-RETURN-FOUND                                           
DJ0009         AND NAPPA-90-DAY-RES = '1'                                       
DJ0009           IF  NAPPA-DATE-90DAY-ENDED NUMERIC                             
DJ0009           AND NAPPA-DATE-90DAY-ENDED > W-TODAY-DATE                      
DJ0009               PERFORM 5732-FORMAT-90DR THRU 5732-EXIT                    
DJ0009               PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                 
DJ0009           END-IF                                                         
DJ0009         END-IF                                                           
               PERFORM 7100-WRITE-ACATDLVF-TYPE3 THRU 7100-EXIT                 
           END-IF.                                                              
                                                                                
DJ0014***REJECT IF THERE IS ONLY MEMO ASSETS.                                   
DJ0014***COMMENT SHOULD BE: "MEMO ONLY - RESTRICTED ASSET".                     
DJ0014     IF  W-NOT-MEMO-CNT     = 0                                           
DJ0014     AND W-IS-MEMO-CNT  NOT = 0                                           
DJ0014         MOVE 'Y' TO W-MEMO-ONLY-SW                                       
DJ0014         MOVE 'Y' TO W-REJ-FLAT                                           
DJ0015         DISPLAY '   W-NOT-MEMO-CNT= ' W-NOT-MEMO-CNT                     
DJ0015                 '   W-IS-MEMO-CNT=  ' W-IS-MEMO-CNT                      
DJ0014     END-IF.                                                              
                                                                                
LRM051     IF  (BH-ACAT-ASCENDIS-USER = '1' OR '2')                             
LRM051     AND W-ASSET-ADDED-FOR-THIS-ACCT-SW NOT = 'Y'                         
LRM051         MOVE 'Y' TO W-REJ-FLAT                                           
LRM051     END-IF.                                                              
                                                                                
           PERFORM 6800-UPDATE-VTRNFR   THRU 6800-EXIT                          
                                                                                
      ***IF AUTO-REJECT, ADD ACTITRF AND DO NOT SEND ASSETS(HOLD)               
ET0006     IF W-ASSET-ADDED-FOR-THIS-ACCT-SW NOT = 'Y'                          
ET0006        MOVE WF-CLIENT-NBR (2:3) TO WS-FROM-CLT                           
ET0006        MOVE WF-BRANCH-CD        TO WS-FROM-BR                            
ET0006        MOVE WF-ACCT-CD          TO WS-FROM-ACCT                          
ET0006        MOVE SPACE TO WS-INTERNALY-TRANSFERED-IND                         
ET0006        PERFORM 4100-CHECK-INTERNAL-TRANSFER                              
ET0006               UNTIL WS-INTERNALY-TRANSFERED-IND > SPACE                  
ET0006        IF  WS-INTERNALY-TRANSFERED-IND = 'Y'                             
ET0006            PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT                    
ET0006     END-IF.                                                              
ET0006                                                                          
ET0006     IF  WS-INTERNALY-TRANSFERED-IND NOT = 'Y'                            
           IF  W-REJECT-SWITCHES > ' '                                          
               IF  W-REJECT-AUTO-SW = 'Y'                                       
                   PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT                   
                   IF W-ASSET-ADDED-FOR-THIS-ACCT-SW = 'Y'                      
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                          ' ERROR FOUND. WILL NOT SUBMIT'                       
                      MOVE 'H'    TO W-BH-NSCC-PEND-CD                          
                      PERFORM 6600-UPDATE-NSCC-PEND-CD THRU 6600-EXIT           
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
DJTEST     DISPLAY 'TEST W-ASSET-ADDED-FOR-THIS-ACCT-SW = '                     
DJTEST                   W-ASSET-ADDED-FOR-THIS-ACCT-SW                         
DJTEST                '  W-REJ-FLAT = ' W-REJ-FLAT.                             
                                                                                
       4000-COMMIT.                                                             
                                                                                
           PERFORM 8100-SQL-COMMIT THRU 8100-EXIT.                              
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
ET0006*****************************************************************         
ET0006*  (1) THERE ARE NO REJECTS FOR FLAT ON NIGHT1. CHECK IF THE              
ET0006*      ACCOUNT IS TRANSFERED INTERNALLY BY CHECKING NACT FILE             
ET0006*      (N&A INTERNAL ACCOUNT TRANSFER FILE) WHICH CONTAINS                
ET0006*      ACCOUNT NUMBERS OF 'TRANSFERED FROM' AND 'TRANSFERED TO'.          
ET0006*  (2) IF 'TRANSFERED TO' ACCOUNT IS FOUND IN NACT FILE, PERFORM          
ET0006*      5000-GET-BALANCES & 5100-GET-POSITIONS AGAIN TO SEE IF             
ET0006*      'TRANSFERED TO' ACCT IS FLAT.                                      
ET0006*  (3) IF 'TRANSFERED TO' ACCOUNT IS FLAT, GO BACK TO (1)                 
ET0006*      TO SEE IF 'TRANSFERED TO' ACCOUNT IS RE-TRANSFERED.                
ET0006*****************************************************************         
ET0006 4100-CHECK-INTERNAL-TRANSFER.                                            
ET0006     SET WS-INTNL-TRNFR-MODE TO TRUE.                                     
ET0006                                                                          
ET0006     MOVE  SPACES               TO  INTERNAL-TRANSFER-PARM.               
ET0006     MOVE  WS-FROM-ACCOUNT      TO  INTNL-FROM-ACCOUNT.                   
ET0006     CALL  CATNACT           USING  INTERNAL-TRANSFER-PARM.               
ET0006                                                                          
ET0006     IF INTNL-ACCT-NOT-FND                                                
ET0006        MOVE 'N' TO WS-INTERNALY-TRANSFERED-IND                           
ET0006     ELSE                                                                 
ET0006     IF INTNL-ACCT-FND                                                    
ET0006        MOVE INTNL-TO-BR       TO  WF-BRANCH-CD                           
ET0006        MOVE INTNL-TO-ACCT     TO  WF-ACCT-CD                             
ET0006        MOVE SPACE TO WS-BALANCE-FOUND-SW                                 
ET0006        PERFORM 5000-GET-BALANCES THRU 5000-EXIT                          
ET0006        IF WS-BALANCE-FOUND                                               
ET0006           MOVE 'Y' TO WS-INTERNALY-TRANSFERED-IND                        
ET0006        ELSE                                                              
ET0006           MOVE SPACE TO WS-POSITION-FOUND-SW                             
ET0006           PERFORM 5100-GET-POSITIONS THRU 5100-EXIT                      
ET0006           IF WS-POSITION-FOUND                                           
ET0006              MOVE 'Y' TO WS-INTERNALY-TRANSFERED-IND                     
ET0006           ELSE                                                           
ET0006              PERFORM 5300-LOAD-BALANCES THRU 5300-EXIT                   
ET0006              IF WS-TYPE1-BALANCE-FOUND                                   
ET0006                 MOVE 'Y' TO WS-INTERNALY-TRANSFERED-IND                  
ET0006              ELSE                                                        
ET0006                 MOVE INTNL-TO-ACCOUNT  TO  WS-FROM-ACCOUNT               
ET0006              END-IF                                                      
ET0006           END-IF                                                         
ET0006        END-IF                                                            
ET0006     END-IF.                                                              
ET0006                                                                          
ET0006     MOVE SPACE   TO WS-INTNL-TRNFR-MODE-SW.                              
ET0006 4100-EXIT. EXIT.                                                         
ET0006/                                                                         
       5000-GET-BALANCES   SECTION.                                             
      *****************************************************************         
      *  GET BALANCES                                                           
      *      TYPES 1, 3 = CASH                                                  
      *      TYPES 2    = MARGIN                                                
      *      TYPES 5    = SHORT                                                 
      *      SMA        = SMA                                                   
      *****************************************************************         
           MOVE '5000-GET-BALANCES             ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO W-BAL-FND-SW                              
           MOVE ZEROES             TO W-BAL-TYPE1                               
                                      W-BAL-TYPE2                               
                                      W-BAL-TYPE3                               
                                      W-BAL-TYPE5                               
                                      W-BAL-SMA                                 
LRM033                                W-BAL-PEND-DVND                           
                                      W-BAL-REGT                                
                                      W-BAL-MMKT                                
                                      W-BAL-TOTAL-MARKET-VALUE                  
                                      W-BAL-TOTL-LIQDATNG-EQUITY                
ET0001                                W-BAL-PENDING-AMOUNT                      
           MOVE SPACES                      TO W-BAL-KEY                        
           MOVE W-CURRENT-CLIENT-N          TO W-BAL-CLT                        
           MOVE WF-BRANCH-CD                TO W-BAL-BR                         
           MOVE WF-ACCT-CD                  TO W-BAL-ACCT                       
           MOVE '28'                        TO W-BAL-REC-TYPE                   
           MOVE '000000'                    TO W-BAL-CUR                        
           MOVE W-BAL-KEY                   TO CMBL-KEY                         
ET0005***  MOVE  LOW-VALUES                TO  GETVBAL-PARM.                    
ET0005     MOVE  'CAT810  '                TO  GETVBAL-CALLING-PROGRAM.         
ET0005     MOVE  'O'  TO GETVBAL-FILE                                           
ET0005     MOVE  'R'  TO GETVBAL-FUNC                                           
ET0005     MOVE W-CURRENT-CLIENT-N         TO  GETVBAL-OLD-CLIENT.              
ET0005     MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
ET0005     MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
ET0005     MOVE ZEROES                     TO  GETVBAL-OLD-CUR-CODE.            
ET0005     SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
ET0005     PERFORM CALL-GETVBAL                                                 
                                                                                
           IF BALNC-OKAY                                                        
              CONTINUE                                                          
           ELSE                                                                 
             IF BALNC-END-OF-FILE                                               
             OR BALNC-NOT-FOUND                                                 
                GO TO 5000-EXIT                                                 
             ELSE                                                               
ET0005          DISPLAY ' ** CAT810  CALL GETVBAL PROBLEM'                      
                        ' FILE-STATUS = ' BALNC-STATUS                          
                DISPLAY 'W-BAL-KEY = ' W-BAL-CLT                                
                                   ' ' W-BAL-BR                                 
                                   ' ' W-BAL-ACCT                               
                MOVE +3101    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
           ADD 1 TO W-BAL-CNT                                                   
                                                                                
           IF  CMBL-KEY NOT = W-BAL-KEY                                         
               DISPLAY '   '                                                    
                        'BAL NOTFND FOR '                                       
                                       W-BAL-CLT                                
                                   ' ' W-BAL-BR                                 
                                   ' ' W-BAL-ACCT                               
                                   ' ' W-BAL-REC-TYPE                           
                                   ' ' W-BAL-CUR                                
               GO TO 5000-EXIT                                                  
           ELSE                                                                 
               CONTINUE                                                         
           END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-BAL-FND-SW                                             
                                                                                
           IF CMBL-ACTYP1-PRESENT = 1                                           
              MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE1                
           END-IF.                                                              
           IF CMBL-ACTYP2-PRESENT = 1                                           
              MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE2                
           END-IF.                                                              
           IF CMBL-ACTYP3-PRESENT = 1                                           
              MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE3                
           END-IF.                                                              
           IF CMBL-ACTYP5-PRESENT = 1                                           
              MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE5                
           END-IF.                                                              
           IF CMBL-TOTAL-SMA < 0                                                
              MOVE CMBL-TOTAL-SMA                 TO W-BAL-SMA                  
           END-IF.                                                              
           IF CMBL-TOTAL-BYINGPWR > 0                                           
              MOVE CMBL-TOTAL-BYINGPWR            TO W-BAL-REGT                 
           END-IF.                                                              
ET0006                                                                          
ET0006     IF WS-INTNL-TRNFR-MODE                                               
ET0006          IF  (W-BAL-TYPE2 = ZERO)                                        
ET0006          AND (W-BAL-TYPE3 = ZERO)                                        
ET0006          AND (W-BAL-TYPE5 = ZERO)                                        
ET0006                  GO TO 5000-EXIT                                         
ET0006          ELSE                                                            
ET0006                  SET WS-BALANCE-FOUND TO TRUE                            
ET0006                  GO TO 5000-EXIT                                         
ET0006          END-IF                                                          
ET0006     END-IF.                                                              
ET0006                                                                          
           MOVE CMBL-TOTAL-MARKET-VALUE   TO W-BAL-TOTAL-MARKET-VALUE           
           MOVE CMBL-TOTL-LIQDATNG-EQUITY TO W-BAL-TOTL-LIQDATNG-EQUITY         
ET0001     MOVE CMBL-PENDING-AMOUNT       TO W-BAL-PENDING-AMOUNT               
                                                                                
           MOVE W-BAL-TYPE1  TO W-BAL-TYPE1-DISPLAY                             
           MOVE W-BAL-TYPE2  TO W-BAL-TYPE2-DISPLAY                             
           MOVE W-BAL-TYPE3  TO W-BAL-TYPE3-DISPLAY                             
           MOVE W-BAL-TYPE5  TO W-BAL-TYPE5-DISPLAY                             
           MOVE W-BAL-SMA    TO W-BAL-SMA-DISPLAY                               
                                                                                
           DISPLAY          '   BAL ' CMBL-COMPANY-CODE                         
                                  ' ' CMBL-OFFICE-CODE                          
                                  ' ' CMBL-ACCOUNT-NUMBER                       
                                  ' ' CMBL-RECORD-TYPE                          
                                  ' ' CMBL-CURR-TYPE (4:3)                      
                               ' T1=' W-BAL-TYPE1-DISPLAY                       
                               ' T2=' W-BAL-TYPE2-DISPLAY                       
                               ' T3=' W-BAL-TYPE3-DISPLAY                       
                               ' T5=' W-BAL-TYPE5-DISPLAY                       
                              ' SMA=' W-BAL-SMA-DISPLAY                         
                              ' FED=' W-BAL-REGT-DISPLAY                        
                                                                                
           IF  BH-ACAT-REJ-DEL-MARGIN-DEBIT > 0                                 
               IF  W-BAL-TYPE2 NOT < BH-ACAT-REJ-DEL-MARGIN-DEBIT               
                   MOVE 'Y' TO W-REJ-MARGIN-DEBIT                               
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  BH-ACAT-REJ-DEL-ASSET-VALUE  > 0                                 
               IF  W-BAL-TOTAL-MARKET-VALUE                                     
                                      NOT < BH-ACAT-REJ-DEL-ASSET-VALUE         
                   MOVE 'Y' TO W-REJ-ASSET-VALUE                                
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  BH-ACAT-REJ-DEL-TOTL-ACT-VAL > 0                                 
               IF  W-BAL-TOTL-LIQDATNG-EQUITY                                   
                                     NOT < BH-ACAT-REJ-DEL-TOTL-ACT-VAL         
                   MOVE 'Y' TO W-REJ-TOTL-ACT-VAL                               
               END-IF                                                           
           END-IF                                                               
           .                                                                    
       5000-EXIT. EXIT.                                                         
      /                                                                         
LRM044 5010-GET-FCURR-BALS SECTION.                                             
LRM044     MOVE SPACES                      TO W-BAL-KEY                        
LRM044     MOVE W-CURRENT-CLIENT-N          TO W-BAL-CLT                        
LRM044     MOVE WF-BRANCH-CD                TO W-BAL-BR                         
LRM044     MOVE WF-ACCT-CD                  TO W-BAL-ACCT                       
LRM044     MOVE '28'                        TO W-BAL-REC-TYPE                   
LRM044     MOVE '000001'                    TO W-BAL-CUR                        
LRM044     MOVE W-BAL-KEY                   TO CMBL-KEY                         
LRM044                                                                          
LRM044     MOVE  'CAT810  '                TO  GETVBAL-CALLING-PROGRAM.         
LRM044     MOVE  'O'                       TO  GETVBAL-FILE.                    
LRM044     MOVE  'N'                       TO  GETVBAL-FUNC.                    
LRM044     MOVE W-CURRENT-CLIENT-N         TO  GETVBAL-OLD-CLIENT.              
LRM044     MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
LRM044     MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
LRM044     MOVE W-BAL-CUR                  TO  GETVBAL-OLD-CUR-CODE.            
LRM044 5010-LOOP.                                                               
LRM044     SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
LRM044     PERFORM CALL-GETVBAL                                                 
LRM044                                                                          
LRM044     IF BALNC-OKAY                                                        
LRM044        CONTINUE                                                          
LRM044     ELSE                                                                 
LRM044       IF BALNC-END-OF-FILE                                               
LRM044       OR BALNC-NOT-FOUND                                                 
LRM044          GO TO 5010-EXIT                                                 
LRM044       ELSE                                                               
LRM044          DISPLAY ' ** CAT810  CALL GETVBAL PROBLEM IN 5010-'             
TEST                    ' FILE-STATUS = ' BALNC-STATUS                          
LRM044          DISPLAY 'W-BAL-KEY = ' W-BAL-CLT                                
LRM044                             ' ' W-BAL-BR                                 
LRM044                             ' ' W-BAL-ACCT                               
LRM044          MOVE +3999    TO ABEND-CODE                                     
LRM044          CALL ABEND USING ABEND-CODE                                     
LRM044       END-IF                                                             
LRM044     END-IF.                                                              
LRM044                                                                          
LRM044     ADD 1 TO W-BAL-CNT                                                   
LRM044     IF  CMBL-KEY-CO-BR-ACCT NOT = W-BAL-KEY-A                            
LRM044     OR (CMBL-CURR-TYPE = '000998' OR '000999')                           
LRM044         DISPLAY '   '                                                    
LRM044                  'NEXT FCUR BAL NOTFND FOR KEY '                         
LRM044                        W-BAL-KEY-A                                       
LRM044         DISPLAY '   '                                                    
LRM044                  'GETVBAL READ CUBAL OLD KEY   '                         
LRM044                        CMBL-KEY-CO-BR-ACCT                               
LRM044         DISPLAY '   '                                                    
LRM044                  'BAL FCUR NEXT REC =  '                                 
LRM044                                CMBL-COMPANY-CODE                         
LRM044                            ' ' CMBL-OFFICE-CODE                          
LRM044                            ' ' CMBL-ACCOUNT-NUMBER                       
LRM044                            ' ' CMBL-RECORD-TYPE                          
LRM044                            ' ' CMBL-CURR-TYPE (4:3)                      
LRM044         GO TO 5010-EXIT                                                  
LRM044     ELSE                                                                 
LRM044         CONTINUE                                                         
LRM044     END-IF.                                                              
LRM047     IF CMBL-CURR-TYPE = '000254'                                         
LRM047        GO TO 5010-LOOP                                                   
LRM047     END-IF.                                                              
LRM044                                                                          
LRM044     MOVE ZEROES             TO W-BAL-TYPE1                               
LRM044                                W-BAL-TYPE2                               
LRM044                                W-BAL-TYPE3                               
LRM044                                W-BAL-TYPE5                               
LRM044                                                                          
LRM044     IF CMBL-ACTYP1-PRESENT = 1                                           
LRM044        MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE1                
LRM044                          W-BAL-TYPE1-DISPLAY                             
LRM044     END-IF.                                                              
LRM044     IF CMBL-ACTYP2-PRESENT = 1                                           
LRM044        MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE2                
LRM044                          W-BAL-TYPE2-DISPLAY                             
LRM044     END-IF.                                                              
LRM044     IF CMBL-ACTYP3-PRESENT = 1                                           
LRM044        MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE3                
LRM044                          W-BAL-TYPE3-DISPLAY                             
LRM044     END-IF.                                                              
LRM044     IF CMBL-ACTYP5-PRESENT = 1                                           
LRM044        MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE5                
LRM044                          W-BAL-TYPE5-DISPLAY                             
LRM044     END-IF.                                                              
LRM044     DISPLAY          '   BAL ' CMBL-COMPANY-CODE                         
LRM044                            ' ' CMBL-OFFICE-CODE                          
LRM044                            ' ' CMBL-ACCOUNT-NUMBER                       
LRM044                            ' ' CMBL-RECORD-TYPE                          
LRM044                         ' CURRENCY=' CMBL-CURR-TYPE (4:3)                
LRM044                         ' T1=' W-BAL-TYPE1-DISPLAY                       
LRM044                         ' T2=' W-BAL-TYPE2-DISPLAY                       
LRM044                         ' T3=' W-BAL-TYPE3-DISPLAY                       
LRM044                         ' T5=' W-BAL-TYPE5-DISPLAY                       
LRM044                                                                          
LRM044     MOVE SPACES TO CURLOOK-DATA                                          
LRM044     MOVE CMBL-CURRENCY-CODE-9  TO CU-ARGUMENT                            
LRM044     MOVE 'DTC CODE REQUESTED' TO CU-DTC-CD                               
LRM044     CALL CURLOOK USING CURLOOK-DATA                                      
LRM044     IF CU-RETURN NOT = SPACE                                             
LRM044        DISPLAY 'UNKNOWN ISO CURRENCY IN 5010- BALANCE SKIPPED '          
LRM044            'FO CURRENCY ' CMBL-CURRENCY-CODE(4:3)                        
LRM044        GO TO 5010-LOOP                                                   
LRM044     END-IF.                                                              
LRM044                                                                          
LRM044     SET FOREIGN-FEE-NOT-APPLY TO TRUE                                    
LRM044     IF  BH-ACAT-TYPE-3-BALANCES = '1'                                    
LRM044         COMPUTE W-WORK-BAL =  W-BAL-TYPE1 + W-BAL-TYPE3                  
LRM044     ELSE                                                                 
LRM044         COMPUTE W-WORK-BAL =  W-BAL-TYPE1                                
LRM044     END-IF.                                                              
LRM044                                                                          
LRM044     MOVE W-WORK-BAL         TO W-WORK-BAL-UNSIGN                         
LRM044     IF  W-WORK-BAL-UNSIGN NOT = 0                                        
LRM044         MOVE 'C'            TO W-CSH-MGN-SHT                             
LRM044         MOVE SPACES         TO W-CASH-SMA                                
LRM044         MOVE 'FC'           TO WF-STTLM-LCTN-CD                          
LRM044         PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
LRM044         MOVE CMBL-CURRENCY-CODE-9                                        
LRM044                             TO ASSET-SEQ-NBR   OF DCLACTIAST             
LRM044         MOVE CU-DTC-CUR-CD  TO ISO-CRNCY-CD    OF DCLACTIAST             
LRM044         MOVE CU-NAME        TO ASSET-DESC-TXT OF DCLACTIAST              
LRM044         MOVE 'XXFCUR' TO  ISIN-SEC-ISSUE-CD OF DCLACTIAST (1:6)          
LRM044         MOVE CMBL-CURRENCY-CODE(4:3) TO CRNCY-CD OF DCLACTIAST           
LRM044                           ISIN-SEC-ISSUE-CD OF DCLACTIAST (7:3)          
LRM044         IF W-WORK-BAL < ZERO                                             
LRM044            MOVE 'L' TO  PSTN-CD OF DCLACTIAST                            
LRM044         ELSE                                                             
LRM044            MOVE 'S' TO  PSTN-CD OF DCLACTIAST                            
LRM044         END-IF                                                           
LRM044         PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
LRM044     END-IF                                                               
LRM044                                                                          
LRM044     COMPUTE W-WORK-BAL =  W-BAL-TYPE2                                    
LRM044     MOVE W-WORK-BAL         TO W-WORK-BAL-UNSIGN                         
LRM044     IF  W-WORK-BAL-UNSIGN NOT = 0                                        
LRM044         MOVE 'M'            TO W-CSH-MGN-SHT                             
LRM044         MOVE SPACES         TO W-CASH-SMA                                
LRM044         MOVE 'FC'           TO WF-STTLM-LCTN-CD                          
LRM044         PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
LRM044         MOVE CMBL-CURRENCY-CODE-9                                        
LRM044                             TO ASSET-SEQ-NBR   OF DCLACTIAST             
LRM044         MOVE CU-DTC-CUR-CD  TO ISO-CRNCY-CD    OF DCLACTIAST             
LRM044         MOVE CU-NAME        TO ASSET-DESC-TXT OF DCLACTIAST              
LRM044         MOVE CMBL-CURRENCY-CODE(4:3) TO CRNCY-CD OF DCLACTIAST           
LRM044         IF W-WORK-BAL < ZERO                                             
LRM044            MOVE 'L' TO  PSTN-CD OF DCLACTIAST                            
LRM044         ELSE                                                             
LRM044            MOVE 'S' TO  PSTN-CD OF DCLACTIAST                            
LRM044         END-IF                                                           
LRM044         PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
LRM044     END-IF                                                               
LRM044                                                                          
LRM044     COMPUTE W-WORK-BAL =  W-BAL-TYPE5                                    
LRM044     MOVE W-WORK-BAL         TO W-WORK-BAL-UNSIGN                         
LRM044     IF  W-WORK-BAL-UNSIGN NOT = 0                                        
LRM044         MOVE 'S'            TO W-CSH-MGN-SHT                             
LRM044         MOVE SPACES         TO W-CASH-SMA                                
LRM044         MOVE 'FC'           TO WF-STTLM-LCTN-CD                          
LRM044         PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
LRM044         MOVE CMBL-CURRENCY-CODE-9                                        
LRM044                             TO ASSET-SEQ-NBR   OF DCLACTIAST             
LRM044         MOVE CU-DTC-CUR-CD  TO ISO-CRNCY-CD    OF DCLACTIAST             
LRM044         MOVE CU-NAME        TO ASSET-DESC-TXT OF DCLACTIAST              
LRM044         MOVE CMBL-CURRENCY-CODE(4:3) TO CRNCY-CD OF DCLACTIAST           
LRM044         IF W-WORK-BAL < ZERO                                             
LRM044            MOVE 'L' TO  PSTN-CD OF DCLACTIAST                            
LRM044         ELSE                                                             
LRM044            MOVE 'S' TO  PSTN-CD OF DCLACTIAST                            
LRM044         END-IF                                                           
LRM044         PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
LRM044     END-IF.                                                              
LRM044     MOVE SPACES         TO WF-STTLM-LCTN-CD                              
LRM044     GO TO 5010-LOOP                                                      
LRM044     .                                                                    
LRM044 5010-EXIT. EXIT.                                                         
      /                                                                         
       5100-GET-POSITIONS  SECTION.                                             
      *****************************************************************         
      *  GET POSITIONS                                                          
      *  SELECT ONLY TYPES 1(CASH), 2(MARGIN), 5(SHORT)                         
      *  BYPASS IRA, ANNUITY, SPAD, MONEY MARKET FUND SECURITIES.               
LRM053*  BYPASS OPEN ORDERS - CUSHOL DEFINED                                    
      *  BYPASS ZERO QTY RECORD                                                 
      *****************************************************************         
           MOVE '5100-GET-POSITIONS            ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                         TO W-POS-FND-SW                     
           MOVE LOW-VALUES             TO W-CUSHOL-KEY                          
           MOVE W-CURRENT-CLIENT(2:3)  TO W-CUSHOL-CLIENT                       
           MOVE WF-BRANCH-CD           TO W-CUSHOL-BRANCH                       
           MOVE WF-ACCT-CD             TO W-CUSHOL-ACCOUNT                      
           MOVE ZEROS                  TO W-CUSHOL-FRGN-CURR-CODE               
DJ0007     MOVE ' '                    TO W-CKDIGIT-ACCT-TC                     
DJ0007                                    W-CKDIGIT-ACCT-TC-1                   
LRM053     MOVE W-CUSHOL-KEY           TO GETVHOL-KEY                           
ET0005     MOVE SPACES                 TO GETVHOL-RETURN-PARAMETERS.            
ET0005                                                                          
ET0005     MOVE 'N'                    TO GETVHOL-FILE.                         
TEST       DISPLAY 'ABOUT TO CALL CUSHOL WITH KEY ' GETVHOL-KEY                 
ET0005                                                                          
ET0005**---DO A SKIP SEQUENTIAL READ TO GET RECORDS FOR THAT ACCOUNT.           
ET0005     MOVE 'S'                    TO GETVHOL-FUNC.                         
ET0005     MOVE SPACES                 TO GETVHOL-PREV-KEY.                     
ET0005                                                                          
       5100-READ-POS-NEXT.                                                      
ET0005**---DO READNEXT FOR NEXT RECORD FOR THAT ACCOUNT.                        
ET0005                                                                          
ET0005     PERFORM CALL-GETVHOL.                                                
ET0005                                                                          
ET0005     IF GETVHOL-END-OF-FILE                                               
                GO TO 5100-EXIT                                                 
ET0005     END-IF.                                                              
ET0005                                                                          
ET0005     IF NOT GETVHOL-SUCCESSFUL                                            
ET0005         DISPLAY 'CAT810: CUSHOLV VSAM FILE, READ ERROR'                  
ET0005         DISPLAY 'CAT810: GETVHOL-RETURN-CODE = '                         
ET0005                         GETVHOL-RETURN-CODE                              
ET0005         DISPLAY 'CAT810: GETVHOL-FILE-STATUS = '                         
ET0005                         GETVHOL-FILE-STATUS                              
                MOVE +3103    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
ET0005     END-IF.                                                              
                                                                                
           ADD 1 TO W-POS-CNT                                                   
                                                                                
ET0005**---MOVE THE NEW RECORD FROM THE PARM AREA                               
ET0005     MOVE GETVHOL-NEW-RECORD   TO CUSHOL-RECORD.                          
ET0005                                                                          
LRM053     IF CUSHOL-REC-TYPE = HIGH-VALUES                                     
ET0005        GO TO 5100-READ-POS-NEXT.                                         
ET0005                                                                          
ET0005     IF CUSHOL-ACCOUNT-TYPE NOT NUMERIC                                   
ET0005        GO TO 5100-READ-POS-NEXT.                                         
ET0005                                                                          
ET0005     IF CUSHOL-KEY(1:11) NOT = W-CUSHOL-KEY(1:11)                         
                GO TO 5100-EXIT.                                                
                                                                                
      ** BYPASS NON-ZERO CURRENCY                                               
LRM053     IF (CUSHOL-FRGN-CURR-CODE NOT = 000                                  
LRM053                   AND 254 AND 998 AND 999)                               
LRM043       IF BH-ACAT-DLVR-FCUR-POSN NOT = '1'                                
DJ0013         MOVE 'CURR' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
               GO TO 5100-READ-POS-NEXT                                         
LRM043       END-IF                                                             
           END-IF                                                               
                                                                                
LRM043     IF CUSHOL-FRGN-CURR-CODE = 254 OR 998 OR 999                         
LRM043        GO TO 5100-READ-POS-NEXT                                          
LRM043     END-IF                                                               
                                                                                
      ** BYPASS OPEN ORDERS                                                     
LRM053***  IF  CUSHOL-ACCOUNT-TYPE NOT NUMERIC                                  
LRM053     IF  CUSHOL-OPEN-ORDER                                                
DJ0013         MOVE 'OPOR' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** SELECT ONLY TYPES 1,2,3,5                                              
           IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '2' OR '3' OR '5')                 
                CONTINUE                                                        
           ELSE                                                                 
DJ0013         MOVE 'TYPE' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
                GO TO 5100-READ-POS-NEXT                                        
           END-IF                                                               
                                                                                
DJ0004** BYPASS THESE SECURITIES                                                
DJ0004     MOVE CUSHOL-SECURITY-NO TO W-SEC-TO-BYPASS-FIELD                     
LRM035                                  VALIDATE-MMF-SECURITY                   
DJ0004     IF  W-IRA-SECURITY                                                   
DJ0013         MOVE 'IRAA' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
DJ0004         GO TO 5100-READ-POS-NEXT                                         
DJ0004     END-IF                                                               
DJ0004     IF  W-ANNUITY-SECURITY                                               
DJ0013         MOVE 'ANNU' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
DJ0004         GO TO 5100-READ-POS-NEXT                                         
DJ0004     END-IF                                                               
DJ0004**** REGT MOVED TO BALANCE SECTION                                        
DJ0004     IF  W-SPAD-SECURITY                                                  
LRM042         IF  (BH-ACAT-ASCENDIS-USER = '1' OR '2')                         
LRM042            PERFORM 5110-CHECK-SPAD-POSITIONS THRU 5110-EXIT              
LRM042         END-IF                                                           
DJ0009*********IF CUSHOL-SECURITY-NO (1:7) NOT = '9999200'                      
DJ0013         MOVE 'SPAD' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
DJ0013*********END-IF                                                           
LRM042         IF W-SPAD-FND-SW = 'Y'                                           
LRM042            PERFORM 7500-WRITE-ASCENDIS-EXCP THRU 7500-EXIT               
LRM042         END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** MAKE SURE QUANTITY IS GREATER THAN ZERO                                
LRM039***  IF  (CUSHOL-CLIENT-N = 10 AND CUSHOL-ACCOUNT-TYPE = '4')             
LRM039***      CONTINUE                                                         
LRM039***  ELSE                                                                 
           IF  (CUSHOL-CPH-TD-QTY NOT NUMERIC)                                  
                   OR                                                           
               (CUSHOL-CPH-TD-QTY = ZERO)                                       
DJ0013         MOVE 'QTY0' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
                GO TO 5100-READ-POS-NEXT                                        
           END-IF.                                                              
                                                                                
           PERFORM 5400-GETMSDC THRU 5400-EXIT                                  
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)                  
                          ' ' MS-DESC1                                          
                       ' GETMSD-RETURN-CODE='  GETMSD-RETURN-CODE               
               GO TO 5100-READ-POS-NEXT                                         
           END-IF.                                                              
                                                                                
           PERFORM 5440-ASSET-PRICING-CATEGORY THRU 5440-EXIT                   
                                                                                
                                                                                
ET0002** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '2' OR '3'                         
ET0002** LIQUIDATE IF IN PRIMARY REDEMPTION LIST                                
ET0002**                                                                        
DJ0005     IF  W-CURRENT-CLIENT (2:3) = GETNA-KEY-CLIENT                        
DJ0005     AND WF-BRANCH-CD           = GETNA-KEY-BRANCH3-5                     
DJ0005     AND WF-ACCT-CD             = GETNA-KEY-ACCOUNT6-10                   
DJ0005         CONTINUE                                                         
DJ0005     ELSE                                                                 
LRM009         MOVE W-CURRENT-CLIENT (2:3) TO GETNA-KEY-CLIENT                  
ET0002         MOVE '00'             TO  GETNA-KEY-BRANCH1-2                    
ET0002         MOVE  WF-BRANCH-CD    TO  GETNA-KEY-BRANCH3-5                    
ET0002         MOVE '00000'          TO  GETNA-KEY-ACCOUNT1-5                   
ET0002         MOVE  WF-ACCT-CD      TO  GETNA-KEY-ACCOUNT6-10                  
ET0002         CALL  GETNA        USING  GETNA-SENDING-PARAMETERS               
ET0002                                   GETNA-SEGMENT-INCLUDES                 
DJ0005     END-IF.                                                              
ET0002     IF  GETNA-RETURN-FOUND                                               
ET0002         ADD 1 TO W-GETNA-FND-CNT                                         
ET0002     ELSE                                                                 
ET0002         ADD 1 TO W-GETNA-NOTFND-CNT                                      
ET0002     END-IF.                                                              
ET0002                                                                          
ET0002     IF GETNA-RETURN-FOUND                                                
ET0002     AND (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                             
ET0002        MOVE  SPACE             TO  W-MMF-FOUND                           
ET0002        PERFORM VARYING  TBL-SUB FROM 1 BY 1                              
ET0002                  UNTIL  TBL-SUB > W-MMF-TBL-CNT                          
LRM008                     OR  W-MMF-FOUND = 'Y' OR 'T'                         
LRM049           IF W-MMF-SWEEP-CD (TBL-SUB) = NAPPA-EXP-FUND-NBR-N             
ET0002              IF W-MMF-SEC (TBL-SUB) = CUSHOL-SECURITY-NO                 
ET0002                 MOVE 'Y' TO W-MMF-FOUND                                  
LRM008              ELSE                                                        
LRM019                 PERFORM VARYING TH-SUB FROM 1 BY 1                       
LRM019                    UNTIL TH-SUB > W-THRESHOLD-TBL-CNT (TBL-SUB)          
LRM019                      IF W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)           
LRM019                                    = CUSHOL-SECURITY-NO                  
LRM019                         MOVE 'T' TO W-MMF-FOUND                          
LRM019                      END-IF                                              
LRM019                 END-PERFORM                                              
ET0002              END-IF                                                      
ET0002           END-IF                                                         
ET0002        END-PERFORM                                                       
ET0002        IF W-MMF-FOUND = 'Y'                                              
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
ET0002                              + CUSHOL-CPH-MKT-VAL                        
ET0002           DISPLAY '   PRIMARY MMKT FNDS FOUND   '                        
ET0002                     CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1                
ET0002                                                ' ' MS-DESC2              
ET0002                     ' AMT=' CUSHOL-CPH-MKT-VAL                           
LRM013           PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                
ET0002           GO TO 5100-READ-POS-NEXT                                       
LRM008        ELSE                                                              
LRM008        IF W-MMF-FOUND = 'T'                                              
LRM008           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
LRM008                              + CUSHOL-CPH-MKT-VAL                        
LRM008           DISPLAY ' THRESHOLD FUND SLOT ' TBL-SUB                        
LRM008                 ' ' CUSHOL-SECURITY-NO (1:7)                             
LRM008                   ' QTY=' CUSHOL-CPH-MKT-VAL                             
LRM008                 ' ' MS-DESC1 ' ' MS-DESC2                                
LRM013           PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                
LRM008           GO TO 5100-READ-POS-NEXT                                       
LRM008        END-IF                                                            
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
ET0002                                                                          
ET0002** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '3'                                
ET0002** LIQUIDATE IF IN SECONDARY REDEMPTION LIST                              
ET0002**                                                                        
ET0002     IF BH-ACAT-LIQUIDATE-MMF = '3'                                       
ET0002        MOVE SPACE TO W-MMF-FOUND                                         
ET0002        PERFORM VARYING TBL-SUB FROM 1 BY 1                               
ET0002                        UNTIL  TBL-SUB > W-MMF-TBL-CNT                    
ET0002                           OR  W-MMF-FOUND > SPACE                        
ET0002           IF W-MMF-SEC (TBL-SUB) = CUSHOL-SECURITY-NO                    
ET0002               MOVE W-MMF-REDMPT-IND (TBL-SUB) TO W-MMF-FOUND             
ET0002           END-IF                                                         
ET0002        END-PERFORM                                                       
ET0002        IF W-MMF-FOUND = 'A' OR 'D'                                       
ET0002           PERFORM VARYING TBL-SUB FROM 1 BY 1                            
ET0002                        UNTIL  TBL-SUB > W-REDMPT-TBL-CNT                 
ET0002                           OR  W-MMF-FOUND = 'Y'                          
ET0002              IF W-REDMPT-SEC(TBL-SUB) = CUSHOL-SECURITY-NO               
ET0002                  MOVE 'Y' TO W-MMF-FOUND                                 
ET0002              END-IF                                                      
ET0002           END-PERFORM                                                    
ET0002        END-IF                                                            
ET0002        IF W-MMF-FOUND = 'Y'                                              
ET0002           DISPLAY '   SECONDARY MMKT FNDS FOUND '                        
ET0002                   CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1                  
ET0002                                            ' ' MS-DESC2                  
ET0002                       ' AMT=' CUSHOL-CPH-MKT-VAL                         
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT +                              
ET0002                                CUSHOL-CPH-MKT-VAL                        
LRM013           PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                
ET0002           GO TO 5100-READ-POS-NEXT                                       
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
                                                                                
DJ0013***IF SECURITY IS ON ACTRBSC TABLE,                                       
DJ0013***DELIVER MONEY MARKET FUND AS CASH                                      
DJ0013     PERFORM 5530-CHECK-ACTRBSC THRU 5530-EXIT                            
DJ0013     IF  W-ACTRBSC-FOUND                                                  
DJ0013         MOVE CUSHOL-CPH-TD-QTY TO W-QTY-DISPLAY                          
DJ0013         DISPLAY '   ACTRBSC MMF DLVR AS CASH  '                          
DJ0013           CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1 ' ' MS-DESC2             
DJ0013           ' QTY=' W-QTY-DISPLAY                                          
DJ0013         COMPUTE W-BAL-MMKT = W-BAL-MMKT +                                
DJ0013                              CUSHOL-CPH-TD-QTY                           
DJ0013         PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                  
DJ0013         GO TO 5100-READ-POS-NEXT                                         
DJ0013     END-IF                                                               
                                                                                
LRM035     IF CUSHOL-SECURITY-NO = 'A000928'                                    
LRM035        GO TO 5100-READ-POS-NEXT                                          
LRM035     END-IF.                                                              
                                                                                
      ** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '1'                                
LRM003** THE FOLLOWING 5 LINES ADDED TO CAUSE MMF FUNDS TO CREATE               
LRM003** ASSETS RATHER THAN BE SKIPPED FOR NEW B1 SETTINGS 2, 3.                
LRM003     IF (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                              
LRM003     AND ((WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')                
LRM003       OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6'))               
LRM003           DISPLAY 'CREATE ASSET FOR MMF ' CUSHOL-SECURITY-NO             
LRM003     ELSE                                                                 
                                                                                
LRM037       IF (W-MONEY-MARKET-SECURITY                                        
LRM035       OR VALID-MMF-SECURITY)                                             
               IF (WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')              
               OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6')              
                  MOVE CUSHOL-CPH-MKT-VAL TO W-AMT-DISPLAY                      
                   DISPLAY '   MONEY MARKET FOUND '                             
                               CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1            
                                                        ' ' MS-DESC2            
                                   ' AMT=' W-AMT-DISPLAY                        
                   IF BH-ACAT-LIQUIDATE-MMF = '1'                               
                      COMPUTE W-BAL-MMKT = W-BAL-MMKT +                         
                                           CUSHOL-CPH-MKT-VAL                   
LRM013                PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT           
                   END-IF                                                       
LRM035         ELSE                                                             
LRM035             DISPLAY 'UNEXPECTED CLASS CODE ' WK-MS-CLASS                 
LRM035               ' ON MMF SECURITY ' CUSHOL-SECURITY-NO (1:7)               
               END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
DJ0004       END-IF                                                             
           END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-POS-FND-SW.                                            
                                                                                
           MOVE ' '                      TO WK-POS-DESC4                        
                                            W-POS-DESC1                         
                                            W-POS-DESC2                         
                                            W-POS-DESC3                         
           INITIALIZE                       WK-POS-DESC5                        
           MOVE ZEROS                    TO W-POS-MEMO-QTY-EXCLUDED             
           MOVE CUSHOL-CPH-TD-QTY TO W-POS-QTY.                                 
LRM024     MOVE ' '                TO W-ASSET-CMNT-TXT                          
                                                                                
           IF  CUSHOL-NO-DESC = 1                                               
               MOVE CUSHOL-CPH-SEC-DESC(1)             TO W-POS-DESC1           
           ELSE                                                                 
             IF  CUSHOL-NO-DESC = 2                                             
                 MOVE CUSHOL-CPH-SEC-DESC(1)           TO W-POS-DESC1           
                 MOVE CUSHOL-CPH-SEC-DESC(2)           TO W-POS-DESC2           
             ELSE                                                               
                 IF  CUSHOL-NO-DESC >= 3                                        
                     MOVE CUSHOL-CPH-SEC-DESC(1) TO W-POS-DESC1                 
                     MOVE CUSHOL-CPH-SEC-DESC(2) TO W-POS-DESC2                 
                     MOVE CUSHOL-CPH-SEC-DESC(3) TO W-POS-DESC3                 
                 END-IF                                                         
                 IF  CUSHOL-NO-DESC >           3                               
                     MOVE CUSHOL-CPH-SEC-DESC(4) TO WK-POS-DESC4                
                 END-IF                                                         
             END-IF                                                             
           END-IF.                                                              
                                                                                
           MOVE CUSHOL-SECURITY-NO TO WK-POS-DESC5-SEC                          
                                                                                
           ADD 1 TO W-POSIT-CNT                                                 
                                                                                
           MOVE W-POS-QTY           TO WORK-POS-QTY                             
                                       WORK-POS-QTY-ORIG                        
           MOVE WORK-POS-QTY        TO WORK-POS-QTY-SIGNED-INTEGER              
                                       WORK-POS-QTY-DECIMAL                     
LRM043     IF CUSHOL-FRGN-CURR-CODE NOT = '000'                                 
LRM043        MOVE W-CURRENT-CLIENT(2:3) TO CURR-CLIENT-NUMBER                  
LRM043        MOVE 'CAT810  '            TO CURR-CALLING-PGM-NAME               
LRM043        MOVE '  '                  TO CURR-RETURN-CODE                    
LRM043        MOVE CUSHOL-FRGN-CURR-CODE                                        
LRM043                                   TO CURR-CURRENCY-NUMBER                
LRM043        MOVE WK-BPD-PROC-DATE    TO    CURR-RATE-DATE                     
LRM043        MOVE 'R'                 TO    CURR-FUNCTION-CODE                 
LRM043        CALL CURRATE       USING CURRATE-COMMAREA,                        
LRM043                                 CURRENCY-RECORD                          
LRM043        IF NOT CURR-SUCCESSFUL OR  CURR-AVG-RATE = 0.00                   
LRM043           MOVE 1.00             TO CURR-AVG-RATE                         
LRM043           DISPLAY 'CURRATE NOT FOUND' W-CURRENT-CLIENT  ' '              
LRM043            CUSHOL-BRANCH '-' CUSHOL-ACCOUNT                              
LRM043                   ' CURR=' CUSHOL-FRGN-CURR-CODE                         
LRM043                   ' SEC=' CUSHOL-SECURITY-NO                             
LRM043        ELSE                                                              
LRM043           DISPLAY 'CURRATE FOUND' W-CURRENT-CLIENT  ' '                  
LRM043            CUSHOL-BRANCH '-' CUSHOL-ACCOUNT                              
LRM043                   ' CURR=' CUSHOL-FRGN-CURR-CODE                         
LRM043                   ' SEC=' CUSHOL-SECURITY-NO                             
LRM043                   ' RATE-7V8=' CURR-AVG-RATE                             
LRM043        END-IF                                                            
LRM043        COMPUTE WORK-POS-VALUE =                                          
LRM043              CUSHOL-CPH-MKT-VAL * CURR-AVG-RATE                          
LRM043     ELSE                                                                 
              MOVE CUSHOL-CPH-MKT-VAL  TO WORK-POS-VALUE                        
LRM043     END-IF.                                                              
                                                                                
           MOVE CUSHOL-CPH-TD-QTY TO W-QTY-DISPLAY                              
           DISPLAY           '   POS ' CUSHOL-CLIENT                            
                                   ' ' CUSHOL-BRANCH                            
                                   ' ' CUSHOL-ACCOUNT                           
                                   ' ' CUSHOL-FRGN-CURR-CODE                    
                                   ' ' CUSHOL-ACCOUNT-TYPE                      
                                   ' ' CUSHOL-SECURITY-NO (1:7)                 
                                ' REC-TYPE=' CUSHOL-REC-TYPE                    
                                   ' ' CUSHOL-CPH-SYMBOL    (1:8)               
                                   ' ' CUSHOL-CPH-CUSIP     (1:12)              
                                   ' ' W-QTY-DISPLAY                            
                                   ' ' W-POS-DESC1                              
                                                                                
           IF  BH-ACAT-REJ-DEL-ASSET-VALUE  > 0                                 
               IF  WORK-POS-VALUE                                               
                                      NOT < BH-ACAT-REJ-DEL-ASSET-VALUE         
                   MOVE 'Y' TO W-REJ-ASSET-VALUE                                
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  CUSHOL-WI                                                        
               ADD 1 TO W-WHEN-ISSUE-CNT                                        
DJ0013*********PERFORM 5730-FORMAT-WHEN-ISSUE THRU 5730-EXIT                    
DJ0009***------ FYI, THIS IS NOT BEING INSERTED INTO THE DATABASE               
DJ0013         MOVE 'WHIS' TO W-ASCENDIS-WHLD-REASON                            
DJ0013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      **** IF SECURITY IS RESTRICTED, CREATE ASSET WITH 'WITHHOLD'              
      ****    AND GO TO READNEXT                                                
           PERFORM 5500-CHECK-RESTRICTED THRU 5500-EXIT                         
LRM005     PERFORM 5520-CHECK-SEC-BLOCK THRU 5520-EXIT                          
                                                                                
LRM023     MOVE 'N' TO W-MATURE-CALLED-BOND-SW.                                 
LRM023     IF  WK-MS-SEC-ID = 'B'                                               
LRM023     AND W-BOND-EXP-ACT NOT = '0'                                         
LRM023         PERFORM 5515-CHECK-BOND-MAT-RTN   THRU 5515-EXIT                 
LRM023     END-IF                                                               
                                                                                
LRM023     IF W-BOND-EXP-ACT = '1'                                              
LRM023     AND (W-MATURE-CALLED-BOND-SW  = 'Y')                                 
LRM023         DISPLAY 'CALLED/MATURE BOND BYPASSED '                           
LRM023                  CUSHOL-SECURITY-NO                                      
LRM013         MOVE 'MATU' TO W-ASCENDIS-WHLD-REASON                            
LRM013         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
LRM023         GO TO 5100-READ-POS-NEXT                                         
LRM023     END-IF                                                               
                                                                                
LRM025     IF  WK-MSD-ISIN > SPACES                                             
LRM025     AND WK-MSD-ISIN(1:2) NOT = 'US'                                      
LRM025     AND WK-CNS-IND NOT = 'Y'                                             
LRM025*****AND WK-DTC-IND NOT = 'Y'                                             
LRM025         SET FOREIGN-FEE-ELIGIBLE TO TRUE                                 
LRM025     ELSE                                                                 
LRM025         SET FOREIGN-FEE-NOT-APPLY TO TRUE                                
LRM025     END-IF.                                                              
                                                                                
           IF (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-ROW-CNT = 0)              
           OR (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-FND-SW  = 'Y')            
LRM005     OR (W-VRSDBLK-SEC-FND-SW  = 'Y')                                     
LRM023     OR (W-MATURE-CALLED-BOND-SW  = 'Y')                                  
ET0006         IF WS-INTNL-TRNFR-MODE                                           
ET0006            GO TO 5100-READ-POS-NEXT                                      
ET0006         END-IF                                                           
               ADD 1 TO W-RESTRICTED-CNT                                        
               PERFORM 5720-FORMAT-RESTRICTED    THRU 5720-EXIT                 
               PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT                 
               IF  BH-ACAT-REJ-PEND-DEL-NTS-IND = '1'                           
                   MOVE 'Y' TO W-REJ-NTS                                        
               END-IF                                                           
LRM023         IF W-BOND-EXP-ACT = '3'                                          
LRM023         AND W-MATURE-CALLED-BOND-SW  = 'Y'                               
LRM023            PERFORM 6020-INSERT-ACTIAST-AUD   THRU 6020-EXIT              
LRM034            PERFORM 6020-INSERT-ACTIAST-AUD   THRU 6020-EXIT              
LRM023         END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
           PERFORM 5510-CHECK-PRNGFL     THRU 5510-EXIT                         
                                                                                
           MOVE  ZERO            TO WORK-WHOLD-MEMO-QTY                         
           PERFORM 5540-GET-MRGIMM-MEMO THRU 5540-EXIT                          
                                                                                
           MOVE W-POS-QTY TO WORK-POS-QTY-LEFT                                  
           IF  WORK-WHOLD-MEMO-QTY NOT = 0                                      
ET0006         IF WS-INTNL-TRNFR-MODE                                           
ET0006            GO TO 5100-READ-POS-NEXT                                      
ET0006         END-IF                                                           
               PERFORM 5740-FORMAT-WHOLD-MEMO    THRU 5740-EXIT                 
               PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT                 
               COMPUTE WORK-POS-QTY-LEFT =                                      
                                    W-POS-QTY - W-POS-MEMO-QTY-EXCLUDED         
               IF  WORK-POS-QTY-LEFT <= 0                                       
                   MOVE WORK-POS-QTY-LEFT TO W-QTY-DISPLAY                      
                   DISPLAY '   WORK-POS-QTY-LEFT('                              
                               W-QTY-DISPLAY   ') <= 0. BYPASSED '              
DJ0013             MOVE 'QTL0' TO W-ASCENDIS-WHLD-REASON                        
DJ0013             PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT              
                   GO TO 5100-READ-POS-NEXT                                     
               END-IF                                                           
           END-IF.                                                              
                                                                                
           MOVE ' '                    TO MFMSD-REC                             
           MOVE ' '                    TO BNWREGOP-RECORD                       
           MOVE ' '                    TO BNWMAST-REC                           
           MOVE ' '                    TO W-BNWMAST-FND-SW                      
           MOVE ' '                    TO W-BNWREGOP-FND-SW                     
           MOVE ' '                    TO W-FUND-SERV-ELIGIBLE-SW               
           MOVE ' '                    TO W-LEGG-MASON-FUND-SW                  
           MOVE ' '                    TO NTW-HOUSE-ACCOUNT                     
           MOVE 'N'                    TO NTW-HOUSE-ACCT-SW                     
           MOVE 'N'                    TO NTW-OMNIBUS-ACCT-SW                   
LRM050     MOVE 'N'                    TO NTW-SHWB-ACCT-FLAG.                   
           SET NTW-NOT-NSCCSRC-ACCT      TO  TRUE.                              
           IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
           AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
DJ0007         PERFORM 5105-CHECK-DIGIT THRU 5105-EXIT                          
               PERFORM 5910-MFMSD            THRU 5910-EXIT                     
               PERFORM 5920-BNWREGOP         THRU 5920-EXIT                     
               PERFORM 5930-GET-BNWMAST-INFO THRU 5930-EXIT                     
           END-IF                                                               
                                                                                
LRM034     IF BH-ACAT-DELIVER-NTW-LVL4-FUND = '0'                               
LRM034     AND BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
LRM034     AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
LRM034     AND W-FUND-SERV-ELIGIBLE-SW = 'Y'                                    
LRM034**** SET NTWLVL IN PARA 5940-                                             
LRM034**** BYPASS LVL 4                                                         
LRM034         MOVE SPACES TO W-CKDIGIT-BRN-ACCT                                
LRM034         PERFORM 5105-CHECK-DIGIT THRU 5105-EXIT                          
LRM034         PERFORM 5940-FORMAT-MF-RTN  THRU 5940-EXIT                       
TEST           DISPLAY 'HAVE NETWORK LEVEL ' NTWRK-CNTL-CD                      
LRM034         IF  NTWRK-CNTL-CD  OF DCLACTIMF = '4'                            
LRM034             DISPLAY 'NTW LVL4 FOUND, CREATE MEMO'                        
LRM034             MOVE 'Y' TO WK-NTWRK-LVL4-IND                                
LRM034             PERFORM 5740-FORMAT-WHOLD-MEMO    THRU 5740-EXIT             
LRM034             MOVE 'LEVEL 4 ASSET MUST BE DELIVERED BY THE FUND'           
LRM034                                        TO W-ASSET-CMNT-TXT               
LRM034             PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT             
LRM034             MOVE 'LVL4' TO W-ASCENDIS-WHLD-REASON                        
LRM034             PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT              
LRM034             GO TO 5100-READ-POS-NEXT                                     
LRM034     END-IF.                                                              
                                                                                
ET0006     IF WS-INTNL-TRNFR-MODE                                               
ET0006        CONTINUE                                                          
ET0006     ELSE                                                                 
      **** IF THERE IS SAFEKEEPING MEMO, FORMAT AND LOAD ACTIAST.               
           IF  WORK-SFK-MEMO-QTY NOT = 0                                        
               IF  WORK-POS-QTY-LEFT < WORK-SFK-MEMO-QTY                        
                   MOVE WORK-POS-QTY-LEFT TO W-QTY-DISPLAY                      
                   MOVE WORK-SFK-MEMO-QTY TO W-QTY-DISPLAY-2                    
                   DISPLAY 'WORK-POS-QTY-LEFT(' WORK-POS-QTY-LEFT               
                   ' < WORK-SFK-MEMO-QTY(' WORK-SFK-MEMO-QTY ')'                
                   ' USE WORK-POS-QTY-LEFT'                                     
                   MOVE WORK-POS-QTY-LEFT TO WORK-SFK-MEMO-QTY                  
               END-IF                                                           
               PERFORM 5750-FORMAT-SFK-MEMO      THRU 5750-EXIT                 
               PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT                 
           END-IF                                                               
ET0006     END-IF.                                                              
                                                                                
           COMPUTE WORK-POS-QTY = W-POS-QTY - W-POS-MEMO-QTY-EXCLUDED           
           MOVE WORK-POS-QTY        TO WORK-POS-QTY-SIGNED-INTEGER              
                                       WORK-POS-QTY-DECIMAL                     
                                                                                
           IF  W-POS-MEMO-QTY-EXCLUDED NOT = 0                                  
               MOVE W-POS-MEMO-QTY-EXCLUDED TO W-QTY-DISPLAY                    
               MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                    
               DISPLAY '   '                                                    
                       'POS-MEMO-QTY-EXCLUDED= ' W-QTY-DISPLAY                  
                        ' WORK-POS-QTY AFTER = ' W-QTY-DISPLAY-2                
           END-IF                                                               
                                                                                
DJ0017     IF (WK-MS-CLASS-1   = 1 OR 7)                                        
DJ0017     OR (WK-MS-CLASS-1-2 = '65')                                          
DJ0017     OR (WK-MS-CLASS-1   = '4' AND WK-MS-CLASS-7 = '3')                   
DJ0017         MOVE 'Y' TO W-FRACTION-EQUITY-IND                                
DJ0017         IF (WK-MS-CLASS-1 = 4 AND WK-MS-CLASS-7 = 3)                     
DJ0017            DISPLAY '   MUNI-TAX-EXEMPT-UNITS: '                          
DJ0017                        CUSHOL-SECURITY-NO                                
DJ0017         END-IF                                                           
DJ0017     ELSE                                                                 
DJ0017         MOVE 'N' TO W-FRACTION-EQUITY-IND                                
DJ0017     END-IF                                                               
                                                                                
           MOVE 'N' TO W-REMOVE-FRACTION-SW                                     
           IF  (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
           OR  (WORK-POS-QTY-DECIMAL = 0)                                       
               CONTINUE                                                         
           ELSE                                                                 
      *************************************************************             
      ******OLD-B1: BH-BTS2-ACAT-FRAC-QTY-DELV = '1'                            
      ******IF CNS AND NOT EQUITY, LEAVE THE FRACTION.                          
      ******IF CNS AND EQUITY, AND B1 IS OFF, LEAVE THE FRACTION.               
      ******IF CNS AND EQUITY, AND B1 IS ON, REMOVE THE FRACTION.               
DJ0017******IF CNS AND MUNI TAX EXEMPT UNITS AND B1 ON, REMOVE.                 
      ******ALL OTHERS, REMOVE THE FRACTION.                                    
      ******CNS EQUITY INCLUDES CLASS CODE 1(EQUITY) AND 7(UNITS).              
DJ0017******MUNI TAX EXEMPT UNITS CLASS CODE 1=4, CODE 7=3.                     
      *************************************************************             
ET0003       IF  WK-CNS-IND = 'Y'                                               
DJ0017       AND W-FRACTION-EQUITY-IND NOT = 'Y'                                
                 CONTINUE                                                       
             ELSE                                                               
ET0003         IF  WK-CNS-IND = 'Y'                                             
DJ0017         AND W-FRACTION-EQUITY-IND = 'Y'                                  
               AND BH-ACAT-FRACT-ON-CNS-ELIG-SEC NOT = '1'                      
                   CONTINUE                                                     
               ELSE                                                             
                   ADD 1 TO W-REMOVE-FRACTION-CNT                               
                   MOVE 'Y' TO W-REMOVE-FRACTION-SW                             
                   MOVE WORK-POS-QTY-SIGNED-INTEGER  TO WORK-POS-QTY            
                   DISPLAY '   ' CUSHOL-SECURITY-NO (1:7)                       
                             ' ' CUSHOL-CPH-SYMBOL    (1:8)                     
                         ' CNS=' WK-CNS-IND                                     
ET0003**               ' CLASS=' WK-MS-CLASS-1                                  
ET0003                 ' CLASS=' WK-MS-CLASS-1-2                                
                        ' CTGY=' W-ASSET-PRC-CTGY-CD                            
                      ' FRAC= .' WORK-POS-QTY-DECIMAL                           
                    ' NEW-QTY= ' WORK-POS-QTY-SIGNED-INTEGER                    
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
           IF  WORK-POS-QTY      <  0                                           
           AND W-POS-QTY         >  0                                           
               MOVE W-POS-QTY             TO W-QTY-DISPLAY                      
               MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                    
               DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)                  
                      ' QTY < 0 AND ORIG-QTY > 0'                               
                      ' QTY=' W-QTY-DISPLAY-2                                   
                      ' ORG=' W-QTY-DISPLAY                                     
                    ' ' MS-DESC1                                                
DJ0013             MOVE 'QTL0' TO W-ASCENDIS-WHLD-REASON                        
DJ0013             PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT              
           ELSE                                                                 
               IF  WORK-POS-QTY      > -.0001                                   
               AND WORK-POS-QTY      <  .0001                                   
                   MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                
                   DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)              
                          ' QTY < .0001'                                        
                          ' QTY=' W-QTY-DISPLAY-2                               
                        ' ' MS-DESC1                                            
DJ0013             MOVE 'QTL1' TO W-ASCENDIS-WHLD-REASON                        
DJ0013             PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT              
               ELSE                                                             
ET0006           IF WS-INTNL-TRNFR-MODE                                         
ET0006              SET WS-POSITION-FOUND TO TRUE                               
ET0006              GO TO 5100-EXIT                                             
ET0006           ELSE                                                           
                   PERFORM 5150-FORMAT-AND-LOAD-ASSET THRU 5150-EXIT            
ET0006           END-IF                                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  W-REMOVE-FRACTION-SW = 'Y'                                       
LRM025         SET ACATDLVF-FRAC-QTY-REC TO TRUE                                
               PERFORM 7200-WRITE-ACATDLVF-FRAC  THRU 7200-EXIT                 
           END-IF.                                                              
                                                                                
      *************************************************************             
LRM025*  IF FOREIGN FEE POTENTIAL CHARGE EXISTS, CREATE AN                      
LRM025*  THE ACATDLVF "F" RECORD TO DRIVE CAT820 LOOKUP.                        
      *************************************************************             
LRM025     IF FOREIGN-FEE-ELIGIBLE                                              
LRM025         SET ACATDLVF-FRGN-FEE-REC TO TRUE                                
LRM025         PERFORM 7200-WRITE-ACATDLVF-FRAC THRU 7200-EXIT                  
LRM025     END-IF.                                                              
                                                                                
           GO TO 5100-READ-POS-NEXT.                                            
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       5105-CHECK-DIGIT              SECTION.                                   
                                                                                
DJ0007     IF  WF-BRANCH-ACCT         = W-CKDIGIT-BRN-ACCT                      
DJ0007     AND CUSHOL-ACCOUNT-TYPE    = W-CKDIGIT-TYPE                          
DJ0007         CONTINUE                                                         
DJ0007     ELSE                                                                 
DJ0007         MOVE WF-BRANCH-ACCT         TO W-CKDIGIT-BRN-ACCT                
DJ0007         MOVE CUSHOL-ACCOUNT-TYPE    TO W-CKDIGIT-TYPE                    
DJ0007         MOVE ' '            TO W-CKDIGIT-CK                              
DJ0007         CALL CKDIGIT USING W-CKDIGIT-ACCT-T                              
DJ0007                            W-CKDIGIT-LEN                                 
DJ0007                            W-CKDIGIT-CK                                  
DJ0007         ADD 1 TO W-CKDIGIT-CNT                                           
DJ0007     END-IF                                                               
DJ0007     IF  BH-MF-SINGLE-FUND-ACCOUNT = '1'                                  
DJ0007     AND (W-CKDIGIT-BRN-ACCT-1 NOT = W-CKDIGIT-BRN-ACCT)                  
DJ0007         MOVE W-CKDIGIT-ACCT-TC TO W-CKDIGIT-ACCT-TC-1                    
DJ0007         IF  W-CKDIGIT-TYPE = '1'                                         
DJ0007             CONTINUE                                                     
DJ0007         ELSE                                                             
DJ0007             MOVE '1'        TO W-CKDIGIT-TYPE-1                          
DJ0007             MOVE ' '        TO W-CKDIGIT-CK-1                            
DJ0007             CALL CKDIGIT USING W-CKDIGIT-ACCT-T-1                        
DJ0007                                W-CKDIGIT-LEN                             
DJ0007                                W-CKDIGIT-CK-1                            
DJ0007             ADD 1 TO W-CKDIGIT-CNT                                       
DJ0007             DISPLAY ' W-CKDIGIT-ACCT-TC=' W-CKDIGIT-ACCT-TC              
DJ0007                     ' W-CKDIGIT-ACCT-TC-1=' W-CKDIGIT-ACCT-TC-1          
DJ0007         END-IF                                                           
DJ0007     END-IF.                                                              
                                                                                
       5105-EXIT. EXIT.                                                         
      /                                                                         
LRM042 5110-CHECK-SPAD-POSITIONS     SECTION.                                   
LRM042     MOVE 'N' TO W-SPAD-FND-SW                                            
LRM042                                                                          
LRM042     IF  BH-ACAT-REJ-PEND-DEL-SPAD-NO > 0                                 
LRM042                                                                          
LRM042         PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL                           
LRM042             SUB1 > BH-ACAT-REJ-PEND-DEL-SPAD-NO                          
LRM042             OR  W-SPAD-FND-SW = 'Y'                                      
LRM042                                                                          
LRM042           IF CUSHOL-SECURITY-NO (4:4) =                                  
LRM042                             BH-ACAT-REJ-PEND-DEL-SPAD (SUB1)             
LRM042              MOVE BH-ACAT-REJ-PEND-DEL-CODE (SUB1)                       
LRM042                       TO W-REJ-SPAD-CODE                                 
LRM042              MOVE 'Y' TO W-REJ-SPAD                                      
LRM042              MOVE 'Y' TO W-SPAD-FND-SW                                   
LRM042              DISPLAY '   SPAD ON B1 REJECTED '                           
LRM042                          CUSHOL-SECURITY-NO (1:7)                        
LRM042                      '. TRANSFER WILL BE REJECTED WITH '                 
LRM042                      'REJ-CODE ' W-REJ-SPAD-CODE                         
LRM042           END-IF                                                         
LRM042                                                                          
LRM042         END-PERFORM                                                      
LRM042                                                                          
LRM042     END-IF.                                                              
LRM042 5110-EXIT. EXIT.                                                         
      /                                                                         
       5150-FORMAT-AND-LOAD-ASSET    SECTION.                                   
                                                                                
      **** FORMAT AND LOAD ASSET                                                
      **** IF OPTIONS, LOAD OPTION TABLE - ACTIOPN                              
      **** IF MUTUAL FUNDS, LOAD MUTUAL FUND TABLE - ACTIMF                     
                                                                                
           PERFORM 5700-FORMAT-ACTIAST       THRU 5700-EXIT                     
                                                                                
           IF  WK-MS-SEC-ID = 'O'                                               
               PERFORM 5800-FORMAT-OPT-RTN    THRU 5800-EXIT                    
           END-IF.                                                              
                                                                                
           PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT                     
                                                                                
           IF  W-ACTIAST-INSERT-SW = 'Y'                                        
                                                                                
                 IF  WK-MS-SEC-ID = 'O'                                         
                     PERFORM 6100-INSERT-ACTIOPN    THRU 6100-EXIT              
                 ELSE                                                           
                                                                                
      **** IF CLIENT IS A FUND/SERV CLIENT                                      
      **** AND ASSET IS A MUTUAL FUND BASED ON MSD                              
      **** LOOK UP FUND ELIGIBILITY ON MFMSD FILE                               
      **** LOOK UP ON MF NETWORKING TABLE IF IT IS A LEGG MASON FUND            
      **** FUND MUST BE FUND/SERV ELIGIBLE                                      
      **** BYPASS LEGG-MASON PROPRIETARY FUNDS                                  
                   IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                        
                   AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                 
                       IF (W-LEGG-MASON-FUND-SW NOT = 'Y')                      
                       AND W-FUND-SERV-ELIGIBLE-SW = 'Y'                        
                           PERFORM 5940-FORMAT-MF-RTN  THRU 5940-EXIT           
                           PERFORM 6200-INSERT-ACTIMF THRU 6200-EXIT            
                       END-IF                                                   
                   END-IF                                                       
                 END-IF                                                         
           END-IF.                                                              
                                                                                
       5150-EXIT. EXIT.                                                         
      /                                                                         
       5300-LOAD-BALANCES  SECTION.                                             
           MOVE '5300-LOAD-BALANCES            ' TO W-ROUTINE-1.                
LRM024     MOVE ' '                TO W-ASSET-CMNT-TXT                          
                                                                                
LRM033     IF WF-CLIENT-NBR = '0010'                                            
LRM033        PERFORM 5512-CHECK-DVNDFL THRU 5512-EXIT                          
LRM033     END-IF                                                               
                                                                                
           IF  BH-ACAT-TYPE-3-BALANCES = '1'                                    
           COMPUTE W-WORK-BAL =  W-BAL-TYPE1 + W-BAL-TYPE3 - W-BAL-MMKT         
LRM033                                       + W-BAL-PEND-DVND                  
           ELSE                                                                 
               COMPUTE W-WORK-BAL =  W-BAL-TYPE1 - W-BAL-MMKT                   
LRM033                                       + W-BAL-PEND-DVND                  
           END-IF                                                               
ET0001**<< B1=434675 - CASH BALANCE ADJUST BY PENDING AMT >>                    
ET0001     IF BH-ACAT-BALANCE-ADJUSTMENT = '1'                                  
ET0001        IF W-BAL-PENDING-AMOUNT NOT = ZERO                                
ET0001           ADD W-BAL-PENDING-AMOUNT   TO W-WORK-BAL                       
ET0001           MOVE W-BAL-PENDING-AMOUNT  TO W-AMT-DISPLAY                    
ET0001           DISPLAY '   *CASH BALANCE ADJUSTED BY PENDING AMT '            
ET0001                        W-AMT-DISPLAY                                     
ET0001        END-IF                                                            
ET0001     END-IF                                                               
ET0006     IF  WS-INTNL-TRNFR-MODE                                              
ET0006          MOVE SPACE TO WS-TYPE1-BALANCE-FOUND-SW                         
ET0006          IF  W-WORK-BAL NOT = ZERO                                       
ET0006                SET WS-TYPE1-BALANCE-FOUND TO TRUE                        
ET0006          END-IF                                                          
ET0006          GO TO 5300-EXIT                                                 
ET0006     END-IF.                                                              
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'C'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
               PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-TYPE2                                    
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'M'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
               PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-TYPE5                                    
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'S'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
               PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-SMA                                      
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'M'                  TO W-CSH-MGN-SHT                       
               MOVE 'SMA '               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
               PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
           END-IF.                                                              
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-REGT                                     
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
DJ0009     IF  W-WORK-BAL-UNSIGN NOT = 0                                        
DJ0009         PERFORM 5731-FORMAT-REGT THRU 5731-EXIT                          
DJ0009         PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
DJ0009     END-IF.                                                              
DJ0009                                                                          
       5300-EXIT. EXIT.                                                         
      /                                                                         
       5400-GETMSDC        SECTION.                                             
           MOVE '5400-GETMSDC                  ' TO W-ROUTINE-1.                
                                                                                
           MOVE CUSHOL-SECURITY-NO       TO WK-MS-SEC                           
           MOVE 'S'                      TO WK-MS-SEC-ID                        
           MOVE ZERO                     TO MS-CLOSING-PRICE                    
                                            WK-MS-CLOSING-PRICE                 
                                            WK-MS-OPT-MMY                       
                                            WK-MS-OPT-PRC                       
                                            WK-MS-OPT-FRAC                      
                                            WK-MS-CLASS                         
                                            WK-MS-OPTION-FACTOR                 
           MOVE 0                        TO WK-MS-ASSET-TYPE                    
           MOVE 'N'                      TO WK-CNS-IND                          
           MOVE 'N'                      TO WK-DTC-IND                          
           MOVE SPACES                   TO WK-MS-BOND-IND                      
                                            WK-MS-CUSIP                         
LRM025                                      WK-MS-CUSIP-10-12                   
LRM025                                      WK-MSD-ISIN                         
                                            WK-MS-SYMBOL-9                      
                                            WK-MS-DESC1                         
                                            WK-MS-DESC2                         
                                            WK-MS-DESC3                         
                                            WK-MS-SYMBOL                        
                                            WK-MS-XREF-NO                       
                                            WK-MS-WI-CODE                       
                                            WK-MS-BOND-REG-CODE                 
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
DJ0010     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           MOVE CUSHOL-SECURITY-NO       TO GETMSD-SEARCH-KEY.                  
LRM053     IF CUSHOL-WI                                                         
              MOVE '1'                   TO GETMSD-WI-CODE                      
LRM053     ELSE                                                                 
              MOVE '0'                   TO GETMSD-WI-CODE                      
LRM053     END-IF.                                                              
DJ0010     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2.                  
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               CONTINUE                                                         
           ELSE                                                                 
               GO TO 5400-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE MS-CUSIP-NO              TO WK-MS-CUSIP                         
LRM025     MOVE MS-CUSIP-AREA(10 : 3)    TO WK-MS-CUSIP-10-12                   
           MOVE MS-SYMBOL                TO WK-MS-SYMBOL-9                      
           MOVE MS-DESC1                 TO WK-MS-DESC1                         
           IF  MS-DESC2 > ' '                                                   
               MOVE MS-DESC2             TO WK-MS-DESC2                         
           END-IF                                                               
           IF  MS-DESC3 > ' '                                                   
               MOVE MS-DESC3             TO WK-MS-DESC3                         
           END-IF                                                               
           MOVE MS-FORMAT-IND            TO WK-MS-CLASS-1                       
           MOVE MS-SECURITY-TYPE         TO WK-MS-SEC-TYPE-X                    
           MOVE WK-MS-SEC-TYPE-P         TO WK-MS-SEC-TYPE-N                    
           MOVE WK-MS-SEC-TYPE           TO WK-MS-CLASS-2-5                     
           MOVE MS-SECURITY-TYPE-2       TO WK-MS-CLASS-6-7                     
LRM025     IF  MSD-SEG-14-ABSENT                                                
LRM025         MOVE SPACES               TO WK-MSD-ISIN                         
LRM025     ELSE                                                                 
LRM025         MOVE MSD-ISIN             TO WK-MSD-ISIN                         
LRM025     END-IF.                                                              
                                                                                
DJ0008     EVALUATE TRUE                                                        
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-1                                        
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1            
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-10                                       
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 10           
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-100                                      
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 100          
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-1000                                     
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1000         
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-10000                                    
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                     MS-CLOSING-PRICE * 10000             
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-100000                                   
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                     MS-CLOSING-PRICE * 100000            
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-1000000                                  
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                     MS-CLOSING-PRICE * 1000000           
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-10000000                                 
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                     MS-CLOSING-PRICE * 10000000          
DJ0008       WHEN OTHER                                                         
                  MOVE MS-CLOSING-PRICE  TO WK-MS-CLOSING-PRICE                 
DJ0008     END-EVALUATE.                                                        
                                                                                
           MOVE MS-XREF-NO               TO WK-MS-XREF-NO                       
           MOVE MS-WI-CODE               TO WK-MS-WI-CODE                       
           MOVE MS-BOND-REG-CODE         TO WK-MS-BOND-REG-CODE                 
                                                                                
           EVALUATE WK-MS-CLASS (1:1)                                           
               WHEN '1'                                                         
                     IF (WK-MS-CLASS (5:1) = '5' OR '6')                        
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '2'                                                         
                     IF (WK-MS-CLASS (5:1) = '2' OR '5' OR '6')                 
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '3'                                                         
                     IF  (WK-MS-CLASS (5:1) = '2' OR '6')                       
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '4'                                                         
                     IF  WK-MS-CLASS (5:1) = '6'                                
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '6'                                                         
                     IF  WK-MS-CLASS (2:1) = '6'                                
                         CONTINUE                                               
                     ELSE                                                       
                       IF  (WK-MS-CLASS (5:1) = '5' OR '6')                     
                           MOVE  'Y'     TO WK-CNS-IND                          
                       END-IF                                                   
                     END-IF                                                     
               WHEN '7'                                                         
                     IF  WK-MS-CLASS (5:1) = '6'                                
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN OTHER                                                       
                    CONTINUE                                                    
           END-EVALUATE                                                         
                                                                                
           IF  (WK-MS-SEC-1 = '8' OR '9')                                       
                   AND                                                          
               (WK-MS-CLASS-1-2-3 = '664' OR '665')                             
               PERFORM 5410-GETMSDC-OPTION-RTN                                  
               IF  WK-MS-SYMBOL = SPACES OR LOW-VALUES                          
                   MOVE SPACES           TO WK-MS-SYMBOL-9                      
                   DISPLAY 'OPTION '  CUSHOL-SECURITY-NO (1:7)                  
                          ' SYMBOL IS BLANK.'                                   
                          ' DESC = ' WK-MS-DESC1                                
                   PERFORM 5415-GETMSD-OPT-SYMBOL THRU 5415-EXIT                
LRM020****     ELSE                                                             
LRM018*** PARA 5420- IS SUNSET FOR OPTION SYMOBOLGY CHANGE, OPRA CODE           
LRM018***  IS NOT LONGER AVAILABLE.                                             
LRM020****         IF L-STREAM NOT = 'Q'                                        
      ****            PERFORM 5420-SCAN-FOR-OPT-SYM THRU 5420-EXIT              
LRM018****         END-IF                                                       
               END-IF                                                           
           ELSE                                                                 
               PERFORM 5430-GETMSDC-UNITS-RTN THRU 5430-EXIT                    
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS (4:1) = '2' OR '3' OR '4'                            
                                OR '5' OR '6' OR '7')                           
               MOVE  'Y'       TO WK-DTC-IND                                    
           END-IF.                                                              
                                                                                
       5400-EXIT. EXIT.                                                         
      /                                                                         
       5410-GETMSDC-OPTION-RTN.                                                 
                                                                                
           MOVE 'O'                      TO WK-MS-SEC-ID                        
           MOVE ' '                      TO WK-MS-BOND-IND                      
                                                                                
           EVALUATE TRUE                                                        
               WHEN WK-MS-CLASS-5 = 5                                           
                   MOVE '3'              TO WK-MS-ASSET-TYPE                    
               WHEN (WK-MS-CLASS-6 = 0 OR 4)                                    
                   MOVE '1'              TO WK-MS-ASSET-TYPE                    
               WHEN OTHER                                                       
                   MOVE '2'              TO WK-MS-ASSET-TYPE                    
           END-EVALUATE                                                         
                                                                                
           MOVE MS-OPTION-EXP-DATE       TO WK-MS-EXP-DATE                      
           MOVE WK-MS-EXP-MM             TO WK-MS-OPT-MM                        
           MOVE WK-MS-EXP-Y              TO WK-MS-OPT-Y                         
           MOVE MS-EXP-OPTION-STRIKE-PRICE TO WK-MS-OPT-PRICE                   
LRM021     IF MS-EXP-OPT-STRIKE-PRC NOT = ZERO                                  
LRM021        MOVE MS-EXP-OPT-STRIKE-PRC TO WK-MS-OPT-PRICE-NEW                 
LRM021     ELSE                                                                 
LRM021        DISPLAY 'EXPANDED OPT STRIKE ZEROS, FORCING OLD PRC '             
LRM021          'WAS ' WK-MS-OPT-PRICE  ' ' MS-ADP-NO                           
LRM021        MOVE WK-MS-OPT-PRC   TO WK-MS-OPT-PRC-NEW                         
LRM021        DIVIDE WK-MS-OPT-FRAC BY 100                                      
LRM021                    GIVING WK-MS-OPT-FRAC-NEW                             
LRM021     END-IF.                                                              
LRM056*****MOVE MS-OPTION-FACTOR           TO WK-MS-OPTION-FACTOR               
LRM056     MOVE MSD-OPTION-FACTOR-N        TO WK-MS-OPTION-FACTOR               
                                                                                
LRM020**** IF L-STREAM NOT = 'Q'                                                
      ****    IF  WK-MS-OPT-FRAC = ZERO                                         
      ****        MOVE ZERO              TO WK-MS-OPT-FRAC-1                    
LRM007****                                  WK-MS-OPT-DECI-ROUNDED              
      ****    ELSE                                                              
LRM007****    IF MSD-FRACTION-DECIMAL-IND = 'D'                                 
LRM007****        COMPUTE WK-MS-OPT-DECI-ROUNDED = WK-MS-OPT-FRAC / 1000        
LRM007****        END-COMPUTE                                                   
LRM007****        DISPLAY 'USING DECIMAL STRIKE PRICE FOR '                     
LRM007****         WK-MS-SEC ' ' WK-MS-OPT-DECI-ROUNDED                         
LRM007****    ELSE                                                              
      ****        COMPUTE WK-MS-OPT-FRAC-6 = WK-MS-OPT-FRAC * 8                 
      ****        END-COMPUTE                                                   
      ****    END-IF                                                            
LRM018**** END-IF.                                                              
LRM018**** IF L-STREAM = 'Q'                                                    
LRM018        MOVE MSD-OCC-OPTN-SYM-ID TO WK-MS-SYMBOL.                         
LRM018**** END-IF.                                                              
                                                                                
       5410-EXIT. EXIT.                                                         
      /                                                                         
LRM033 5512-CHECK-DVNDFL     SECTION.                                           
LRM033     MOVE '5512-CHECK-DVNDFL             ' TO W-ROUTINE-1.                
LRM033                                                                          
LRM041     MOVE LOW-VALUES TO DVND-KEY                                          
LRM033     MOVE W-CURRENT-CLIENT(2 : 3) TO DVND-ADP-CL-NO-X                     
LRM033     MOVE WF-BRANCH-ACCT          TO DVND-CUST-ACCOUNT                    
LRM033                                                                          
LRM033     START DVNDFL KEY NOT < DVND-KEY                                      
LRM033                                                                          
LRM033     IF DVNDFL-OKAY                                                       
LRM033        CONTINUE                                                          
LRM033     ELSE                                                                 
LRM033       IF DVNDFL-END-OF-FILE                                              
LRM033       OR DVNDFL-NOT-FOUND                                                
LRM033          GO TO 5512-EXIT                                                 
LRM033       ELSE                                                               
LRM033          DISPLAY ' ** CAT810 - DVNDFL FILE, START BROWSE ERROR'          
LRM033                  ' FILE-STATUS = ' DVNDFL-STATUS                         
LRM033          DISPLAY 'W-DVNDFL-KEY = ' CUSHOL-SECURITY-NO                    
LRM033          MOVE +4001    TO ABEND-CODE                                     
LRM033          CALL ABEND USING ABEND-CODE                                     
LRM033       END-IF                                                             
LRM033     END-IF.                                                              
LRM033                                                                          
LRM033 5512-READ-DVNDFL-NEXT.                                                   
LRM033                                                                          
LRM033     READ DVNDFL NEXT RECORD.                                             
LRM033                                                                          
LRM033     IF DVNDFL-OKAY                                                       
LRM033        CONTINUE                                                          
LRM033     ELSE                                                                 
LRM033       IF DVNDFL-END-OF-FILE                                              
LRM033          GO TO 5512-EXIT                                                 
LRM033       ELSE                                                               
LRM033          DISPLAY ' ** CAT810 - DVNDFL FILE, READ NEXT ERROR'             
LRM033                  ' FILE-STATUS = ' DVNDFL-STATUS                         
LRM033          DISPLAY 'W-DVNDFL-KEY = ' PRNGKEY                               
LRM033          MOVE +4002    TO ABEND-CODE                                     
LRM033          CALL ABEND USING ABEND-CODE                                     
LRM033       END-IF                                                             
LRM033     END-IF.                                                              
LRM033                                                                          
LRM033     ADD 1 TO W-DVNDFL-CNT                                                
LRM033                                                                          
LRM033     EVALUATE TRUE                                                        
LRM033         WHEN W-CURRENT-CLIENT(2 : 3) NOT = DVND-ADP-CL-NO-X              
LRM033           OR WF-BRANCH-ACCT NOT = DVND-CUST-ACCOUNT                      
LRM033              CONTINUE                                                    
LRM040         WHEN (DVND-CURRENCY NOT = '000' AND '001')                       
LRM040              GO TO 5512-READ-DVNDFL-NEXT                                 
LRM033         WHEN OTHER                                                       
LRM033              ADD 1     TO W-DVNDFL-FND-CNT                               
LRM033              DISPLAY '   PENDING DIVIDEND FOUND'                         
LRM040                        DVND-ADP-NBR                                      
LRM040                         ' REC-DATE=' DVND-REC-DATE                       
LRM040                         ' PAY-DATE=' DVND-PAY-DATE                       
LRM040                         ' AMT=' DVND-ASSET-VALUE                         
LRM033              IF DVND-ASSET-VALUE < ZERO                                  
LRM038              AND DVND-REC-DATE <= WK-PROJECTED-SETTLE-DATE               
LRM038              AND DVND-PAY-DATE > W-TODAY-DATE                            
LRM033                 SUBTRACT DVND-ASSET-VALUE FROM W-BAL-PEND-DVND           
LRM033                 DISPLAY '    DB VALUE ' DVND-ASSET-VALUE                 
LRM033                           ' TOTAL DIV ' W-BAL-PEND-DVND                  
LRM033                 PERFORM 7310-WRITE-ACATDLVF-DVND THRU 7310-EXIT          
LRM033              END-IF                                                      
LRM033              GO TO 5512-READ-DVNDFL-NEXT                                 
LRM033     END-EVALUATE.                                                        
LRM033                                                                          
LRM033 5512-EXIT. EXIT.                                                         
      /                                                                         
       5415-GETMSD-OPT-SYMBOL.                                                  
                                                                                
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
DJ0010     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           MOVE WK-MS-XREF-NO            TO GETMSD-SEARCH-KEY.                  
           MOVE '0'                      TO GETMSD-WI-CODE                      
DJ0010     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2.                  
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               MOVE MS-SYMBOL-AREA       TO WK-MS-SYMBOL-9                      
                   DISPLAY 'OPTION '  CUSHOL-SECURITY-NO (1:7)                  
                          ' UNDERLYING SECURITY = ' WK-MS-XREF-NO               
                          ' FOUND SYMBOL = ' WK-MS-SYMBOL-9                     
           ELSE                                                                 
               MOVE ' '                  TO WK-MS-SYMBOL-9                      
                   DISPLAY 'OPTION '  CUSHOL-SECURITY-NO (1:7)                  
                          ' UNDERLYING SECURITY = ' WK-MS-XREF-NO               
                          ' SYMBOL NOT FOUND '                                  
           END-IF.                                                              
                                                                                
       5415-EXIT. EXIT.                                                         
      /                                                                         
       5420-SCAN-FOR-OPT-SYM.                                                   
      *** EXTRACT OPTION ROOT SYMBOL FROM BROADRIDGE OPTION SYMBOL              
      *** Q/X + ROOT SYMBOL + EXPIRATION CODE + STRIKE PRICE CODE               
                                                                                
      ***GOING BACKWARDS, SKIP SPACES(BLANKS)                                   
           MOVE WK-MS-SYMBOL-9           TO OPT-WORK1                           
           MOVE    12                    TO SUB2                                
           PERFORM UNTIL NOT (OPT-WORK3 (SUB2) = SPACES)                        
               SUBTRACT 1              FROM SUB2                                
           END-PERFORM                                                          
                                                                                
      ***GOING BACKWARDS, IF NUMERIC SKIP IT, ELSE JUMP 2 BYTES                 
           IF  OPT-WORK3 (SUB2) IS NUMERIC                                      
               SUBTRACT 1 FROM SUB2                                             
               PERFORM UNTIL NOT (OPT-WORK3 (SUB2) IS NUMERIC)                  
                       SUBTRACT 1 FROM SUB2                                     
               END-PERFORM                                                      
               SUBTRACT 1 FROM SUB2                                             
           ELSE                                                                 
               SUBTRACT 2              FROM SUB2                                
           END-IF                                                               
                                                                                
           MOVE SPACES                   TO OPTION-SYMBOL1 (1)                  
                                            OPTION-SYMBOL1 (2)                  
                                            OPTION-SYMBOL1 (3)                  
                                                                                
      ***GOING BACKWARDS, EXTRACT THE ROOT SYMBOL(3 BYTES)                      
           MOVE 3                        TO SUB3                                
           PERFORM UNTIL SUB2 = 1                                               
               MOVE  OPT-WORK3 (SUB2)    TO OPTION-SYMBOL1 (SUB3)               
               SUBTRACT 1              FROM SUB2                                
                                            SUB3                                
               END-SUBTRACT                                                     
           END-PERFORM                                                          
                                                                                
      ***GOING FORWARDS, ELIMINATE LEADING SPACES, EXTRACT ROOT SYMBOL          
           MOVE 1                        TO SUB2                                
                                            SUB3                                
           MOVE SPACES                   TO OPT-SYMBOL                          
           PERFORM UNTIL SUB3 > 3                                               
               IF  OPTION-SYMBOL1 (SUB3) = SPACES                               
                   ADD  1                TO SUB3                                
               ELSE                                                             
                   MOVE  OPTION-SYMBOL1 (SUB3) TO                               
                         OPTION-SYMBOL  (SUB2)                                  
                   ADD  1                TO SUB3                                
                                            SUB2                                
                   END-ADD                                                      
               END-IF                                                           
           END-PERFORM                                                          
                                                                                
           MOVE OPT-SYMBOL               TO WK-MS-SYMBOL-9.                     
                                                                                
       5420-EXIT. EXIT.                                                         
      /                                                                         
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *                   UNITS (TREATED AS STOCK)                  *           
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
       5430-GETMSDC-UNITS-RTN.                                                  
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((WK-MS-SEC-1 = '4')                                        
                 OR                                                             
DJ0004         (WK-MS-SEC > '1999999' AND < '2200000'))                         
                   MOVE 'S'            TO WK-MS-SEC-ID                          
                   MOVE '0'            TO WK-MS-ASSET-TYPE                      
                   MOVE ' '            TO WK-MS-BOND-IND                        
                   IF WK-MS-WI-CODE  = '1'                                      
                       MOVE 'W'        TO WK-MS-BOND-IND                        
                   ELSE                                                         
                       IF WF-TRANS-TYPE-CD    NOT = 'A'                         
                           MOVE 'G'    TO WK-MS-BOND-IND                        
                       END-IF                                                   
                   END-IF                                                       
                                                                                
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *                   STOCK                                     *           
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
                                                                                
               WHEN (WK-MS-SEC-1 < '0')                                         
                   MOVE 'S'            TO WK-MS-SEC-ID                          
                   MOVE '0'            TO WK-MS-ASSET-TYPE                      
                   MOVE ' '            TO WK-MS-BOND-IND                        
                   IF WK-MS-WI-CODE  = '1'                                      
                       MOVE 'W'        TO WK-MS-BOND-IND                        
                   ELSE                                                         
                       IF WF-TRANS-TYPE-CD    NOT = 'A'                         
                           MOVE 'G'        TO WK-MS-BOND-IND                    
                       END-IF                                                   
                   END-IF                                                       
                                                                                
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *                   BOND                                      *           
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
                                                                                
               WHEN   WK-MS-SEC-1 = ('0' OR '1' OR '2' OR '3'                   
                   OR '5' OR '6' OR '7')                                        
                   MOVE 'B'              TO WK-MS-SEC-ID                        
                   MOVE '0'              TO WK-MS-ASSET-TYPE                    
                   MOVE ' '              TO WK-MS-BOND-IND                      
                   PERFORM 5431-GETMSDC-FOR-BOND                                
               WHEN OTHER                                                       
                   PERFORM 5431-GETMSDC-FOR-BOND                                
           END-EVALUATE.                                                        
       5430-EXIT. EXIT.                                                         
      /                                                                         
       5431-GETMSDC-FOR-BOND.                                                   
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((WK-MS-WI-CODE  = '1') AND                                 
                   (WF-TRANS-TYPE-CD    = 'A'))                                 
                   MOVE 'W'          TO WK-MS-BOND-IND                          
               WHEN WF-TRANS-TYPE-CD    = 'A'                                   
                   IF WK-MS-BOND-REG-CODE = '1'                                 
                       MOVE 'B'      TO WK-MS-BOND-IND                          
                   END-IF                                                       
               WHEN WF-TRANS-TYPE-CD    NOT = 'A'                               
                   IF (WK-MS-BOND-REG-CODE = '2' OR '4' OR '6')                 
                       MOVE 'R'      TO WK-MS-BOND-IND                          
                   ELSE                                                         
                       MOVE 'G'      TO WK-MS-BOND-IND                          
                   END-IF                                                       
               WHEN OTHER                                                       
                   CONTINUE                                                     
           END-EVALUATE.                                                        
                                                                                
       5431-EXIT. EXIT.                                                         
      /                                                                         
       5440-ASSET-PRICING-CATEGORY SECTION.                                     
           MOVE '5440-ASSET-PRICING-CATEGORY   ' TO W-ROUTINE-1.                
      *****************************************************************         
      * ASSET PRICING CATEGORY - BASED ON MSD CLASS CODE              *         
      *---------------------------------------------------------------*         
      * CATEGORY                            MSD CLASS CODE            *         
      * ----------------------------------  --------------            *         
      * ANNU - ANNUITY                      6XXXXX7; 6XXXXX8          *         
      * CDCP - CD & COMMERCIAL PAPER        27XXXX5; 27XXXX6;         *         
      *                                     27XXXX7; 27XXXX9;         *         
      * CORP - CORPORATE BOND               POS 1 = 2 (EXCLUDE 2XX21X;*         
      *                                     2XX71X; 29XX1X; 2XXX701;  *         
      *                                     2XX702; 2XX703            *         
      *                                                               *         
      * EQU  - EQUITIES                     1XXXXXX; 65XXXXX          *         
      * FCUR - FOREIGN CURRENCY             -------                   *         
      * FDEB - FOREIGN DEBT                 2XXXXXX; 3XXXXXX; 4XXXXXX;*         
      *                                     7XXXXXX; AND FIRST THREE  *         
      *                                     CHARACTERS OF DESCRIPTION *         
      *                                     EQUAL TO '***'            *         
      * FEQU - FOREIGN EQUITY               1XXXXXX; AND FIRST THREE  *         
      *                                     CHARACTERS OF DESCRIPTION *         
      *                                     EQUAL TO '***'            *         
      * GOVT - US GOVT & GOVT AGENCY        3XXX211; 3XXX711; 2XXX210;*         
      *                                     2XXX710                   *         
      * LPAR - LIMITED PARTNERSHIPS         6XXXXX1; 1XXXXX1          *         
      * MBS  - FHLMC, FNMA, GNMA            2XXXXX1; 2XXXXX2; 2XXXXX3 *         
      * MFMM - MUTUAL FD MONEY MKT          63XXXX6                   *         
      * MFNM - MUTUAL FD NON-MONEY MKT      POS 1 & 2 = 63 AND        *         
      *                                     POS 7 IS NOT EQUAL TO 6   *         
      * MUNI - MUNICIPAL BONDS              4XXXXXX                   *         
      * UARP - ACTION RATE PREFERRED - UIT  -------                   *         
      * UDSC - DEFERRED SALES CHARGE - UIT  -------                   *         
      * UIT  - UNIT INVESTMENT TRUST        7XXXXXX                   *         
      * ZERO - ZERO COUPON BONDS            29XXXXX; 39XXXXX; 49XXXXX *         
      * OTH  - OTHER                        NOT DEFINED ABOVE         *         
      *****************************************************************         
                                                                                
           MOVE 'OTH'  TO W-ASSET-PRC-CTGY-CD                                   
                                                                                
      ***OPTIONS = 'OTH'                                                        
           IF  (WK-MS-SEC-1 = '8' OR '9')                                       
                   AND                                                          
               (WK-MS-CLASS-1-2-3 = '664' OR '665')                             
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '1'  AND                                         
               WK-MS-DESC1 (1:3) = '***'                                        
               MOVE 'FEQU' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '2' OR '3' OR '4' OR '7') AND                    
               WK-MS-DESC1 (1:3) = '***'                                        
               MOVE 'FDEB' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '4')                                             
               MOVE 'MUNI' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '7')                                             
               MOVE 'UIT ' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1-2 = '29' OR '39' OR '49')                          
               MOVE 'ZERO' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1-2 = '27'   AND                                     
              (WK-MS-CLASS-7 = '5' OR '6' OR '7' OR '9')                        
               MOVE 'CDCP' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '2'  AND                                         
              (WK-MS-CLASS-7 = '1' OR '2' OR '3'))                              
               MOVE 'MBS ' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '3'  AND                                         
              (WK-MS-CLASS-5-6-7 = '211' OR '711'))                             
           OR (WK-MS-CLASS-1 = '2'  AND                                         
              (WK-MS-CLASS-5-6-7 = '210' OR '710'))                             
               MOVE 'GOVT' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '2'                                              
           AND (WK-MS-CLASS-4-5   NOT = '21' AND '71')                          
           AND (WK-MS-CLASS-2     NOT = '9'                                     
           AND  WK-MS-CLASS-5     NOT = '1')                                    
           AND (WK-MS-CLASS-5-6-7 NOT = '701' AND '702' AND '703')              
               MOVE 'CORP' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '6'      AND                                     
              (WK-MS-CLASS-7 = '7' OR '8')                                      
               MOVE 'ANNU' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '6'  AND                                         
               WK-MS-CLASS-7 = '1')                                             
           OR (WK-MS-CLASS-1 = '1'  AND                                         
               WK-MS-CLASS-7 = '1')                                             
               MOVE 'LPAR' TO W-ASSET-PRC-CTGY-CD                               
               IF BH-ACAT-REJ-PEND-DEL-LP-IND = '1'                             
                  MOVE 'Y'    TO W-REJ-LP                                       
               END-IF                                                           
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1-2 = '63') AND                                      
               WK-MS-CLASS-7 = '6'                                              
               MOVE 'MFMM' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1-2 = '63') AND                                      
              (WK-MS-CLASS-7 NOT = '6')                                         
               MOVE 'MFNM' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '1'                                              
           OR  WK-MS-CLASS-1-2 = '65'                                           
               MOVE 'EQU ' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
       5440-EXIT. EXIT.                                                         
      /                                                                         
       5500-CHECK-RESTRICTED     SECTION.                                       
           MOVE '5500-CHECK-RESTRICTED         ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO DCLVRSTSEC                                
           MOVE ' '                TO DCLVRSTBRKR                               
           MOVE ' '                TO W-VRSTSEC-FND-SW                          
           MOVE ' '                TO W-VRSTBRKR-FND-SW                         
           MOVE 0                  TO W-VRSTBRKR-ROW-CNT                        
                                                                                
           EXEC SQL                                                             
                 SELECT COUNT(*)                                                
                   INTO :W-VRSTBRKR-ROW-CNT                                     
                   FROM VRSTBRKR                                                
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
                   IF  W-VRSTBRKR-ROW-CNT > 0                                   
                       DISPLAY '   VRSTBRKR FOUND FOR'                          
                                        ' '  WF-CLIENT-NBR                      
                                        ' '  WK-MS-CUSIP                        
                                    ' CNT='  W-VRSTBRKR-ROW-CNT                 
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,BRKR_CONTRA_NBR                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
               INTO                                                             
                    :DCLVRSTBRKR.CLIENT-NBR                                     
                   ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                              
                   ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                
                   ,:DCLVRSTBRKR.CRT-TMSTP                                      
                   ,:DCLVRSTBRKR.UPDT-TMSTP                                     
                   ,:DCLVRSTBRKR.CICS-TERM-ID-CD                                
                   ,:DCLVRSTBRKR.PRGM-NM                                        
                   ,:DCLVRSTBRKR.SECURITY-ADP-NBR                               
               FROM VRSTBRKR                                                    
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND BRKR_CONTRA_NBR   = :WF-RCV-NBR                             
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSTBRKR-FND-CNT                                      
               MOVE 'Y'            TO W-VRSTBRKR-FND-SW                         
               DISPLAY '   RESTRICTED BRK: CUSIP=' WK-MS-CUSIP                  
                                               ' ' WK-MS-SEC                    
                                               ' ' WK-MS-SYMBOL-9               
                       ' BRKR=' WF-RCV-NBR                                      
           ELSE                                                                 
               ADD 1 TO W-VRSTBRKR-NOTFND-CNT                                   
               MOVE 'N'            TO W-VRSTBRKR-FND-SW                         
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,TRNFR_MEMO_IND                                              
                   ,TRNFR_BRKR_TYPE_CD                                          
                   ,RSTRD_MSG_TXT                                               
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,SECURITY_ADP_NBR                                            
               INTO                                                             
                    :DCLVRSTSEC.CLIENT-NBR                                      
                   ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                               
                   ,:DCLVRSTSEC.TRNFR-MEMO-IND                                  
                   ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                              
                   ,:DCLVRSTSEC.RSTRD-MSG-TXT                                   
                   ,:DCLVRSTSEC.PRGM-NM                                         
                   ,:DCLVRSTSEC.CICS-TERM-ID-CD                                 
                   ,:DCLVRSTSEC.CRT-TMSTP                                       
                   ,:DCLVRSTSEC.UPDT-TMSTP                                      
                   ,:DCLVRSTSEC.SECURITY-ADP-NBR                                
               FROM VRSTSEC                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND TRNFR_BRKR_TYPE_CD IN ('D','B')                             
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSTSEC-FND-CNT                                       
               DISPLAY '   RESTRICTED SEC: CUSIP=' WK-MS-CUSIP                  
                                               ' ' WK-MS-SEC                    
                                               ' ' WK-MS-SYMBOL-9               
                       ' MEMO=' TRNFR-MEMO-IND     OF DCLVRSTSEC                
                        ' TFR=' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                
                        ' (IF MEMO=N, WILL BE WITHHELD)'                        
               MOVE 'Y'               TO W-VRSTSEC-FND-SW                       
           ELSE                                                                 
               ADD 1 TO W-VRSTSEC-NOTFND-CNT                                    
               MOVE 'N'               TO W-VRSTSEC-FND-SW                       
DJ0015         IF SQLCODE  <  +0                                                
DJ0015            MOVE SQLCODE      TO W-DB2-SQLCODE                            
DJ0015            DISPLAY '   VRSTSEC ERROR: ' WF-CLIENT-NBR                    
DJ0015                                     ' ' WK-MS-SEC                        
DJ0015                  ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                    
DJ0015                    ' SQLCODE = ' W-DB2-SQLCODE                           
DJ0015         END-IF                                                           
           END-IF.                                                              
                                                                                
       5500-EXIT. EXIT.                                                         
      /                                                                         
       5510-CHECK-PRNGFL     SECTION.                                           
           MOVE '5510-CHECK-PRNGFL             ' TO W-ROUTINE-1.                
                                                                                
           MOVE 'N'  TO W-PRNGFL-SW                                             
           MOVE SPACES                      TO PRNGREC                          
           MOVE CUSHOL-SECURITY-NO          TO PRNGKEY                          
                                                                                
           START PRNGFL KEY NOT < PRNGKEY                                       
                                                                                
           IF PRNGFL-OKAY                                                       
              CONTINUE                                                          
           ELSE                                                                 
             IF PRNGFL-END-OF-FILE                                              
             OR PRNGFL-NOT-FOUND                                                
                GO TO 5510-EXIT                                                 
             ELSE                                                               
                DISPLAY ' ** CAT810 - PRNGFL FILE, START BROWSE ERROR'          
                        ' FILE-STATUS = ' PRNGFL-STATUS                         
                DISPLAY 'W-PRNGFL-KEY = ' CUSHOL-SECURITY-NO                    
                MOVE +3105    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
       5510-READ-PRNGFL-NEXT.                                                   
                                                                                
           READ PRNGFL NEXT RECORD.                                             
                                                                                
           IF PRNGFL-OKAY                                                       
              CONTINUE                                                          
           ELSE                                                                 
             IF PRNGFL-END-OF-FILE                                              
                GO TO 5510-EXIT                                                 
             ELSE                                                               
                DISPLAY ' ** CAT810 - PRNGFL FILE, READ NEXT ERROR'             
                        ' FILE-STATUS = ' PRNGFL-STATUS                         
                DISPLAY 'W-PRNGFL-KEY = ' PRNGKEY                               
                MOVE +3106    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
           ADD 1 TO W-PRNGFL-CNT                                                
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((CUSHOL-SECURITY-NO < PRSECLO)                             
                          OR                                                    
                    (PRCLNT  =  '000' OR '096'))                                
                    MOVE 'N'  TO W-PRNGFL-SW                                    
               WHEN OTHER                                                       
                    ADD 1     TO W-PRNGFL-FND-CNT                               
                    MOVE 'Y'  TO W-PRNGFL-SW                                    
                    DISPLAY '   PRIVATE RANGE FOUND: '                          
                                CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1           
                    IF BH-ACAT-REJ-PEND-DEL-PRIV-IND = '1'                      
                       MOVE 'Y'  TO W-REJ-PRIV                                  
                    END-IF                                                      
           END-EVALUATE.                                                        
                                                                                
       5510-EXIT. EXIT.                                                         
      /                                                                         
LRM023 5515-CHECK-BOND-MAT-RTN   SECTION.                                       
TEST       DISPLAY 'WE ARE IN 5515- CALL/MAT LOOKUP'.                           
TEST****   DISPLAY 'PRE-IND ' CHLD-CALL-PRE-IND                                 
    ****    ' PRE-DATE ' CHLD-CALL-PRE-CCYYMMDD                                 
    ****    ' CALC EXP ' WK-BOND-EXP-DATE                                       
                                                                                
LRM023***  IF CHLD-CALL-PRE-IND = 'C'                                           
LRM023***  AND CHLD-CALL-PRE-CCYYMMDD NUMERIC                                   
LRM023***  AND CHLD-CALL-PRE-CCYYMMDD > ZEROS                                   
LRM023***  AND CHLD-CALL-PRE-CCYYMMDD <=  WK-BOND-EXP-DATE                      
LRM023***      DISPLAY '   CALLED BOND: CUSIP=' WK-MS-CUSIP                     
LRM023***                                   ' ' WK-MS-SEC                       
LRM023***                     ' ' CHLD-CALL-PRE-CCYYMMDD                        
LRM023***                     ' CUTOFF ' WK-BOND-EXP-DATE                       
LRM023***      MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM023***      ADD 1 TO W-MATURE-FND-CNT                                        
LRM023***      GO TO 5515-EXIT                                                  
LRM023***  END-IF.                                                              
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR FULLY CALLED ' WK-MS-SEC               
                                                                                
LRM024**** READ DB2 MSD...                                                      
LRM024     EXEC SQL SELECT                                                      
LRM024            RATE_BOND_DT                                                  
LRM024           ,TYPE_RATE_CD                                                  
LRM024         INTO                                                             
LRM024              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM024             ,:DCLVBNDFTRV.TYPE-RATE-CD                                   
LRM024         FROM VBNDFTRV                                                    
LRM024        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM024          AND TYPE_RATE_CD      = 'FC'                                    
LRM024     END-EXEC                                                             
LRM024                                                                          
LRM024     IF (SQLCODE  =  +0 OR -811)                                          
LRM024       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM024         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM024         DISPLAY 'FULLY CALLED BOND: CUSIP=' WK-MS-CUSIP                  
LRM024                                       ' ' WK-MS-SEC                      
LRM024                                  ' MSD=' RATE-BOND-DT                    
LRM024                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM024         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM024         MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM029         MOVE 'FC'              TO W-ASSET-CMNT-TXT (20 : 2)              
LRM029         MOVE RATE-BOND-DT      TO W-ASSET-CMNT-TXT (23 : 10)             
LRM024         ADD 1 TO W-MATURE-FND-CNT                                        
LRM024         GO TO 5515-EXIT                                                  
LRM024       ELSE                                                               
LRM024          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM024          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM024     ELSE                                                                 
LRM024         IF SQLCODE  <  +0                                                
LRM024            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM024            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM024                                     ' ' WK-MS-SEC                        
LRM024                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM024         END-IF                                                           
LRM024     END-IF.                                                              
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR PRTL CALLED ' WK-MS-SEC                
                                                                                
LRM024     EXEC SQL SELECT                                                      
LRM024            RATE_BOND_DT                                                  
LRM024         INTO                                                             
LRM024              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM024         FROM VBNDFTRV                                                    
LRM024        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM024          AND TYPE_RATE_CD      = 'PD'                                    
LRM024          AND FEATURE_FRQNC_CD  = 'AC'                                    
LRM024          AND RATE_BOND_DT      > :WK-TODAY-DB2                           
LRM024     END-EXEC                                                             
LRM024                                                                          
TEST       DISPLAY 'SQLCODE ' SQLCODE                                           
LRM024     IF (SQLCODE  =  +0 OR -811)                                          
LRM024       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM024       AND RATE-BOND-DT > WK-TODAY-DB2                                    
LRM024         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM024         DISPLAY 'PRTL CALLED BOND: CUSIP=' WK-MS-CUSIP                   
LRM024                                       ' ' WK-MS-SEC                      
LRM024                                  ' MSD=' RATE-BOND-DT                    
LRM024                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM024         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM024         MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM029         MOVE 'PC'              TO W-ASSET-CMNT-TXT (20 : 2)              
LRM029         MOVE RATE-BOND-DT      TO W-ASSET-CMNT-TXT (23 : 10)             
LRM024         ADD 1 TO W-MATURE-FND-CNT                                        
LRM024         GO TO 5515-EXIT                                                  
LRM024       ELSE                                                               
LRM024         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM024         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM024          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM024          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM024          ' AND GREATER THAN TODAY ' WK-TODAY-DB2                         
LRM024     ELSE                                                                 
LRM024         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM024         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM024         IF SQLCODE  <  +0                                                
LRM024            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM024            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM024                                     ' ' WK-MS-SEC                        
LRM024                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM024         END-IF                                                           
LRM024     END-IF.                                                              
LRM024                                                                          
TEST       DISPLAY 'READING VBNDDT FOR ' WK-MS-SEC                              
                                                                                
LRM023**** READ DB2 MSD...                                                      
LRM023     EXEC SQL SELECT                                                      
LRM023            MATURITY_DT                                                   
LRM023         INTO                                                             
LRM023              :DCLVBNDDT.MATURITY-DT                                      
LRM023         FROM VBNDDT                                                      
LRM023        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM023     END-EXEC                                                             
LRM023                                                                          
LRM023     IF  SQLCODE  =  +0                                                   
LRM023     AND MATURITY-DT NOT > WK-MS-BOND-EXP-DATE-DB2                        
LRM023         ADD 1 TO W-VBNDDT-FND-CNT                                        
LRM023         DISPLAY '   MATURED BOND: CUSIP=' WK-MS-CUSIP                    
LRM023                                       ' ' WK-MS-SEC                      
LRM023                                  ' MSD=' MATURITY-DT                     
LRM023                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM023         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM024         MOVE 'MATURE BOND'     TO W-ASSET-CMNT-TXT                       
LRM023     ELSE                                                                 
LRM023         ADD 1 TO W-VBNDDT-NOTFND-CNT                                     
LRM023         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM023         IF SQLCODE  <  +0                                                
LRM023            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM023            DISPLAY '   VBNDDT ERROR: ' WF-CLIENT-NBR                     
LRM023                                     ' ' WK-MS-SEC                        
LRM023                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM023         END-IF                                                           
LRM023     END-IF.                                                              
LRM023                                                                          
LRM023 5515-EXIT. EXIT.                                                         
      /                                                                         
LRM005 5520-CHECK-SEC-BLOCK      SECTION.                                       
           MOVE '5520-CHECK-SEC-BLOCK          ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO DCLVRSDBLK                                
           MOVE ' '                TO W-VRSDBLK-SEC-FND-SW                      
                                                                                
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,BLOCK_CD                                                    
                   ,SECURITY_ADP_NBR                                            
                   ,CMNT_TXT                                                    
               INTO                                                             
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BLOCK-CD                                        
                   ,:DCLVRSDBLK.SECURITY-ADP-NBR                                
                   ,:DCLVRSDBLK.CMNT-TXT                                        
               FROM VRSDBLK                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
DJ0006          AND BRANCH_CD         = :WF-BRANCH-CD                           
DJ0006          AND ACCT_CD           = :WF-ACCT-CD                             
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND BLOCK_CD = 'S'                                              
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDBLK '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
           AND (BH-ACAT-BLOCK-SECURITY-IND = '1' OR '2')                        
               ADD 1 TO W-VRSDBLK-SEC-FND-CNT                                   
               MOVE 'Y'               TO W-VRSDBLK-SEC-FND-SW                   
DJ0006         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0006            '    SECURITY BLOCK FOUND FOR'                                
DJ0006                             ' '  WF-CLIENT-NBR                           
DJ0006                             ' '  WF-BRANCH-CD                            
DJ0006                             ' '  WF-ACCT-CD                              
DJ0006                             ' '  WK-MS-SEC                               
               MOVE CMNT-TXT OF DCLVRSDBLK TO ASSET-CMNT-TXT                    
           ELSE                                                                 
               MOVE 'N'               TO W-VRSDBLK-SEC-FND-SW                   
           END-IF.                                                              
                                                                                
       5520-EXIT. EXIT.                                                         
      /                                                                         
DJ0013 5530-CHECK-ACTRBSC         SECTION.                                      
DJ0013     MOVE '5530-CHECK-ACTRBSC            ' TO W-ROUTINE-1.                
DJ0013                                                                          
DJ0013     MOVE ' '                TO DCLACTRBSC                                
DJ0013     MOVE ' '                TO W-ACTRBSC-FND-SW                          
DJ0013                                                                          
DJ0013     EXEC SQL SELECT                                                      
DJ0013              CLIENT_NBR                                                  
DJ0013             ,SECURITY_ADP_NBR                                            
DJ0013         INTO                                                             
DJ0013              :DCLACTRBSC.CLIENT-NBR                                      
DJ0013             ,:DCLACTRBSC.SECURITY-ADP-NBR                                
DJ0013         FROM ACTRBSC                                                     
DJ0013        WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
DJ0013          AND BRANCH_CD         = :WF-BRANCH-CD                           
DJ0013          AND ACCT_CD           = :WF-ACCT-CD                             
DJ0013          AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
DJ0013          AND BLOCK_CD          = 'M'                                     
DJ0013     END-EXEC                                                             
DJ0013                                                                          
DJ0013     MOVE 'ACTRBSC '               TO W-DB2-TABLE-NAME                    
DJ0013     MOVE 'SELECT'                 TO W-DB2-ACTION                        
DJ0013     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0013                                                                          
DJ0013     IF  SQLCODE  =  +0                                                   
DJ0013         ADD 1 TO W-ACTRBSC-FND-CNT                                       
DJ0013         MOVE 'Y'               TO W-ACTRBSC-FND-SW                       
DJ0013     ELSE                                                                 
DJ0013         ADD 1 TO W-ACTRBSC-NOTFND-CNT                                    
DJ0013         MOVE 'N'               TO W-ACTRBSC-FND-SW                       
DJ0013     END-IF.                                                              
DJ0013                                                                          
DJ0013 5530-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  READ MRGIMM FOR MEMOS                                                  
      *****************************************************************         
       5540-GET-MRGIMM-MEMO     SECTION.                                        
           MOVE '5540-GET-MRGIMM-MEMO           ' TO W-ROUTINE-1.               
                                                                                
           MOVE 0                        TO WORK-SFK-MEMO-QTY                   
           MOVE LOW-VALUES            TO MRGI-RECORD.                           
           MOVE CUSHOL-CLIENT-N       TO MRGI-CLIENT-N                          
           MOVE CUSHOL-BRANCH         TO MRGI-BRANCH                            
           MOVE CUSHOL-ACCOUNT        TO MRGI-ACCOUNT                           
           MOVE CUSHOL-FRGN-CURR-CODE TO MRGI-CURRENCY-N                        
           MOVE CUSHOL-ACCOUNT-TYPE   TO MRGI-TYPE-N                            
           MOVE CUSHOL-SECURITY-NO    TO MRGI-ADP-NO                            
           MOVE '5'                   TO MRGI-TRID.                             
           MOVE MRGI-RECORD           TO MRGIMM-RECORD.                         
                                                                                
           MOVE 'N'         TO W-MRGIMM-FND-SW                                  
           ADD 1 TO W-MRGIMM-CNT.                                               
                                                                                
           READ MRGIMM    INVALID KEY                                           
                ADD 1 TO W-MRGIMM-NOTFND-CNT                                    
                GO  TO  5540-EXIT.                                              
                                                                                
           ADD 1 TO W-MRGIMM-FND-CNT.                                           
           MOVE 'Y'         TO W-MRGIMM-FND-SW.                                 
           MOVE MRGIMM-SEQ-KEY        TO MRGI-SEQ-KEY.                          
           MOVE MRGIMM-MEMO-OCCURS-NO TO MRGI-MEMO-OCCURS-NO.                   
           MOVE MRGIMM-MEMOES         TO MRGI-MEMOES.                           
                                                                                
           IF  BH-BTS2-ACAT-SK-MEMO-OVERRIDE = '1'                              
           AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
               PERFORM 5541-CHECK-N4-MEMO THRU 5541-EXIT                        
           ELSE                                                                 
               MOVE 'N' TO W-MRGIMM-N4-FND-SW                                   
           END-IF                                                               
                                                                                
           PERFORM 5542-CHECK-B1-MEMO THRU 5542-EXIT.                           
                                                                                
       5540-EXIT. EXIT.                                                         
      /                                                                         
       5541-CHECK-N4-MEMO SECTION.                                              
           MOVE '5541-CHECK-N5-MEMO             ' TO W-ROUTINE-1.               
                                                                                
           MOVE 'N' TO W-MRGIMM-N4-FND-SW                                       
                                                                                
           PERFORM VARYING W-MM-SUB FROM 1 BY 1 UNTIL                           
                  W-MM-SUB > MRGI-MEMO-OCCURS-NO                                
                                                                                
             IF MRGI-FAM-IND  (W-MM-SUB) = 'N4'                                 
             OR MRGI-MEMO-IND (W-MM-SUB) = 'N4'                                 
                      MOVE 'Y' TO W-MRGIMM-N4-FND-SW                            
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY '   MRGIMM N4 MEMO '                            
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
               DISPLAY '   '                                                    
                       'B1#511220 AND LEVEL-4. IGNORE SFK MEMO QTY'             
             END-IF                                                             
           END-PERFORM.                                                         
                                                                                
       5541-EXIT. EXIT.                                                         
      /                                                                         
       5542-CHECK-B1-MEMO SECTION.                                              
           MOVE '5542-CHECK-B1-MEMO             ' TO W-ROUTINE-1.               
                                                                                
           PERFORM VARYING W-MM-SUB FROM 1 BY 1 UNTIL                           
                  W-MM-SUB > MRGI-MEMO-OCCURS-NO                                
                                                                                
             MOVE 'N' TO W-MRGIMM-MEMO-FND-SW                                   
                                                                                
             PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL                             
                  SUB1 > BH-ACAT-WHOLD-STK-REC-MEMO-NO                          
                  OR  W-MRGIMM-MEMO-FND-SW = 'Y'                                
      *********WITHHOLD THESE MEMOS IF ON B1 434533: SK,SN,TL,TF                
      *********IF BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1) =                        
      *********   'SK' OR 'SN' OR 'TL' OR 'TF'                                  
      *********   CONTINUE                                                      
      *********ELSE                                                             
                 IF MRGI-MEMO-IND (W-MM-SUB) =                                  
                                   BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1)         
                    MOVE 'Y' TO W-MRGIMM-MEMO-FND-SW                            
                    ADD MRGI-MEMO-QTY (W-MM-SUB)                                
                                              TO W-POS-MEMO-QTY-EXCLUDED        
                                                 WORK-WHOLD-MEMO-QTY            
                    MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY              
                    DISPLAY '   MRGIMM B1 MEMO '                                
                                   BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1)         
                                  ' FOUND:'                                     
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
                                   ' WITHHOLD CREATED'                          
                 END-IF                                                         
      *********END-IF                                                           
             END-PERFORM                                                        
                                                                                
             IF  W-MRGIMM-MEMO-FND-SW = 'Y'                                     
                 CONTINUE                                                       
             ELSE                                                               
      ***********PROCESS AS SFK IF NOT ON B1 434533: SK,SN                      
                   IF (MRGI-FAM-IND (W-MM-SUB) = 'SK' OR 'SN')                  
                   AND W-MRGIMM-N4-FND-SW = 'N'                                 
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                               TO   WORK-SFK-MEMO-QTY           
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                             TO W-POS-MEMO-QTY-EXCLUDED         
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY '   MRGIMM SF MEMO '                            
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
                                   ' SFK CREATED'                               
                   ELSE                                                         
                     IF MRGI-FAM-IND (W-MM-SUB) = 'TL' OR 'TF'                  
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                             TO W-POS-MEMO-QTY-EXCLUDED         
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY '   MRGIMM TF MEMO '                            
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
                                   ' EXCLUDED'                                  
                     END-IF                                                     
                   END-IF                                                       
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
       5542-EXIT. EXIT.                                                         
      /                                                                         
LRM039 5543-CHECK-TYPE4-RSTRCT-MEMO.                                            
LRM039     MOVE '5543-CHECK-TYPE4-RSTRCT-MEMO   ' TO W-ROUTINE-1.               
LRM039                                                                          
LRM039     PERFORM VARYING W-MM-SUB FROM 1 BY 1 UNTIL                           
LRM039            W-MM-SUB > MRGI-MEMO-OCCURS-NO                                
LRM039                                                                          
LRM039       MOVE 'N' TO W-MRGIMM-TYPE4-FND-SW                                  
LRM039                                                                          
LRM039       IF (MRGI-MEMO-IND (W-MM-SUB) =                                     
LRM039                 'RS' OR 'PP' OR 'R7' OR 'CJ' OR 'TL' OR 'SK')            
LRM039          MOVE 'Y' TO W-MRGIMM-TYPE4-FND-SW                               
LRM039          ADD MRGI-MEMO-QTY (W-MM-SUB)                                    
LRM039                                      TO W-POS-MEMO-TYPE4-QTY             
LRM039          MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY                  
LRM039          DISPLAY '   MRGIMM TYPE4 POSN/MEMO '                            
LRM039                            ' FOUND:'                                     
LRM039                             ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
LRM039                            ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
LRM039                             ' QTY=' W-QTY-DISPLAY                        
LRM039       END-IF                                                             
LRM039     END-PERFORM.                                                         
LRM039                                                                          
LRM039 5543-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  CREATE ASSET RECORD FOR BALANCE AMOUNTS                                
      *****************************************************************         
       5600-FORMAT-BALANCES SECTION.                                            
           MOVE '5600-FORMAT-BALANCES           ' TO W-ROUTINE-1.               
                                                                                
           MOVE ' '                                      TO DCLACTIAST          
                                                                                
           MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
           MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
                                                                                
           MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
           MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
           MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
           MOVE WF-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR  OF DCLACTIAST          
           MOVE WF-TRNFR-TYPE-CD   TO TRNFR-TYPE-CD      OF DCLACTIAST          
      *****MOVE WF-SBMTG-PRTCP-NBR TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
                                   TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
           MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
DJ0005     MOVE ' '                TO TRANS-RFRN-ID-CD   OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
                                                                                
LRM044     IF WF-STTLM-LCTN-CD = 'FC'                                           
LRM044         MOVE '50'           TO STTLM-LCTN-CD      OF DCLACTIAST          
LRM044         MOVE 'FCUR'         TO STTLM-RSN-CD      OF DCLACTIAST           
LRM044                                ASSET-PRC-CTGY-CD OF DCLACTIAST           
LRM044     ELSE                                                                 
               MOVE '00'           TO STTLM-LCTN-CD      OF DCLACTIAST          
LRM044     END-IF.                                                              
           MOVE '00'               TO OPTN-CTGY-CD       OF DCLACTIAST          
                                                                                
           IF  W-CASH-SMA = 'CASH'                                              
               MOVE '40'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               IF  W-WORK-BAL > 0                                               
                   MOVE 'DEB'      TO STTLM-RSN-CD       OF DCLACTIAST          
               ELSE                                                             
                   MOVE 'CRED'     TO STTLM-RSN-CD       OF DCLACTIAST          
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  W-CASH-SMA = 'SMA'                                               
               MOVE '45'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE 'SMA'          TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE ' '                TO ASSET-RQST-QTY-CD  OF DCLACTIAST          
           MOVE ' '                TO AST-RQST-TRANS-CD  OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-QTY          OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
                                                                                
           IF  W-WORK-BAL > 0                                                   
               MOVE 'S'            TO PSTN-CD            OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'L'            TO PSTN-CD            OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
           MOVE W-WORK-BAL-UNSIGN  TO ASSET-AMT          OF DCLACTIAST          
           MOVE ' '                TO BEARER-BOND-CD     OF DCLACTIAST          
           MOVE W-CSH-MGN-SHT      TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
           MOVE ' '                TO WHI-CD             OF DCLACTIAST          
                                                                                
           MOVE W-PGM-NAME         TO PRGM-NM            OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
           MOVE W-BH-NSCC-PEND-CD  TO NSCC-PEND-CD       OF DCLACTIAST          
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           MOVE W-WORK-BAL TO W-AMT-DISPLAY                                     
           DISPLAY '   BAL ' W-CSH-MGN-SHT ' ' W-CASH-SMA                       
                         ' ' W-AMT-DISPLAY                                      
                         ' ' STTLM-LCTN-CD OF DCLACTIAST                        
                         ' ' STTLM-RSN-CD  OF DCLACTIAST                        
                         ' ' PSTN-CD       OF DCLACTIAST                        
                         ' ' ASSET-AMT     OF DCLACTIAST                        
           .                                                                    
       5600-EXIT. EXIT.                                                         
      /                                                                         
       5700-FORMAT-ACTIAST SECTION.                                             
      *****************************************************************         
      *****    SETTLING LOCATION = 00, SETTLING REASON = ' '   DEFAULT          
      *****CNS SETTLING LOCATION = 05, SETTLING REASON = ' '                    
      *****MF  SETTLING LOCATION = 10, SETTLING REASON = ' '                    
      *****DTC SETTLING LOCATION = 25, SETTLING REASON = ' '                    
      *****OPT SETTLING LOCATION = 35, SETTLING REASON = 'OPT'                  
      *****************************************************************         
           MOVE '5700-FORMAT-ACTIAST           ' TO W-ROUTINE-1.                
                                                                                
           MOVE WORK-POS-QTY       TO W-ASSET-QTY-SIGN                          
                                      W-ASSET-QTY-UNSIGN                        
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
LRM043     IF  CUSHOL-FRGN-CURR-CODE NOT = '000'                                
LRM043         MOVE '50'           TO STTLM-LCTN-CD      OF DCLACTIAST          
LRM043         MOVE 'XSET'         TO  STTLM-RSN-CD      OF DCLACTIAST          
LRM043         MOVE SPACES TO CURLOOK-DATA                                      
LRM043         MOVE CUSHOL-FRGN-CURR-CODE TO CU-ARGUMENT                        
LRM043         MOVE 'DTC CODE REQUESTED' TO CU-DTC-CD                           
LRM043         CALL CURLOOK USING CURLOOK-DATA                                  
LRM043         MOVE 'ORIGINAL CURRENCY '    TO W-ASSET-CMNT-TXT                 
LRM043         MOVE CUSHOL-FRGN-CURR-CODE   TO W-ASSET-CMNT-TXT(19:3)           
LRM043                                         WK-ASSET-SEQ-NBR                 
LRM043                                         CRNCY-CD OF DCLACTIAST           
LRM043         MOVE WK-ASSET-SEQ-NBR-9 TO ASSET-SEQ-NBR OF DCLACTIAST           
LRM043         IF CU-RETURN = SPACE                                             
LRM043            MOVE CU-DTC-CUR-CD        TO W-ASSET-CMNT-TXT(23:3)           
LRM043            MOVE CU-NAME              TO W-ASSET-CMNT-TXT(27:16)          
LRM043         END-IF                                                           
LRM043         GO TO 5700-EXIT                                                  
LRM043     END-IF.                                                              
                                                                                
                                                                                
           IF  WK-DTC-IND = 'Y'                                                 
               MOVE '25'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
           IF  WK-CNS-IND = 'Y'                                                 
               MOVE '05'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
           AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
               MOVE '10'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  WK-MS-SEC-ID = 'O'                                               
               MOVE '35'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE 'OPT'          TO STTLM-RSN-CD       OF DCLACTIAST          
               MOVE 'XX'  TO ISIN-SEC-ISSUE-CD OF DCLACTIAST (1:2)              
               MOVE CUSHOL-SECURITY-NO                                          
                          TO ISIN-SEC-ISSUE-CD OF DCLACTIAST (3:7)              
           END-IF                                                               
                                                                                
ET0004     IF W-CURRENT-CLIENT = '0039'                                         
ET0004        MOVE CUSHOL-SECURITY-NO TO W-PRIVATE-RANGE-FUNDS                  
ET0004        IF W-PRIV-RANGE-SECURITY                                          
ET0004            PERFORM 5760-FORMAT-PVRT-RANGE    THRU 5760-EXIT              
ET0004        END-IF                                                            
ET0004     END-IF.                                                              
ET0004                                                                          
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           .                                                                    
       5700-EXIT. EXIT.                                                         
                                                                                
       5720-FORMAT-RESTRICTED SECTION.                                          
      *****************************************************************         
      *****SET THE WITHHOLD INDICATOR.                                          
      *****SETTLING LOCATION = 45, SETTLING REASON = COMT                       
      *****************************************************************         
           MOVE '5720-FORMAT-RESTRICTED         ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-POS-QTY       TO W-ASSET-QTY-SIGN                          
                                      W-ASSET-QTY-UNSIGN                        
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'COMT'             TO STTLM-RSN-CD       OF DCLACTIAST          
                                                                                
           IF  TRNFR-MEMO-IND OF DCLVRSTSEC = 'N'                               
LRM005     OR (W-VRSDBLK-SEC-FND-SW  = 'Y'                                      
LRM005     AND BH-ACAT-BLOCK-SECURITY-IND = '2')                                
               MOVE 'W'             TO NSCC-WTHLD-CD     OF DCLACTIAST          
           ELSE                                                                 
               MOVE ' '             TO NSCC-WTHLD-CD     OF DCLACTIAST          
           END-IF                                                               
           .                                                                    
       5720-EXIT. EXIT.                                                         
                                                                                
       5730-FORMAT-WHEN-ISSUE SECTION.                                          
      *****************************************************************         
      *****SETTLING LOCATION = 45, SETTLING REASON = COMT                       
      *****************************************************************         
           MOVE '5730-FORMAT-WHEN-ISSUE         ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-POS-QTY         TO W-ASSET-QTY-SIGN                        
                                        W-ASSET-QTY-UNSIGN                      
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'COMT'             TO STTLM-RSN-CD       OF DCLACTIAST          
                                                                                
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           .                                                                    
       5730-EXIT. EXIT.                                                         
                                                                                
DJ0009 5731-FORMAT-REGT       SECTION.                                          
DJ0009*****************************************************************         
DJ0009**** SETTLING LOCATION = 45, SETTLING REASON = REGT                       
DJ0009**** THIS IS MOVED TO 5300-LOAD-BALANCE                                   
DJ0009**** REG T CALLS (CREATE DATE AND AMOUNT REQUIRED)                        
DJ0009**** PUT IT (CCYYMMDD) IN THE ASSET COMMENTS FIELD                        
DJ0009*****************************************************************         
DJ0009     MOVE '5731-FORMAT-REGT               ' TO W-ROUTINE-1.               
DJ0009                                                                          
DJ0009***--- MOVE TODAY'S DATE                                                  
DJ0009     MOVE W-TODAY-DATE               TO W-ASSET-CMNT-TXT                  
DJ0009***  MOVE W-WORK-BAL-UNSIGN          TO W-ASSET-CMNT-TXT(10:15)           
DJ0009                                                                          
DJ0009     MOVE 0                    TO W-ASSET-QTY-SIGN                        
DJ0009                                  W-ASSET-QTY-UNSIGN                      
DJ0009                                                                          
LRM038     MOVE 0 TO WK-MS-ASSET-TYPE                                           
DJ0009     PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
DJ0009                                                                          
DJ0009     MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
DJ0009     MOVE 'REGT'             TO STTLM-RSN-CD       OF DCLACTIAST          
DJ0009     MOVE W-WORK-BAL-UNSIGN  TO ASSET-AMT          OF DCLACTIAST          
DJ0009     MOVE 0                  TO ASSET-QTY          OF DCLACTIAST          
DJ0009     MOVE ' '                TO ASSET-PRC-CTGY-CD  OF DCLACTIAST          
DJ0009     MOVE 'TOTAL FED CALL AMOUNT'                                         
DJ0009                             TO ASSET-DESC-TXT OF DCLACTIAST              
DJ0009     MOVE W-ASSET-CMNT-TXT   TO ASSET-CMNT-TXT     OF DCLACTIAST          
DJ0009     MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
LRM039                                SECURITY-ADP-NBR   OF DCLACTIAST          
LRM039                                ISIN-CNTRY-CD      OF DCLACTIAST          
LRM039                                ISIN-SEC-ISSUE-CD  OF DCLACTIAST          
LRM039                                ISIN-SEC-CDG-CD    OF DCLACTIAST          
DJ0009     DISPLAY           '   REGT ' W-ASSET-CMNT-TXT(1:8)                   
DJ0009     .                                                                    
DJ0009 5731-EXIT. EXIT.                                                         
                                                                                
DJ0009 5732-FORMAT-90DR       SECTION.                                          
DJ0009*****************************************************************         
DJ0009**** SETTLING LOCATION = 45, SETTLING REASON = 90DR                       
DJ0009**** 90-DAY RESTRICTION (EXPIRATION DATE REQUIRED)                        
DJ0009**** THE EXPIRATION DATE IS IN NAPPA-DATE-90DAY-ENDED                     
DJ0009**** PUT IT (CCYYMMDD) IN THE ASSET COMMENTS FIELD                        
DJ0009*****************************************************************         
DJ0009     MOVE '5732-FORMAT-90DR               ' TO W-ROUTINE-1.               
DJ0009                                                                          
DJ0009     MOVE ' '                                      TO DCLACTIAST          
DJ0009     MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
DJ0009     MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
DJ0009     MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
DJ0009     MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
DJ0009     MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
DJ0009     MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
DJ0009     MOVE WF-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR  OF DCLACTIAST          
DJ0009     MOVE WF-TRNFR-TYPE-CD   TO TRNFR-TYPE-CD      OF DCLACTIAST          
DJ0009     MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
DJ0009                             TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
DJ0009     MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
DJ0009     MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
DJ0009     MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
DJ0009     MOVE '00'               TO OPTN-CTGY-CD       OF DCLACTIAST          
DJ0009     MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
DJ0009     MOVE ZEROES             TO ASSET-QTY          OF DCLACTIAST          
DJ0009     MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
DJ0009     MOVE ZEROES             TO ASSET-AMT          OF DCLACTIAST          
DJ0009     MOVE W-PGM-NAME         TO PRGM-NM            OF DCLACTIAST          
DJ0009     MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
DJ0009     MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
DJ0009     MOVE W-BH-NSCC-PEND-CD  TO NSCC-PEND-CD       OF DCLACTIAST          
DJ0009                                                                          
DJ0009     MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
DJ0009     MOVE '90DR'             TO STTLM-RSN-CD       OF DCLACTIAST          
           MOVE NAPPA-DATE-90DAY-ENDED TO W-NAPPA-DATE-90DAY                    
DJ0009*****MOVE W-NAPPA-DATE-90DAY TO ASSET-CMNT-TXT     OF DCLACTIAST          
DJ0009     MOVE W-NAPPA-DATE-90DAY TO W-ASSET-CMNT-TXT                          
DJ0009     MOVE '90 DAY RESTRICTION'                                            
DJ0009                             TO ASSET-DESC-TXT     OF DCLACTIAST          
DJ0009     DISPLAY           '   90DR ' W-NAPPA-DATE-90DAY                      
DJ0009     .                                                                    
DJ0009 5732-EXIT. EXIT.                                                         
                                                                                
       5740-FORMAT-WHOLD-MEMO SECTION.                                          
      *****************************************************************         
      *****SET THE WITHHOLD INDICATOR.                                          
      *****SETTLING LOCATION = 45, SETTLING REASON = COMT                       
      *****************************************************************         
           MOVE '5740-FORMAT-WHOLD-MEMO         ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-WHOLD-MEMO-QTY  TO W-ASSET-QTY-SIGN                        
                                        W-ASSET-QTY-UNSIGN                      
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'COMT'             TO STTLM-RSN-CD       OF DCLACTIAST          
                                                                                
           MOVE 'W'                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           .                                                                    
       5740-EXIT. EXIT.                                                         
                                                                                
       5750-FORMAT-SFK-MEMO SECTION.                                            
      *****************************************************************         
      *****SETTLING LOCATION = 50, SETTLING REASON = SFK                        
      *****************************************************************         
           MOVE '5750-FORMAT-SFK-MEMO           ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-SFK-MEMO-QTY  TO W-ASSET-QTY-SIGN                          
                                      W-ASSET-QTY-UNSIGN                        
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '50'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'SFK'              TO STTLM-RSN-CD       OF DCLACTIAST          
                                                                                
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           .                                                                    
       5750-EXIT. EXIT.                                                         
                                                                                
ET0004 5760-FORMAT-PVRT-RANGE.                                                  
ET0004     MOVE '50'               TO STTLM-LCTN-CD      OF DCLACTIAST          
ET0004     MOVE 'XSET'             TO STTLM-RSN-CD       OF DCLACTIAST          
ET0004     .                                                                    
ET0004 5760-EXIT. EXIT.                                                         
    50                                                                          
       5790-FORMAT-COMMON-FIELDS       SECTION.                                 
           MOVE '5790-FORMAT-COMMON-FIELDS      ' TO W-ROUTINE-1.               
                                                                                
           MOVE ' '                                      TO DCLACTIAST          
                                                                                
           MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
           MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
           MOVE CUSHOL-SECURITY-NO TO SECURITY-ADP-NBR OF DCLACTIAST            
                                                                                
           MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
           MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
           MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
           MOVE WF-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR  OF DCLACTIAST          
           MOVE WF-TRNFR-TYPE-CD   TO TRNFR-TYPE-CD      OF DCLACTIAST          
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
                                   TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
           MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
DJ0005     MOVE ' '                TO TRANS-RFRN-ID-CD   OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
           MOVE W-ASSET-PRC-CTGY-CD TO ASSET-PRC-CTGY-CD OF DCLACTIAST          
                                                                                
           IF  WK-MS-NON-OPT                                                    
               MOVE '00'           TO OPTN-CTGY-CD       OF DCLACTIAST          
           ELSE                                                                 
             IF  WK-MS-EQUITY-OPT                                               
                 MOVE '01'         TO OPTN-CTGY-CD       OF DCLACTIAST          
             ELSE                                                               
               IF  WK-MS-NON-EQU-OPT                                            
                   MOVE '02'       TO OPTN-CTGY-CD       OF DCLACTIAST          
               ELSE                                                             
                   MOVE '03'       TO OPTN-CTGY-CD       OF DCLACTIAST          
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
                                                                                
           MOVE '00'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE ' '                TO STTLM-RSN-CD       OF DCLACTIAST          
                                                                                
LRM045     IF CUSHOL-CPH-CUSIP > SPACES                                         
              MOVE 'US'              TO ISIN-CNTRY-CD     OF DCLACTIAST         
              MOVE CUSHOL-CPH-CUSIP  TO ISIN-SEC-ISSUE-CD OF DCLACTIAST         
              MOVE ' '               TO ISIN-SEC-CDG-CD   OF DCLACTIAST         
LRM045     ELSE                                                                 
LRM045     IF WK-MSD-ISIN > SPACES                                              
LRM045        DISPLAY 'FOREIGN ISIN USED ' WK-MSD-ISIN                          
LRM045           ' FOR ADP-SEC ' CUSHOL-SECURITY-NO                             
LRM045        MOVE WK-MSD-ISIN(1:2)  TO ISIN-CNTRY-CD     OF DCLACTIAST         
LRM045        MOVE WK-MSD-ISIN(3:9)  TO ISIN-SEC-ISSUE-CD OF DCLACTIAST         
LRM045        MOVE WK-MSD-ISIN(12:1) TO ISIN-SEC-CDG-CD   OF DCLACTIAST         
LRM045     END-IF.                                                              
                                                                                
           MOVE WK-MS-DESC1  TO ASSET-DESC-TXT OF DCLACTIAST (1:30)             
           MOVE WK-MS-DESC2  TO ASSET-DESC-TXT OF DCLACTIAST (31:30)            
           MOVE WK-MS-DESC3  TO ASSET-DESC-TXT OF DCLACTIAST (61:30)            
           MOVE ' '          TO ASSET-DESC-TXT OF DCLACTIAST (91:30)            
           MOVE WK-POS-DESC5 TO ASSET-DESC-TXT OF DCLACTIAST (121:20)           
                                                                                
           MOVE ' '                TO ASSET-RQST-QTY-CD  OF DCLACTIAST          
           MOVE ' '                TO AST-RQST-TRANS-CD  OF DCLACTIAST          
                                                                                
           MOVE W-ASSET-QTY-UNSIGN TO ASSET-QTY          OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
                                                                                
           IF  W-ASSET-QTY-SIGN < 0                                             
               MOVE 'S'            TO PSTN-CD            OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'L'            TO PSTN-CD            OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
                                                                                
      *****IF  WORK-POS-VALUE = 0                                               
               IF  WK-MS-CLOSING-PRICE = 0                                      
                   COMPUTE WORK-POS-VALUE ROUNDED = W-ASSET-QTY-UNSIGN          
LRM046                   / 100                                                  
LRM046             IF  WORK-POS-VALUE < 1.00                                    
LRM046                 MOVE 1.00 TO WORK-POS-VALUE                              
LRM046             END-IF                                                       
TEST               DISPLAY 'WORK-VALUE ' WORK-POS-VALUE                         
               ELSE                                                             
                   COMPUTE WORK-POS-VALUE ROUNDED =                             
                           W-ASSET-QTY-UNSIGN    * WK-MS-CLOSING-PRICE          
                   IF  WK-MS-OPTION                                             
                       COMPUTE WORK-POS-VALUE ROUNDED =                         
                                  WORK-POS-VALUE * WK-MS-OPTION-FACTOR          
                   ELSE                                                         
                       IF  WK-MS-BOND                                           
                          COMPUTE WORK-POS-VALUE = WORK-POS-VALUE / 100         
                       END-IF                                                   
                   END-IF                                                       
               END-IF                                                           
      *****END-IF                                                               
           IF  WORK-POS-VALUE < .01                                             
               MOVE .01            TO WORK-POS-VALUE                            
           END-IF                                                               
           MOVE WORK-POS-VALUE     TO ASSET-AMT          OF DCLACTIAST          
                                                                                
           IF  WK-MS-BOND-IND = 'B'                                             
               MOVE 'B'            TO BEARER-BOND-CD     OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'N'            TO BEARER-BOND-CD     OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '3')                               
LRM039     OR (CUSHOL-CLIENT-N = 10 AND CUSHOL-ACCOUNT-TYPE = '4')              
               MOVE 'C'            TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
           ELSE                                                                 
             IF  (CUSHOL-ACCOUNT-TYPE = '2')                                    
                 MOVE 'M'          TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
             ELSE                                                               
      *******IF**(CUSHOL-ACCOUNT-TYPE = '5')                                    
                 MOVE 'S'          TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF  CUSHOL-WI                                                        
               MOVE 'W'            TO WHI-CD             OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'N'            TO WHI-CD             OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
           MOVE W-BH-NSCC-PEND-CD   TO NSCC-PEND-CD      OF DCLACTIAST          
           MOVE ' '                 TO NSCC-WTHLD-CD     OF DCLACTIAST          
           .                                                                    
       5790-EXIT. EXIT.                                                         
      /                                                                         
       5800-FORMAT-OPT-RTN.                                                     
           MOVE '5800-FORMAT-OPT-RTN            ' TO W-ROUTINE-1.               
                                                                                
           MOVE ' '                                      TO DCLACTIOPN          
           MOVE CLIENT-NBR OF DCLACTIAST                                        
                                   TO CLIENT-NBR         OF DCLACTIOPN          
           MOVE RCV-NBR OF DCLACTIAST                                           
                                   TO RCV-NBR            OF DCLACTIOPN          
           MOVE DLVR-NBR OF DCLACTIAST                                          
                                   TO DLVR-NBR           OF DCLACTIOPN          
           MOVE ACCT-RCV-NBR OF DCLACTIAST                                      
                                   TO ACCT-RCV-NBR       OF DCLACTIOPN          
           MOVE ACCT-DLVR-NBR OF DCLACTIAST                                     
                                   TO ACCT-DLVR-NBR      OF DCLACTIOPN          
           MOVE STTLM-LCTN-CD OF DCLACTIAST                                     
                                   TO STTLM-LCTN-CD      OF DCLACTIOPN          
           MOVE ISIN-CNTRY-CD OF DCLACTIAST                                     
                                   TO ISIN-CNTRY-CD      OF DCLACTIOPN          
           MOVE ISIN-SEC-ISSUE-CD  OF DCLACTIAST                                
                                   TO ISIN-SEC-ISSUE-CD  OF DCLACTIOPN          
           MOVE ISIN-SEC-CDG-CD    OF DCLACTIAST                                
                                   TO ISIN-SEC-CDG-CD    OF DCLACTIOPN          
           MOVE CSH-MGN-SHRT-CD OF DCLACTIAST                                   
                                   TO CSH-MGN-SHRT-CD    OF DCLACTIOPN          
           MOVE SECURITY-ADP-NBR OF DCLACTIAST                                  
                                   TO SECURITY-ADP-NBR   OF DCLACTIOPN          
                                                                                
      ****REVERSE THE BUY/SELL SIGN FOR OCC                                     
           IF  WORK-POS-QTY < 0                                                 
               MOVE 'B'             TO BS-CD             OF DCLACTIOPN          
           ELSE                                                                 
               MOVE 'S'             TO BS-CD             OF DCLACTIOPN          
           END-IF                                                               
           MOVE WK-MS-PUT-CALL      TO PTCL-CD           OF DCLACTIOPN          
      ****OPEN/CLOSE IS ALWAYS CLOSE                                            
           MOVE 'C'                 TO OPTN-OPN-CLSD-CD  OF DCLACTIOPN          
                                                                                
           MOVE WK-MS-SYMBOL        TO SYM-CD            OF DCLACTIOPN          
           MOVE WK-MS-EXP-DATE(1:4) TO W-DATE-YEAR                              
           MOVE WK-MS-EXP-DATE(5:2) TO W-DATE-MM                                
           MOVE WK-MS-EXP-DATE(7:2) TO W-DATE-DD                                
LRM007     IF W-DATE-MM < '01' OR > '12'                                        
LRM007        DISPLAY 'EXP DATE MM NG ' W-DATE-MM                               
LRM007        MOVE '12' TO W-DATE-MM                                            
LRM007     END-IF.                                                              
LRM007     IF W-DATE-DD < '01' OR > '31'                                        
LRM007        DISPLAY 'EXP DATE DD NG ' W-DATE-DD                               
LRM007        MOVE '31' TO W-DATE-DD                                            
LRM007     END-IF.                                                              
LRM007     IF W-DATE-YEAR NOT NUMERIC                                           
LRM007        DISPLAY 'EXP DATE YEAR NG ' W-DATE-YEAR                           
LRM007        MOVE '9999' TO W-DATE-YEAR                                        
LRM007     END-IF.                                                              
           MOVE W-DATE              TO EXPTN-DT          OF DCLACTIOPN          
LRM020**** IF L-STREAM = 'Q'                                                    
LRM018       MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLACTIOPN         
LRM018       MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT   OF DCLACTIOPN         
LRM018**** ELSE                                                                 
      ****    MOVE WK-MS-OPT-PRC    TO STPRC-INTEGER-AMT OF DCLACTIOPN          
LRM007****    IF MSD-FRACTION-DECIMAL-IND = 'D'                                 
LRM007****       MOVE WK-MS-OPT-DECI-ROUNDED                                    
LRM007****                          TO STPRC-FRCTN-AMT   OF DCLACTIOPN          
LRM007****    ELSE                                                              
      ****       MOVE WK-MS-OPT-FRAC-1 TO STPRC-FRCTN-AMT OF DCLACTIOPN         
LRM018****    END-IF                                                            
LRM007**** END-IF.                                                              
           MOVE ' '                 TO DLVR-OCC-NBR      OF DCLACTIOPN          
           MOVE 'C'                 TO OPTN-ACCT-TYPE-CD OF DCLACTIOPN          
           MOVE ' '                 TO ACCT-SUB-CD       OF DCLACTIOPN          
           MOVE WK-MS-DESC1         TO OPTN-CMNT-TXT     OF DCLACTIOPN          
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIOPN          
           MOVE W-BH-NSCC-PEND-CD  TO NSCC-PEND-CD       OF DCLACTIOPN          
                                                                                
           INITIALIZE                W-OPT-DESC                                 
           IF  BS-CD OF DCLACTIOPN = 'B'                                        
                  MOVE 'BUY'          TO W-OPT-BUY-SELL                         
           ELSE                                                                 
                  MOVE 'SELL'         TO W-OPT-BUY-SELL                         
           END-IF                                                               
                                                                                
      ****OPEN/CLOSE IS ALWAYS CLOSE                                            
           MOVE 'CLOS'                TO W-OPT-OPEN-CLOSE                       
                                                                                
           IF  PTCL-CD OF DCLACTIOPN = 'C'                                      
                  MOVE 'CALL'         TO W-OPT-CALL-PUT                         
           ELSE                                                                 
                  MOVE 'PUT '         TO W-OPT-CALL-PUT                         
           END-IF                                                               
           MOVE SYM-CD OF DCLACTIOPN           TO W-OPT-SYMBOL                  
LRM020**** IF L-STREAM = 'Q'                                                    
LRM018        MOVE WK-MS-SYMBOL              TO W-OPT-UNDLY-SYMBOL              
LRM018        MOVE WK-MS-EXP-MM-NEW          TO W-OPT-EXPTN-MM-NEW              
LRM018        MOVE '/'                       TO W-OPT-EXPTN-S1-NEW              
LRM018                                          W-OPT-EXPTN-S2-NEW              
LRM018        MOVE WK-MS-EXP-DD-NEW          TO W-OPT-EXPTN-DD-NEW              
LRM018        MOVE WK-MS-EXP-YY-NEW          TO W-OPT-EXPTN-YY-NEW              
LRM018        MOVE WK-MS-OPT-PRC-NEW         TO W-OPT-STRIKE-PRIC-NEW           
LRM018        IF WK-MS-OPT-FRAC-NEW = ZEROS                                     
LRM018           MOVE SPACES                 TO W-OPT-STRIKE-FRAC-NEW           
LRM018        ELSE                                                              
LRM018           MOVE WK-MS-OPT-FRAC-NEW     TO W-OPT-STRIKE-FRAC-NEW           
LRM018       END-IF                                                             
LRM018**** ELSE                                                                 
      ****    MOVE MS-SYMBOL                   TO W-OPT-MS-SYMBOL               
      ****    MOVE WK-MS-EXP-DATE(5:2)         TO W-OPT-EXPTN-MM                
      ****    MOVE '/'                         TO W-OPT-EXPTN-S1                
      ****    MOVE WK-MS-EXP-DATE(1:2)         TO W-OPT-EXPTN-CC                
      ****    MOVE WK-MS-EXP-DATE(3:2)         TO W-OPT-EXPTN-YY                
      ****    MOVE WK-MS-OPT-PRC               TO W-STPRC-INTEGER-AMT           
      ****    MOVE WK-MS-OPT-FRAC-1            TO W-STPRC-FRCTN-AMT             
      ****    MOVE W-STPRC-INTEGER-AMT         TO W-OPT-STRIKE-PRIC             
      ****    IF   W-STPRC-FRCTN = '00'                                         
LRM007****    AND  MSD-FRACTION-DECIMAL-IND NOT = 'D'                           
      ****          MOVE ' '            TO W-OPT-STRIKE-FRAC                    
      ****          MOVE ' '            TO W-OPT-SLASH-8                        
      ****    ELSE                                                              
LRM007****          IF MSD-FRACTION-DECIMAL-IND = 'D'                           
LRM007****             MOVE '0'            TO W-OPT-STRIKE-FRAC                 
LRM007****          ELSE                                                        
      ****          MOVE W-STPRC-FRCTN (2:1)                                    
      ****                              TO W-OPT-STRIKE-FRAC                    
LRM007****          END-IF                                                      
      ****          MOVE '/8'           TO W-OPT-SLASH-8                        
      **** END-IF.                                                              
                                                                                
           IF (ASSET-DESC-TXT OF DCLACTIAST (1:60) = ' ')                       
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST (1:60)         
           ELSE                                                                 
            IF (ASSET-DESC-TXT OF DCLACTIAST (31:60) = ' ')                     
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST(31:60)         
            ELSE                                                                
             IF (ASSET-DESC-TXT OF DCLACTIAST (61:60) = ' ')                    
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST(61:60)         
             ELSE                                                               
               IF (ASSET-DESC-TXT OF DCLACTIAST (91:30) = ' ')                  
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST(91:30)         
               END-IF                                                           
             END-IF                                                             
            END-IF                                                              
           END-IF.                                                              
                                                                                
           IF WK-MS-EXP-DATE NOT >  W-OPT-EXP-DATE                              
    10       IF  W-EXP-OPT-ACT  > '0'                                           
    20         MOVE  'Y'       TO W-EXP-OPT-POSN                                
    30         DISPLAY ' EXP OPT FOR ' CUSHOL-KEY                               
    40         IF  W-EXP-OPT-ACT  = '2'                                         
    50           MOVE 'W'        TO NSCC-WTHLD-CD     OF DCLACTIAST             
                 MOVE 'H'        TO NSCC-PEND-CD      OF DCLACTIAST             
                 PERFORM 5850-INSERT-VRSDACC                                    
    60         END-IF                                                           
    70       END-IF                                                             
    80     END-IF.                                                              
                                                                                
DJ0004     MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
DJ0004                             TO ACAT-CONTROL-NBR   OF DCLACTIOPN          
DJ0004     MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
DJ0004                             TO ASSET-SEQ-NBR      OF DCLACTIOPN          
DJ0004     MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
DJ0004                             TO TRNFR-TYPE-CD      OF DCLACTIOPN.         
                                                                                
       5800-EXIT. EXIT.                                                         
      /                                                                         
       5850-INSERT-VRSDACC.                                                     
                                                                                
           INITIALIZE DCLVRSDACC                                                
           MOVE WF-CLIENT-NBR       TO CLIENT-NBR         OF DCLVRSDACC         
           MOVE WF-ACCT-CD          TO ACCT-CD            OF DCLVRSDACC         
           MOVE WF-BRANCH-CD        TO BRANCH-CD          OF DCLVRSDACC         
           MOVE ' '                 TO BRANCH-ORGNL-CD    OF DCLVRSDACC         
           MOVE ' '                 TO ACCT-ORGNL-CD      OF DCLVRSDACC         
           MOVE CMBL-REGISTERED-REP                                             
                                    TO RR-CD              OF DCLVRSDACC         
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP          OF DCLVRSDACC         
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVRSDACC         
           MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVRSDACC         
           MOVE 'CAT810'            TO PRGM-NM            OF DCLVRSDACC         
                                                                                
           EXEC SQL                                                             
              INSERT INTO VRSDACC                                               
                (  CLIENT_NBR                                                   
                  ,ACCT_CD                                                      
                  ,BRANCH_CD                                                    
                  ,BRANCH_ORGNL_CD                                              
                  ,ACCT_ORGNL_CD                                                
                  ,RR_CD                                                        
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM )                                                    
              VALUES                                                            
                ( :DCLVRSDACC.CLIENT-NBR                                        
                 ,:DCLVRSDACC.ACCT-CD                                           
                 ,:DCLVRSDACC.BRANCH-CD                                         
                 ,:DCLVRSDACC.BRANCH-ORGNL-CD                                   
                 ,:DCLVRSDACC.ACCT-ORGNL-CD                                     
                 ,:DCLVRSDACC.RR-CD                                             
                 ,:DCLVRSDACC.CRT-TMSTP                                         
                 ,:DCLVRSDACC.UPDT-TMSTP                                        
                 ,:DCLVRSDACC.CICS-TERM-ID-CD                                   
                 ,:DCLVRSDACC.PRGM-NM )                                         
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
                                                                                
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VRSDACC-INSERT-CNT                                    
               DISPLAY                                                          
                    ' ' CLIENT-NBR         OF DCLVRSDACC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                      ' VRSDACC INSERTED'                                       
                                                                                
               PERFORM 5860-INSERT-VRSDSEC                                      
                                                                                
           ELSE                                                                 
               ADD 1 TO W-VRSDACC-NOT-INSERT-CNT                                
               DISPLAY                                                          
                    ' ' CLIENT-NBR         OF DCLVRSDACC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                      ' VRSDACC NOT INSERTED'                                   
                      ' SQLCODE = ' W-DB2-SQLCODE                               
                                                                                
               MOVE 0                  TO W-VRSDSEC-ROW-CNT                     
                                                                                
               EXEC SQL                                                         
                 SELECT COUNT(*)                                                
                   INTO :W-VRSDSEC-ROW-CNT                                      
                   FROM VRSDSEC                                                 
                 WHERE CLIENT_NBR        = :WF-CLIENT-NBR                       
                   AND BRANCH_CD         = :WF-BRANCH-CD                        
                   AND ACCT_CD           = :WF-ACCT-CD                          
               END-EXEC                                                         
                                                                                
               IF  W-VRSDSEC-ROW-CNT > 0                                        
                 PERFORM 5860-INSERT-VRSDSEC                                    
               END-IF                                                           
           END-IF                                                               
           .                                                                    
                                                                                
       5860-INSERT-VRSDSEC.                                                     
                                                                                
           INITIALIZE DCLVRSDSEC                                                
           MOVE WF-CLIENT-NBR       TO CLIENT-NBR        OF DCLVRSDSEC          
           MOVE WF-ACCT-CD          TO ACCT-CD           OF DCLVRSDSEC          
           MOVE WF-BRANCH-CD        TO BRANCH-CD         OF DCLVRSDSEC          
           MOVE WK-MS-CUSIP         TO ISIN-SEC-ISSUE-CD OF DCLVRSDSEC          
           MOVE WK-MS-SEC           TO SECURITY-ADP-NBR  OF DCLVRSDSEC          
           MOVE 'CAT810'            TO PRGM-NM           OF DCLVRSDSEC          
           MOVE ' '                 TO CICS-TERM-ID-CD   OF DCLVRSDSEC          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLVRSDSEC          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLVRSDSEC          
                                                                                
           EXEC SQL                                                             
              INSERT INTO VRSDSEC                                               
                (  CLIENT_NBR                                                   
                  ,ACCT_CD                                                      
                  ,BRANCH_CD                                                    
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,SECURITY_ADP_NBR                                             
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP )                                                 
              VALUES                                                            
                ( :DCLVRSDSEC.CLIENT-NBR                                        
                 ,:DCLVRSDSEC.ACCT-CD                                           
                 ,:DCLVRSDSEC.BRANCH-CD                                         
                 ,:DCLVRSDSEC.ISIN-SEC-ISSUE-CD                                 
                 ,:DCLVRSDSEC.SECURITY-ADP-NBR                                  
                 ,:DCLVRSDSEC.PRGM-NM                                           
                 ,:DCLVRSDSEC.CICS-TERM-ID-CD                                   
                 ,:DCLVRSDSEC.CRT-TMSTP                                         
                 ,:DCLVRSDSEC.UPDT-TMSTP )                                      
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VRSDSEC-INSERT-CNT                                    
               DISPLAY                                                          
                    ' ' CLIENT-NBR         OF DCLVRSDSEC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSDSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSDSEC                        
                      ' VRSDSEC INSERTED'                                       
           ELSE                                                                 
               ADD 1 TO W-VRSDSEC-NOT-INSERT-CNT                                
               DISPLAY                                                          
                    ' ' CLIENT-NBR         OF DCLVRSDSEC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSDSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSDSEC                        
                      ' VRSDSEC NOT INSERTED'                                   
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               IF  SQLCODE  =  -803                                             
                   ADD 1 TO W-VRSDSEC-DUPE-CNT                                  
               ELSE                                                             
                   IF  SQLCODE  =  -530                                         
                       ADD 1 TO W-VRSDSEC-FOREIGN-KY-CNT                        
                   END-IF                                                       
               END-IF                                                           
           END-IF                                                               
           .                                                                    
                                                                                
       5910-MFMSD           SECTION.                                            
           MOVE '5910-MFMSD                    ' TO W-ROUTINE-1.                
                                                                                
DJ0016     MOVE 'N'          TO W-MFMSD-FND-SW                                  
           MOVE ' '                      TO W-FUND-SERV-ELIGIBLE-SW             
           MOVE ' '                      TO MFMSD-REC                           
           IF  WK-MS-SYMBOL > ' '                                               
               MOVE WK-MS-SYMBOL TO  MAIN-KEY                                   
           ELSE                                                                 
               MOVE WK-MS-CUSIP  TO  MAIN-KEY                                   
           END-IF.                                                              
                                                                                
           ADD 1 TO W-MFMSD-CNT                                                 
           READ MFMSD     INVALID KEY                                           
                MOVE 'N'         TO W-FUND-SERV-ELIGIBLE-SW                     
                  DISPLAY         '   MFMSD-NOTFND'                             
                              ' FOR ' MAIN-KEY                                  
                                  ' ' W-ASSET-PRC-CTGY-CD                       
                            '. NOT FUND SERV ELIGIBILE'                         
                GO  TO  5910-EXIT.                                              
                                                                                
           ADD 1 TO W-MFMSD-FND-CNT                                             
                                                                                
DJ0016     MOVE 'Y'          TO W-MFMSD-FND-SW                                  
           IF  NOT-FUND-SERV-ELIGIBLE                                           
               MOVE 'N'          TO W-FUND-SERV-ELIGIBLE-SW                     
               DISPLAY '   THIS MF IS NOT FUND SERV ELIGIBILE'                  
           ELSE                                                                 
               MOVE 'Y'          TO W-FUND-SERV-ELIGIBLE-SW                     
           END-IF.                                                              
                                                                                
       5910-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5920-BNWREGOP        SECTION.                                            
           MOVE '5920-BNWREGOP                 ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                    TO W-BNWREGOP-FND-SW                     
           MOVE ' '                    TO W-LEGG-MASON-FUND-SW                  
           MOVE ' '                    TO NTW-HOUSE-ACCOUNT                     
           MOVE 'N'                    TO NTW-HOUSE-ACCT-SW                     
           MOVE 'N'                    TO NTW-OMNIBUS-ACCT-SW                   
LRM050     MOVE 'N'                    TO NTW-SHWB-ACCT-FLAG.                   
           MOVE ' '                    TO BNWREGOP-RECORD                       
           MOVE CUSHOL-CLIENT-N        TO CLIENT-NO OF BNWREGOP-RECORD          
           MOVE CUSHOL-CPH-CUSIP       TO CUSIP-9   OF BNWREGOP-RECORD          
                                                                                
           ADD 1 TO W-BNWREGOP-CNT                                              
           READ BNWREGOP  INVALID KEY                                           
                MOVE 'N'         TO W-BNWREGOP-FND-SW                           
                MOVE 'N'         TO W-LEGG-MASON-FUND-SW                        
      **********DISPLAY '   BNWREGOP-NOTFND FOR ' REG-OPT-KEY-AREA              
                GO TO 5920-EXIT.                                                
                                                                                
           ADD 1 TO W-BNWREGOP-FND-CNT                                          
           MOVE 'Y'         TO W-BNWREGOP-FND-SW                                
      *****DISPLAY*'***BNWREGOP-FOUND**FOR*'*REG-OPT-KEY-AREA***********        
      ***************'*PROCESSING-CODE='********************************        
      *****************PROCESSING-CODE*OF*BNWREGOP-RECORD***************        
      ***************'*HOUSE-ACCOUNT='*REG-OP-HOUSE-ACCT****************        
                                                                                
LRM002     IF  BH-MF-ACTIVE                                                     
LRM002             AND                                                          
LRM002         BH-MFN-OMNIBUS-MULTI-PLAT-OPT  =  '1'                            
LRM002             AND                                                          
LRM002        (OMNIBUS-PROCESSING OF BNWREGOP-RECORD                            
LRM004             OR DST-DIRECT  OF BNWREGOP-RECORD                            
LRM022             OR PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD)                 
LRM002         MOVE 'R'                 TO NTWIO-FUNCTION-CODE                  
LRM002         MOVE CUSHOL-CLIENT-N     TO NTWIO-CLIENT                         
LRM002         MOVE CUSHOL-CPH-CUSIP    TO NTWIO-CUSIP-9                        
LRM002         IF MS-SYMBOL > SPACES                                            
LRM002            MOVE MS-SYMBOL        TO NTWIO-SYMBOL                         
LRM002         ELSE                                                             
LRM002            MOVE MS-CUSIP-NO      TO NTWIO-SYMBOL                         
LRM002         END-IF                                                           
DJ0007         MOVE W-CKDIGIT-ACCT-TC        TO NTWIO-ACCT-ID                   
LRM002         DISPLAY 'CALLING NTWIO WITH ' NTWIO-REQUEST-PARAMETERS           
LRM002         CALL  BNWNTWIO  USING NTWIO-PARAMETERS                           
LRM002         IF NTWIO-RETURN-OK                                               
LRM002            MOVE NTWIO-PROCESSING-CODE                                    
LRM002              TO PROCESSING-CODE OF BNWREGOP-RECORD                       
LRM002            DISPLAY 'BNWNTWIO OVERRIDE PROCESS CODE TO '                  
LRM002                 NTWIO-PROCESSING-CODE                                    
LRM002         ELSE                                                             
LRM002            DISPLAY 'NTWIO FAILED ' NTWIO-RETURN-CODE                     
LRM002         END-IF                                                           
LRM002     END-IF.                                                              
           IF  PROCESSING-CODE OF BNWREGOP-RECORD = 'L'                         
               MOVE 'Y'         TO W-LEGG-MASON-FUND-SW                         
               ADD 1 TO W-LEGG-CNT                                              
      *********DISPLAY '   THIS IS A LEGG-MASON PROPRIETARY FUND'               
      *********        ' ' WK-MS-SYMBOL                                         
           ELSE                                                                 
               MOVE 'N'         TO W-LEGG-MASON-FUND-SW                         
           END-IF.                                                              
                                                                                
           IF REG-OP-HOUSE-ACCT > SPACES                                        
              MOVE REG-OP-HOUSE-ACCT     TO  NTW-HOUSE-ACCOUNT                  
              SET NTW-HOUSE-ACCT         TO  TRUE                               
           END-IF                                                               
                                                                                
           IF OMNIBUS-PROCESSING OF BNWREGOP-RECORD                             
               ADD 1 TO W-OMNIBUS-CNT                                           
      *********DISPLAY '   THIS IS AN OMNIBUS-PROCESSING FUND'                  
      *********        ' ' WK-MS-SYMBOL                                         
              SET NTW-OMNIBUS-ACCT       TO  TRUE                               
           END-IF.                                                              
LRM004     IF DST-DIRECT         OF BNWREGOP-RECORD                             
               ADD 1 TO W-DST-MFE-CNT                                           
LRM004        SET NTW-DST-MFE-ACCT TO TRUE                                      
LRM004     END-IF.                                                              
LRM022     IF PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD                          
LRM022         ADD 1 TO W-PNC-SURPAS-CNT                                        
LRM022        SET NTW-PNC-SURPAS-ACCT TO TRUE                                   
LRM022     END-IF.                                                              
           IF TBL-MNT-SOURCE-NSCC                                               
              SET NTW-NSCCSRC-ACCT          TO  TRUE                            
           END-IF.                                                              
                                                                                
LRM050     IF TBL-MNT-SOURCE-SHWB                                               
LRM050        DISPLAY 'HAVE SHWB ON TBL MAINT ' CUSHOL-CPH-CUSIP                
LRM050        SET NTW-SHWB-ACCT          TO  TRUE                               
LRM050     END-IF.                                                              
       5920-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5930-GET-BNWMAST-INFO.                                                   
                                                                                
           MOVE ' '                      TO W-BNWMAST-FND-SW                    
           MOVE SPACES                   TO W-BNWMAST-KEY                       
           MOVE ZEROES                   TO W-BNWMAST-ACCT-ID                   
           MOVE CUSHOL-CLIENT-N          TO W-BNWMAST-CLT-NO                    
                                            W-BNWMAST-CLT                       
           MOVE CUSHOL-CPH-CUSIP         TO W-BNWMAST-CUSIP                     
           MOVE CUSHOL-BRANCH            TO W-BNWMAST-BRN-3                     
           MOVE CUSHOL-ACCOUNT           TO W-BNWMAST-ACCT-5                    
LRM048     IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                                   
LRM048     AND CUSHOL-ACCOUNT-TYPE NOT = '1'                                    
LRM048        MOVE '1'                      TO W-BNWMAST-TYPE                   
LRM048        MOVE W-CKDIGIT-CK-1           TO W-BNWMAST-CHK                    
LRM048        DISPLAY 'USE TYPE1 ON NTWMAST READ ' W-BNWMAST-KEY                
LRM048     ELSE                                                                 
              MOVE CUSHOL-ACCOUNT-TYPE      TO W-BNWMAST-TYPE                   
              MOVE W-CKDIGIT-CK             TO W-BNWMAST-CHK                    
LRM048     END-IF.                                                              
                                                                                
           MOVE 0                        TO W-BNWMAST-PAYABLE-SEQ-NO            
           MOVE SPACES                   TO BNWMAST-REC                         
           MOVE W-BNWMAST-KEY            TO MAST-KEY-AREA                       
TEST       DISPLAY 'ABOUT TO READ BNWMAST W/KEY ' W-BNWMAST-KEY                 
                                                                                
           READ BNWMAST.                                                        
                                                                                
           ADD 1 TO W-BNWMAST-CNT                                               
                                                                                
           IF  BNWMAST-OKAY                                                     
               MOVE 'Y'               TO W-BNWMAST-FND-SW                       
               ADD 1 TO W-BNWMAST-FND-CNT                                       
               DISPLAY         '   BNWMAST--FOUND  FOR '                        
                                   MAST-KEY-AREA                                
                                 ' LEVEL=' MATRIX-LEVEL                         
           ELSE                                                                 
               IF BNWMAST-END-OF-FILE                                           
               OR BNWMAST-NOT-FOUND                                             
                  MOVE 'N'                 TO W-BNWMAST-FND-SW                  
      ************DISPLAY******'***BNWMAST--NOTFND*FOR*'****************        
      *****************************MAST-KEY-AREA************************        
               ELSE                                                             
                  DISPLAY ' ** CAT810 - BNWMAST FILE, READ ERROR'               
                          ' FILE-STATUS = ' BNWMAST-STATUS                      
                  DISPLAY 'MAST-KEY-AREA = ' MAST-KEY-AREA                      
                  MOVE +3107    TO ABEND-CODE                                   
                  CALL ABEND USING ABEND-CODE                                   
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5930-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5940-FORMAT-MF-RTN.                                                      
           MOVE '5940-FORMAT-MF-RTN             ' TO W-ROUTINE-1.               
                                                                                
           MOVE ' '                                      TO DCLACTIMF           
           MOVE CLIENT-NBR OF DCLACTIAST                                        
                                   TO CLIENT-NBR         OF DCLACTIMF           
           MOVE RCV-NBR OF DCLACTIAST                                           
                                   TO RCV-NBR            OF DCLACTIMF           
           MOVE DLVR-NBR OF DCLACTIAST                                          
                                   TO DLVR-NBR           OF DCLACTIMF           
           MOVE ACCT-RCV-NBR OF DCLACTIAST                                      
                                   TO ACCT-RCV-NBR       OF DCLACTIMF           
           MOVE ACCT-DLVR-NBR OF DCLACTIAST                                     
                                   TO ACCT-DLVR-NBR      OF DCLACTIMF           
           MOVE STTLM-LCTN-CD OF DCLACTIAST                                     
                                   TO STTLM-LCTN-CD      OF DCLACTIMF           
           MOVE ISIN-CNTRY-CD OF DCLACTIAST                                     
                                   TO ISIN-CNTRY-CD      OF DCLACTIMF           
           MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST                                 
                                   TO ISIN-SEC-ISSUE-CD  OF DCLACTIMF           
           MOVE ISIN-SEC-CDG-CD OF DCLACTIAST                                   
                                   TO ISIN-SEC-CDG-CD    OF DCLACTIMF           
           MOVE CSH-MGN-SHRT-CD OF DCLACTIAST                                   
                                   TO CSH-MGN-SHRT-CD    OF DCLACTIMF           
           MOVE SECURITY-ADP-NBR OF DCLACTIAST                                  
                                   TO SECURITY-ADP-NBR   OF DCLACTIMF           
           MOVE WF-DSTBN-SIDE-CD   TO DSTBN-SIDE-CD      OF DCLACTIMF           
           MOVE WF-PRCS-DT          TO PRCS-DT           OF DCLACTIMF           
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIMF           
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIMF           
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIMF.          
                                                                                
      ***FUND CUSTOMER ACCOUNT NUMBER -                                         
      ***FNBR - DEFAULT = HOUSE ACCOUNT FROM TABLE MAINTENANCE                  
           MOVE NTW-HOUSE-ACCOUNT        TO FNBR OF DCLACTIMF                   
LRM022     IF  PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                  
               CONTINUE                                                         
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
               IF (MATRIX-LEVEL = '1' OR '2' OR '3' OR '4')                     
DJ0007          IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                              
DJ0007            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0007                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0007            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
DJ0007          ELSE                                                            
DJ0007            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0007                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0007            MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
DJ0007          END-IF                                                          
               ELSE                                                             
                 IF MATRIX-LEVEL = '6'                                          
                    MOVE CUST-ACCT-NO       TO FNBR OF DCLACTIMF                
                 END-IF                                                         
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
           IF  FNBR OF DCLACTIMF = ' '                                          
DJ0007         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0007            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0007                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0007            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
DJ0007         ELSE                                                             
                  MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
                                            TO FNBR OF DCLACTIMF (1:3)          
                  MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
DJ0007         END-IF                                                           
           END-IF.                                                              
                                                                                
      ***FUND ACCOUNT NUMBER                                                    
      ***B1#434608 1 = BBBAAAAATC                                               
           IF  BH-ACAT-MF-REG-FUND-ACCT = '1'                                   
DJ0007         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0007            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (1:10)         
DJ0007         ELSE                                                             
                  MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (1:10)         
DJ0007         END-IF                                                           
           END-IF.                                                              
                                                                                
      ***BOOK/PHYSICAL SHARE INDICATOR -                                        
      ***BK-PHSCL-SHR-CD - DEFAULT = 1                                          
           MOVE '1'                    TO BK-PHSCL-SHR-CD OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT = ' '                                          
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
                   MOVE '0'            TO BK-PHSCL-SHR-CD OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***NETWORK CONTROL INDICATOR -                                            
      ***NTWRK-CNTL-CD   - DEFAULT = 0                                          
           MOVE '0'                     TO NTWRK-CNTL-CD  OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT = ' '                                          
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
                   MOVE MATRIX-LEVEL    TO NTWRK-CNTL-CD  OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***ACCOUNT TYPE INDICATOR -                                               
      ***ACCT-TYPE-CD    - DEFAULT = 1                                          
           MOVE  '1'                    TO ACCT-TYPE-CD   OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT NOT = ' '                                      
LRM050     OR NTW-SHWB-ACCT                                                     
               MOVE  '2'                TO ACCT-TYPE-CD   OF DCLACTIMF          
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '3'                                           
                   MOVE  '2'            TO ACCT-TYPE-CD   OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***DIVIDEND CODE -                                                        
      ***DVDND-CD        - DEFAULT = 1 = R,R,R                                  
           MOVE 'R'    TO DVDND-CD OF DCLACTIMF                                 
           MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                                 
           MOVE 'R'    TO STCG-CD  OF DCLACTIMF                                 
           IF  W-BNWMAST-FOUND                                                  
                EVALUATE DIVIDEND-CODE                                          
                    WHEN '0'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '1'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '2'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '3'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '4'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '5'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '6'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '7'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                END-EVALUATE                                                    
           END-IF.                                                              
                                                                                
      ***DIVIDEND PAYEE INDICATOR -                                             
      ***DVDND-PAYEE-CD  - DEFAULT = N                                          
           MOVE 'N'                     TO DVDND-PAYEE-CD OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT NOT = ' '                                      
LRM050     OR NTW-SHWB-ACCT                                                     
               MOVE '1'                 TO DVDND-PAYEE-CD OF DCLACTIMF          
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
                IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
                   IF PAYABLE-INFO-INDICATOR  = '0'                             
                      MOVE '0'          TO DVDND-PAYEE-CD OF DCLACTIMF          
                   ELSE                                                         
                      IF PAYABLE-INFO-INDICATOR  = '3'                          
                         MOVE '1'       TO DVDND-PAYEE-CD OF DCLACTIMF          
                      END-IF                                                    
                   END-IF                                                       
                ELSE                                                            
                   MOVE BH-ACAT-MF-REG-DIVD-PAYEE-IND                           
                                        TO DVDND-PAYEE-CD OF DCLACTIMF          
                END-IF                                                          
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***EXECUTING BROKER -                                                     
DJ0016***BRKR-EXCTG-NBR: DEFAULT=BH-ACAT-MF-REGIST-RECEIVE-BKR(434636)          
DJ0016***BH-MF-EXBR-OPTION = '1', USE MFEXBR FILE                               
DJ0016***PROCESSING CODE = 'O', USE B1 434636.                                  
DJ0016***ELSE,USE B1 540167.IF NOT ON B1 540167, USE B1 434636                  
DJ0016     MOVE 'N'                    TO W-MFEXBR-FND-SW                       
DJ0016     IF BH-MF-EXBR-OPTION = '1'                                           
DJ0016         PERFORM 5951-GET-MFEXBR THRU 5951-EXIT                           
DJ0016         IF W-MFEXBR-FND-SW = 'Y'                                         
DJ0016            MOVE EXBR-EXECUTING-BROKER                                    
DJ0016                                 TO BRKR-EXCTG-NBR OF DCLACTIMF           
DJ0016         END-IF                                                           
DJ0016     END-IF                                                               
DJ0016     IF W-MFEXBR-FND-SW = 'N'                                             
             MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                            
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             IF BH-ACAT-MF-REGIST-RECEIVE-BKR > '0000'                          
                MOVE BH-ACAT-MF-REGIST-RECEIVE-BKR                              
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             END-IF                                                             
LRM022       IF PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                 
                CONTINUE                                                        
             ELSE                                                               
               MOVE CUSHOL-BRANCH       TO WK-BR                                
               PERFORM 5950-GET-EXEC-BRKR THRU 5950-EXIT                        
               IF  W-BH-MF3-SEBR-CLEAR-FOUND                                    
                   MOVE W-BH-MF3-SEBR-CLEAR                                     
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
DJ0016     END-IF.                                                              
LRM050     IF NTW-SHWB-ACCT                                                     
LRM050        MOVE '0164'               TO BRKR-EXCTG-NBR OF DCLACTIMF          
LRM050     END-IF.                                                              
                                                                                
      ***FULL/PARTIAL -                                                         
      ***MF-FULL-PRTL-CD - DEFAULT= 2                                           
           MOVE '2'                TO MF-FULL-PRTL-CD    OF DCLACTIMF           
LRM041*** THE FOLLOWING 7 LINES COMMENTED OUT TO ALWAYS USE '2' PRTL.           
LRM041***  IF  NTW-HOUSE-ACCOUNT = ' '                                          
LRM041***    IF W-BNWMAST-FOUND                                                 
LRM041***       IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
LRM041***          MOVE '1'        TO MF-FULL-PRTL-CD    OF DCLACTIMF           
LRM041***       END-IF                                                          
LRM041***    END-IF                                                             
LRM041***  END-IF.                                                              
                                                                                
      ***OVERRIDES FOR O-NSCC:                                                  
LRM004     IF NTW-DST-MFE-ACCT                                                  
LRM004       AND (WS-DST-BOX-ACCT-TC NOT = SPACE AND LOW-VALUE)                 
LRM004       DISPLAY 'APPLY O-NSCC B1 537601 TO FUND NBR: '                     
LRM004                WS-DST-BOX-ACCT-TC                                        
DJ0007       MOVE CLIENT-NBR OF DCLACTIAST (2:3)                                
LRM004                               TO FNBR OF DCLACTIMF (1:3)                 
LRM004       MOVE WS-DST-BOX-ACCT-TC TO FNBR OF DCLACTIMF (4: )                 
LRM004       MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM004       MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM004     ELSE                                                                 
LRM022     IF NTW-PNC-SURPAS-ACCT                                               
LRM022       IF  W-BNWMAST-FOUND                                                
LRM022       AND MATRIX-LEVEL = '6'                                             
LRM022       AND (WS-PNC-SURPAS-BOX-TC NOT = SPACE AND LOW-VALUE)               
LRM022          DISPLAY 'APPLY O-NSCC B1 540238 TO FUND NBR: '                  
LRM022                WS-PNC-SURPAS-BOX-TC                                      
LRM022          MOVE CLIENT-NBR OF DCLACTIAST (2:3)                             
LRM022                                    TO FNBR OF DCLACTIMF (1:3)            
LRM022          MOVE WS-PNC-SURPAS-BOX-TC TO FNBR OF DCLACTIMF (4: )            
LRM022       END-IF                                                             
LRM022       MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM022       MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM022       IF TBL-TENDER                                                      
LRM022          MOVE 'C'    TO DVDND-CD OF DCLACTIMF                            
LRM022          MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                            
LRM022          MOVE 'C'    TO STCG-CD  OF DCLACTIMF                            
LRM022       ELSE                                                               
LRM022          MOVE 'R'    TO DVDND-CD OF DCLACTIMF                            
LRM022          MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                            
LRM022          MOVE 'R'    TO STCG-CD  OF DCLACTIMF                            
LRM022       END-IF                                                             
LRM022       MOVE  '2'            TO ACCT-TYPE-CD     OF DCLACTIMF              
LRM022       MOVE  '1'            TO DVDND-PAYEE-CD   OF DCLACTIMF              
LRM022       MOVE  '2'            TO MF-FULL-PRTL-CD  OF DCLACTIMF              
LRM004     ELSE                                                                 
             IF     NTW-NSCCSRC-ACCT                                            
             AND (NS-BRCH-ACCT-TC NOT = SPACE AND LOW-VALUE)                    
               DISPLAY 'APPLY O-NSCC B1 537596 TO FUND NBR: '                   
                        NS-BRCH-ACCT-TC                                         
DJ0007         MOVE CLIENT-NBR OF DCLACTIAST (2:3)                              
                                     TO FNBR OF DCLACTIMF (1:3)                 
               MOVE NS-BRCH-ACCT-TC  TO FNBR OF DCLACTIMF (4: )                 
               MOVE '0'              TO BK-PHSCL-SHR-CD OF DCLACTIMF            
               MOVE '3'              TO NTWRK-CNTL-CD  OF DCLACTIMF             
             END-IF                                                             
           END-IF.                                                              
                                                                                
LRM050     IF NTW-SHWB-ACCT                                                     
LRM050        DISPLAY 'SHWB FUND/FNBR LOOKUP ' CUSHOL-CPH-CUSIP                 
LRM050        DISPLAY '  MATRIX=' MATRIX-LEVEL                                  
LRM050                ' WAIVE-ACCT=' TBL-WAIVE-ACCT                             
LRM050                ' HOUSE-ACCOUNT=' REG-OP-HOUSE-ACCT                       
LRM050        DISPLAY '  WRAP-ACCT MUST BE 5,HAVE ' NAV-ACCT-INDICATOR          
LRM050        IF MATRIX-LEVEL = '3'                                             
LRM050           DISPLAY '  MATRIX=3, USE LEVEL3 VALUES '                       
LRM050                FNBR OF DCLACTIMF                                         
LRM050        ELSE                                                              
LRM050        IF NAV-WRAP-FEE-ACCOUNT                                           
LRM050          IF TBL-WAIVE-ACCT > SPACES                                      
LRM050          AND MATRIX-LEVEL = '6'                                          
LRM050             MOVE TBL-WAIVE-ACCT       TO FNBR OF DCLACTIMF               
LRM050             DISPLAY '  RULE1 WAIVE ACCOUNT FOR FNBR'                     
LRM050          ELSE                                                            
LRM050             IF REG-OP-HOUSE-ACCT > SPACES                                
LRM050                MOVE REG-OP-HOUSE-ACCT    TO FNBR OF DCLACTIMF            
LRM050                DISPLAY '  RULE2 HOUSE ACCOUNT FOR FNBR/NO WAIVE'         
LRM050             END-IF                                                       
LRM050        ELSE                                                              
LRM050        IF REG-OP-HOUSE-ACCT > SPACES                                     
LRM050           MOVE REG-OP-HOUSE-ACCT    TO FNBR OF DCLACTIMF                 
LRM050           DISPLAY '  RULE3 HOUSE ACCOUNT FOR FNBR/NON WAIVE'             
LRM050        ELSE                                                              
LRM050        IF TBL-WAIVE-ACCT > SPACES                                        
LRM050           MOVE TBL-WAIVE-ACCT       TO FNBR OF DCLACTIMF                 
LRM050            DISPLAY '  RULE4 WAIVE ACCOUNT FOR FNBR/NO HOUSE'             
LRM050     END-IF.                                                              
                                                                                
LRM050     IF NTW-SHWB-ACCT                                                     
LRM050       MOVE '1'               TO BK-PHSCL-SHR-CD OF DCLACTIMF             
LRM050       MOVE '3'               TO NTWRK-CNTL-CD  OF DCLACTIMF              
LRM050       MOVE 'S'               TO ACCT-TYPE-STTS-CD OF DCLACTIMF           
LRM055       MOVE '1'               TO FND-AGNT-CD    OF DCLACTIMF              
LRM050     END-IF.                                                              
                                                                                
DJ0004     MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
DJ0004                              TO ACAT-CONTROL-NBR  OF DCLACTIMF           
DJ0004     MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
DJ0004                              TO ASSET-SEQ-NBR     OF DCLACTIMF           
DJ0004     MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
DJ0004                              TO TRNFR-TYPE-CD     OF DCLACTIMF           
DJ0004     MOVE ' '                TO FCST-ACCT-RCVR-NBR OF DCLACTIMF.          
                                                                                
       5940-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
DJ0016*****************************************************************         
DJ0016*  USE THE EXECUTING BROKER NUMBER(BH-MF3-SEBR-CLEAR) FROM                
DJ0016*  B1 540167 = MF3 SUB-EXECUTOR,BKR OF RECORD.                            
DJ0016*  SEARCH USING THE BRANCH NUMBER OF THE ACCOUNT.                         
DJ0016*****************************************************************         
       5950-GET-EXEC-BRKR.                                                      
                                                                                
           MOVE ' ' TO W-BH-MF3-SEBR-CLEAR                                      
           MOVE 'N' TO W-BH-MF3-SEBR-CLEAR-SW.                                  
                                                                                
           IF  BH-MF3-SUB-EXEC-BKR-REC-NO  = 0                                  
               GO TO 5950-EXIT.                                                 
           MOVE 1 TO W-SUB1.                                                    
       5950-LOOP.                                                               
           IF  WK-BR      >= BH-MF3-SEBR-BR-LO           (W-SUB1) AND           
               WK-BR      <= BH-MF3-SEBR-BR-HI           (W-SUB1)               
               MOVE BH-MF3-SEBR-CLEAR(W-SUB1) TO W-BH-MF3-SEBR-CLEAR            
               MOVE 'Y' TO W-BH-MF3-SEBR-CLEAR-SW                               
           ELSE                                                                 
               IF  W-SUB1 < BH-MF3-SUB-EXEC-BKR-REC-NO                          
                   ADD 1 TO W-SUB1                                              
               GO TO 5950-LOOP                                                  
           END-IF.                                                              
                                                                                
       5950-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
DJ0016*****************************************************************         
DJ0016*  IF B1 537483(BH-MF-EXBR-OPTION)=1                                      
DJ0016*  GET THE EXECUTING BROKER NUMBER FROM THE MFEXBR FILE.                  
DJ0016*  USE THE FUND NUMBER FROM MFMSD TO READ THE MFEXBR FILE.                
DJ0016*****************************************************************         
DJ0016 5951-GET-MFEXBR.                                                         
DJ0016     MOVE '5951-GET-MFEXBR               ' TO W-ROUTINE-1.                
DJ0016                                                                          
DJ0016     IF W-MFMSD-FND-SW = 'Y'                                              
DJ0016        MOVE ' '                   TO MFEXBR-REC                          
DJ0016        MOVE WF-CLIENT-NBR (2:3)   TO EXBR-CLIENT                         
DJ0016        MOVE WF-BRANCH-CD          TO EXBR-BRANCH                         
DJ0016        MOVE FUND-NO OF MFMSD-REC  TO EXBR-FUND-NO                        
DJ0016        ADD 1 TO W-MFEXBR-CNT                                             
DJ0016        READ MFEXBR                                                       
DJ0016        IF MFEXBR-STATUS = '00'                                           
DJ0016           ADD 1 TO W-MFEXBR-FND-CNT                                      
DJ0016           MOVE 'Y'                TO W-MFEXBR-FND-SW                     
DJ0016           DISPLAY 'MFEXBR FND: ' EXBR-CLIENT                             
DJ0016                          ' BRN:' EXBR-BRANCH                             
DJ0016                         ' SEC: ' MAIN-KEY                                
DJ0016                         ' FUND:' EXBR-FUND-NO                            
DJ0016                         ' BRKR:' EXBR-EXECUTING-BROKER                   
DJ0016        END-IF                                                            
DJ0016     END-IF.                                                              
DJ0016                                                                          
DJ0016 5951-EXIT.                                                               
DJ0016     EXIT.                                                                
      /                                                                         
      *****************************************************************         
      *  FOR NEW ASSETS FROM OTHER BROKERS,                                     
      *  ADD THE NEW ROW TO THE ACTIVE-TABLE                                    
      *****************************************************************         
       6000-INSERT-ACTIAST SECTION.                                             
           MOVE '6000-INSERT-ACTIAST           ' TO W-ROUTINE-1.                
                                                                                
DJ0015****CHECK TO SEE IF THERE ARE MEMO('45') ASSETS                           
DJ0015     IF STTLM-LCTN-CD OF DCLACTIAST = '45'                                
DJ0015        ADD 1 TO W-IS-MEMO-CNT                                            
DJ0015     ELSE                                                                 
DJ0015        ADD 1 TO W-NOT-MEMO-CNT                                           
DJ0015     END-IF                                                               
                                                                                
           MOVE ' ' TO W-ACTIAST-INSERT-SW.                                     
           MOVE ISIN-CNTRY-CD     OF DCLACTIAST TO WF-ISIN-CNTRY-CD             
           MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST TO WF-ISIN-SEC-ISSUE-CD         
           MOVE ISIN-SEC-CDG-CD   OF DCLACTIAST TO WF-ISIN-SEC-CDG-CD           
           MOVE STTLM-LCTN-CD     OF DCLACTIAST TO WF-STTLM-LCTN-CD             
           MOVE CSH-MGN-SHRT-CD   OF DCLACTIAST TO WF-CSH-MGN-SHRT-CD           
                                                                                
CSG001*    MOVE ASSET-DESC-TXT OF DCLACTIAST TO W-TXT                           
CSG001*    PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > 140                
CSG001*           EVALUATE W-TXT-BYTE (W-SUB1)                                  
CSG001*               WHEN '~'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN '_'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN '`'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN '{'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN '}'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN '|'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN '^'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN ''   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*               WHEN '\'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
CSG001*           END-EVALUATE                                                  
CSG001*    END-PERFORM                                                          
CSG001*    MOVE W-TXT TO ASSET-DESC-TXT OF DCLACTIAST                           
CSG001                                                                          
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLACTIAST TO W-ASSET-DESC-TXT                
CSG001     PERFORM 6030-EDIT-ASSET-DESC-TXT  THRU 6030-EXIT                     
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLACTIAST                
CSG001                                                                          
LRM024     MOVE W-ASSET-CMNT-TXT TO ASSET-CMNT-TXT OF DCLACTIAST                
                                                                                
LRM058     IF  STTLM-LCTN-CD OF DCLACTIAST = '35' OR '40' OR '45'               
               CONTINUE                                                         
           ELSE                                                                 
               IF  ISIN-SEC-ISSUE-CD OF DCLACTIAST > ' '                        
               AND CUSHOL-CPH-CUSIP (10:3)       = '090'                        
LRM027         AND (BH-ACAT-WH-ASSET-CONTRA-CUSIP = '1' OR '3')                 
                   MOVE 'W'          TO NSCC-WTHLD-CD OF DCLACTIAST             
LRM058             MOVE 'C'          TO WHI-STTS-CD   OF DCLACTIAST             
                   DISPLAY '   WITHHELD-CUSIP:'                                 
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                            ' CUS=' CUSHOL-CPH-CUSIP                            
                            ' SEC=' CUSHOL-SECURITY-NO (1:7)                    
               END-IF                                                           
           END-IF                                                               
                                                                                
DJ0014     EVALUATE BH-ACAT-ASCENDIS-USER                                       
DJ0014        WHEN '1'   MOVE 'A'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0014        WHEN '2'   MOVE 'P'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0014        WHEN OTHER MOVE ' '  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0014     END-EVALUATE                                                         
                                                                                
LRM025     IF FOREIGN-FEE-ELIGIBLE                                              
LRM025        MOVE 'Y' TO FOREIGN-FEE-IND OF DCLACTIAST                         
LRM025        ADD 1 TO W-FRGN-ASSET-CNT                                         
LRM025     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTIAST                                              
                 (                                                              
                   CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,RCRD_STTS_CD                                                 
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,TRANS_TYPE_STTS_CD                                           
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,CONTROL_NBR_STS_CD                                           
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
                  ,TRANS_RFRN_STTS_CD                                           
                  ,AST_SEQ_NBR_STS_CD                                           
                  ,AST_PRC_CTG_STS_CD                                           
                  ,OPTN_CTGY_STTS_CD                                            
                  ,STTLM_LCTN_STTS_CD                                           
                  ,STTLM_RSN_STTS_CD                                            
                  ,ISIN_CNTRY_STTS_CD                                           
                  ,ISIN_SEC_IS_STS_CD                                           
                  ,ISIN_SEC_CD_STS_CD                                           
                  ,ASSET_DESC_STTS_CD                                           
                  ,ASSET_RQST_STS_CD                                            
                  ,AST_RQ_TRAN_STS_CD                                           
                  ,ASSET_QTY_STTS_CD                                            
                  ,ASSET_PCT_STTS_CD                                            
                  ,PSTN_CD_STTS_CD                                              
                  ,ISO_CRNCY_STTS_CD                                            
                  ,ASSET_AMT_STTS_CD                                            
                  ,BEARER_BND_STTS_CD                                           
                  ,CSH_MRG_SHT_STS_CD                                           
                  ,WHI_STTS_CD                                                  
                  ,TRN_TYP_RSN_STS_CD                                           
                  ,MBS_SERIAL_STTS_CD                                           
                  ,ASSET_CMNT_STTS_CD                                           
                  ,PHSCL_SEQ_NBR                                                
                  ,LGCL_SEQ_NBR                                                 
                  ,TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_CD                                                
                  ,SBMTG_PRTCP_NBR                                              
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,TRANS_RFRN_ID_CD                                             
                  ,ASSET_PRC_CTGY_CD                                            
                  ,OPTN_CTGY_CD                                                 
                  ,STTLM_LCTN_CD                                                
                  ,STTLM_RSN_CD                                                 
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,PSTN_CD                                                      
                  ,ISO_CRNCY_CD                                                 
                  ,ASSET_AMT                                                    
                  ,BEARER_BOND_CD                                               
                  ,CSH_MGN_SHRT_CD                                              
                  ,WHI_CD                                                       
                  ,TRNFR_TYPE_RSN_CD                                            
                  ,MBS_SERIAL_NBR                                               
                  ,ASSET_CMNT_TXT                                               
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,SECURITY_ADP_NBR                                             
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_WTHLD_CD                                                
LRM025            ,FOREIGN_FEE_IND                                              
LRM043            ,CRNCY_CD                                                     
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTIAST.CLIENT-NBR                                       
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIAST.ASSET-SEQ-NBR                                    
                  ,:DCLACTIAST.RCRD-STTS-CD                                     
                  ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
                  ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
                  ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
                  ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
                  ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
                  ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
                  ,:DCLACTIAST.LGCL-SEQ-NBR                                     
                  ,:DCLACTIAST.TRANS-TYPE-CD                                    
                  ,:DCLACTIAST.TRNFR-TYPE-CD                                    
                  ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTIAST.RCV-NBR                                          
                  ,:DCLACTIAST.DLVR-NBR                                         
                  ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
                  ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
                  ,:DCLACTIAST.OPTN-CTGY-CD                                     
                  ,:DCLACTIAST.STTLM-LCTN-CD                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:DCLACTIAST.ISIN-CNTRY-CD                                    
                  ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIAST.ASSET-DESC-TXT                                   
                  ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                  ,:DCLACTIAST.AST-RQST-TRANS-CD                                
                  ,:DCLACTIAST.ASSET-QTY                                        
                  ,:DCLACTIAST.ASSET-PCT                                        
                  ,:DCLACTIAST.PSTN-CD                                          
                  ,:DCLACTIAST.ISO-CRNCY-CD                                     
                  ,:DCLACTIAST.ASSET-AMT                                        
                  ,:DCLACTIAST.BEARER-BOND-CD                                   
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIAST.WHI-CD                                           
                  ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
                  ,:DCLACTIAST.MBS-SERIAL-NBR                                   
                  ,:DCLACTIAST.ASSET-CMNT-TXT                                   
                  ,:DCLACTIAST.PRGM-NM                                          
                  ,:DCLACTIAST.CICS-TERM-ID-CD                                  
                  ,:DCLACTIAST.CRT-TMSTP                                        
                  ,:DCLACTIAST.UPDT-TMSTP                                       
                  ,:DCLACTIAST.ACCT-DLVR-NBR                                    
                  ,:DCLACTIAST.ACCT-RCV-NBR                                     
                  ,:DCLACTIAST.SECURITY-ADP-NBR                                 
                  ,:DCLACTIAST.NSCC-ACK-IND                                     
                  ,:DCLACTIAST.NSCC-PEND-CD                                     
                  ,:DCLACTIAST.NSCC-WTHLD-CD                                    
LRM025            ,:DCLACTIAST.FOREIGN-FEE-IND                                  
LRM043            ,:DCLACTIAST.CRNCY-CD                                         
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-ADD-CNT                                       
               MOVE 'Y' TO W-ACTIAST-INSERT-SW                                  
               MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                       
                                                                                
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-ADD-CNT                                   
                   DISPLAY '   ACTIAST NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
               IF  SQLCODE  =  -803                                             
                   PERFORM 6300-UPDATE-ACTIAST THRU 6300-EXIT                   
                   MOVE 'Y' TO W-ACTIAST-INSERT-SW                              
                   MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                   
               ELSE                                                             
                   DISPLAY '   ACTIAST PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR INSERTING A ROW INTO ACTIAST'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT810: DCLACTIAST  ='                              
                        '(' DCLACTIAST ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
LRM023******************************************************************        
LRM023*  CREATE AUDIT ROW WITH CLIENT NUMBER W### TO DRIVE X SCREEN             
LRM023*  UPDATE IN CAT755.                                                      
LRM023*****************************************************************         
LRM023 6020-INSERT-ACTIAST-AUD  SECTION.                                        
LRM023     MOVE '6020-INSERT-ACTIAST-AUD       ' TO W-ROUTINE-1.                
LRM023                                                                          
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLACTIAST   TO W-ASSET-DESC-TXT              
CSG001     PERFORM 6030-EDIT-ASSET-DESC-TXT    THRU 6030-EXIT                   
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLACTIAST                
CSG001                                                                          
LRM034     IF W-MATURE-CALLED-BOND-SW  = 'Y'                                    
LRM023        MOVE  'W'                        TO W-CLIENT-NBR-AUD-PFX          
LRM034     ELSE                                                                 
LRM034        MOVE  'L'                        TO W-CLIENT-NBR-AUD-PFX          
LRM034     END-IF.                                                              
LRM023     MOVE  CLIENT-NBR OF DCLACTIAST (2:3) TO W-CLIENT-NBR-AUD-SFX.        
LRM023                                                                          
LRM023     EXEC SQL                                                             
LRM023         INSERT INTO ACTIAST                                              
LRM023           (                                                              
LRM023             CLIENT_NBR                                                   
LRM023            ,ACAT_CONTROL_NBR                                             
LRM023            ,ASSET_SEQ_NBR                                                
LRM023            ,RCRD_STTS_CD                                                 
LRM023            ,RCRD_LNGTH_STTS_CD                                           
LRM023            ,PHSCL_SEQ_STTS_CD                                            
LRM023            ,LGCL_SEQ_NR_STS_CD                                           
LRM023            ,TRANS_TYPE_STTS_CD                                           
LRM023            ,TRNFR_TYPE_STTS_CD                                           
LRM023            ,CONTROL_NBR_STS_CD                                           
LRM023            ,SBMT_PRT_NR_STS_CD                                           
LRM023            ,RCV_NBR_STTS_CD                                              
LRM023            ,DLVR_NBR_STTS_CD                                             
LRM023            ,TRANS_RFRN_STTS_CD                                           
LRM023            ,AST_SEQ_NBR_STS_CD                                           
LRM023            ,AST_PRC_CTG_STS_CD                                           
LRM023            ,OPTN_CTGY_STTS_CD                                            
LRM023            ,STTLM_LCTN_STTS_CD                                           
LRM023            ,STTLM_RSN_STTS_CD                                            
LRM023            ,ISIN_CNTRY_STTS_CD                                           
LRM023            ,ISIN_SEC_IS_STS_CD                                           
LRM023            ,ISIN_SEC_CD_STS_CD                                           
LRM023            ,ASSET_DESC_STTS_CD                                           
LRM023            ,ASSET_RQST_STS_CD                                            
LRM023            ,AST_RQ_TRAN_STS_CD                                           
LRM023            ,ASSET_QTY_STTS_CD                                            
LRM023            ,ASSET_PCT_STTS_CD                                            
LRM023            ,PSTN_CD_STTS_CD                                              
LRM023            ,ISO_CRNCY_STTS_CD                                            
LRM023            ,ASSET_AMT_STTS_CD                                            
LRM023            ,BEARER_BND_STTS_CD                                           
LRM023            ,CSH_MRG_SHT_STS_CD                                           
LRM023            ,WHI_STTS_CD                                                  
LRM023            ,TRN_TYP_RSN_STS_CD                                           
LRM023            ,MBS_SERIAL_STTS_CD                                           
LRM023            ,ASSET_CMNT_STTS_CD                                           
LRM023            ,PHSCL_SEQ_NBR                                                
LRM023            ,LGCL_SEQ_NBR                                                 
LRM023            ,TRANS_TYPE_CD                                                
LRM023            ,TRNFR_TYPE_CD                                                
LRM023            ,SBMTG_PRTCP_NBR                                              
LRM023            ,RCV_NBR                                                      
LRM023            ,DLVR_NBR                                                     
LRM023            ,TRANS_RFRN_ID_CD                                             
LRM023            ,ASSET_PRC_CTGY_CD                                            
LRM023            ,OPTN_CTGY_CD                                                 
LRM023            ,STTLM_LCTN_CD                                                
LRM023            ,STTLM_RSN_CD                                                 
LRM023            ,ISIN_CNTRY_CD                                                
LRM023            ,ISIN_SEC_ISSUE_CD                                            
LRM023            ,ISIN_SEC_CDG_CD                                              
LRM023            ,ASSET_DESC_TXT                                               
LRM023            ,ASSET_RQST_QTY_CD                                            
LRM023            ,AST_RQST_TRANS_CD                                            
LRM023            ,ASSET_QTY                                                    
LRM023            ,ASSET_PCT                                                    
LRM023            ,PSTN_CD                                                      
LRM023            ,ISO_CRNCY_CD                                                 
LRM023            ,ASSET_AMT                                                    
LRM023            ,BEARER_BOND_CD                                               
LRM023            ,CSH_MGN_SHRT_CD                                              
LRM023            ,WHI_CD                                                       
LRM023            ,TRNFR_TYPE_RSN_CD                                            
LRM023            ,MBS_SERIAL_NBR                                               
LRM023            ,ASSET_CMNT_TXT                                               
LRM023            ,PRGM_NM                                                      
LRM023            ,CICS_TERM_ID_CD                                              
LRM023            ,CRT_TMSTP                                                    
LRM023            ,UPDT_TMSTP                                                   
LRM023            ,ACCT_DLVR_NBR                                                
LRM023            ,ACCT_RCV_NBR                                                 
LRM023            ,SECURITY_ADP_NBR                                             
LRM023            ,NSCC_ACK_IND                                                 
LRM023            ,NSCC_PEND_CD                                                 
LRM023            ,NSCC_WTHLD_CD                                                
LRM025            ,FOREIGN_FEE_IND                                              
LRM023           )                                                              
LRM023           VALUES                                                         
LRM023           (                                                              
LRM023             :W-CLIENT-NBR-AUD                                            
LRM023            ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
LRM023            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
LRM023            ,:DCLACTIAST.RCRD-STTS-CD                                     
LRM023            ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
LRM023            ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
LRM023            ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
LRM023            ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
LRM023            ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
LRM023            ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
LRM023            ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
LRM023            ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
LRM023            ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
LRM023            ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
LRM023            ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
LRM023            ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
LRM023            ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
LRM023            ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
LRM023            ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
LRM023            ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
LRM023            ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
LRM023            ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
LRM023            ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
LRM023            ,:DCLACTIAST.ASSET-RQST-STS-CD                                
LRM023            ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
LRM023            ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
LRM023            ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
LRM023            ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
LRM023            ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
LRM023            ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
LRM023            ,:DCLACTIAST.BEARER-BND-STTS-CD                               
LRM023            ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
LRM023            ,:DCLACTIAST.WHI-STTS-CD                                      
LRM023            ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
LRM023            ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
LRM023            ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
LRM023            ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
LRM023            ,:DCLACTIAST.LGCL-SEQ-NBR                                     
LRM023            ,:DCLACTIAST.TRANS-TYPE-CD                                    
LRM023            ,:DCLACTIAST.TRNFR-TYPE-CD                                    
LRM023            ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
LRM023            ,:DCLACTIAST.RCV-NBR                                          
LRM023            ,:DCLACTIAST.DLVR-NBR                                         
LRM023            ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
LRM023            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
LRM023            ,:DCLACTIAST.OPTN-CTGY-CD                                     
LRM023            ,:DCLACTIAST.STTLM-LCTN-CD                                    
LRM023            ,:DCLACTIAST.STTLM-RSN-CD                                     
LRM023            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
LRM023            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
LRM023            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
LRM023            ,:DCLACTIAST.ASSET-DESC-TXT                                   
LRM023            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
LRM023            ,:DCLACTIAST.AST-RQST-TRANS-CD                                
LRM023            ,:DCLACTIAST.ASSET-QTY                                        
LRM023            ,:DCLACTIAST.ASSET-PCT                                        
LRM023            ,:DCLACTIAST.PSTN-CD                                          
LRM023            ,:DCLACTIAST.ISO-CRNCY-CD                                     
LRM023            ,:DCLACTIAST.ASSET-AMT                                        
LRM023            ,:DCLACTIAST.BEARER-BOND-CD                                   
LRM023            ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
LRM023            ,:DCLACTIAST.WHI-CD                                           
LRM023            ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
LRM023            ,:DCLACTIAST.MBS-SERIAL-NBR                                   
LRM023            ,:DCLACTIAST.ASSET-CMNT-TXT                                   
LRM023            ,:DCLACTIAST.PRGM-NM                                          
LRM023            ,:DCLACTIAST.CICS-TERM-ID-CD                                  
LRM023            ,:DCLACTIAST.CRT-TMSTP                                        
LRM023            ,:DCLACTIAST.UPDT-TMSTP                                       
LRM023            ,:DCLACTIAST.ACCT-DLVR-NBR                                    
LRM023            ,:DCLACTIAST.ACCT-RCV-NBR                                     
LRM023            ,:DCLACTIAST.SECURITY-ADP-NBR                                 
LRM023            ,:DCLACTIAST.NSCC-ACK-IND                                     
LRM023            ,:DCLACTIAST.NSCC-PEND-CD                                     
LRM023            ,:DCLACTIAST.NSCC-WTHLD-CD                                    
LRM025            ,:DCLACTIAST.FOREIGN-FEE-IND                                  
LRM023           )                                                              
LRM023     END-EXEC.                                                            
LRM023                                                                          
LRM023     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
LRM023     IF  SQLCODE  =  +0                                                   
LRM034         IF W-MATURE-CALLED-BOND-SW  = 'Y'                                
LRM023            ADD 1 TO W-BOND-AUDIT-ADD                                     
LRM034         ELSE                                                             
LRM034            ADD 1 TO W-LVL4-AUDIT-ADD                                     
LRM034         END-IF                                                           
LRM023     ELSE                                                                 
LRM034             IF W-MATURE-CALLED-BOND-SW  = 'Y'                            
LRM023                ADD 1 TO W-BOND-AUDIT-NOTADD                              
LRM034             ELSE                                                         
LRM034                ADD 1 TO W-LVL4-AUDIT-NOTADD                              
LRM034             END-IF                                                       
LRM023             DISPLAY '   ACTIAST/BOND AUDIT NOT ADDED.'                   
LRM023                       ' SQLCODE = ' W-DB2-SQLCODE                        
LRM023             DISPLAY '   ACTIAST PRIMARY KEY:'                            
LRM023                      ' CLT=' W-CLIENT-NBR-AUD                            
LRM023                       ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
LRM023                      ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
LRM023                       ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
LRM023                       ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
LRM023                      ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
LRM023             DISPLAY '           '                                        
LRM023                      ' DLV=' DLVR-NBR          OF DCLACTIAST             
LRM023                   ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
LRM023                      ' RCV=' RCV-NBR           OF DCLACTIAST             
LRM023                   ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
LRM023     END-IF.                                                              
LRM023                                                                          
LRM023 6020-EXIT. EXIT.                                                         
      /                                                                         
CSG001 6030-EDIT-ASSET-DESC-TXT SECTION.                                        
CSG001* MOVE SPACES FOR THE SPECIAL CHARACTERS FOUND IN ASSET-DESC-TXT.         
CSG001* AND LEFT JUSTIFY THE FIRST DESCRIPTION IF FIRST CHAR IS SPACE           
CSG001* AFTER EDITED.                                                           
CSG001     MOVE SPACES                 TO W-EDIT-ASSET-DESC-TXT-FLAG            
CSG001     PERFORM                                                              
CSG001         VARYING W-SUB2 FROM 1 BY 1                                       
CSG001           UNTIL W-SUB2 > 140                                             
CSG001         MOVE W-ASSET-DESC-TXT(W-SUB2:1)    TO W-EDIT-CHAR-AREA2          
CSG001         IF NOT W-VALID-CHARACTER2                                        
CSG001            MOVE SPACES           TO W-ASSET-DESC-TXT(W-SUB2:1)           
CSG001            SET W-EDIT-ASSET-DESC-TXT-Y     TO TRUE                       
CSG001         END-IF                                                           
CSG001     END-PERFORM                                                          
CSG001*                                                                         
CSG001     IF W-EDIT-ASSET-DESC-TXT-Y AND                                       
CSG001        W-ASSET-DESC1-TXT(1:1) = SPACES                                   
CSG001        SET W-JUST-LEFT-NOT-DONE       TO TRUE                            
CSG001        PERFORM                                                           
CSG001          VARYING W-SUB2 FROM 2 BY 1                                      
CSG001            UNTIL W-SUB2 > 30 OR W-JUST-LEFT-DONE                         
CSG001          IF W-ASSET-DESC1-TXT(W-SUB2 : 1) NOT = SPACES           03760002
CSG001             MOVE SPACES               TO W-ASSET-DESC-TMP                
CSG001             MOVE W-ASSET-DESC1-TXT(W-SUB2 : ) TO W-ASSET-DESC-TMP03760002
CSG001             MOVE W-ASSET-DESC-TMP     TO W-ASSET-DESC1-TXT               
CSG001             SET W-JUST-LEFT-DONE      TO TRUE                    03760002
CSG001          END-IF                                                  03760002
CSG001        END-PERFORM                                               03760002
CSG001     END-IF                                                       03760002
CSG001           .                                                      03760002
CSG001 6030-EXIT. EXIT.                                                         
CSG001/                                                                         
       6100-INSERT-ACTIOPN SECTION.                                             
           MOVE '6100-INSERT-ACTIOPN            ' TO W-ROUTINE-1.               
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTIOPN                                              
                 (                                                              
                   CLIENT_NBR                                                   
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,BS_STTS_CD                                                   
                  ,PTCL_STTS_CD                                                 
                  ,OPT_OPN_CLS_TST_CD                                           
                  ,SYM_STTS_CD                                                  
                  ,OPTN_EXPTN_DT_CD                                             
                  ,STPRC_INTR_STTS_CD                                           
                  ,STPRC_FRCT_STTS_CD                                           
                  ,OPT_OCC_DLV_STS_CD                                           
                  ,OPT_ACT_TYP_STS_CD                                           
                  ,ACCT_SUB_STTS_CD                                             
                  ,OPTN_CMNT_CD                                                 
                  ,BS_CD                                                        
                  ,PTCL_CD                                                      
                  ,OPTN_OPN_CLSD_CD                                             
                  ,SYM_CD                                                       
                  ,EXPTN_DT                                                     
                  ,STPRC_INTEGER_AMT                                            
                  ,STPRC_FRCTN_AMT                                              
                  ,DLVR_OCC_NBR                                                 
                  ,OPTN_ACCT_TYPE_CD                                            
                  ,ACCT_SUB_CD                                                  
                  ,OPTN_CMNT_TXT                                                
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,SECURITY_ADP_NBR                                             
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
DJ0004            ,ACAT_CONTROL_NBR                                             
DJ0004            ,ASSET_SEQ_NBR                                                
DJ0004            ,TRNFR_TYPE_CD                                                
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTIOPN.CLIENT-NBR                                       
                  ,:DCLACTIOPN.RCV-NBR                                          
                  ,:DCLACTIOPN.DLVR-NBR                                         
                  ,:DCLACTIOPN.ISIN-CNTRY-CD                                    
                  ,:DCLACTIOPN.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIOPN.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIOPN.STTLM-LCTN-CD                                    
                  ,:DCLACTIOPN.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIOPN.BS-STTS-CD                                       
                  ,:DCLACTIOPN.PTCL-STTS-CD                                     
                  ,:DCLACTIOPN.OPT-OPN-CLS-TST-CD                               
                  ,:DCLACTIOPN.SYM-STTS-CD                                      
                  ,:DCLACTIOPN.OPTN-EXPTN-DT-CD                                 
                  ,:DCLACTIOPN.STPRC-INTR-STTS-CD                               
                  ,:DCLACTIOPN.STPRC-FRCT-STTS-CD                               
                  ,:DCLACTIOPN.OPT-OCC-DLV-STS-CD                               
                  ,:DCLACTIOPN.OPT-ACT-TYP-STS-CD                               
                  ,:DCLACTIOPN.ACCT-SUB-STTS-CD                                 
                  ,:DCLACTIOPN.OPTN-CMNT-CD                                     
                  ,:DCLACTIOPN.BS-CD                                            
                  ,:DCLACTIOPN.PTCL-CD                                          
                  ,:DCLACTIOPN.OPTN-OPN-CLSD-CD                                 
                  ,:DCLACTIOPN.SYM-CD                                           
                  ,:DCLACTIOPN.EXPTN-DT                                         
                  ,:DCLACTIOPN.STPRC-INTEGER-AMT                                
                  ,:DCLACTIOPN.STPRC-FRCTN-AMT                                  
                  ,:DCLACTIOPN.DLVR-OCC-NBR                                     
                  ,:DCLACTIOPN.OPTN-ACCT-TYPE-CD                                
                  ,:DCLACTIOPN.ACCT-SUB-CD                                      
                  ,:DCLACTIOPN.OPTN-CMNT-TXT                                    
                  ,:DCLACTIOPN.PRGM-NM                                          
                  ,:DCLACTIOPN.CICS-TERM-ID-CD                                  
                  ,:DCLACTIOPN.CRT-TMSTP                                        
                  ,:DCLACTIOPN.UPDT-TMSTP                                       
                  ,:DCLACTIOPN.ACCT-DLVR-NBR                                    
                  ,:DCLACTIOPN.ACCT-RCV-NBR                                     
                  ,:DCLACTIOPN.SECURITY-ADP-NBR                                 
                  ,:DCLACTIOPN.NSCC-ACK-IND                                     
                  ,:DCLACTIOPN.NSCC-PEND-CD                                     
DJ0004            ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
DJ0004            ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
DJ0004            ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIOPN'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIOPN-ADD-CNT                                       
           ELSE                                                                 
               ADD 1 TO W-ACTIOPN-NOT-ADD-CNT                                   
                   DISPLAY '   ACTIOPN NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
               IF  SQLCODE  =  -803                                             
                   PERFORM 6400-UPDATE-ACTIOPN THRU 6400-EXIT                   
               ELSE                                                             
                   DISPLAY '   ACTIOPN PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
LRM007                      ' EXP DT=' EXPTN-DT       OF DCLACTIOPN             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR INSERTING A ROW INTO ACTIOPN'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT810: DCLACTIOPN  ='                              
                        '(' DCLACTIOPN ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6100-EXIT. EXIT.                                                         
      /                                                                         
       6200-INSERT-ACTIMF SECTION.                                              
           MOVE '6200-INSERT-ACTIMF              ' TO W-ROUTINE-1.              
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTIMF                                               
                 (                                                              
                   CLIENT_NBR                                                   
                  ,DSTBN_SIDE_CD                                                
                  ,PRCS_DT                                                      
                  ,RGSTN_CD                                                     
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,FND_ACT_NBR_STS_CD                                           
                  ,BK_PHSC_SHR_STS_CD                                           
                  ,NTWRK_CNTL_STTS_CD                                           
                  ,ACCT_TYPE_STTS_CD                                            
                  ,DVDND_STTS_CD                                                
                  ,DVDND_PYE_STTS_CD                                            
                  ,BRKR_EXCTG_STTS_CD                                           
                  ,MF_FUL_PRTL_STS_CD                                           
                  ,FNBR                                                         
                  ,BK_PHSCL_SHR_CD                                              
                  ,NTWRK_CNTL_CD                                                
                  ,ACCT_TYPE_CD                                                 
                  ,DVDND_CD                                                     
                  ,LTCG_CD                                                      
                  ,STCG_CD                                                      
                  ,DVDND_PAYEE_CD                                               
                  ,BRKR_EXCTG_NBR                                               
                  ,MF_FULL_PRTL_CD                                              
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,SECURITY_ADP_NBR                                             
DJ0004            ,ACAT_CONTROL_NBR                                             
DJ0004            ,ASSET_SEQ_NBR                                                
DJ0004            ,TRNFR_TYPE_CD                                                
DJ0004            ,FCST_ACCT_RCVR_NBR                                           
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTIMF.CLIENT-NBR                                        
                  ,:DCLACTIMF.DSTBN-SIDE-CD                                     
                  ,:DCLACTIMF.PRCS-DT                                           
                  ,:DCLACTIMF.RGSTN-CD                                          
                  ,:DCLACTIMF.RCV-NBR                                           
                  ,:DCLACTIMF.DLVR-NBR                                          
                  ,:DCLACTIMF.ISIN-CNTRY-CD                                     
                  ,:DCLACTIMF.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLACTIMF.ISIN-SEC-CDG-CD                                   
                  ,:DCLACTIMF.STTLM-LCTN-CD                                     
                  ,:DCLACTIMF.CSH-MGN-SHRT-CD                                   
                  ,:DCLACTIMF.FND-ACT-NBR-STS-CD                                
                  ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                                
                  ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                                
                  ,:DCLACTIMF.ACCT-TYPE-STTS-CD                                 
                  ,:DCLACTIMF.DVDND-STTS-CD                                     
                  ,:DCLACTIMF.DVDND-PYE-STTS-CD                                 
                  ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                                
                  ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                                
                  ,:DCLACTIMF.FNBR                                              
                  ,:DCLACTIMF.BK-PHSCL-SHR-CD                                   
                  ,:DCLACTIMF.NTWRK-CNTL-CD                                     
                  ,:DCLACTIMF.ACCT-TYPE-CD                                      
                  ,:DCLACTIMF.DVDND-CD                                          
                  ,:DCLACTIMF.LTCG-CD                                           
                  ,:DCLACTIMF.STCG-CD                                           
                  ,:DCLACTIMF.DVDND-PAYEE-CD                                    
                  ,:DCLACTIMF.BRKR-EXCTG-NBR                                    
                  ,:DCLACTIMF.MF-FULL-PRTL-CD                                   
                  ,:DCLACTIMF.PRGM-NM                                           
                  ,:DCLACTIMF.CICS-TERM-ID-CD                                   
                  ,:DCLACTIMF.CRT-TMSTP                                         
                  ,:DCLACTIMF.UPDT-TMSTP                                        
                  ,:DCLACTIMF.ACCT-DLVR-NBR                                     
                  ,:DCLACTIMF.ACCT-RCV-NBR                                      
                  ,:DCLACTIMF.SECURITY-ADP-NBR                                  
DJ0004            ,:DCLACTIMF.ACAT-CONTROL-NBR                                  
DJ0004            ,:DCLACTIMF.ASSET-SEQ-NBR                                     
DJ0004            ,:DCLACTIMF.TRNFR-TYPE-CD                                     
DJ0004            ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIMF '                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIMF-ADD-CNT                                        
           ELSE                                                                 
               ADD 1 TO W-ACTIMF-NOT-ADD-CNT                                    
                   DISPLAY '   ACTIMF  NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
               IF  SQLCODE  =  -803                                             
                   PERFORM 6500-UPDATE-ACTIMF   THRU 6500-EXIT                  
               ELSE                                                             
                   DISPLAY '   ACTIMF  PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR INSERTING A ROW INTO ACTIMF'          
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT810: DCLACTIMF  ='                               
                        '(' DCLACTIMF ')'                                       
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6200-EXIT. EXIT.                                                         
      /                                                                         
       6300-UPDATE-ACTIAST SECTION.                                             
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIAST                                                     
                SET                                                             
                   CLIENT_NBR          = :DCLACTIAST.CLIENT-NBR                 
                  ,ACAT_CONTROL_NBR    = :DCLACTIAST.ACAT-CONTROL-NBR           
                  ,ASSET_SEQ_NBR       = :DCLACTIAST.ASSET-SEQ-NBR              
                  ,RCRD_STTS_CD        = :DCLACTIAST.RCRD-STTS-CD               
                  ,RCRD_LNGTH_STTS_CD  = :DCLACTIAST.RCRD-LNGTH-STTS-CD         
                  ,PHSCL_SEQ_STTS_CD   = :DCLACTIAST.PHSCL-SEQ-STTS-CD          
                  ,LGCL_SEQ_NR_STS_CD  = :DCLACTIAST.LGCL-SEQ-NR-STS-CD         
                  ,TRANS_TYPE_STTS_CD  = :DCLACTIAST.TRANS-TYPE-STTS-CD         
                  ,TRNFR_TYPE_STTS_CD  = :DCLACTIAST.TRNFR-TYPE-STTS-CD         
                  ,CONTROL_NBR_STS_CD  = :DCLACTIAST.CONTROL-NBR-STS-CD         
                  ,SBMT_PRT_NR_STS_CD  = :DCLACTIAST.SBMT-PRT-NR-STS-CD         
                  ,RCV_NBR_STTS_CD     = :DCLACTIAST.RCV-NBR-STTS-CD            
                  ,DLVR_NBR_STTS_CD    = :DCLACTIAST.DLVR-NBR-STTS-CD           
                  ,TRANS_RFRN_STTS_CD  = :DCLACTIAST.TRANS-RFRN-STTS-CD         
                  ,AST_SEQ_NBR_STS_CD  = :DCLACTIAST.AST-SEQ-NBR-STS-CD         
                  ,AST_PRC_CTG_STS_CD  = :DCLACTIAST.AST-PRC-CTG-STS-CD         
                  ,OPTN_CTGY_STTS_CD   = :DCLACTIAST.OPTN-CTGY-STTS-CD          
                  ,STTLM_LCTN_STTS_CD  = :DCLACTIAST.STTLM-LCTN-STTS-CD         
                  ,STTLM_RSN_STTS_CD   = :DCLACTIAST.STTLM-RSN-STTS-CD          
                  ,ISIN_CNTRY_STTS_CD  = :DCLACTIAST.ISIN-CNTRY-STTS-CD         
                  ,ISIN_SEC_IS_STS_CD  = :DCLACTIAST.ISIN-SEC-IS-STS-CD         
                  ,ISIN_SEC_CD_STS_CD  = :DCLACTIAST.ISIN-SEC-CD-STS-CD         
                  ,ASSET_DESC_STTS_CD  = :DCLACTIAST.ASSET-DESC-STTS-CD         
                  ,ASSET_RQST_STS_CD   = :DCLACTIAST.ASSET-RQST-STS-CD          
                  ,AST_RQ_TRAN_STS_CD  = :DCLACTIAST.AST-RQ-TRAN-STS-CD         
                  ,ASSET_QTY_STTS_CD   = :DCLACTIAST.ASSET-QTY-STTS-CD          
                  ,ASSET_PCT_STTS_CD   = :DCLACTIAST.ASSET-PCT-STTS-CD          
                  ,PSTN_CD_STTS_CD     = :DCLACTIAST.PSTN-CD-STTS-CD            
                  ,ISO_CRNCY_STTS_CD   = :DCLACTIAST.ISO-CRNCY-STTS-CD          
                  ,ASSET_AMT_STTS_CD   = :DCLACTIAST.ASSET-AMT-STTS-CD          
                  ,BEARER_BND_STTS_CD  = :DCLACTIAST.BEARER-BND-STTS-CD         
                  ,CSH_MRG_SHT_STS_CD  = :DCLACTIAST.CSH-MRG-SHT-STS-CD         
                  ,WHI_STTS_CD         = :DCLACTIAST.WHI-STTS-CD                
                  ,TRN_TYP_RSN_STS_CD  = :DCLACTIAST.TRN-TYP-RSN-STS-CD         
                  ,MBS_SERIAL_STTS_CD  = :DCLACTIAST.MBS-SERIAL-STTS-CD         
                  ,ASSET_CMNT_STTS_CD  = :DCLACTIAST.ASSET-CMNT-STTS-CD         
                  ,PHSCL_SEQ_NBR       = :DCLACTIAST.PHSCL-SEQ-NBR              
                  ,LGCL_SEQ_NBR        = :DCLACTIAST.LGCL-SEQ-NBR               
                  ,TRANS_TYPE_CD       = :DCLACTIAST.TRANS-TYPE-CD              
                  ,TRNFR_TYPE_CD       = :DCLACTIAST.TRNFR-TYPE-CD              
                  ,SBMTG_PRTCP_NBR     = :DCLACTIAST.SBMTG-PRTCP-NBR            
                  ,RCV_NBR             = :DCLACTIAST.RCV-NBR                    
                  ,DLVR_NBR            = :DCLACTIAST.DLVR-NBR                   
                  ,TRANS_RFRN_ID_CD    = :DCLACTIAST.TRANS-RFRN-ID-CD           
                  ,ASSET_PRC_CTGY_CD   = :DCLACTIAST.ASSET-PRC-CTGY-CD          
                  ,OPTN_CTGY_CD        = :DCLACTIAST.OPTN-CTGY-CD               
                  ,STTLM_LCTN_CD       = :DCLACTIAST.STTLM-LCTN-CD              
                  ,STTLM_RSN_CD        = :DCLACTIAST.STTLM-RSN-CD               
                  ,ISIN_CNTRY_CD       = :DCLACTIAST.ISIN-CNTRY-CD              
                  ,ISIN_SEC_ISSUE_CD   = :DCLACTIAST.ISIN-SEC-ISSUE-CD          
                  ,ISIN_SEC_CDG_CD     = :DCLACTIAST.ISIN-SEC-CDG-CD            
                  ,ASSET_DESC_TXT      = :DCLACTIAST.ASSET-DESC-TXT             
                  ,ASSET_RQST_QTY_CD   = :DCLACTIAST.ASSET-RQST-QTY-CD          
                  ,AST_RQST_TRANS_CD   = :DCLACTIAST.AST-RQST-TRANS-CD          
                  ,ASSET_QTY           = :DCLACTIAST.ASSET-QTY                  
                  ,ASSET_PCT           = :DCLACTIAST.ASSET-PCT                  
                  ,PSTN_CD             = :DCLACTIAST.PSTN-CD                    
                  ,ISO_CRNCY_CD        = :DCLACTIAST.ISO-CRNCY-CD               
                  ,ASSET_AMT           = :DCLACTIAST.ASSET-AMT                  
                  ,BEARER_BOND_CD      = :DCLACTIAST.BEARER-BOND-CD             
                  ,CSH_MGN_SHRT_CD     = :DCLACTIAST.CSH-MGN-SHRT-CD            
                  ,WHI_CD              = :DCLACTIAST.WHI-CD                     
                  ,TRNFR_TYPE_RSN_CD   = :DCLACTIAST.TRNFR-TYPE-RSN-CD          
                  ,MBS_SERIAL_NBR      = :DCLACTIAST.MBS-SERIAL-NBR             
                  ,ASSET_CMNT_TXT      = :DCLACTIAST.ASSET-CMNT-TXT             
                  ,PRGM_NM             = :DCLACTIAST.PRGM-NM                    
                  ,CICS_TERM_ID_CD     = :DCLACTIAST.CICS-TERM-ID-CD            
                  ,CRT_TMSTP           = :DCLACTIAST.CRT-TMSTP                  
                  ,UPDT_TMSTP          = :DCLACTIAST.UPDT-TMSTP                 
                  ,ACCT_DLVR_NBR       = :DCLACTIAST.ACCT-DLVR-NBR              
                  ,ACCT_RCV_NBR        = :DCLACTIAST.ACCT-RCV-NBR               
                  ,SECURITY_ADP_NBR    = :DCLACTIAST.SECURITY-ADP-NBR           
                  ,NSCC_ACK_IND        = :DCLACTIAST.NSCC-ACK-IND               
                  ,NSCC_PEND_CD        = :DCLACTIAST.NSCC-PEND-CD               
                  ,NSCC_WTHLD_CD       = :DCLACTIAST.NSCC-WTHLD-CD              
LRM025            ,FOREIGN_FEE_IND     = :DCLACTIAST.FOREIGN-FEE-IND            
LRM043            ,CRNCY_CD            = :DCLACTIAST.CRNCY-CD                   
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIAST  '              TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-UPD-CNT                                       
                                                                                
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-UPD-CNT                                   
                   DISPLAY '   ACTIAST NOT UPDATED.'                            
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                   DISPLAY '   ACTIAST PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR UPDATING A ROW IN ACTIAST'            
                         ' (INIT-ASSET TABLE)'                                  
                   DISPLAY 'CAT810: DCLACTIAST  ='                              
                        '(' DCLACTIAST ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6300-EXIT. EXIT.                                                         
      /                                                                         
       6400-UPDATE-ACTIOPN SECTION.                                             
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIOPN                                                     
                SET                                                             
                   CLIENT_NBR          = :DCLACTIOPN.CLIENT-NBR                 
                  ,RCV_NBR             = :DCLACTIOPN.RCV-NBR                    
                  ,DLVR_NBR            = :DCLACTIOPN.DLVR-NBR                   
                  ,ISIN_CNTRY_CD       = :DCLACTIOPN.ISIN-CNTRY-CD              
                  ,ISIN_SEC_ISSUE_CD   = :DCLACTIOPN.ISIN-SEC-ISSUE-CD          
                  ,ISIN_SEC_CDG_CD     = :DCLACTIOPN.ISIN-SEC-CDG-CD            
                  ,STTLM_LCTN_CD       = :DCLACTIOPN.STTLM-LCTN-CD              
                  ,CSH_MGN_SHRT_CD     = :DCLACTIOPN.CSH-MGN-SHRT-CD            
                  ,BS_STTS_CD          = :DCLACTIOPN.BS-STTS-CD                 
                  ,PTCL_STTS_CD        = :DCLACTIOPN.PTCL-STTS-CD               
                  ,OPT_OPN_CLS_TST_CD  = :DCLACTIOPN.OPT-OPN-CLS-TST-CD         
                  ,SYM_STTS_CD         = :DCLACTIOPN.SYM-STTS-CD                
                  ,OPTN_EXPTN_DT_CD    = :DCLACTIOPN.OPTN-EXPTN-DT-CD           
                  ,STPRC_INTR_STTS_CD  = :DCLACTIOPN.STPRC-INTR-STTS-CD         
                  ,STPRC_FRCT_STTS_CD  = :DCLACTIOPN.STPRC-FRCT-STTS-CD         
                  ,OPT_OCC_DLV_STS_CD  = :DCLACTIOPN.OPT-OCC-DLV-STS-CD         
                  ,OPT_ACT_TYP_STS_CD  = :DCLACTIOPN.OPT-ACT-TYP-STS-CD         
                  ,ACCT_SUB_STTS_CD    = :DCLACTIOPN.ACCT-SUB-STTS-CD           
                  ,OPTN_CMNT_CD        = :DCLACTIOPN.OPTN-CMNT-CD               
                  ,BS_CD               = :DCLACTIOPN.BS-CD                      
                  ,PTCL_CD             = :DCLACTIOPN.PTCL-CD                    
                  ,OPTN_OPN_CLSD_CD    = :DCLACTIOPN.OPTN-OPN-CLSD-CD           
                  ,SYM_CD              = :DCLACTIOPN.SYM-CD                     
                  ,EXPTN_DT            = :DCLACTIOPN.EXPTN-DT                   
                  ,STPRC_INTEGER_AMT   = :DCLACTIOPN.STPRC-INTEGER-AMT          
                  ,STPRC_FRCTN_AMT     = :DCLACTIOPN.STPRC-FRCTN-AMT            
                  ,DLVR_OCC_NBR        = :DCLACTIOPN.DLVR-OCC-NBR               
                  ,OPTN_ACCT_TYPE_CD   = :DCLACTIOPN.OPTN-ACCT-TYPE-CD          
                  ,ACCT_SUB_CD         = :DCLACTIOPN.ACCT-SUB-CD                
                  ,OPTN_CMNT_TXT       = :DCLACTIOPN.OPTN-CMNT-TXT              
                  ,PRGM_NM             = :DCLACTIOPN.PRGM-NM                    
                  ,CICS_TERM_ID_CD     = :DCLACTIOPN.CICS-TERM-ID-CD            
                  ,CRT_TMSTP           = :DCLACTIOPN.CRT-TMSTP                  
                  ,UPDT_TMSTP          = :DCLACTIOPN.UPDT-TMSTP                 
                  ,ACCT_DLVR_NBR       = :DCLACTIOPN.ACCT-DLVR-NBR              
                  ,ACCT_RCV_NBR        = :DCLACTIOPN.ACCT-RCV-NBR               
                  ,SECURITY_ADP_NBR    = :DCLACTIOPN.SECURITY-ADP-NBR           
                  ,NSCC_ACK_IND        = :DCLACTIOPN.NSCC-ACK-IND               
                  ,NSCC_PEND_CD        = :DCLACTIOPN.NSCC-PEND-CD               
DJ0004            ,ACAT_CONTROL_NBR    = :DCLACTIOPN.ACAT-CONTROL-NBR           
DJ0004            ,ASSET_SEQ_NBR       = :DCLACTIOPN.ASSET-SEQ-NBR              
DJ0004            ,TRNFR_TYPE_CD       = :DCLACTIOPN.TRNFR-TYPE-CD              
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIOPN   '             TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIOPN-UPD-CNT                                       
           ELSE                                                                 
               ADD 1 TO W-ACTIOPN-NOT-UPD-CNT                                   
           END-IF.                                                              
                                                                                
       6400-EXIT. EXIT.                                                         
      /                                                                         
       6500-UPDATE-ACTIMF SECTION.                                              
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIMF                                                      
                SET                                                             
                   CLIENT_NBR          = :DCLACTIMF.CLIENT-NBR                  
                  ,DSTBN_SIDE_CD       = :DCLACTIMF.DSTBN-SIDE-CD               
                  ,PRCS_DT             = :DCLACTIMF.PRCS-DT                     
                  ,RGSTN_CD            = :DCLACTIMF.RGSTN-CD                    
                  ,RCV_NBR             = :DCLACTIMF.RCV-NBR                     
                  ,DLVR_NBR            = :DCLACTIMF.DLVR-NBR                    
                  ,ISIN_CNTRY_CD       = :DCLACTIMF.ISIN-CNTRY-CD               
                  ,ISIN_SEC_ISSUE_CD   = :DCLACTIMF.ISIN-SEC-ISSUE-CD           
                  ,ISIN_SEC_CDG_CD     = :DCLACTIMF.ISIN-SEC-CDG-CD             
                  ,STTLM_LCTN_CD       = :DCLACTIMF.STTLM-LCTN-CD               
                  ,CSH_MGN_SHRT_CD     = :DCLACTIMF.CSH-MGN-SHRT-CD             
                  ,FND_ACT_NBR_STS_CD  = :DCLACTIMF.FND-ACT-NBR-STS-CD          
                  ,BK_PHSC_SHR_STS_CD  = :DCLACTIMF.BK-PHSC-SHR-STS-CD          
                  ,NTWRK_CNTL_STTS_CD  = :DCLACTIMF.NTWRK-CNTL-STTS-CD          
                  ,ACCT_TYPE_STTS_CD   = :DCLACTIMF.ACCT-TYPE-STTS-CD           
                  ,DVDND_STTS_CD       = :DCLACTIMF.DVDND-STTS-CD               
                  ,DVDND_PYE_STTS_CD   = :DCLACTIMF.DVDND-PYE-STTS-CD           
                  ,BRKR_EXCTG_STTS_CD  = :DCLACTIMF.BRKR-EXCTG-STTS-CD          
                  ,MF_FUL_PRTL_STS_CD  = :DCLACTIMF.MF-FUL-PRTL-STS-CD          
                  ,FNBR                = :DCLACTIMF.FNBR                        
                  ,BK_PHSCL_SHR_CD     = :DCLACTIMF.BK-PHSCL-SHR-CD             
                  ,NTWRK_CNTL_CD       = :DCLACTIMF.NTWRK-CNTL-CD               
                  ,ACCT_TYPE_CD        = :DCLACTIMF.ACCT-TYPE-CD                
                  ,DVDND_CD            = :DCLACTIMF.DVDND-CD                    
                  ,LTCG_CD             = :DCLACTIMF.LTCG-CD                     
                  ,STCG_CD             = :DCLACTIMF.STCG-CD                     
                  ,DVDND_PAYEE_CD      = :DCLACTIMF.DVDND-PAYEE-CD              
                  ,BRKR_EXCTG_NBR      = :DCLACTIMF.BRKR-EXCTG-NBR              
                  ,MF_FULL_PRTL_CD     = :DCLACTIMF.MF-FULL-PRTL-CD             
                  ,PRGM_NM             = :DCLACTIMF.PRGM-NM                     
                  ,CICS_TERM_ID_CD     = :DCLACTIMF.CICS-TERM-ID-CD             
                  ,CRT_TMSTP           = :DCLACTIMF.CRT-TMSTP                   
                  ,UPDT_TMSTP          = :DCLACTIMF.UPDT-TMSTP                  
                  ,ACCT_DLVR_NBR       = :DCLACTIMF.ACCT-DLVR-NBR               
                  ,ACCT_RCV_NBR        = :DCLACTIMF.ACCT-RCV-NBR                
                  ,SECURITY_ADP_NBR    = :DCLACTIMF.SECURITY-ADP-NBR            
DJ0004            ,ACAT_CONTROL_NBR    = :DCLACTIMF.ACAT-CONTROL-NBR            
DJ0004            ,ASSET_SEQ_NBR       = :DCLACTIMF.ASSET-SEQ-NBR               
DJ0004            ,TRNFR_TYPE_CD       = :DCLACTIMF.TRNFR-TYPE-CD               
DJ0004            ,FCST_ACCT_RCVR_NBR  = :DCLACTIMF.FCST-ACCT-RCVR-NBR          
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIMF     '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIMF-UPD-CNT                                        
           ELSE                                                                 
               ADD 1 TO W-ACTIMF-NOT-UPD-CNT                                    
           END-IF.                                                              
                                                                                
       6500-EXIT. EXIT.                                                         
      /                                                                         
       6600-UPDATE-NSCC-PEND-CD   SECTION.                                      
      *****************************************************************         
      *  IN CASE OF ERROR OR REJECT, HOLD THE ASSETS. DO NOT SEND.              
      *****************************************************************         
           MOVE '6600-UPDATE-NSCC-PEND-CD      ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIAST                                                     
                SET                                                             
                     NSCC_PEND_CD        = :W-BH-NSCC-PEND-CD                   
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIAST    '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)          TO W-SQLERRD-3                              
           MOVE W-SQLERRD-3         TO W-SQL-UPDATE-COUNT                       
                                                                                
           IF  SQLCODE  =  +0                                                   
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                     ' ACTIAST UPDATED WITH PEND=' W-BH-NSCC-PEND-CD            
                     '. COUNT=' W-SQL-UPDATE-COUNT                              
           ELSE                                                                 
               DISPLAY '   ACTIAST NSCC-PEND-CD NOT UPDATED'                    
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               IF  SQLCODE  =  +100                                             
      *************DISPLAY '   BYPASSING INIT ASSETS NOT FOUND.'                
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR UPDATING A ROW IN ACTIAST'            
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6600-EXIT. EXIT.                                                         
      /                                                                         
       6650-SUBMIT-ASSETS         SECTION.                                      
      *****************************************************************         
      *  IF DAYS = B1 DAYS, CHANGE NSCC-PEND TO ' ' TO SUBMIT.                  
      *  DO NOT SUBMIT WITHHELD ASSETS.                                         
      *****************************************************************         
           MOVE '6650-SUBMIT-ASSETS      ' TO W-ROUTINE-1.                      
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIAST                                                     
                SET                                                             
                     NSCC_PEND_CD        = :W-BH-NSCC-PEND-CD                   
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  NSCC_WTHLD_CD     = ' '                                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIAST    '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)          TO W-SQLERRD-3                              
           MOVE W-SQLERRD-3         TO W-SQL-UPDATE-COUNT                       
                                                                                
           IF  SQLCODE  =  +0                                                   
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' CTL=' WF-ACAT-CONTROL-NBR                           
                          ' ACC=' WF-BRANCH-CD ' ' WF-ACCT-CD                   
                     ' ACTIAST UPDATED WITH PEND=' W-BH-NSCC-PEND-CD            
                     '. COUNT=' W-SQL-UPDATE-COUNT                              
           ELSE                                                                 
               DISPLAY '   ACTIAST NSCC-PEND-CD NOT UPDATED'                    
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               IF  SQLCODE  =  +100                                             
      *************DISPLAY '   BYPASSING INIT ASSETS NOT FOUND.'                
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR UPDATING A ROW IN ACTIAST'            
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6650-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  SET FLAGS IN VTRNFR                                                    
      *  UPDATE VTRNFR                                                          
      *****************************************************************         
       6800-UPDATE-VTRNFR          SECTION.                                     
           MOVE '6800-UPDATE-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
           MOVE W-PGM-NAME             TO PRGM-NM          OF DCLVTRNFR         
           MOVE ' '                    TO CICS-TERM-ID-CD  OF DCLVTRNFR         
           MOVE W-CURRENT-TIMESTAMP    TO UPDT-TMSTP       OF DCLVTRNFR         
                                                                                
           IF  W-REJ-MARGIN-DEBIT = 'Y'                                         
               DISPLAY '   W-REJ-MARGIN-DEBIT'                                  
               MOVE 'Y'             TO    ACCT-MRGN-DB-IND OF DCLVTRNFR         
           ELSE                                                                 
               MOVE 'N'             TO    ACCT-MRGN-DB-IND OF DCLVTRNFR         
           END-IF                                                               
           IF  W-REJ-ASSET-VALUE  = 'Y'                                         
           OR  W-REJ-TOTL-ACT-VAL = 'Y'                                         
               DISPLAY '   W-REJ-ASSET-VALUE'                                   
               MOVE 'Y'             TO   ACCT-AST-EXCS-IND OF DCLVTRNFR         
           ELSE                                                                 
               MOVE 'N'             TO   ACCT-AST-EXCS-IND OF DCLVTRNFR         
           END-IF                                                               
           IF  W-REJ-LP           = 'Y'                                         
               DISPLAY '   W-REJ-LP'                                            
               IF BH-ACAT-REJ-PEND-DEL-LP-CODE > '00'                           
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
               MOVE 'Y'             TO  ACCT-LTD-PRTNR-IND OF DCLVTRNFR         
           ELSE                                                                 
               MOVE 'N'             TO  ACCT-LTD-PRTNR-IND OF DCLVTRNFR         
           END-IF                                                               
           IF  W-REJ-PRIV         = 'Y'                                         
               DISPLAY '   W-REJ-PRIV'                                          
               IF BH-ACAT-REJ-PEND-DEL-PRIV-CODE > '00'                         
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
               MOVE 'Y'             TO   ACCT-PRVT-RNG-IND OF DCLVTRNFR         
           ELSE                                                                 
               MOVE 'N'             TO   ACCT-PRVT-RNG-IND OF DCLVTRNFR         
           END-IF                                                               
           IF  W-REJ-NTS          = 'Y'                                         
               DISPLAY '   W-REJ-NTS'                                           
               IF  BH-ACAT-REJ-PEND-DEL-NTS-CODE > '00'                         
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
               MOVE 'Y'             TO  ACCT-SEC-RSTRD-IND OF DCLVTRNFR         
           ELSE                                                                 
               MOVE 'N'             TO  ACCT-SEC-RSTRD-IND OF DCLVTRNFR         
           END-IF                                                               
           IF  W-REJ-FLAT         = 'Y'                                         
               DISPLAY '   W-REJ-FLAT'                                          
               IF  BH-ACAT-REJ-PEND-DEL-FLAT-CODE > '00'                        
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
               MOVE 'F'     TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
               ADD 1 TO W-FLAT-CNT                                              
           ELSE                                                                 
               MOVE ' '     TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
           END-IF                                                               
                                                                                
           IF  W-BAL-FND-SW = 'Y'                                               
               MOVE W-BAL-TOTL-LIQDATNG-EQUITY                                  
                                    TO    ACCT-EQUITY-AMT OF DCLVTRNFR          
           ELSE                                                                 
               MOVE 0               TO    ACCT-EQUITY-AMT OF DCLVTRNFR          
           END-IF                                                               
                                                                                
    10     IF  W-EXP-OPT-POSN = 'Y'                                             
    20         MOVE 'X'          TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR             
    30     END-IF                                                               
                                                                                
DJ0014     IF  W-MEMO-ONLY-SW = 'Y'                                             
DJ0014         MOVE 'N'             TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR          
DJ0014     END-IF                                                               
LRM033     MOVE W-BAL-PEND-DVND    TO PEND-DVDND-DB-AMT   OF DCLVTRNFR          
LRM034     MOVE WK-NTWRK-LVL4-IND  TO NTWRK-LVL4-FND-IND  OF DCLVTRNFR          
                                                                                
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET                                                             
                   CICS_TERM_ID_CD     = :DCLVTRNFR.CICS-TERM-ID-CD             
                  ,UPDT_TMSTP          = :DCLVTRNFR.UPDT-TMSTP                  
                  ,PRGM_NM             = :DCLVTRNFR.PRGM-NM                     
                  ,ACCT_MRGN_DB_IND    = :DCLVTRNFR.ACCT-MRGN-DB-IND            
                  ,ACCT_AST_EXCS_IND   = :DCLVTRNFR.ACCT-AST-EXCS-IND           
                  ,ACCT_LTD_PRTNR_IND  = :DCLVTRNFR.ACCT-LTD-PRTNR-IND          
                  ,ACCT_PRVT_RNG_IND   = :DCLVTRNFR.ACCT-PRVT-RNG-IND           
                  ,ACCT_SEC_RSTRD_IND  = :DCLVTRNFR.ACCT-SEC-RSTRD-IND          
    10            ,ACCT_OPTN_PSTN_IND  = :DCLVTRNFR.ACCT-OPTN-PSTN-IND          
                  ,ACCT_EQUITY_AMT     = :DCLVTRNFR.ACCT-EQUITY-AMT             
                  ,TRNFR_TYPE_RJC2_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC2-CD          
LRM005            ,ACCT_RB_SEC_IND     = :DCLVTRNFR.ACCT-RB-SEC-IND             
LRM012            ,NSCC_PEND_CD        = ' '                                    
LRM033            ,PEND_DVDND_DB_AMT   = :DCLVTRNFR.PEND-DVDND-DB-AMT           
LRM034            ,NTWRK_LVL4_FND_IND  = :DCLVTRNFR.NTWRK-LVL4-FND-IND          
                WHERE  CURRENT OF VTRNFR_CURSOR                                 
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
               DISPLAY '   VTRNFR NOT UPDATED.'                                 
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               DISPLAY '   VTRNFR PRIMARY KEY:'                                 
                         ' CLT=' WF-CLIENT-NBR                                  
                         ' CTL=' WF-ACAT-CONTROL-NBR                            
                       ' EQTY= ' WF-ACCT-EQUITY-AMT                             
               IF  L-RERUN                                                      
               AND SQLCODE  =  +100                                             
      *************DISPLAY '   BYPASSING VTRNFR UPDATE NOT FOUND.'              
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6800-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  ADD THE NEW ROW TO THE INIT-TABLE                                      
ET0006*    AND FOR AN INTERNALLY TRANSFERED ACCOUNT,                            
ET0006*    CREATE A CHANGE RECORD BY ADDING A NEW ROW TO THE                    
ET0006*    INIT-TABLE INSTEAD OF REJECTING THE TRANSFER.                        
      *****************************************************************         
       6900-INSERT-ACTITRF SECTION.                                             
           MOVE '6900-INSERT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
           MOVE CLIENT-NBR         OF DCLVTRNFR                                 
                                   TO CLIENT-NBR         OF DCLACTITRF          
           MOVE DSTBN-SIDE-CD      OF DCLVTRNFR                                 
                                   TO DSTBN-SIDE-CD      OF DCLACTITRF          
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                                 
                                   TO ACAT-CONTROL-NBR   OF DCLACTITRF          
           MOVE PRCS-DT            OF DCLVTRNFR                                 
                                   TO PRCS-DT            OF DCLACTITRF          
           MOVE CYCLE-CD           OF DCLVTRNFR                                 
                                   TO CYCLE-CD           OF DCLACTITRF          
           MOVE SYS-ACT-CD         OF DCLVTRNFR                                 
                                   TO SYS-ACT-CD         OF DCLACTITRF          
           MOVE SYS-RJCT-RSN-CD    OF DCLVTRNFR                                 
                                   TO SYS-RJCT-RSN-CD    OF DCLACTITRF          
           MOVE STTS-CD            OF DCLVTRNFR                                 
                                   TO STTS-CD            OF DCLACTITRF          
           MOVE DAYS-STTS-QTY      OF DCLVTRNFR                                 
                                   TO DAYS-STTS-QTY      OF DCLACTITRF          
           MOVE RCRD-STTS-CD       OF DCLVTRNFR                                 
                                   TO RCRD-STTS-CD       OF DCLACTITRF          
           MOVE RCRD-LNGTH-STTS-CD OF DCLVTRNFR                                 
                                   TO RCRD-LNGTH-STTS-CD OF DCLACTITRF          
           MOVE PHSCL-SEQ-STTS-CD  OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-STTS-CD  OF DCLACTITRF          
           MOVE LGCL-SEQ-NR-STS-CD OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NR-STS-CD OF DCLACTITRF          
           MOVE TRANS-TYPE-STTS-CD OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-STTS-CD OF DCLACTITRF          
           MOVE CONTROL-NBR-STS-CD OF DCLVTRNFR                                 
                                   TO CONTROL-NBR-STS-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-STTS-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-STTS-CD OF DCLACTITRF          
           MOVE SBMT-PRT-NR-STS-CD OF DCLVTRNFR                                 
                                   TO SBMT-PRT-NR-STS-CD OF DCLACTITRF          
           MOVE RCV-NBR-STTS-CD    OF DCLVTRNFR                                 
                                   TO RCV-NBR-STTS-CD    OF DCLACTITRF          
           MOVE DLVR-NBR-STTS-CD   OF DCLVTRNFR                                 
                                   TO DLVR-NBR-STTS-CD   OF DCLACTITRF          
           MOVE ACCT-RCV-STTS-CD   OF DCLVTRNFR                                 
                                   TO ACCT-RCV-STTS-CD   OF DCLACTITRF          
           MOVE RCV-CUST-NM-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-CUST-NM-STS-CD OF DCLACTITRF          
           MOVE RCV-SS-PRIM-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-SS-PRIM-STS-CD OF DCLACTITRF          
           MOVE RCV-SS-SCDY-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-SS-SCDY-STS-CD OF DCLACTITRF          
           MOVE RCV-ACT-TYP-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-ACT-TYP-STS-CD OF DCLACTITRF          
           MOVE RCV-OCC-STTS-CD    OF DCLVTRNFR                                 
                                   TO RCV-OCC-STTS-CD    OF DCLACTITRF          
           MOVE RCV-CRSPN-STTS-CD  OF DCLVTRNFR                                 
                                   TO RCV-CRSPN-STTS-CD  OF DCLACTITRF          
           MOVE ACCT-DLVR-STTS-CD  OF DCLVTRNFR                                 
                                   TO ACCT-DLVR-STTS-CD  OF DCLACTITRF          
           MOVE TRN-TYP-RJC-STS-CD OF DCLVTRNFR                                 
                                   TO TRN-TYP-RJC-STS-CD OF DCLACTITRF          
           MOVE CNTL-ASTD-STTS-CD  OF DCLVTRNFR                                 
                                   TO CNTL-ASTD-STTS-CD  OF DCLACTITRF          
           MOVE STTLM-ASCTD-STS-CD OF DCLVTRNFR                                 
                                   TO STTLM-ASCTD-STS-CD OF DCLACTITRF          
           MOVE TRANS-RFRN-STTS-CD OF DCLVTRNFR                                 
                                   TO TRANS-RFRN-STTS-CD OF DCLACTITRF          
           MOVE CMNT-STTS-CD       OF DCLVTRNFR                                 
                                   TO CMNT-STTS-CD       OF DCLACTITRF          
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-NBR      OF DCLACTITRF          
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NBR       OF DCLACTITRF          
           MOVE TRANS-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-CD      OF DCLACTITRF          
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-CD      OF DCLACTITRF          
      *****MOVE SBMTG-PRTCP-NBR    OF DCLVTRNFR                                 
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
                                   TO SBMTG-PRTCP-NBR    OF DCLACTITRF          
           MOVE RCV-NBR            OF DCLVTRNFR                                 
                                   TO RCV-NBR            OF DCLACTITRF          
           MOVE DLVR-NBR           OF DCLVTRNFR                                 
                                   TO DLVR-NBR           OF DCLACTITRF          
           MOVE ACCT-RCV-NBR       OF DCLVTRNFR                                 
                                   TO ACCT-RCV-NBR       OF DCLACTITRF          
           MOVE RCV-CUST-NM        OF DCLVTRNFR                                 
                                   TO RCV-CUST-NM        OF DCLACTITRF          
           MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR                                 
                                   TO RCV-SS-PRIM-NBR    OF DCLACTITRF          
           MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR                                 
                                   TO RCV-SS-SCNDY-NBR   OF DCLACTITRF          
           MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR                                 
                                   TO RCV-ACCT-TYPE-CD   OF DCLACTITRF          
           MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR                                 
                                   TO RCV-OCC-BRKR-NBR   OF DCLACTITRF          
           MOVE RCV-CRSPN-NBR      OF DCLVTRNFR                                 
                                   TO RCV-CRSPN-NBR      OF DCLACTITRF          
           MOVE PRTCP-CONTRA-CD    OF DCLVTRNFR                                 
                                   TO PRTCP-CONTRA-CD    OF DCLACTITRF          
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR                                 
                                   TO ACCT-DLVR-NBR      OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
           MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR                                 
                                   TO ACAT-CNTL-ASTD-NBR OF DCLACTITRF          
           MOVE STTLM-ASCTD-DT     OF DCLVTRNFR                                 
                                   TO STTLM-ASCTD-DT     OF DCLACTITRF          
           MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR                                 
                                   TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO CMNT-TXT           OF DCLACTITRF          
           MOVE CICS-TERM-ID-CD    OF DCLVTRNFR                                 
                                   TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE CRT-TMSTP          OF DCLVTRNFR                                 
                                   TO CRT-TMSTP          OF DCLACTITRF          
           MOVE DB-CR-CD           OF DCLVTRNFR                                 
                                   TO DB-CR-CD           OF DCLACTITRF          
           MOVE NSCC-ACK-IND       OF DCLVTRNFR                                 
                                   TO NSCC-ACK-IND       OF DCLACTITRF          
                                                                                
           MOVE W-BH-NSCC-PEND-CD  TO NSCC-PEND-CD       OF DCLACTITRF          
                                                                                
           MOVE PRGM-NM            OF DCLVTRNFR                                 
                                   TO PRGM-NM            OF DCLACTITRF          
           MOVE RR-CD              OF DCLVTRNFR                                 
                                   TO RR-CD              OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
           MOVE UPDT-TMSTP         OF DCLVTRNFR                                 
                                   TO UPDT-TMSTP         OF DCLACTITRF          
                                                                                
           IF  W-REJ-LP           = 'Y'                                         
               IF BH-ACAT-REJ-PEND-DEL-LP-CODE > '00'                           
                  IF TRNFR-TYPE-RJCT-CD OF DCLACTITRF = ' '                     
                     MOVE BH-ACAT-REJ-PEND-DEL-LP-CODE                          
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                  END-IF                                                        
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-PRIV         = 'Y'                                         
               IF BH-ACAT-REJ-PEND-DEL-PRIV-CODE > '00'                         
                  IF TRNFR-TYPE-RJCT-CD OF DCLACTITRF = ' '                     
                      MOVE BH-ACAT-REJ-PEND-DEL-PRIV-CODE                       
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                  END-IF                                                        
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-NTS          = 'Y'                                         
               IF BH-ACAT-REJ-PEND-DEL-NTS-CODE > '00'                          
                  IF TRNFR-TYPE-RJCT-CD OF DCLACTITRF = ' '                     
                      MOVE BH-ACAT-REJ-PEND-DEL-NTS-CODE                        
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                  END-IF                                                        
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-FLAT         = 'Y'                                         
               IF BH-ACAT-REJ-PEND-DEL-FLAT-CODE > '00'                         
                  IF TRNFR-TYPE-RJCT-CD OF DCLACTITRF = ' '                     
                      MOVE BH-ACAT-REJ-PEND-DEL-FLAT-CODE                       
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                  END-IF                                                        
               END-IF                                                           
DJ0014         IF  W-MEMO-ONLY-SW = 'Y'                                         
DJ0014             DISPLAY '   REJECT: MEMO ONLY - RESTRICTED ASSET.'           
DJ0014                     ' FLAT'                                              
DJ0014             MOVE 'MEMO ONLY - RESTRICTED ASSET'                          
DJ0014                                       TO CMNT-TXT OF DCLACTITRF          
DJ0014         END-IF                                                           
           END-IF                                                               
                                                                                
           MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF          
                                                                                
LRM033     MOVE W-BAL-PEND-DVND    TO PEND-DVDND-DB-AMT   OF DCLACTITRF         
ET0006**<  CREATE A CHANGE RECORD FOR THE INTERNALLY TRANSFERED ACCT >          
ET0006     IF WS-INTERNALY-TRANSFERED-IND = 'Y'                                 
ET0006        MOVE SPACES          TO  W-CHANGED-DLVR-NBR                       
ET0006        MOVE INTNL-TO-BR     TO  W-CHANGED-BRANCH                         
ET0006        MOVE INTNL-TO-ACCT   TO  W-CHANGED-ACCT                           
ET0006        MOVE W-CHANGED-DLVR-NBR                                           
ET0006                             TO ACCT-DLVR-NBR      OF DCLACTITRF          
DJ0013        MOVE '1'             TO ACCT-DLVR-STTS-CD  OF DCLACTITRF          
ET0006        MOVE 'C'                                                          
ET0006                             TO TRANS-TYPE-CD      OF DCLACTITRF          
ET0006        MOVE SPACE                                                        
ET0006                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
ET0006                                TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
ET0006                                TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
ET0006        MOVE CMNT-TXT OF DCLVTRNFR                                        
ET0006                             TO CMNT-TXT           OF DCLACTITRF          
ET0006        MOVE W-CURRENT-TIMESTAMP                                          
ET0006                             TO CRT-TMSTP          OF DCLACTITRF          
ET0006                                UPDT-TMSTP         OF DCLACTITRF          
ET0006********MOVE W-CURRENT-TIMESTAMP (1:10)                                   
DJ0013        MOVE W-PROC-DT                                                    
ET0006                             TO PRCS-DT            OF DCLACTITRF          
ET0006        MOVE 'CAT810'                                                     
ET0006                             TO PRGM-NM            OF DCLACTITRF          
ET0006        DISPLAY '   * ACCOUNT FOUND IN INTERNAL ACCT TRNFR FILE'          
ET0006        DISPLAY '   * ACCT ' ACCT-DLVR-NBR OF DCLVTRNFR (1:8)             
ET0006                ' WAS INTERNALLY TRANSFERED TO ACCT# '                    
ET0006                                W-CHANGED-DLVR-NBR (1:8)                  
DJ0011        MOVE 'H'             TO NSCC-PEND-CD       OF DCLACTITRF          
ET0006     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTITRF                                              
                 (                                                              
                   CLIENT_NBR                                                   
                  ,DSTBN_SIDE_CD                                                
                  ,ACAT_CONTROL_NBR                                             
                  ,PRCS_DT                                                      
                  ,CYCLE_CD                                                     
                  ,SYS_ACT_CD                                                   
                  ,SYS_RJCT_RSN_CD                                              
                  ,STTS_CD                                                      
                  ,DAYS_STTS_QTY                                                
                  ,RCRD_STTS_CD                                                 
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,TRANS_TYPE_STTS_CD                                           
                  ,CONTROL_NBR_STS_CD                                           
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
                  ,ACCT_RCV_STTS_CD                                             
                  ,RCV_CUST_NM_STS_CD                                           
                  ,RCV_SS_PRIM_STS_CD                                           
                  ,RCV_SS_SCDY_STS_CD                                           
                  ,RCV_ACT_TYP_STS_CD                                           
                  ,RCV_OCC_STTS_CD                                              
                  ,RCV_CRSPN_STTS_CD                                            
                  ,ACCT_DLVR_STTS_CD                                            
                  ,TRN_TYP_RJC_STS_CD                                           
                  ,CNTL_ASTD_STTS_CD                                            
                  ,STTLM_ASCTD_STS_CD                                           
                  ,TRANS_RFRN_STTS_CD                                           
                  ,CMNT_STTS_CD                                                 
                  ,PHSCL_SEQ_NBR                                                
                  ,LGCL_SEQ_NBR                                                 
                  ,TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_CD                                                
                  ,SBMTG_PRTCP_NBR                                              
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,ACCT_RCV_NBR                                                 
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                              
                  ,RCV_SS_SCNDY_NBR                                             
                  ,RCV_ACCT_TYPE_CD                                             
                  ,RCV_OCC_BRKR_NBR                                             
                  ,RCV_CRSPN_NBR                                                
                  ,PRTCP_CONTRA_CD                                              
                  ,ACCT_DLVR_NBR                                                
                  ,TRNFR_TYPE_RJCT_CD                                           
                  ,ACAT_CNTL_ASTD_NBR                                           
                  ,STTLM_ASCTD_DT                                               
                  ,TRANS_RFRN_ID_CD                                             
                  ,CMNT_TXT                                                     
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,DB_CR_CD                                                     
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
                  ,PRGM_NM                                                      
                  ,RR_CD                                                        
                  ,TRNFR_TYPE_RJC1_CD                                           
                  ,TRNFR_TYPE_RJC2_CD                                           
                  ,UPDT_TMSTP                                                   
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTITRF.CLIENT-NBR                                       
                  ,:DCLACTITRF.DSTBN-SIDE-CD                                    
                  ,:DCLACTITRF.ACAT-CONTROL-NBR                                 
                  ,:DCLACTITRF.PRCS-DT                                          
                  ,:DCLACTITRF.CYCLE-CD                                         
                  ,:DCLACTITRF.SYS-ACT-CD                                       
                  ,:DCLACTITRF.SYS-RJCT-RSN-CD                                  
                  ,:DCLACTITRF.STTS-CD                                          
                  ,:DCLACTITRF.DAYS-STTS-QTY                                    
                  ,:DCLACTITRF.RCRD-STTS-CD                                     
                  ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLACTITRF.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTITRF.CONTROL-NBR-STS-CD                               
                  ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                               
                  ,:DCLACTITRF.RCV-NBR-STTS-CD                                  
                  ,:DCLACTITRF.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTITRF.ACCT-RCV-STTS-CD                                 
                  ,:DCLACTITRF.RCV-CUST-NM-STS-CD                               
                  ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                               
                  ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                               
                  ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                               
                  ,:DCLACTITRF.RCV-OCC-STTS-CD                                  
                  ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                
                  ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                
                  ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                               
                  ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                
                  ,:DCLACTITRF.STTLM-ASCTD-STS-CD                               
                  ,:DCLACTITRF.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTITRF.CMNT-STTS-CD                                     
                  ,:DCLACTITRF.PHSCL-SEQ-NBR                                    
                  ,:DCLACTITRF.LGCL-SEQ-NBR                                     
                  ,:DCLACTITRF.TRANS-TYPE-CD                                    
                  ,:DCLACTITRF.TRNFR-TYPE-CD                                    
                  ,:DCLACTITRF.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTITRF.RCV-NBR                                          
                  ,:DCLACTITRF.DLVR-NBR                                         
                  ,:DCLACTITRF.ACCT-RCV-NBR                                     
                  ,:DCLACTITRF.RCV-CUST-NM                                      
                  ,:DCLACTITRF.RCV-SS-PRIM-NBR                                  
                  ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                 
                  ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                 
                  ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                 
                  ,:DCLACTITRF.RCV-CRSPN-NBR                                    
                  ,:DCLACTITRF.PRTCP-CONTRA-CD                                  
                  ,:DCLACTITRF.ACCT-DLVR-NBR                                    
                  ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                               
                  ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                               
                  ,:DCLACTITRF.STTLM-ASCTD-DT                                   
                  ,:DCLACTITRF.TRANS-RFRN-ID-CD                                 
                  ,:DCLACTITRF.CMNT-TXT                                         
                  ,:DCLACTITRF.CICS-TERM-ID-CD                                  
                  ,:DCLACTITRF.CRT-TMSTP                                        
                  ,:DCLACTITRF.DB-CR-CD                                         
                  ,:DCLACTITRF.NSCC-ACK-IND                                     
                  ,:DCLACTITRF.NSCC-PEND-CD                                     
                  ,:DCLACTITRF.PRGM-NM                                          
                  ,:DCLACTITRF.RR-CD                                            
                  ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                               
                  ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                               
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-ADD-CNT                                       
ET0006       IF WS-INTERNALY-TRANSFERED-IND = 'Y'                               
ET0006         DISPLAY '   ACTITRF ADDED FOR CHANGE RECORD.'                    
ET0006         ' TRANS-TYPE-CD=' TRANS-TYPE-CD OF DCLACTITRF                    
ET0006       ELSE                                                               
               DISPLAY '   ACTITRF ADDED.'                                      
              ' TRANS-TYPE-CD=' TRANS-TYPE-CD OF DCLACTITRF                     
              ' TRNFR-TYPE-RJCT-CD=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF           
ET0006       END-IF                                                             
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
               IF  SQLCODE  =  -803                                             
ET0006           IF WS-INTERNALY-TRANSFERED-IND = 'Y'                           
ET0006             PERFORM 6911-UPD-ACTITRF-INTRNL-TRNF THRU 6911-EXIT          
ET0006           ELSE                                                           
                   PERFORM 6910-UPDATE-ACTITRF     THRU 6910-EXIT               
ET0006           END-IF                                                         
               ELSE                                                             
                   DISPLAY '   ACTITRF NOT ADDED.'                              
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' WF-CLIENT-NBR                             
                              ' TFR=' WF-TRNFR-TYPE-CD                          
                   DISPLAY '    DLV=' WF-DLVR-NBR                               
                           ' DLV-AC=' WF-ACCT-DLVR-NBR                          
                              ' RCV=' WF-RCV-NBR                                
                           ' RCV-AC=' WF-ACCT-RCV-NBR                           
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT810: DCLACTITRF  ='                              
                        '(' DCLACTITRF ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6900-EXIT. EXIT.                                                         
                                                                                
       6910-UPDATE-ACTITRF SECTION.                                             
           MOVE '6910-UPDATE-ACTITRF       ' TO W-ROUTINE-1.                    
                                                                                
           EXEC SQL SELECT                                                      
                      ACAT_CONTROL_NBR                                          
                     ,NSCC_PEND_CD                                              
                     ,PRCS_DT                                                   
                     ,PRGM_NM                                                   
                     ,UPDT_TMSTP                                                
                     ,TRNFR_TYPE_RJCT_CD                                        
               INTO  :W-ACTITRF-ACAT-CONTROL-NO                                 
                    ,:W-ACTITRF-NSCC-PEND-CD                                    
                    ,:W-ACTITRF-PRCS-DT                                         
                    ,:W-ACTITRF-PRGM-NM                                         
                    ,:W-ACTITRF-UPDT-TMSTP                                      
                    ,:W-ACTITRF-TRNFR-TYPE-RJCT-CD                              
               FROM  ACTITRF                                                    
              WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                  
                AND  RCV_NBR           = :DCLVTRNFR.RCV-NBR                     
                AND  DLVR_NBR          = :DCLVTRNFR.DLVR-NBR                    
                AND  ACCT_RCV_NBR      = :DCLVTRNFR.ACCT-RCV-NBR                
                AND  ACCT_DLVR_NBR     = :DCLVTRNFR.ACCT-DLVR-NBR               
                AND  TRNFR_TYPE_CD     = :DCLVTRNFR.TRNFR-TYPE-CD               
           END-EXEC                                                             
                                                                                
           DISPLAY '   ACTITRF FOUND    :'                                      
                         ' CLT=' CLIENT-NBR OF DCLVTRNFR                        
                         ' CTL=' W-ACTITRF-ACAT-CONTROL-NO                      
                                ' RJCT=' W-ACTITRF-TRNFR-TYPE-RJCT-CD           
                                ' PEND=' W-ACTITRF-NSCC-PEND-CD                 
                                ' PRCS=' W-ACTITRF-PRCS-DT                      
                                ' PRGM=' W-ACTITRF-PRGM-NM                      
                                 ' UPDT=' W-ACTITRF-UPDT-TMSTP                  
                                                                                
           IF  W-ACTITRF-ACAT-CONTROL-NO NOT = WF-ACAT-CONTROL-NBR              
               DISPLAY '   ACAT-CONTROL-NBR NOT EQUAL. BYPASS'                  
               GO TO 6910-EXIT                                                  
           END-IF                                                               
                                                                                
           IF TRNFR-TYPE-RJCT-CD OF DCLACTITRF > '00'                           
               GO TO 6910-EXIT                                                  
           END-IF                                                               
                                                                                
           IF TRNFR-TYPE-RJCT-CD OF DCLACTITRF < '01'                           
              IF  W-REJ-LP           = 'Y'                                      
                 IF BH-ACAT-REJ-PEND-DEL-LP-CODE > '00'                         
                     MOVE BH-ACAT-REJ-PEND-DEL-LP-CODE                          
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                 END-IF                                                         
              END-IF                                                            
              IF  W-REJ-PRIV         = 'Y'                                      
                 IF BH-ACAT-REJ-PEND-DEL-PRIV-CODE > '00'                       
                      MOVE BH-ACAT-REJ-PEND-DEL-PRIV-CODE                       
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                 END-IF                                                         
              END-IF                                                            
              IF  W-REJ-NTS          = 'Y'                                      
                 IF BH-ACAT-REJ-PEND-DEL-NTS-CODE > '00'                        
                      MOVE BH-ACAT-REJ-PEND-DEL-NTS-CODE                        
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                 END-IF                                                         
              END-IF                                                            
              IF  W-REJ-FLAT         = 'Y'                                      
                 IF BH-ACAT-REJ-PEND-DEL-FLAT-CODE > '00'                       
                      MOVE BH-ACAT-REJ-PEND-DEL-FLAT-CODE                       
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                 END-IF                                                         
              END-IF                                                            
              MOVE 'R'                TO TRANS-TYPE-CD   OF DCLACTITRF          
              MOVE ' '                TO CICS-TERM-ID-CD OF DCLACTITRF          
              MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP     OF DCLACTITRF          
              MOVE W-PGM-NAME          TO PRGM-NM        OF DCLACTITRF          
              MOVE W-BH-NSCC-PEND-CD   TO NSCC-PEND-CD   OF DCLACTITRF          
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
             UPDATE ACTITRF                                                     
                SET                                                             
                   TRANS_TYPE_CD       = :DCLACTITRF.TRANS-TYPE-CD              
                  ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD         
                  ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD            
                  ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP                 
                  ,PRGM_NM             = :DCLACTITRF.PRGM-NM                    
                  ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD               
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD                    
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-UPD-CNT                                       
               DISPLAY '   ACTITRF UPDATED'                                     
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-UPD-CNT                                   
               DISPLAY '   ACTITRF NOT UPDATED '                                
                         ' SQLCODE = ' W-DB2-SQLCODE                            
               DISPLAY '   '                                                    
                      'ACTITRF PRIMARY KEY:'                                    
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' TFR=' WF-TRNFR-TYPE-CD                              
               DISPLAY '    DLV=' WF-DLVR-NBR                                   
                       ' DLV-AC=' WF-ACCT-DLVR-NBR                              
                          ' RCV=' WF-RCV-NBR                                    
                       ' RCV-AC=' WF-ACCT-RCV-NBR                               
               DISPLAY '   '                                                    
                      'ACTITRF  UPDATE KEY:'                                    
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' TFR=' WF-TRNFR-TYPE-CD                              
               DISPLAY '    DLV=' WF-DLVR-NBR                                   
                       ' DLV-AC=' WF-ACCT-DLVR-NBR                              
                          ' RCV=' WF-RCV-NBR                                    
                       ' RCV-AC=' WF-ACCT-RCV-NBR                               
             IF  SQLCODE  =  +100                                               
                   DISPLAY '   ACTITRF UPDATE NOT FOUND.'                       
             END-IF                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT810: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6910-EXIT. EXIT.                                                         
      /                                                                         
ET0006******************************************************************        
ET0006* UPDATE INITIAL TRANSFER TABLE ROW, AND DISPLAY APPROPRIATE              
ET0006* MESSAGE IF DUPLICATE CHANGE RECORD, THAT WAS CREATED DUE TO AN          
ET0006* INTERNAL ACCOUNT TRANSFER, IS FOUND IN INITIAL TRANSFER TBL.            
ET0006*   TRANS-TYPE-CD OF DCLACTITRF = 'C' MEANS 'CHANGE'.                     
ET0006*   TRANS-TYPE-CD OF DCLACTITRF = 'R' MEANS 'REJECT'.                     
ET0006******************************************************************        
ET0006 6911-UPD-ACTITRF-INTRNL-TRNF.                                            
ET0006     MOVE W-CHANGED-DLVR-NBR TO ACCT-DLVR-NBR OF DCLVTRNFR.               
ET0006                                                                          
ET0006     EXEC SQL                                                             
ET0006       UPDATE ACTITRF                                                     
ET0006          SET                                                             
ET0006             UPDT_TMSTP          = :W-CURRENT-TIMESTAMP                   
ET0006            ,PRGM_NM             = 'CAT810'                               
DJ0013            ,ACCT_DLVR_STTS_CD   = '1'                                    
ET0006          WHERE  CLIENT_NBR      = :DCLVTRNFR.CLIENT-NBR                  
ET0006            AND  RCV_NBR         = :DCLVTRNFR.RCV-NBR                     
ET0006            AND  DLVR_NBR        = :DCLVTRNFR.DLVR-NBR                    
ET0006            AND  ACCT_RCV_NBR    = :DCLVTRNFR.ACCT-RCV-NBR                
ET0006            AND  ACCT_DLVR_NBR   = :DCLVTRNFR.ACCT-DLVR-NBR               
ET0006            AND  TRNFR_TYPE_CD   = :DCLVTRNFR.TRNFR-TYPE-CD               
ET0006     END-EXEC.                                                            
ET0006                                                                          
ET0006     MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
ET0006     MOVE 'UPDATE'                 TO W-DB2-ACTION                        
ET0006     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
ET0006                                                                          
ET0006     IF  SQLCODE  =  +0                                                   
ET0006         ADD 1 TO W-ACTITRF-UPD-CNT                                       
ET0006         PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
ET0006         DISPLAY '   ACTITRF UPDATED'                                     
ET0006     ELSE                                                                 
ET0006         ADD 1 TO W-ACTITRF-NOT-UPD-CNT                                   
ET0006         DISPLAY '   ACTITRF NOT UPDATED '                                
ET0006                   ' SQLCODE = ' W-DB2-SQLCODE                            
ET0006         DISPLAY '   '                                                    
ET0006                'ACTITRF  UPDATE KEY:'                                    
ET0006                    ' CLT=' WF-CLIENT-NBR                                 
ET0006                    ' TFR=' WF-TRNFR-TYPE-CD                              
ET0006         DISPLAY '    DLV=' WF-DLVR-NBR                                   
ET0006                 ' DLV-AC=' W-CHANGED-DLVR-NBR                            
ET0006                    ' RCV=' WF-RCV-NBR                                    
ET0006                 ' RCV-AC=' WF-ACCT-RCV-NBR                               
ET0006       IF  SQLCODE  =  +100                                               
ET0006             DISPLAY '   ACTITRF UPDATE NOT FOUND.'                       
ET0006       END-IF                                                             
ET0006             DISPLAY ' '                                                  
ET0006             DISPLAY 'CAT810: ERROR UPDATING A ROW IN ACTITRF'            
ET0006                   ' (ACAT-TRNFR      TABLE)'                             
ET0006             DISPLAY 'CAT810: DCLACTITRF  ='                              
ET0006                     '(' DCLACTITRF ')'                                   
ET0006             PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
ET0006     END-IF.                                                              
ET0006                                                                          
ET0006 6911-EXIT.  EXIT.                                                        
ET0006/                                                                         
       6920-SELECT-ACTITRF SECTION.                                             
           MOVE '6920-SELECT-ACTITRF          ' TO W-ROUTINE-1.                 
                                                                                
           MOVE ' '   TO W-ACTITRF-FND-SW                                       
           INITIALIZE DCLACTITRF                                                
                                                                                
           EXEC SQL SELECT                                                      
                   TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_RJCT_CD                                           
                  ,CICS_TERM_ID_CD                                              
                  ,UPDT_TMSTP                                                   
                  ,PRGM_NM                                                      
                  ,NSCC_PEND_CD                                                 
               INTO                                                             
                   :DCLACTITRF.TRANS-TYPE-CD                                    
                  ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                               
                  ,:DCLACTITRF.CICS-TERM-ID-CD                                  
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                  ,:DCLACTITRF.PRGM-NM                                          
                  ,:DCLACTITRF.NSCC-PEND-CD                                     
                                                                                
               FROM  ACTITRF                                                    
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD                    
           END-EXEC                                                             
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y'   TO W-ACTITRF-FND-SW                                   
           ELSE                                                                 
              IF  SQLCODE  =  +100                                              
                  MOVE 'N'   TO W-ACTITRF-FND-SW                                
              ELSE                                                              
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT810: ERROR SELECTING A ROW IN ACTITRF'           
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT810: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
       6920-EXIT. EXIT.                                                         
      /                                                                         
       7100-WRITE-ACATDLVF-TYPE3 SECTION.                                       
           MOVE '7100-WRITE-ACATDLVF-TYPE3         ' TO W-ROUTINE-1.            
                                                                                
           MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
           MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
           MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
           MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
           MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
           MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
           MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
           MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
           MOVE 'B'                      TO ACATDLVF-RECORD-TYPE                
           MOVE W-BAL-TYPE1              TO ACATDLVF-TYPE1-BALANCE              
           MOVE W-BAL-TYPE2              TO ACATDLVF-TYPE2-BALANCE              
           MOVE W-BAL-TYPE3              TO ACATDLVF-TYPE3-BALANCE              
           MOVE W-BAL-TYPE5              TO ACATDLVF-TYPE5-BALANCE              
           MOVE W-BAL-SMA                TO ACATDLVF-SMA-BALANCE                
LRM033     MOVE W-BAL-PEND-DVND          TO ACATDLVF-PEND-DVDND-DB-AMT          
           MOVE DAYS-STTS-QTY OF DCLVTRNFR TO ACATDLVF-DAYS-STTS-QTY.           
           MOVE W-BH-NSCC-PEND-CD        TO ACATDLVF-BAL-NSCC-PEND-CD.          
           MOVE STTS-CD OF DCLVTRNFR     TO ACATDLVF-STTS-CD.                   
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           ADD 1 TO W-ACATDLVF-CNT.                                             
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7200-WRITE-ACATDLVF-FRAC SECTION.                                        
           MOVE '7200-WRITE-ACATDLVF-FRAC        ' TO W-ROUTINE-1.              
                                                                                
           MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
           MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
           MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
           MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
           MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
           MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
           MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
           MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
LRM025     IF ACATDLVF-FRGN-FEE-REC                                             
LRM025        MOVE 'F'                   TO ACATDLVF-RECORD-TYPE                
LRM025     ELSE                                                                 
              MOVE 'A'                   TO ACATDLVF-RECORD-TYPE                
LRM025     END-IF.                                                              
                                                                                
           IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '3')                               
               MOVE 'C'                  TO ACATDLVF-CASH-MGN-IND               
           ELSE                                                                 
             IF  (CUSHOL-ACCOUNT-TYPE = '2')                                    
                 MOVE 'M'                TO ACATDLVF-CASH-MGN-IND               
             ELSE                                                               
      *******IF**(CUSHOL-ACCOUNT-TYPE = '5')                                    
                 MOVE 'S'                TO ACATDLVF-CASH-MGN-IND               
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF  WORK-POS-QTY < 0                                                 
               MOVE 'S'                  TO ACATDLVF-PSTN-CD                    
           ELSE                                                                 
               MOVE 'L'                  TO ACATDLVF-PSTN-CD                    
           END-IF                                                               
                                                                                
           MOVE WK-MS-SEC                TO ACATDLVF-ADP-SECURITY               
           MOVE WK-MS-CUSIP              TO ACATDLVF-CUSIP-NUM                  
LRM025     MOVE WK-MS-CUSIP-10-12        TO ACATDLVF-CUSIP-10-12                
           MOVE W-ASSET-QTY-UNSIGN       TO ACATDLVF-QTY                        
           MOVE WORK-POS-VALUE           TO ACATDLVF-MARKET-VALUE               
           MOVE WORK-POS-QTY-DECIMAL     TO ACATDLVF-FRAC-QTY                   
                                                                                
           COMPUTE ACATDLVF-FRAC-MARKET-VALUE ROUNDED =                         
                             WORK-POS-QTY-DECIMAL * WK-MS-CLOSING-PRICE         
           IF  WK-MS-BOND                                                       
                   AND ACATDLVF-FRAC-MARKET-VALUE NOT = 0                       
               COMPUTE ACATDLVF-FRAC-MARKET-VALUE =                             
                       ACATDLVF-FRAC-MARKET-VALUE / 100                         
           END-IF                                                               
                                                                                
           MOVE STTLM-LCTN-CD OF DCLACTIAST TO ACATDLVF-SETTLING-LOC            
           MOVE STTLM-RSN-CD  OF DCLACTIAST                                     
                                            TO ACATDLVF-SETTLING-REASON         
           MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST                                 
                                            TO ACATDLVF-ASSET-CATEGORY          
           MOVE CUSHOL-CPH-SEC-DESC(1)                                          
                                            TO ACATDLVF-ASSET-DESC              
           MOVE W-BH-NSCC-PEND-CD        TO ACATDLVF-NSCC-PEND-CD.              
LRM025     MOVE WK-MSD-ISIN              TO ACATDLVF-MSD-ISIN.                  
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           ADD 1 TO W-ACATDLVF-CNT.                                             
                                                                                
       7200-EXIT. EXIT.                                                         
      /                                                                         
LRM013 7300-WRITE-ACATDLVF-MMF SECTION.                                         
LRM013     MOVE '7300-WRITE-ACATDLVF-MMF         ' TO W-ROUTINE-1.              
LRM013                                                                          
LRM013     MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
LRM013     MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
LRM013     MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
LRM013     MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
LRM013     MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
LRM013     MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
LRM013     MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
LRM013     MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
LRM013     MOVE 'M'                      TO ACATDLVF-RECORD-TYPE                
LRM013     MOVE 'C'                      TO ACATDLVF-CASH-MGN-IND               
LRM013                                                                          
LRM013     IF  CUSHOL-CPH-TD-QTY < 0                                            
LRM013         MOVE 'S'                  TO ACATDLVF-PSTN-CD                    
LRM013     ELSE                                                                 
LRM013         MOVE 'L'                  TO ACATDLVF-PSTN-CD                    
LRM013     END-IF                                                               
LRM013                                                                          
LRM013     MOVE WK-MS-SEC                TO ACATDLVF-ADP-SECURITY               
LRM013     MOVE WK-MS-CUSIP              TO ACATDLVF-CUSIP-NUM                  
LRM025     MOVE WK-MS-CUSIP-10-12        TO ACATDLVF-CUSIP-10-12                
LRM025     MOVE WK-MSD-ISIN              TO ACATDLVF-MSD-ISIN.                  
LRM013     MOVE CUSHOL-CPH-TD-QTY        TO ACATDLVF-QTY                        
LRM053     MOVE CUSHOL-CPH-MKT-VAL       TO ACATDLVF-MARKET-VALUE               
LRM013     MOVE WORK-POS-QTY-DECIMAL     TO ACATDLVF-FRAC-QTY                   
LRM013     MOVE ZERO                     TO ACATDLVF-FRAC-MARKET-VALUE          
LRM013                                                                          
LRM013     MOVE SPACES                   TO ACATDLVF-SETTLING-LOC               
LRM013                                      ACATDLVF-SETTLING-REASON            
LRM013                                      ACATDLVF-ASSET-CATEGORY             
LRM013     MOVE 'MUTUAL FUND DLVR AS CASH'                                      
LRM013                                   TO ACATDLVF-ASSET-DESC                 
LRM013     MOVE ' '                      TO ACATDLVF-NSCC-PEND-CD.              
LRM013                                                                          
LRM013     WRITE ACATDLVF-RECORD.                                               
LRM013     ADD 1 TO W-ACATDLVF-CNT.                                             
LRM013                                                                          
LRM013 7300-EXIT. EXIT.                                                         
      /                                                                         
LRM033 7310-WRITE-ACATDLVF-DVND SECTION.                                        
LRM033     MOVE '7310-WRITE-ACATDLVF-DVND        ' TO W-ROUTINE-1.              
LRM033                                                                          
LRM033     MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
LRM033     MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
LRM033     MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
LRM033     MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
LRM033     MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
LRM033     MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
LRM033     MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
LRM033     MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
LRM033     MOVE 'D'                      TO ACATDLVF-RECORD-TYPE                
LRM033     MOVE 'C'                      TO ACATDLVF-CASH-MGN-IND               
LRM033                                                                          
LRM033     MOVE 'S'                      TO ACATDLVF-PSTN-CD                    
LRM033     MOVE DVND-ADP-NBR             TO ACATDLVF-ADP-SECURITY               
LRM033     MOVE DVND-CUSIP-NUM           TO ACATDLVF-CUSIP-NUM                  
LRM033     MOVE SPACES                   TO ACATDLVF-CUSIP-10-12                
LRM033     MOVE ZERO                       TO ACATDLVF-QTY                      
LRM033                                        ACATDLVF-FRAC-QTY                 
LRM033                                        ACATDLVF-MARKET-VALUE             
LRM033                                      ACATDLVF-FRAC-MARKET-VALUE          
LRM033     MOVE DVND-ASSET-VALUE           TO ACATDLVF-ASSET-DVDND-AMT          
LRM033                                                                          
LRM033     MOVE SPACES                   TO ACATDLVF-SETTLING-LOC               
LRM033                                      ACATDLVF-SETTLING-REASON            
LRM033                                      ACATDLVF-ASSET-CATEGORY             
LRM033     MOVE 'PEND DVND DB '          TO ACATDLVF-ASSET-DESC                 
LRM033     MOVE DVND-REC-DATE(3:6)       TO ACATDLVF-ASSET-DESC(14:6)           
LRM033     MOVE DVND-PAY-DATE(3:6)       TO ACATDLVF-ASSET-DESC(21:6)           
LRM033     MOVE ' '                      TO ACATDLVF-NSCC-PEND-CD.              
LRM033     MOVE WK-MSD-ISIN              TO ACATDLVF-MSD-ISIN.                  
LRM033                                                                          
LRM033     WRITE ACATDLVF-RECORD.                                               
LRM033     ADD 1 TO W-ACATDLVF-CNT.                                             
LRM033                                                                          
LRM033 7310-EXIT. EXIT.                                                         
      /                                                                         
LRM039 7312-WRITE-ACATDLVF-TYPE4 SECTION.                                       
LRM039     MOVE '7312-WRITE-ACATDLVF-TYPE4       ' TO W-ROUTINE-1.              
LRM039                                                                          
LRM039     MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
LRM039     MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
LRM039     MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
LRM039     MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
LRM039     MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
LRM039     MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
LRM039     MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
LRM039     MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
LRM039     MOVE '4'                      TO ACATDLVF-RECORD-TYPE                
LRM039     MOVE 'C'                      TO ACATDLVF-CASH-MGN-IND               
LRM039                                                                          
LRM039     MOVE 'S'                      TO ACATDLVF-PSTN-CD                    
LRM039     MOVE CUSHOL-SECURITY-NO       TO ACATDLVF-ADP-SECURITY               
LRM033     MOVE CUSHOL-CPH-CUSIP         TO ACATDLVF-CUSIP-NUM                  
LRM033     MOVE SPACES                   TO ACATDLVF-CUSIP-10-12                
LRM039     MOVE W-POS-MEMO-TYPE4-QTY     TO ACATDLVF-QTY                        
LRM039                                      ACATDLVF-FRAC-QTY                   
LRM039     MOVE ZERO                     TO ACATDLVF-MARKET-VALUE               
LRM039                                      ACATDLVF-FRAC-MARKET-VALUE          
LRM039                                      ACATDLVF-ASSET-DVDND-AMT            
LRM039     MOVE ASSET-AMT OF DCLACTIAST  TO ACATDLVF-MARKET-VALUE               
LRM039                                                                          
LRM039     MOVE SPACES                   TO ACATDLVF-SETTLING-LOC               
LRM039                                      ACATDLVF-SETTLING-REASON            
LRM039                                      ACATDLVF-ASSET-CATEGORY             
LRM039     MOVE 'TYPE4 MEMO   '          TO ACATDLVF-ASSET-DESC                 
LRM039     MOVE ' '                      TO ACATDLVF-NSCC-PEND-CD.              
LRM039     MOVE WK-MSD-ISIN              TO ACATDLVF-MSD-ISIN.                  
LRM039                                                                          
LRM039     WRITE ACATDLVF-RECORD.                                               
LRM039     ADD 1 TO W-ACATDLVF-CNT.                                             
LRM039                                                                          
LRM039 7312-EXIT. EXIT.                                                         
      /                                                                         
DJ0013 7400-WRITE-ASCENDIS-WHLD SECTION.                                        
DJ0013     MOVE '7400-WRITE-ASCENDIS-WHLD        ' TO W-ROUTINE-1.              
DJ0013                                                                          
DJ0013     MOVE SPACES                   TO CATWHLD-RECORD                      
DJ0013     MOVE WF-CLIENT-NBR            TO CATWHLD-CLIENT-NBR                  
DJ0013     MOVE WF-ACAT-CONTROL-NBR      TO CATWHLD-ACAT-CONTROL-NBR            
DJ0013     MOVE WF-BRANCH-ACCT           TO CATWHLD-BRN-ACCT                    
DJ0013     MOVE CUSHOL-FRGN-CURR-CODE    TO CATWHLD-CURR-CODE                   
DJ0013     MOVE CUSHOL-ACCOUNT-TYPE      TO CATWHLD-TYPE                        
DJ0013     MOVE CUSHOL-SECURITY-NO       TO CATWHLD-ASSET-ADP-NBR               
DJ0013     IF  CUSHOL-WI                                                        
DJ0013         MOVE 'W'                  TO CATWHLD-WI-CODE                     
DJ0013     ELSE                                                                 
DJ0013         MOVE 'N'                  TO CATWHLD-WI-CODE                     
DJ0013     END-IF                                                               
DJ0013     MOVE W-ASCENDIS-WHLD-REASON   TO CATWHLD-ASSET-WHLD-RSN-CD           
DJ0013     WRITE CATWHLD-RECORD.                                                
DJ0013     ADD 1 TO W-CATWHLD-CNT.                                              
DJ0013                                                                          
DJ0013 7400-EXIT. EXIT.                                                         
      /                                                                         
LRM042 7500-WRITE-ASCENDIS-EXCP.                                                
LRM042     MOVE '7500-WRITE-ASCENDIS-EXCP        ' TO W-ROUTINE-1.              
LRM042                                                                          
LRM042     MOVE SPACES                   TO CATEXCP-RECORD                      
LRM042     MOVE WF-CLIENT-NBR            TO CATEXCP-CLIENT-NBR                  
LRM042     MOVE 'T'                      TO CATEXCP-REC-TYPE                    
LRM042     MOVE WF-ACAT-CONTROL-NBR      TO CATEXCP-ACAT-CONTROL-NBR            
LRM042     MOVE WF-BRANCH-ACCT           TO CATEXCP-BRANCH-CD                   
LRM042     MOVE WF-BRANCH-ACCT(4:5)      TO CATEXCP-ACCT-CD                     
LRM042     SET CATEXCP-SPAD TO TRUE                                             
LRM042     MOVE CUSHOL-SECURITY-NO       TO CATEXCP-EXCEPTION-DATA              
LRM042     MOVE '-'                      TO CATEXCP-EXCEPTION-DATA(8:1)         
LRM042     MOVE W-REJ-SPAD-CODE          TO CATEXCP-EXCEPTION-DATA(9:2)         
LRM042     WRITE CATEXCP-RECORD.                                                
LRM042     ADD 1 TO W-CATEXCP-CNT.                                              
LRM042                                                                          
LRM042 7500-EXIT. EXIT.                                                         
      /                                                                         
       8100-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT810: '                                               
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
                  ' INFILE-CNT= '           W-INFILE-CNT                        
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT            
           ELSE                                                                 
               ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.           
                                                                                
       8100-EXIT. EXIT.                                                         
      /                                                                         
       8300-DISPLAY-KEY    SECTION.                                             
           DISPLAY '    KEY:'                                                   
                                ' CLT=' WF-CLIENT-NBR                           
                                ' CTL=' WF-ACAT-CONTROL-NBR                     
                                ' TFR=' WF-TRNFR-TYPE-CD                        
                                ' TRN=' WF-TRANS-TYPE-CD                        
           DISPLAY '   '                                                        
                                ' DLV=' WF-DLVR-NBR                             
                             ' DLV-AC=' WF-ACCT-DLVR-NBR                        
                                ' RCV=' WF-RCV-NBR                              
                             ' RCV-AC=' WF-ACCT-RCV-NBR                         
           DISPLAY '   '                                                        
                         ' SEC-CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                         ' SEC-NO=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                         ' SEC-CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                         ' STL-LC=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
           .                                                                    
       8300-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8500-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                             
                                                                                
           DISPLAY 'CAT810: U3999 - ABENDING ON BAD DB2 STATUS'                 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT810: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8500-EXIT. EXIT.                                                         
      /                                                                         
       8700-SQL-ROLLBACK   SECTION.                                             
           DISPLAY '8700-SQL-ROLLBACK'                                          
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
                  ' LAST-COMMIT-INFILE-CNT = '                                  
                                            W-LAST-COMMIT-INFILE-CNT            
                                                                                
           EXEC SQL ROLLBACK WORK                                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
                                                                                
           IF ROLLBACK-AB                                                       
               DISPLAY                                                          
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                   
                   ROLLBACK-RETURN                                              
           ELSE                                                                 
               DISPLAY                                                          
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '               
                   ROLLBACK-RETURN                                              
           END-IF.                                                              
                                                                                
       8700-EXIT. EXIT.                                                         
      /                                                                         
       8900-DISPLAY-CNT   SECTION.                                              
           DISPLAY ' '                                                          
           DISPLAY 'CAT810: INFILE  COUNT      = ' W-INFILE-CNT                 
                 ' (INCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT810: ACATDLVF COUNT     = ' W-ACATDLVF-CNT               
                 ' (EXCLUDES HEADER AND TRAILER)'                               
LRM042     DISPLAY 'CAT810: CATWHLD  COUNT     = ' W-CATWHLD-CNT                
LRM042           ' (EXCLUDES HEADER AND TRAILER)'                               
LRM042     DISPLAY 'CAT810: CATEXCP  COUNT     = ' W-CATEXCP-CNT                
LRM042           ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT810: FUL-TFR-DLVR-CNT   = ' W-LOAD-CNT                   
           DISPLAY 'CAT810: W-FLAT-CNT         = ' W-FLAT-CNT                   
ET0002     DISPLAY 'CAT810: MMF FILE READ CNT  = ' W-MMF-CNT                    
ET0002           ' (INCLUDES HEADER)'                                           
           DISPLAY 'CAT810: BAL-READ-CNT       = ' W-BAL-CNT                    
           DISPLAY 'CAT810: POS-READ-CNT       = ' W-POS-CNT                    
           DISPLAY ' '                                                          
           DISPLAY 'CAT810: POSIT-OUTPUT-CNT   = ' W-POSIT-CNT                  
           DISPLAY 'CAT810: W-WHEN-ISSUE-CNT   = ' W-WHEN-ISSUE-CNT             
           DISPLAY 'CAT810: W-RESTRICTED-CNT   = ' W-RESTRICTED-CNT             
           DISPLAY 'CAT810: W-MRGIMM-CNT       = ' W-MRGIMM-CNT                 
           DISPLAY 'CAT810: W-MRGIMM-FND-CNT   = ' W-MRGIMM-FND-CNT             
                          ' W-MRGIMM-NOTFND-CNT= ' W-MRGIMM-NOTFND-CNT          
           DISPLAY ' '                                                          
ET0002     DISPLAY 'CAT810: W-GETNA-FND-CNT    = ' W-GETNA-FND-CNT              
ET0002                    ' W-GETNA-NOTFND-CNT = ' W-GETNA-NOTFND-CNT           
           DISPLAY 'CAT810: VRSTSEC-FND-CNT    = ' W-VRSTSEC-FND-CNT            
                          ' VRSTSEC-NOTFND-CNT = ' W-VRSTSEC-NOTFND-CNT         
LRM005     DISPLAY 'CAT810: VRSDBLK-SEC-FND-CNT= ' W-VRSDBLK-SEC-FND-CNT        
           DISPLAY 'CAT810: W-PRNGFL-CNT       = ' W-PRNGFL-CNT                 
                          ' W-PRNGFL-FND-CNT   = ' W-PRNGFL-FND-CNT             
LRM033     DISPLAY 'CAT810: W-DVNDFL-CNT       = ' W-DVNDFL-CNT                 
LRM033                    ' W-DVNDFL-FND-CNT   = ' W-DVNDFL-FND-CNT             
LRM023     DISPLAY 'CAT810: W-MATURE-FND-CNT   = ' W-MATURE-FND-CNT             
LRM023     DISPLAY 'CAT810: W-VBNDDT-FND-CNT   = ' W-VBNDDT-FND-CNT             
LRM023                    ' W-VBNDDT-NOTFND-CNT= ' W-VBNDDT-NOTFND-CNT          
LRM024     DISPLAY 'CAT810: W-VBNDFTRV-FND-CNT = ' W-VBNDFTRV-FND-CNT           
LRM024                    ' W-VBNDFTRV-NOTFND  = ' W-VBNDFTRV-NOTFND            
LRM023     DISPLAY 'CAT810: W-BOND-AUDIT-ADD   = ' W-BOND-AUDIT-ADD             
LRM023     DISPLAY 'CAT810: W-BOND-AUDIT-NOTADD= ' W-BOND-AUDIT-NOTADD          
LRM034     DISPLAY 'CAT810: W-LVL4-AUDIT-ADD   = ' W-LVL4-AUDIT-ADD             
LRM034     DISPLAY 'CAT810: W-LVL4-AUDIT-NOTADD= ' W-LVL4-AUDIT-NOTADD          
           DISPLAY 'CAT810: BNWMAST-READ-CNT   = ' W-BNWMAST-CNT                
           DISPLAY 'CAT810: BNWMAST-READ-CNT   = ' W-BNWMAST-CNT                
                          ' BNWMAST-FND-CNT    = ' W-BNWMAST-FND-CNT            
           DISPLAY 'CAT810: BNWREGOP-READ-CNT  = ' W-BNWREGOP-CNT               
                          ' BNWREGOP-FND-CNT   = ' W-BNWREGOP-FND-CNT           
           DISPLAY 'CAT810: W-MFMSD-CNT        = ' W-MFMSD-CNT                  
                          ' W-MFMSD-FND-CNT    = ' W-MFMSD-FND-CNT              
DJ0016     DISPLAY 'CAT810: W-MFEXBR-CNT       = ' W-MFEXBR-CNT                 
DJ0016                    ' W-MFEXBR-FND-CNT   = ' W-MFEXBR-FND-CNT             
           DISPLAY 'CAT810: W-LEGG-CNT         = ' W-LEGG-CNT                   
           DISPLAY 'CAT810: W-OMNIBUS-CNT      = ' W-OMNIBUS-CNT                
LRM004     DISPLAY 'CAT810: W-DST-MFE-CNT      = ' W-DST-MFE-CNT                
LRM022     DISPLAY 'CAT810: W-PNC-SURPAS-CNT   = ' W-PNC-SURPAS-CNT             
           DISPLAY 'CAT810: W-CKDIGIT-CNT      = ' W-CKDIGIT-CNT                
           DISPLAY 'CAT810: REMOVE-FRACTION-CNT= '                              
                                                  W-REMOVE-FRACTION-CNT         
LRM025     DISPLAY 'CAT810: W-FRGN-ASSET-CNT   = ' W-FRGN-ASSET-CNT             
           DISPLAY ' '                                                          
           DISPLAY 'CAT810: SQL-CNT            = ' W-SQL-CNT                    
           DISPLAY 'CAT810: W-COMMIT-CNT       = ' W-COMMIT-CNT                 
           DISPLAY 'CAT810: ACTIAST-ADD-CNT    = ' W-ACTIAST-ADD-CNT            
                          ' ACTIAST-NOT-ADD-CNT = '                             
                                                  W-ACTIAST-NOT-ADD-CNT         
           DISPLAY 'CAT810: ACTIAST-UPD-CNT    = ' W-ACTIAST-UPD-CNT            
                          ' ACTIAST-NOT-UPD-CNT = '                             
                                                  W-ACTIAST-NOT-UPD-CNT         
           DISPLAY 'CAT810: ACTIOPN-ADD-CNT    = ' W-ACTIOPN-ADD-CNT            
                          ' ACTIOPN-NOT-ADD-CNT = '                             
                                                  W-ACTIOPN-NOT-ADD-CNT         
           DISPLAY 'CAT810: ACTIOPN-UPD-CNT    = ' W-ACTIOPN-UPD-CNT            
                          ' ACTIOPN-NOT-UPD-CNT = '                             
                                                  W-ACTIOPN-NOT-UPD-CNT         
           DISPLAY 'CAT810: ACTIMF-ADD-CNT     = '   W-ACTIMF-ADD-CNT           
                          ' ACTIMF-NOT-ADD-CNT  = '                             
                                                   W-ACTIMF-NOT-ADD-CNT         
           DISPLAY 'CAT810: ACTIMF-UPD-CNT     = '   W-ACTIMF-UPD-CNT           
                          ' ACTIMF-NOT-UPD-CNT  = '                             
                                                   W-ACTIMF-NOT-UPD-CNT         
           DISPLAY 'CAT810: ACTITRF-ADD-CNT    = ' W-ACTITRF-ADD-CNT            
                          ' ACTITRF-NOT-ADD-CNT = '                             
                                                 W-ACTITRF-NOT-ADD-CNT          
           DISPLAY 'CAT810: ACTITRF-UPD-CNT    = ' W-ACTITRF-UPD-CNT            
                          ' ACTITRF-NOT-UPD-CNT = '                             
                                                 W-ACTITRF-NOT-UPD-CNT          
           DISPLAY 'CAT810: VTRNFR-UPD-CNT     = ' W-VTRNFR-UPD-CNT             
                          ' VTRNFR-NOT-UPD-CNT   = '                            
                                                 W-VTRNFR-NOT-UPD-CNT           
           DISPLAY ' '                                                          
           DISPLAY 'CAT810: W-LOAD-ONLY-CNT    = ' W-LOAD-ONLY-CNT              
           DISPLAY 'CAT810: W-LOAD-AND-SUBMIT  = ' W-LOAD-AND-SUBMIT-CNT        
           DISPLAY 'CAT810: W-SUBMIT-ONLY-CNT  = ' W-SUBMIT-ONLY-CNT            
                          ' W-AST-SUBMIT-COUNT   = ' W-AST-SUBMIT-COUNT         
           DISPLAY 'CAT810: W-AUTO-SUBMIT-CNT  = ' W-AUTO-SUBMIT-CNT            
                          ' W-AST-AUTO-COUNT     = ' W-AST-AUTO-COUNT           
           DISPLAY 'CAT810: W-VRSDACC-INSERT-CNT     = '                        
                            W-VRSDACC-INSERT-CNT                                
           DISPLAY 'CAT810: W-VRSDACC-NOT-INSERT-CNT = '                        
                            W-VRSDACC-NOT-INSERT-CNT                            
           DISPLAY 'CAT810: W-VRSDSEC-INSERT-CNT     = '                        
                            W-VRSDSEC-INSERT-CNT                                
           DISPLAY 'CAT810: W-VRSDSEC-NOT-INSERT-CNT = '                        
                            W-VRSDSEC-NOT-INSERT-CNT                            
           DISPLAY 'CAT810: W-VRSDSEC-DUPE-CNT       = '                        
                            W-VRSDSEC-DUPE-CNT                                  
           DISPLAY 'CAT810: W-VRSDSEC-FOREIGN-KY-CNT = '                        
                            W-VRSDSEC-FOREIGN-KY-CNT                            
DJ0013     DISPLAY 'CAT810: ACTRBSC-FND-CNT   = ' W-ACTRBSC-FND-CNT             
DJ0013                    ' ACTRBSC-NOTFND    = ' W-ACTRBSC-NOTFND-CNT          
           DISPLAY ' '                                                          
           .                                                                    
                                                                                
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
                                                                                
           DISPLAY ' '.                                                         
           MOVE ' '                      TO ACATDLVF-TRAILER-RECORD             
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-ACATDLVF-CNT           TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            ACATDLVF.                           
           MOVE CP2-RETURN-RECORD        TO ACATDLVF-TRAILER-RECORD             
DJ0013     MOVE LD-PROC-DATE             TO ACATDLVF-TRL-PROC-DATE              
DJ0013     MOVE 'CYCLE='                 TO ACATDLVF-TRL-CYCLE-LIT              
DJ0013     MOVE '00'                     TO ACATDLVF-TRL-CYCLE-NO               
           DISPLAY 'CAT810: ACATDLVF-TRL= ' ACATDLVF-TRAILER-RECORD             
           WRITE ACATDLVF-RECORD.                                               
           DISPLAY 'CAT810: ACATDLVF  TRAILER WRITTEN. STATUS = '               
                                               ACATDLVF-FILE-STATUS.            
                                                                                
DJ0013     DISPLAY ' '.                                                         
DJ0013     MOVE ' '                      TO CATWHLD-TRAILER-RECORD              
DJ0013     MOVE 'T'                      TO CP2-REQUEST-CODE.                   
DJ0013     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
DJ0013     MOVE W-CATWHLD-CNT            TO CP2-RECORD-COUNT.                   
DJ0013     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
DJ0013     CALL P2HDTR                USING CP2-AREA                            
DJ0013                                      CATWHLD.                            
DJ0013     MOVE CP2-RETURN-RECORD        TO CATWHLD-TRAILER-RECORD              
DJ0013     MOVE LD-PROC-DATE             TO CATWHLD-TRL-PROC-DATE               
DJ0013     MOVE 'CYCLE='                 TO CATWHLD-TRL-CYCLE-LIT               
DJ0013     MOVE '00'                     TO CATWHLD-TRL-CYCLE-NO                
DJ0013     DISPLAY 'CAT810: CATWHLD-TRL= ' CATWHLD-TRAILER-RECORD               
DJ0013     WRITE CATWHLD-RECORD.                                                
DJ0013     DISPLAY 'CAT810: CATWHLD   TRAILER WRITTEN. STATUS = '               
DJ0013                                         CATWHLD-FILE-STATUS.             
                                                                                
LRM042     MOVE ' '                      TO CATEXCP-TRAILER-RECORD              
LRM042     MOVE 'T'                      TO CP2-REQUEST-CODE.                   
LRM042     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
LRM042     MOVE W-CATEXCP-CNT            TO CP2-RECORD-COUNT.                   
LRM042     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
LRM042     CALL P2HDTR                USING CP2-AREA                            
LRM042                                      CATEXCP.                            
LRM042     MOVE CP2-RETURN-RECORD        TO CATEXCP-TRAILER-RECORD              
LRM042     MOVE LD-PROC-DATE             TO CATEXCP-TRL-PROC-DATE               
LRM042     MOVE 'CYCLE='                 TO CATEXCP-TRL-CYCLE-LIT               
LRM042     MOVE '00'                     TO CATEXCP-TRL-CYCLE-NO                
LRM042     DISPLAY 'CAT810: CATEXCP-TRL= ' CATEXCP-TRAILER-RECORD               
LRM042     WRITE CATEXCP-RECORD.                                                
LRM042     DISPLAY 'CAT810: CATEXCP  TRAILER WRITTEN. STATUS = '                
LRM042                                         CATEXCP-FILE-STATUS.             
ET0002     CLOSE MMF-FILE.                                                      
ET0005     MOVE 'C' TO GETVBAL-FUNC.                                            
ET0005     PERFORM CALL-GETVBAL.                                                
ET0005     DISPLAY 'CAT810: GETVBAL  CLOSED. STATUS = '                         
                                             BALNC-STATUS.                      
ET0005     MOVE 'C'        TO GETVHOL-FUNC                                      
ET0005     PERFORM CALL-GETVHOL.                                                
ET0005     DISPLAY 'CAT810: GETVHOL  CLOSED. STATUS = '                         
                                             POSVSAM-STATUS.                    
           CLOSE MRGIMM                                                         
           DISPLAY 'CAT810: MRGIMM   CLOSED. STATUS = '                         
                                             MRGIMM-STATUS.                     
           CLOSE PRNGFL                                                         
           DISPLAY 'CAT810: PRNGFL   CLOSED. STATUS = '                         
                                             PRNGFL-STATUS.                     
LRM033     CLOSE DVNDFL                                                         
LRM033     DISPLAY 'CAT810: DVNDFL   CLOSED. STATUS = '                         
LRM033                                       DVNDFL-STATUS.                     
           CLOSE MFMSD                                                          
           DISPLAY 'CAT810: MFMSD    CLOSED. STATUS = '                         
                                             MFMSD-STATUS.                      
           CLOSE BNWMAST                                                        
           DISPLAY 'CAT810: BNWMAST  CLOSED. STATUS = '                         
                                             BNWMAST-STATUS.                    
           CLOSE BNWREGOP                                                       
           DISPLAY 'CAT810: BNWREGOP CLOSED. STATUS = '                         
                                             BNWREGOP-STATUS.                   
DJ0016     CLOSE MFEXBR                                                         
DJ0016     DISPLAY 'CAT810: MFEXBR   CLOSED. STATUS = '                         
DJ0016                                       MFEXBR-STATUS.                     
           CLOSE ACATDLVF                                                       
           DISPLAY 'CAT810: ACATDLVF CLOSED. STATUS = '                         
                                             ACATDLVF-FILE-STATUS.              
DJ0013     CLOSE CATWHLD                                                        
DJ0013     DISPLAY 'CAT810: CATWHLD  CLOSED. STATUS = '                         
                                             CATWHLD-FILE-STATUS.               
                                                                                
LRM042     CLOSE CATEXCP                                                        
LRM042     DISPLAY 'CAT810: CATEXCP  CLOSED. STATUS = '                         
LRM042                                       CATEXCP-FILE-STATUS.               
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT810: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT. EXIT.                                                         
ET0005 CALL-GETVBAL.                                                            
ET0005     CALL GETVBAL USING GETVBAL-PARM.                                     
ET0005     MOVE GETVBAL-FILE-STATUS TO BALNC-STATUS                             
ET0005     IF GETVBAL-FILE = 'N'                                                
ET0005        MOVE GETVBAL-NEW-RECORD TO BAL-REC                                
ET0005     ELSE                                                                 
ET0005        MOVE GETVBAL-OLD-RECORD TO CMBL-CUSTOMER-BALANCE-SEGMENT.         
ET0005 CALL-GETVHOL.                                                            
ET0005     CALL GETVHOL USING GETVHOL-PARM.                                     
ET0005     MOVE GETVHOL-FILE-STATUS TO       POSVSAM-STATUS.                    
      *################################################################         
