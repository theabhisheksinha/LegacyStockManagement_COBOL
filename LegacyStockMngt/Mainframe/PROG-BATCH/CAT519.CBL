000001* PDX    - CAT519   C0360671 02/23/15 11:17:30 TBLAMUR            00001000
      * LRM056 SSR# 99150 MARK CONTRA CUSIP POSN AS WHI-STTS-CD = C TO          
      *   CAUSE ONLINE DSPLY WARNING WHEN CLIENT REMOVES THE WITHHELD.          
      *   ADD SETTLE LOC 35 TO BYPASS CONTRA CUSIP TEST.                        
000001* PDX    - CAT519   C0355480 06/12/14 11:44:43 TBLAMUR            00001000
      * CSG001 SSR 101121 REPLACE ILLEGAL CHARS IN MSD-DESC WITH SPACES.        
      * LRM054 SSR# 95308 USE EXPANDED MSD OPTION FACTOR                        
000001* PDX    - CAT519   C0353648 04/07/14 10:41:42 TBLAMUR            00001000
      * LRM053 SSR# 100417 SET FUND AGENT CODE NEW COL ON ACTIMF.               
000001* PDX    - CAT519   C0350737 01/23/14 11:57:40 TBLAMUR            00001000
      * LRM052 SSR# 99427 SAME CODE AS SSR 54991 FOR CLIENT 313,                
      *  TO NOT UPDATE RCVR ACCOUNT WHEN CVSRN IS MARKED.                       
000001* PDX    - CAT519   C0346158 10/11/13 15:05:52 TBLAMUR            00001000
000001* LRM052 SSR 83186 MMF NOT VALUED AT $1.00 PER SHARE, USE                 
000001*   THE MARKET VALUE, NOT THE QTY ON THESE POSITIONS.  CHANGE TO          
000001*   USE COPYBOOK CUSHOL (FROM HOLDAVSM) TO OBTAIN THE MMF CENTS.          
000001* PDX    - CAT519   C0344128 09/16/13 09:25:27 TBLAMUR            00001000
000001* LRM051 SSR 94296 RECOMPILE FOR EXPANDED BNWMASTW AND                    
      *    NEW COPYBOOK VERSION FOR NTWIOREC.                                   
000001* PDX    - CAT519   C0336625 06/17/13 08:58:55 TBLAMUR            00001000
000001* LRM050 SSR 85742 DST/SCHWAB SUPER OMNI FUNDS.                           
000001*  NTWMAST VALUE 5 USE WAIVE ACCOUNT.                                     
000001* PDX    - CAT519   C0336021 06/13/13 09:06:16 TBLAMUR            00001000
000001* LRM051 SSR 80735 MMF SWEEP CODE EXPAND TO 999.                          
      *  NO CHANGES TO ICTL TABLE AT THIS TIME; SEPERATE SSR TO FOLLOW.         
000001* PDX    - CAT519   C0335509 04/02/13 13:42:38 TBLAMUR            00001000
000001* SSR 88342 REMOVE TEMP LINES TO CAUSE FCUR BALS TO BE CREATED            
000001*   FOR ASCENDIS CLIENTS. FIX FOR MSD OPTION SYMBOL = LOW-VALUES          
000001* PDX    - CAT519   C0331456 01/22/13 14:02:23 TBLAMUR            00001000
000001* LRM049 SSR 85484 FRZN IND = O WHEN ONLY FROZEN CASH OR SEC OUT.         
000001*   CAT513 CHANGED TO REJECT FULL DLVY FOR "OR" CONDITION.                
000001* PDX    - CAT519   C0332648 11/26/12 14:09:42 TBLAMUR            00001000
000001* LRM048 SSR 86111 CONSIDER SINGLE FUND ACCOUNT B1 WHEN                   
      *   READING NETWORK MASTER.                                               
000001* PDX    - CAT519   C0333590 11/12/12 09:35:44 TBLAMUR            00001000
      * LRM047 SSR 86856 PP BYPASS CURRENCY 254.                                
000001* PDX    - CAT519   C0331869 10/12/12 09:34:29 TBLAMUR            00001000
000001* LRM046 SSR 86655 CAUSE NON PRICED ASSETS TO BY .01 PER SHARE            
      *   NOT 1.00 (WAS MOVING QTY TO AMT); IF THE AMT IS LESS THAN             
      *   $1.00, TO USE $1.00.                                                  
000001* PDX    - CAT519   C0329036 10/10/12 15:32:47 TBLAMUR            00001000
      * LRM045 SSR 85105 CHANGE FOREIGN ASSET LOGIC TO MOVE THE                 
      * MSD ISIN (ALL 12 BYTES) WHEN CUSIP IS MISSING.                          
      * LRM044 SSR 86856 INCLUDE BALS HELD IN FOREIGN CURRENCY                  
      * DELIVERY AS SLOC=50, XSET, FCUR WITH COMMENT.                           
      * LRM043 SSR 84763 INCLUDE POSN HELD IN FOREIGN CURRENCY IN THE           
      * DELIVERY AS SLOC=50, XSET WITH COMMENT; NEW B1 434763.                  
000001* PDX    - CAT519   C0328075 07/25/12 11:38:18 TBLAMUR            00001000
      * LRM042 SSR 83475 SEND SPAD EXCPTIONS TO ASCENDIS BY WRITING             
      *   OUT ON CATEXCP FILE.                                                  
000001* PDX    - CAT519   C0326246 05/31/12 11:05:30 TBLAMUR            00001000
      * LRM041 SSR 83441 FULL-PRTL CODE SHOULD ALWAYS BE 2 PARTIAL.             
      *    ADDITIONAL CHANGE FOR PENDING DIV NOTFOUND BUG.                      
000001* PDX    - CAT519   C0319859 03/27/12 09:11:14 TBLAMUR            00001000
      * LRM040 SSR 79096 ADDITIONAL CHANGE, HANDLE MULTI PEND DIV               
      *    CURRENCIES BY BYPASSING NON 000 AND 001 IN THE ACCOUNT.              
000001* PDX    - CAT519   C0324522 03/22/12 10:25:49 TBLAMUR            00001000
      * LRM039 COMMENT OUT TYPE4 CHANGE.                                        
000001* PDX    - CAT519   C0321761 02/20/12 09:22:59 TBLAMUR            00001000
      * LRM039 SSR 79558 CLIENT 10 INCLUDE TYPE4 MEMOS AS 50 SFK FOR            
      *   RS,PP,R7,CJ,TL,SK IN THE DELIVERY.                                    
000001* PDX    - CAT519   C0319859 02/17/12 09:19:52 TBLAMUR            00001000
      * LRM038 SSR 79096 ADDITIONAL CHANGE, USE INCLUDE PEND DIV ONLY           
      *   WHEN PAY-DATE > TODAY; OTHERWISE DIV WAS ALREADY BOOKED.              
      *   ALSO INITIALIZE WK-MS-ASSET-TYPE IN REGT RTN TO RESOLVE               
      *    PROBLEM IN ASCENDIS AND LATER CAT950A WITH REC LENGTH.               
000001* PDX    - CAT519   C0321444 01/13/12 14:16:11 TBLAMUR            00001000
      * LRM037 SSR 81018 USE 'OR' LOGIC TO COVER NON MMFVALID A000*.            
000001* PDX    - CAT519   C0321184 01/09/12 09:57:41 TBLAMUR            00001000
000001* PDX    - CAT519   C0317345 12/28/11 09:52:10 TBLAMUR            00001000
      * LRM033 SSR 79096 WITHHOLD BAL TO COVER PENDING DIVIDEND DEBIT           
      * LRM034 SSR 80728 WITHHOLD MUTUAL FUND WITH NTW LVL=4 WHEN               
      *   B1 434743 = 0, WHICH IS THE DEFAULT TO WITHHOLD, VALUE 1 MEANS        
      *   TO DELIVER.  INSERT AUDIT ROW WITH CLIENT L### INTO ACTIAST           
      *   TO CAUSE CAT770 TO CREATE Y SCREEN UPDATE.                            
      * LRM035 SSR 81018 UPGRADE MMF A000* LOOKUP TO COPYBOOK MMFVALID          
      * LRM036 SSR 82391 UPGRADE IRA SECURITY 866 RANGES                        
000001* PDX    - CAT519   C0311358 05/03/11 14:45:17 TBLAMUR            00001000
      * LRM032 SSR 76911 CORRECT B1 434517=3, ALSO CONSIDER 090 SUFFIX          
000001* PDX    - CAT519   C0306932 01/21/11 14:40:30 TBLAMUR            00001000
      * LRM031 SSR TBD   CORRECT SPAD SECURITY GETTING DELIVERED                
000001* PDX    - CAT519   C0302557 12/09/10 15:10:12 TBLAMUR            00001000
000001* PDX    - CAT519   C0296621 09/21/10 10:23:58 TBLAMUR            00001000
      * LRM030 SSR 71810 CREATE FOREIGN FEE ASSET RECORD ON ACATDLVF            
      *   WHEN ISIN(1:2) NOT 'US', AND NOT DTC OR CNS.                          
000001* PDX    - CAT519   C0299269 07/23/10 08:28:22 TBLAMUR            00001000
      * LRM029 SSR 62889 CONTINUED... ADD PARTIALLY CALLED BOND LOOKUP          
000001* PDX    - CAT519   C0295620 06/30/10 09:57:55 TBLAMUR            00001000
      * LRM028 SSR 62889 WITHHOLD MATURING OR CALLED BONDS; CREATE              
      *   MEMO RATHER THAN DELIVERY ASSET. B1 434748 HAS 3 SETTINGS,            
      *   1 - BYPASS SEC, 2 - CREATE MEMO, 3 MEMO AND (ADD TO X SCREEN          
      *   INSERT ACTIAST ROW CLIENT= W### TO DRIVE X SCREEN UPDATE).            
000001* PDX    - CAT519   C0298473 06/29/10 13:49:30 TBLAMUR            00001000
      * LRM027 SSR 64900 PENSON FIX                                             
000001* PDX    - CAT519   C0292845 04/06/10 11:01:56 TBLAMUR            00001000
      * LRM026 SSR 67411 PNC SURPAS FUNDS                                       
      * LRM025 SSR 66790 TO INCLUDE REORG COMMENT ON MEMO-ED ASSET              
000001* PDX    - CAT519   C0290020 01/26/10 14:36:25 TBLAMUR            00001000
      * LRM024 SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM                  
      * LRM023 SSR 59603 OPTION SYMBOLOGY CONTINUED. POPULATE                   
      *   STPRC-INTEGER2-AMT                                                    
000001* PDX    - CAT519   C0287084 11/03/09 07:53:03 TBLAMUR            00001000
      * LRM024 SSR 66946 CAMS THRESHOLD FUND EXPANSION.                         
000001* PDX    - CAT519   C0286143 10/30/09 09:48:52 TBLAMUR            00001000
      * LRM023 SSR 59603 OPTION SYMBOLOGY CHANGES.                              
      *   ADD PARM-STREAM = Q HARD CODE AT THIS TIME.                           
      *   CHANGE ASSET DESC FORMATTING WHEN MSD NOTFND FOR OPTIONS.             
      *   USE EXPANDED STRIKE PRICE FROM MSD.  CHANGE OPT SYMBOL TO USE         
      *   MSD-OCC-OPTN-SYM-ID, AND WHEN MISSING, CALL MSD TO                    
      *   OBTAIN THE UNDERLYING SEC SYMBOL; REMOVE OPRA CODE LOGIC.             
000001* PDX    - CAT519   C0278316 04/13/09 11:22:17 TBDOJUN            00001000
      * DJ0022 SSR 61075 FRACTIONAL SHARES ON MUNI TAX EXEMPT UNITS             
      * DJ0022 SSR 61867 USE ADP-NO TO READ VRSTSEC(NO MORE CUSIP)              
000001* PDX    - CAT519   C0275568 03/09/09 09:54:59 TBDOJUN            00001000
      * DJ0021 SSR 61065 BH-MF-EXBR-OPTION(537483)=1,USE MF EXBR TABLE          
      * DJ0021 FOR THE MUTUAL FUND EXECUTING BROKER NUMBER                      
000001* PDX    - CAT519   C0273186 11/24/08 17:30:20 TBDOJUN            00001000
      * DJ0020 SSR 59508 FOR SMA,CASH, ADD TO MEMO COUNT.                       
      * DJ0020 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN. FIX SYNTAX.           
000001* PDX    - CAT519   C0269375 10/20/08 14:46:37 TBDOJUN            00001000
      * DJ0019 SSR 59508 IF TRANSFER HAS ONLY MEMO ASSETS, REJECT               
      * DJ0019 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN                        
000001* PDX    - CAT519   C0266770 07/14/08 08:42:06 TBDOJUN                    
      * DJ0018 SSR 55171 READ ACTRBSC TABLE FOR MMF DELIVER AS CASH             
      * DJ0018 SSR 55766 ASCENDIS(WORKFLOW) SET ASCENDIS INDICATOR              
      * DJ0018 FOR FUL,PTR,PTD ONLY AND BH-ACAT-ASCENDIS-USER = '1'             
      * DJ0018 ASCENDIS - CREATE WITHHOLD FILE                                  
      * LRM018 ASCENDIS - PASS MMF DELIVERED AS CASH ON ACATDLVF.               
000001* PDX    - CAT519   C0253977 10/17/07 15:12:08 TBLAMUR                    
      * LRM012 SSR# 54091 ONGOING INBOUND CONVERSION CHANGES CLIENT 6.          
      * LRM012 ON DLVR FULL REQUEST, CAT513 STORED A POSSIBLE ACCOUNT           
      * LRM012 CHANGE VALUE IN  COL CVRSN-ACCT-NBR ON VTRNFR.                   
      * LRM012 BUILD THE ACTITRF CHANGE RECORD BASED ON THIS.                   
000001* PDX    - CAT519   C0254177 09/12/07 14:25:19 TBLAMUR                    
      * LRM010 TASK 54287. CHANGE TO PREVENT LOOPING BY                         
      * LRM010 ADDING COUNTER AND LOGICAL LIMIT OF 20 CALLS TO                  
      * LRM010 CATNACT (LOOKING UP INTERNAL TRANSFERS).                         
000001* PDX    - CAT519   C0249006 06/29/07 12:12:30 TBDOJUN                    
      * DJ0017 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
      * DJ0017           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT519   C0245386 03/28/07 13:54:48 TBDOJUN                    
      * DJ0016 SSR 49202 CREATE '45' MEMO FOR REGT, 90DR                        
000001* PDX    - CAT519   C0235973 07/10/06 10:05:56 TBDOJUN                    
      * DJ0015 SSR 44420 USE MSD PRICE MULTIPLIER                               
000001* PDX    - CAT519   C0234715 06/12/06 08:11:52 TBDOJUN                    
      * DJ0014 SSR 45744 ACCOUNT-FREEZE EDIT                                    
000001* PDX    - CAT519   C0231736 04/13/06 15:11:11 TBDOJUN                    
      * DJ0013 SSR# 44629 - MAINTAIN ONE MF NETWORK LEVEL                       
      * DJ0013 B1#537486: 1=ONE NETWORK-LEVEL 3 FUND ACCOUNT                    
      * DJ0013 IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
000001* PDX    - CAT519   C0230098 02/16/06 10:27:01 TBDOJUN                    
      * LRM009 - SSR 45101 DELIVER CAMS THRESHOLD FUNDS AS CASH.                
      * LRM009 - TREATED LIKE PRIMARY FUNDS.                                    
000001* PDX    - CAT519   C0227894 12/12/05 10:46:10 TBDOJUN                    
      * DJ0012 SSR# 42122 RESCIND BLOCK FIX. USE BRN/ACCT IN LOOKUP             
000001* PDX    - CAT519   C0223366 08/08/05 10:47:58 TBDOJUN                    
      * DJ0011 SSR# 41440 B1 434561 DO NOT REJECT IF 1-00                       
000001* PDX    - CAT519   C0210131 04/12/05 14:40:07 TBDOJUN                    
      * DJ0010 SSR# 35425 INTRADAY FEES                                         
000001* PDX    - CAT519   C0218155 03/17/05 10:54:51 TBDOJUN                    
      * DJ0009 SSR# 38793 ADD IRA SECURITY RANGE 8667304-8667310                
      * DJ0009 SSR# XXXXX DO NOT POPULATE TRANS-RFRN-ID-CD                      
000001* PDX    - CAT519   C0215363 02/14/05 08:00:51 TBDOJUN                    
      * DJ0008 SSR# 38793 EXPAND IRA SECURITY RANGE FOR BYPASSING               
      * DJ0008 SSR# 40042 NEW DB2 INIT TBL: ACTI***,NEW KEY STRUCTURE           
      * DJ0008 SSR# 40173 ALLOW MSD SEC NO ALPHANUMERIC                         
      * DJ0008 SSR# 40271 FIX UNITS RANGE                                       
      * DJ0008 SSR# 40633 RECOMPILED FOR NEW NSCC COPYBOOK (ANNUITY)            
      * DJ0008 MIPS REDUCTION: CHG TO PIC 9 COMP-3. CORRECT DISPLAY             
      * PDX    - CAT519   C0214139 12/03/04 11:11:04 TBDOJUN                    
      * LRM008 PMR 2324802 BUG FIX FOR FLAT FULL DLVY AFTER FLAT PTR.           
      * PDX    - CAT519   C0206314 07/12/04 10:09:18 TBDOJUN                    
      * DJ0007 SSR# 38232 PTR EDIT FOR FLAT ACCOUNT B1 434572                   
      * DJ0007 SSR# 35925 DELETE INIT ASSSETS FOR REJECTED NON-FUL              
      * PDX    - CAT519   C0183314 02/12/04 12:17:26 TBLAMUR                    
      * LRM007 - SSR 0024803 DECIMAL STRIKE PRICE                               
      * PDX    - CAT519   C0197712 11/03/03 10:33:56 TBLAMUR                    
      * PDX    - CAT519   C0197442 10/27/03 12:32:09 TBLAMUR                    
      * PDX    - CAT519   C0197392 10/24/03 16:29:51 TBLAMUR                    
      * PDX    - CAT519   C0196644 10/06/03 11:31:07 TBLAMUR                    
      * PDX    - CAT519   C0194849 08/25/03 10:07:02 TBLAMUR                    
      * PDX    - CAT519   C0184804 03/24/03 11:01:08 TBEDTAK                    
      * ET0006 - CREATE A NEW CHANGE RECORD FOR A REJECTED ACCOUNT IF           
      *          THE ACCOUNT WAS TRANSFERED INTERNALLY.                         
      * PDX    - CAT519   C0182051 02/12/03 15:41:25 TBLAMUR                    
      * ET0005 - SSR 0029711 MARGIN RETOOL - CALL GETVBAL & GETVHOL             
      * PDX    - CAT519   C0184898 01/10/03 08:54:28 TBLAMUR                    
      * LRM004 - SSR 0029440 MUTUAL FUND DST/MFE CHANGE                         
      * PDX    - CAT519   C0179727 10/25/02 14:20:58 TBLAMUR                    
      * LRM005 - SSR 0026952 RESCIND BLOCK                                      
      * PDX    - CAT519   C0179392 09/06/02 14:43:41 TBEDTAK                    
      * ET0004 - FOR PRIVATE RANGE FUNDS, SET STTL LOCATION TO '50' AND         
      *          STTL REASON CODE TO 'XSET' FOR CLIENT 39 (BERNSTEIN).          
      * PDX    - CAT519   C0179141 08/23/02 14:45:44 TBLAMUR                    
      * LRM003 - CHANGE ET0002 TO TRANSFER MMF FUNDS AS ASSETS WHEN             
      *          434510 = 2,3 AND NOT MATCHED TO CAMS LIQ.                      
      * PDX    - CAT519   C0176254 08/01/02 15:29:12 TBEDTAK                    
      * ET0003 - REMOVE FRACTIONAL QTY FROM CNS ELIGIBLE ADRS                   
      * ET0002 - MODIFY MMF PROCESS BY ADDITIONAL B1(434510) VALUES             
      * PDX    - CAT519   C0176431 07/02/02 08:12:24 TBLAMUR                    
      * LRM002 - SSR# 0029188 MULTI PLATFORM O-NSCC                             
      * PDX    - CAT519   C0173277 05/13/02 09:15:49 TBEDTAK                    
      * ET0001 - CASH ADJUST BY PENDING AMOUNT                                  
      * PDX    - CAT519   C0171522 04/04/02 11:13:42 TBLAMUR                    
      *          NEW B1 OPTION TO HANDLE EXPIRING OPTION                        
      * PDX    - CAT519   C0158046 05/29/01 09:37:51 TBLAMUR                    
      * PDX    - CAT519   C0122851 05/25/01 16:27:07 TBLAMUR                    
      * PDX    - CAT519   C0158046 05/24/01 13:04:23 TBLAMUR                    
      * LRM001 - R5762700 OVERRIDES TO FNBR ON DELVR FOR O-NSCC                 
      * LRM001 - INCLUDE A000015,17,26,27,28,29,31 IN MONEY MKT RANGE           
      * PDX    - CAT519   C0154419 03/26/01 15:50:34 TBDOJUN                    
      * DJ0006 - USE B1 434557 TO EDIT FOR SPAD POSITIONS                       
      * PDX    - CAT519   C0152145 01/16/01 16:38:15 TBDOJUN                    
      * DJ0005 - USE B1 434608 FOR FUND ACCOUNT NUMBER                          
      * DJ0005 - SSR# R162800 FIX WITHHOLD LOGIC. COBOL LE                      
      * DJ0005   IF SK,SN,TL,TL IS ON B1 434533, WITHHOLD THE ASSETS            
      * DJ0005 - FIX ASSET CATEGORY                                             
      * PDX    - CAT519   C0151178 12/18/00 08:38:08 TBDOJUN                    
      * DJ0004 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE             
      * PDX    - CAT519   C0141412 08/28/00 10:13:21 TBDOJUN                    
      * DJ0003 - IF RECEIVER-ACCT CHANGE, DELETE AND RELOAD                     
      * PDX    - CAT519   C0139071 03/03/00 08:53:52 TBLAMUR                    
      * PDX    - CAT519   C0130527 08/30/99 11:16:33 TBDOJUN                    
      * DJ0002 - LIQUIDATE FRACTIONS FOR CNS ELIGIBLE UNITS                     
      * PDX    - CAT519   C0128917 08/16/99 09:51:26 TBDOJUN                    
      * DJ0001 - BYPASS IF QTY < 0 AND ORIG-QTY > 0                             
      * DJ0001 - ALPHA BRANCH - CHANGE ACBALVSM TO ACBALALP                     
      * DJ0001 - ALPHA BRANCH - CHANGE HOLDNVSM TO HOLDAVSM                     
      * DJ0001 - DELETE COPYBOOK POSRECOB                                       
      * DJ0001 - CHANGE DELETE TO DELETE ONE ROW AT A TIME                      
      * PDX    - CAT519   C0125737 06/21/99 14:55:28 TBDOJUN                    
      * DJ     - USE MRGIMM FILE FOR MEMO LOOKUP. REMOVE SRMAS                  
      * DJ     - IF ACCT CHANGE, DELETE AND RELOAD                              
      * DJ     - INCLUDE A000039 IN MONEY MARKET RANGE                          
      * PDX    - CAT519   C0124764 04/26/99 10:47:45 TBDOJUN                    
      * DJ     - USE TRNFR-TYPE-RJC2-CD = 'F' TO FLAG FLAT ACCOUNT              
      * PDX    - CAT519   C0123087 04/12/99 10:28:59 TBDOJUN                    
      * PDX    - CAT519   C0122736 03/11/99 19:55:51 TBDOJUN                    
      * PDX    - CAT519   C0122542 03/05/99 11:33:30 TBDOJUN                    
      * PDX    - CAT519   C0122310 02/25/99 12:52:35 TBDOJUN                    
      * PDX    - CAT519   C0122194 02/23/99 12:02:38 TBDOJUN                    
      * PDX    - CAT519   C0121541 02/14/99 22:49:34 TBDOJUN                    
      * PDX    - CAT519   C0121508 02/08/99 22:28:48 TBDOJUN                    
      * PDX    - CAT519   C0121209 02/05/99 22:27:26 TBDOJUN                    
      * PDX    - CAT519   C0121087 02/01/99 10:01:03 TBDOJUN                    
      * PDX    - CAT519   C0120784 01/26/99 19:26:29 TBDOJUN                    
      * PDX    - CAT519   C0120203 01/22/99 09:46:02 TBDOJUN                    
      * PDX    - CAT519   C0119389 01/06/99 16:29:14 TBDOJUN                    
      * PDX    - CAT519   C0118401 12/10/98 15:38:37 TBDOJUN                    
      * DJ     - FIX S0C7 READNEXT POSVSAM                                      
      * PDX    - CAT519   C0109316 11/13/98 10:23:38 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT519.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT519 - CREATES ASSETS FOR NEW FULL TRANSFER REQUEST.        *         
      *          WE ARE THE DELIVERER.                                *         
      * SELECT FULL TRANSFER DELIVERY REQUESTS FROM THE NSCC M FILE.  *         
      *                                                               *         
      * READ BPS VSAM BALANCE, POSITIONS, MRGIMM MEMO  FILES TO       *         
      * CREATE THE ASSETS AND LOAD TO THE INIT TABLES.                *         
      * IF OPTIONS, ALSO LOAD TO INIT OPTION TABLE.                   *         
      * IF MUTUAL FUNDS, ALSO LOAD TO THE INIT MUTUAL FUND TABLE.     *         
      * SUBTRACT MEMO-QTY FROM POS-QTY BASED ON B1 AND SK,SN.         *         
      * IF SAFEKEEPING MEMO (SN,SK), CREATE A MEMO ASSET.             *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - EXTRACTED NSCC FILE                                  *         
      *        - BALANCE FILE                                         *         
      *        - POSITION FILE                                        *         
      *        - MRGIMM MEMO  FILE                                    *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - DB2 DATABASE                                         *         
DJ0010*        - ACATDLVF TRANSFER FEE FILE                           *         
      *                                                               *         
      * REJECT FULL TRANSFER DELIEVER IF THE FOLLOWING B1 EQUAL '1'   *         
      * BH-ACAT-REJ-PEND-FULL-DEL-AMT  (434556)                       *         
      * BH-ACAT-REJ-DEL-MARGIN-DEBIT   (434556)                       *         
      * BH-ACAT-REJ-DEL-ASSET-VALUE    (434556)                       *         
      * BH-ACAT-REJ-DEL-TOTL-ACT-VAL   (434556)                       *         
      * BH-ACAT-REJ-PEND-DEL-SPAD-NO   (434557)                       *         
      * BH-ACAT-REJ-PEND-DEL-SPADS     (434557)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-NTS  (434560)         CAT519        *         
      * BH-ACAT-REJ-PEND-FULL-DEL-FLAT (434561)         CAT519        *         
      * BH-ACAT-REJ-PEND-FULL-DEL-LP   (434562)         CAT519        *         
      * BH-ACAT-REJ-PEND-FULL-DEL-PRIV (434567)         CAT519        *         
DJ0007* BH-ACAT-REJ-PEND-PTR-DEL-FLAT  (434572)         CAT519        *         
      *                                                               *         
      * 04/20/99 - USE TRNFR-TYPE-RJC2-CD = 'F' TO FLAG FLAT ACCOUNT  *         
      *                                                               *         
      *****************************************************************         
      * 07/30/98 DJ    NEW PROGRAM                                    *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-FILE-STATUS.          
                                                                                
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
                                                                                
LRM033     SELECT DVNDFL            ASSIGN TO DVNDFL                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     DVND-KEY                                    
                  FILE STATUS IS    DVNDFL-STATUS.                              
                                                                                
           SELECT MFMSD             ASSIGN TO MFMSD                             
                  ACCESS            RANDOM                                      
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MAIN-KEY                                    
                  FILE STATUS IS    MFMSD-STATUS.                               
                                                                                
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
                                                                                
DJ0021     SELECT MFEXBR            ASSIGN TO MFEXBR                            
DJ0021            ACCESS            DYNAMIC                                     
DJ0021            ORGANIZATION      INDEXED                                     
DJ0021            RECORD KEY IS     EXBR-KEY                                    
DJ0021            FILE STATUS IS    MFEXBR-STATUS.                              
                                                                                
DJ0010     SELECT ACATDLVF         ASSIGN      TO ACATDLVF                      
DJ0010                             FILE STATUS IS ACATDLVF-FILE-STATUS.         
                                                                                
DJ0018     SELECT CATWHLD          ASSIGN      TO CATWHLD                       
DJ0018                             FILE STATUS IS CATWHLD-FILE-STATUS.          
LRM042     SELECT CATEXCP          ASSIGN      TO CATEXCP                       
LRM042                             FILE STATUS IS CATEXCP-FILE-STATUS.          
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==INFILE==.                
      /                                                                         
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
DJ0021 FD  MFEXBR.                                                              
DJ0021 01  MFEXBR-REC.                                                          
DJ0021     COPY MFEXBR.                                                         
      /                                                                         
DJ0010 FD  ACATDLVF                                                             
DJ0010     RECORDING MODE IS F                                                  
DJ0010     BLOCK CONTAINS 0 RECORDS.                                            
DJ0010     COPY ACATDLVF REPLACING ==:FMT:== BY ==ACATDLVF==.                   
      /                                                                         
DJ0018 FD  CATWHLD                                                              
DJ0018     RECORDING MODE IS F                                                  
DJ0018     BLOCK CONTAINS 0 RECORDS.                                            
DJ0018     COPY CATWHLD REPLACING ==:CATWHLD:== BY ==CATWHLD==.                 
      /                                                                         
LRM042 FD  CATEXCP                                                              
LRM042     RECORDING MODE IS F                                                  
LRM042     BLOCK CONTAINS 0 RECORDS.                                            
LRM042     COPY CATEXCP REPLACING ==:CATEXCP:== BY ==CATEXCP==.                 
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT519'.            
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
           05  INFILE-FILE-STATUS        PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  BALNC-STATUS              PIC X(002).                            
               88 BALNC-OKAY             VALUE '00' THRU '09', '97'.            
               88 BALNC-END-OF-FILE      VALUE '10'.                            
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
DJ0021     05  MFEXBR-STATUS             PIC X(002).                            
DJ0021         88 VALID-MFEXBR-STATUS    VALUE '00' '04' '10' '23'.             
DJ0021         88 MFEXBR-OKAY            VALUE '00' THRU '09', '97'.            
DJ0021         88 MFEXBR-END-OF-FILE     VALUE '10'.                            
DJ0021         88 MFEXBR-NOT-FOUND       VALUE '23'.                            
DJ0021         88 MFEXBR-EMPTY-MISSING   VALUE '35'.                            
           05  POSIT-STATUS              PIC  X(002).                           
               88 POSIT-OKAY             VALUE '00' THRU '09', '97'.            
               88 POSIT-END-OF-FILE      VALUE '10'.                            
               88 POSIT-EMPTY-MISSING    VALUE '35'.                            
DJ0010     05  ACATDLVF-FILE-STATUS      PIC  X(002).                           
DJ0010         88 ACATDLVF-OKAY          VALUE '00' THRU '09', '97'.            
DJ0010         88 ACATDLVF-END-OF-FILE   VALUE '10'.                            
DJ0010         88 ACATDLVF-EMPTY-MISSING VALUE '35'.                            
DJ0018     05  CATWHLD-FILE-STATUS       PIC  X(002).                           
DJ0018         88 CATWHLD-OKAY           VALUE '00' THRU '09', '97'.            
DJ0018         88 CATWHLD-END-OF-FILE    VALUE '10'.                            
DJ0018         88 CATWHLD-EMPTY-MISSING VALUE '35'.                             
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
           05  W-EXP-OPT-ACT             PIC  X(001) VALUE '0'.                 
           05  W-NUM-TO-EXP              PIC  9(003) VALUE 0.                   
LRM028     05  W-BOND-EXP-ACT            PIC  X(001) VALUE '0'.                 
LRM028     05  W-NUM-BOND-TO-EXP         PIC  9(003) VALUE 0.                   
LRM028     05  W-CLIENT-NBR-AUD          PIC  X(004).                           
LRM028     05  FILLER REDEFINES W-CLIENT-NBR-AUD.                               
LRM028         10  W-CLIENT-NBR-AUD-PFX  PIC  X(001).                           
LRM028         10  W-CLIENT-NBR-AUD-SFX  PIC  X(003).                           
LRM043     05  WK-BPD-PROC-DATE          PIC  9(008).                           
           05  W-TODAY-DATE              PIC  9(008) VALUE 0.                   
           05  W-OPT-EXP-DATE            PIC  9(008) VALUE 0.                   
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
ET0004     05 W-PRIVATE-RANGE.                                                  
ET0004         10 W-PRIVATE-RANGE-FUNDS  PIC  X(007).                           
ET0004            88 W-PRIV-RANGE-SECURITY    VALUE '8022143'                   
ET0004                                         THRU '8022152',                  
ET0004                                              '8022159',                  
ET0004                                              '8864350'.                  
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
DJ0010     05  FILLER                    PIC  X(008) VALUE 'ACATDLVF'.          
DJ0010     05  W-ACATDLVF-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0018     05  FILLER                    PIC  X(008) VALUE 'CATWHLD'.           
DJ0018     05  W-CATWHLD-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM042     05  W-CATEXCP-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'UNMATCHC'.          
           05  W-UNMATCH-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-TI-CNT                  PIC  9(009) COMP-3 VALUE 0.            
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
LRM028     05  W-MATURE-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-VBNDDT-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-VBNDDT-NOTFND-CNT       PIC  9(009) COMP-3 VALUE 0.            
LRM029     05  W-VBNDFTRV-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM029     05  W-VBNDFTRV-NOTFND         PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-BOND-AUDIT-ADD          PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-BOND-AUDIT-NOTADD       PIC  9(009) COMP-3 VALUE 0.            
LRM034     05  W-LVL4-AUDIT-ADD          PIC  9(009) COMP-3 VALUE 0.            
LRM034     05  W-LVL4-AUDIT-NOTADD       PIC  9(009) COMP-3 VALUE 0.            
           05  W-WHEN-ISSUE-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-RESTRICTED-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM010     05  W-CATNACT-LOOP-COUNT      PIC  9(003) COMP-3 VALUE 0.            
           05  W-REJECT-SWITCHES.                                               
               07  W-REJ-MARGIN-DEBIT    PIC  X(001) VALUE ' '.                 
               07  W-REJ-ASSET-VALUE     PIC  X(001) VALUE ' '.                 
               07  W-REJ-TOTL-ACT-VAL    PIC  X(001) VALUE ' '.                 
               07  W-REJ-SPAD            PIC  X(001) VALUE ' '.                 
               07  W-REJ-NTS             PIC  X(001) VALUE ' '.                 
               07  W-REJ-FLAT            PIC  X(001) VALUE ' '.                 
               07  W-REJ-LP              PIC  X(001) VALUE ' '.                 
               07  W-REJ-PRIV            PIC  X(001) VALUE ' '.                 
               07  W-REJ-SPAD-CODE       PIC  X(002) VALUE ' '.                 
               07  W-EXP-OPT-POSN        PIC  X(001) VALUE ' '.                 
DJ0014         07  W-REJ-ACCT-FRZN       PIC  X(001) VALUE ' '.                 
           05  W-REJECT-AUTO-SW          PIC  X(001) VALUE ' '.                 
           05  W-ACTITRF-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTITRF-FOUND                    VALUE 'Y'.                 
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-PRNGFL-SW               PIC  X(001) VALUE ' '.                 
               88 W-PRNGFL-FOUND                     VALUE 'Y'.                 
LRM028     05  W-MATURE-CALLED-BOND-SW   PIC  X(001) VALUE ' '.                 
LRM005     05  W-VRSDBLK-SEC-FND-CNT     PIC  9(009) COMP-3 VALUE 0.            
LRM005     05  W-VRSDBLK-SEC-FND-SW      PIC  X(001) VALUE ' '.                 
           05  W-VRSTSEC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSTSEC-FOUND                    VALUE 'Y'.                 
           05  W-VRSTBRKR-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-NOTFND-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-VRSTBRKR-FOUND                   VALUE 'Y'.                 
           05  W-VRSTBRKR-ROW-CNT        PIC S9(4) COMP VALUE +0.               
DJ0018     05  W-ACTRBSC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
DJ0018     05  W-ACTRBSC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
DJ0018     05  W-ACTRBSC-FND-SW          PIC  X(001) VALUE ' '.                 
DJ0018         88 W-ACTRBSC-FOUND                    VALUE 'Y'.                 
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
LRM002     05  LENGTH-KEY                PIC  99     VALUE 9.                   
ET0006     05  CATNACT                   PIC X(08)   VALUE 'CATNACT'.           
DJ0007     05  W-PTR-TRANSFER-SW         PIC  X(001).                           
DJ0007         88  W-PTR-TRANSFER                    VALUE 'Y'.                 
DJ0007     05  W-PTR-ASSET-FOUND-SW      PIC  X(001).                           
DJ0007         88  W-PTR-ASSET-FOUND                 VALUE 'Y'.                 
DJ0018     05  W-ASCENDIS-WHLD-CNT       PIC  9(009) COMP-3 VALUE 0.            
DJ0018     05  W-ASCENDIS-WHLD-REASON    PIC  X(004).                           
DJ0018         88  W-ASCENDIS-CURR-CODE              VALUE 'CURR'.              
DJ0018         88  W-ASCENDIS-OPEN-ORDER             VALUE 'OPOR'.              
DJ0018         88  W-ASCENDIS-ACCT-TYPE              VALUE 'TYPE'.              
DJ0018         88  W-ASCENDIS-IRA                    VALUE 'IRAA'.              
DJ0018         88  W-ASCENDIS-ANNUITY                VALUE 'ANNU'.              
DJ0018         88  W-ASCENDIS-SPAD                   VALUE 'SPAD'.              
DJ0018         88  W-ASCENDIS-QTY-ZERO               VALUE 'QTY0'.              
DJ0018         88  W-ASCENDIS-WHEN-ISSUED            VALUE 'WHIS'.              
DJ0018         88  W-ASCENDIS-QTY-LT-ZERO            VALUE 'QTL0'.              
DJ0018         88  W-ASCENDIS-QTY-LT-0001            VALUE 'QTL1'.              
LRM034         88  W-ASCENDIS-NTW-LVL4               VALUE 'LVL4'.              
DJ0019     05  W-MEMO-ONLY-SW            PIC  X(001).                           
DJ0019         88  W-MEMO-ONLY-FOUND                 VALUE 'Y'.                 
DJ0019     05  W-NOT-MEMO-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0019     05  W-IS-MEMO-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM030     05  W-ACATDLVF-TYPE-SW        PIC  X(001).                           
LRM030         88  ACATDLVF-FRAC-QTY-REC             VALUE 'Q'.                 
LRM030         88  ACATDLVF-FRGN-FEE-REC             VALUE 'F'.                 
LRM039         88  ACATDLVF-TYPE4-AS-TYPE1           VALUE '4'.                 
LRM030     05  W-FOREIGN-FEE-SW          PIC  X(001).                           
LRM030         88  FOREIGN-FEE-ELIGIBLE              VALUE 'E'.                 
LRM030         88  FOREIGN-FEE-NOT-APPLY             VALUE 'N'.                 
LRM043     05  WK-ASSET-SEQ-NBR.                                                
LRM043         07  WK-ASSET-SEQ-NBR-9    PIC 9(003).                            
      /                                                                         
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
CSG001/                                                                         
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
                                                                                
           05  W-POS-QTY                 PIC S9(12)V9(5) COMP-3.                
           05  W-POS-DESC1               PIC X(30)     VALUE SPACE.             
           05  W-POS-DESC2               PIC X(30)     VALUE SPACE.             
           05  W-POS-DESC3               PIC X(30)     VALUE SPACE.             
           05  W-POS-MEMO-QTY-EXCLUDED   PIC S9(12)V9(5) COMP-3.                
LRM039     05  W-POS-MEMO-TYPE4-QTY      PIC S9(12)V9(5) COMP-3.                
LRM039     05  W-POS-MEMO-TYPE4-AMT      PIC S9(15)V9(2) COMP-3.                
DJ0016     05  W-NAPPA-DATE-90DAY        PIC 9(08).                             
                                                                                
CSG001*    05  W-TXT.                                                           
CSG001*        10  W-TXT-BYTE            PIC X OCCURS 140 TIMES.                
           05  W-ASSET-CMNT-TXT          PIC X(50).                             
                                                                                
           05  SUB1                      PIC 9(03) COMP-3 VALUE 0.              
           05  W-SUB1                    PIC 9(03) COMP-3 VALUE 0.              
ET0002     05  OCR-SUB                   PIC 9(05) COMP-3 VALUE 0.              
LRM024     05  TH-SUB                    PIC 9(05) COMP-3 VALUE 0.              
ET0002     05  TBL-SUB                   PIC 9(05) COMP-3 VALUE 0.              
ET0002     05  MM-SUB                    PIC 9(05) COMP-3 VALUE 0.              
           05  W-HEX                     PIC S9(04) COMP SYNC VALUE +0.         
           05  FILLER REDEFINES W-HEX.                                          
               10  FILLER                PIC X(01).                             
               10  W-HEX-X               PIC X(01).                             
           05  WORK-POS-QTY              PIC S9(12)V9(5) COMP-3.                
           05  WORK-POS-QTY-SIGNED-INTEGER PIC S9(12)    COMP-3.                
           05  WORK-POS-QTY-DECIMAL      PIC V9(5).                             
           05  WORK-POS-QTY-LEFT         PIC S9(12)V9(5) COMP-3.                
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
           05  WORK-POS-MEMO-QTY         PIC S9(12)V9(5) COMP-3.                
           05  WORK-SN-MEMO-QTY          PIC S9(12)V9(5) COMP-3.                
           05  WORK-SFK-MEMO-QTY         PIC S9(12)V9(5) COMP-3.                
           05  WORK-WHOLD-MEMO-QTY       PIC S9(12)V9(5) COMP-3.                
                                                                                
           05  W-BR.                                                            
               10  W-BR-X                PIC X(03).                             
           05  W-BR-N REDEFINES W-BR     PIC 9(03).                             
           05  W-ACCT.                                                          
               10  W-ACCT-X              PIC X(05).                             
           05  W-ACCT-N REDEFINES W-ACCT PIC 9(05).                             
           05  W-WI                      PIC 9  COMP-3 VALUE 1.                 
           05  W-MEMO-IND                PIC X(01).                             
               88  MEMO-NOT-FOUND        VALUE ' '.                             
               88  MEMO-FOUND            VALUE '1'.                             
           05  W-ASSET-PRC-CTGY-CD       PIC X(04).                             
           05  W-ACTIAST-INSERT-SW       PIC X(01).                             
               88  W-ACTIAST-INSERT-OKAY VALUE 'Y'.                             
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
LRM051            09 W-MMF-SWEEP-CD      PIC 9(04).                             
ET0002            09 W-MMF-REDMPT-IND    PIC X(01).                             
LRM024            09 W-THRESHOLD-TBL-CNT PIC 9(05).                             
LRM024            09 W-MMF-THRESHOLD-TBL   OCCURS 999 TIMES.                    
LRM024               11 W-MMF-THRESHOLD-FUND    PIC X(07).                      
ET0002         07 W-REDMPT-TBL          OCCURS 999 TIMES.                       
ET0002            09 W-REDMPT-SEC        PIC X(07).                             
ET0002     05  W-MMF-TBL-CNT             PIC 9(05) COMP-3 VALUE 0.              
ET0002     05  W-REDMPT-TBL-CNT          PIC 9(05) COMP-3 VALUE 0.              
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
DJ0021     05  W-MFEXBR-CNT              PIC  9(009) COMP-3 VALUE 0.            
DJ0021     05  W-MFEXBR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-LEGG-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-OMNIBUS-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM030     05  W-FRGN-ASSET-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM004     05  W-DST-MFE-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM026     05  W-PNC-SURPAS-CNT          PIC  9(009) COMP-3 VALUE 0.            
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
LRM026         88  NTW-PNC-SURPAS-ACCT                VALUE 'P'.                
LRM050     05  NTW-SHWB-ACCT-FLAG           PIC  X(01)  VALUE SPACES.           
LRM050         88  NTW-SHWB-ACCT                     VALUE 'Y'.                 
LRM050         88  NTW-NOT-SHWB-ACCT                 VALUE 'N'.                 
DJ0021     05  W-MFMSD-FND-SW             PIC X(01).                            
DJ0021         88  W-MFMSD-FOUND                    VALUE 'Y'.                  
DJ0021         88  W-MFMSD-NOT-FOUND                VALUE 'N'.                  
DJ0021     05  W-MFEXBR-FND-SW            PIC X(01).                            
DJ0021         88  W-MFEXBR-FOUND                   VALUE 'Y'.                  
DJ0021         88  W-MFEXBR-NOT-FOUND               VALUE 'N'.                  
           05  NS-BRCH-ACCT-TC.                                                 
               10  NS-BRCH-ACCT-T        PIC  X(09).                            
               10  NS-CK                 PIC  X(01).                            
           05  WS-DST-BOX-ACCT-TC.                                              
               10  WS-DST-BOX-ACCT-T     PIC  X(09).                            
               10  WS-DST-BOX-CK         PIC  X(01).                            
LRM026     05  WS-PNC-SURPAS-BOX-TC.                                            
LRM026         10  WS-PNC-SURPAS-BOX-T       PIC  X(09).                        
LRM026         10  WS-PNC-SURPAS-CK          PIC  X(01).                        
                                                                                
       01  W-CKDIGIT.                                                           
           03 W-CKDIGIT-PARM.                                                   
              05 W-CKDIGIT-LEN               PIC 9(02) VALUE 9.                 
              05 W-CKDIGIT-ACCT-TC.                                             
                 07 W-CKDIGIT-ACCT-T.                                           
                    09 W-CKDIGIT-BRN-ACCT   PIC X(08) VALUE ' '.                
                    09 W-CKDIGIT-TYPE       PIC X(01) VALUE ' '.                
                 07 W-CKDIGIT-CK            PIC X(01) VALUE ' '.                
              05 W-CKDIGIT-ACCT-TC-1.                                           
                 07 W-CKDIGIT-ACCT-T-1.                                         
                    09 W-CKDIGIT-BRN-ACCT-1 PIC X(08) VALUE ' '.                
                    09 W-CKDIGIT-TYPE-1     PIC X(01) VALUE ' '.                
                 07 W-CKDIGIT-CK-1          PIC X(01) VALUE ' '.                
                                                                                
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
                                                                                
ET0005 01  GETVBAL                          PIC X(08) VALUE 'ZGETVBAL'.         
ET0005     COPY GETVBALC REPLACING ==:GETVBAL:== BY ==GETVBAL==.                
ET0005     COPY CUSBALRE REPLACING ==:BAL:==     BY ==BAL==.                    
ET0005     COPY BVHEADER.                                                       
ET0005     COPY ACBALALP.                                                       
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
ET0001     05  W-BAL-PENDING-AMOUNT         PIC S9(09)V99 COMP-3.               
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
      * NSCC EXTRACT FILE                                              *        
      ******************************************************************        
       01  FILLER PIC X(016) VALUE 'CURRENT-RECORD='.                           
       01  FILLER                        PIC X(008) VALUE 'W-NSCC'.             
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:==  BY ==W-NSCC==.               
      /                                                                         
LRM052*01  FILLER                        PIC X(08) VALUE 'HOLDAVSM'.            
LRM052*****COPY HOLDAVSM.                                                       
LRM052 01  FILLER                        PIC X(08) VALUE 'CUSHOL  '.            
LRM052 01  WS-CUSHOL-AREA.                                                      
LRM052     COPY CUSHOL REPLACING ==:CUSHOL:== BY ==CUSHOL==.                    
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
           05  W-MM-SUB                  PIC 9(03) COMP-3 VALUE 0.              
           05  W-SPAD-FND-SW             PIC X(01).                             
               88  W-SPAD-FOUND                      VALUE 'Y'.                 
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'POSMEMO='.            
           COPY  POSMEMOR REPLACING ==:POSMEMO:== BY ==MRGI==.                  
      /                                                                         
ET0002     COPY GETNACOB.                                                       
ET0002     EJECT                                                                
ET0002 01  GETNA-SEGMENT-INCLUDES.                                              
ET0002     COPY NASEGPPA.                                                       
ET0002     EJECT                                                                
ET0002     COPY NASEGEND.                                                       
ET0002     EJECT                                                                
LRM051*****COPY MMFSUB.                                                         
ET0002     EJECT                                                                
      /                                                                         
DJ0010******************************************************************        
DJ0010* P2HDRTRL COMMAREA - USED TO CREATE HEADER AND TRAILER RECORDS  *        
DJ0010******************************************************************        
DJ0010 01  FILLER                        PIC X(008) VALUE 'CP2WS   '.           
DJ0010 01  W-SAVE-CYCLE-NBR              PIC X(002) VALUE '00'.                 
DJ0010 01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.                  
DJ0010                                                                          
DJ0010     COPY CP2WS.                                                          
      /                                                                         
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
LRM030     05  WK-MS-CUSIP-10-12       PIC X(3)      VALUE SPACE.               
LRM030     05  WK-MSD-ISIN             PIC X(12)     VALUE SPACE.               
           05  WK-MS-OPT-MMY                         VALUE ZERO.                
               10  WK-MS-OPT-MM        PIC X(2).                                
               10  WK-MS-OPT-Y         PIC X(1).                                
           05  WK-MS-EXP-DATE          PIC 9(8)      VALUE ZERO.                
           05  FILLER                  REDEFINES WK-MS-EXP-DATE.                
               10  FILLER              PIC 9(3).                                
               10  WK-MS-EXP-Y         PIC X(1).                                
               10  WK-MS-EXP-MM        PIC X(2).                                
               10  FILLER              PIC 9(2).                                
LRM023     05  FILLER REDEFINES WK-MS-EXP-DATE.                                 
LRM023         10  WK-MS-EXP-CC-NEW    PIC X(2).                                
LRM023         10  WK-MS-EXP-YY-NEW    PIC X(2).                                
LRM023         10  WK-MS-EXP-MM-NEW    PIC X(2).                                
LRM023         10  WK-MS-EXP-DD-NEW    PIC X(2).                                
LRM028     05  WK-BOND-EXP-DATE        PIC 9(8).                                
LRM028     05  WK-MS-BOND-EXP-DATE-DB2.                                         
LRM028         10  WK-MS-BOND-EXP-CCYY   PIC X(4).                              
LRM028         10  FILLER                PIC X(1) VALUE '-'.                    
LRM028         10  WK-MS-BOND-EXP-MM     PIC X(2).                              
LRM028         10  FILLER                PIC X(1) VALUE '-'.                    
LRM028         10  WK-MS-BOND-EXP-DD     PIC X(2).                              
                                                                                
LRM029     05  WK-TODAY-DB2              PIC X(10).                             
LRM029     05  FILLER REDEFINES WK-TODAY-DB2.                                   
LRM029         10  WK-TODAY-DB2-CCYY     PIC X(4).                              
LRM029         10  WK-TODAY-DB2-DASH1    PIC X(1).                              
LRM029         10  WK-TODAY-DB2-MM       PIC X(2).                              
LRM029         10  WK-TODAY-DB2-DASH2    PIC X(1).                              
LRM029         10  WK-TODAY-DB2-DD       PIC X(2).                              
LRM038     05  WK-PROJECTED-SETTLE-DATE PIC X(8)  VALUE SPACES.                 
           05  WK-MS-OPT-PRICE         PIC S9(4)V9(5) VALUE ZERO.               
           05  FILLER                  REDEFINES WK-MS-OPT-PRICE.               
               10  WK-MS-OPT-PRC       PIC 9(4).                                
               10  WK-MS-OPT-FRAC      PIC 9(5).                                
           05  WK-MS-OPT-FRAC-6        PIC 9(6) VALUE ZEROS.                    
           05  FILLER REDEFINES    WK-MS-OPT-FRAC-6.                            
               10  WK-MS-OPT-FRAC-1    PIC 9.                                   
               10  FILLER              PIC 9(5).                                
LRM023     05  WK-MS-OPT-PRICE-NEW     PIC S9(5)V9(3) VALUE ZERO.               
LRM023     05  FILLER                  REDEFINES WK-MS-OPT-PRICE-NEW.           
LRM023         10  WK-MS-OPT-PRC-NEW   PIC 9(5).                                
LRM023         10  WK-MS-OPT-FRAC-NEW  PIC 9(3).                                
LRM007     05  WK-MS-OPT-DECI-ROUNDED  PIC 9(2).                                
LRM054     05  WK-MS-OPTION-FACTOR     PIC S9(7)V9(8)  COMP-3.                  
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
                                                                                
DJ0022     05  W-FRACTION-EQUITY-IND   PIC X(1) VALUE ' '.                      
DJ0022         88  W-FRACTION-EQUITY            VALUE 'Y'.                      
DJ0022         88  W-NOT-FRACTION-EQUITY        VALUE 'N'.                      
                                                                                
           05  WK-MS-DESC1                           VALUE SPACE.               
               10  WK-MS-PUT-CALL      PIC X(4).                                
               10  FILLER              PIC X(26).                               
           05  WK-MS-DESC2             PIC X(30)     VALUE SPACE.               
           05  WK-MS-DESC3             PIC X(30)     VALUE SPACE.               
DJ0015     05  WK-MS-CLOSING-PRICE     PIC 9(8)V9(7) COMP-3 VALUE ZERO.         
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
LRM023     05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
LRM023         07  FILLER                PIC X(22).                             
LRM023         07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
LRM023         07  FILLER                PIC X(02).                             
LRM023         07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
LRM023         07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
LRM023         07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
LRM023         07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
LRM023         07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
LRM023         07  FILLER                PIC X(01).                             
LRM023         07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
LRM023         07  FILLER                PIC X(01).                             
LRM023         07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
LRM023         07  FILLER                PIC X(12).                             
       01  OPT-WORK-AREA.                                                       
           05  SUB2               PIC 9(03) COMP-3 VALUE 0.                     
           05  SUB3               PIC 9(03) COMP-3 VALUE 0.                     
           05  OPT-SYMBOL         PIC X(03).                                    
           05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                             
                                  PIC X(01) OCCURS 3 TIMES.                     
           05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.                     
           05  OPT-WORK1          PIC X(12).                                    
           05  OPT-WORK2   REDEFINES  OPT-WORK1.                                
             10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.                    
                                                                                
DJ0008 01  W-SEC-TO-BYPASS.                                                     
DJ0008     05 W-SEC-TO-BYPASS-FIELD   PIC  X(007).                              
DJ0008        88 W-IRA-SECURITY          VALUE '8660000' THRU '8661299',        
LRM036                                         '8667000' THRU '8668799'.        
DJ0008***                                      '8667003' THRU '8667010',        
DJ0008***                                      '8667101' THRU '8667125',        
DJ0008***                                      '8667203' THRU '8667250',        
DJ0009***                                      '8667304' THRU '8667310',        
DJ0008***                                      '8667338' THRU '8667339',        
DJ0008***                                      '8667800' THRU '8668799'.        
DJ0008        88 W-ANNUITY-SECURITY      VALUE '8S15113'.                       
DJ0008        88 W-SPAD-SECURITY         VALUE '9997292' THRU '9999999'.        
DJ0008        88 W-MONEY-MARKET-SECURITY VALUE 'A000015',     'A000017',        
DJ0008                                         'A000026' THRU 'A000029',        
DJ0008                                         'A000031',     'A000039',        
DJ0008                                         'A000046' THRU 'A000999'.        
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
           05  WF-CICS-TERM-ID-CD     PIC X(4).                                 
           05  WF-UPDT-TMSTP          PIC X(26).                                
           05  WF-PRGM-NM             PIC X(8).                                 
           05  WF-ACCT-MRGN-DB-IND    PIC X(1).                                 
           05  WF-ACCT-AST-EXCS-IND   PIC X(1).                                 
           05  WF-ACCT-LTD-PRTNR-IND  PIC X(1).                                 
           05  WF-ACCT-PRVT-RNG-IND   PIC X(1).                                 
           05  WF-ACCT-SEC-RSTRD-IND  PIC X(1).                                 
DJ0013     05  WF-BRANCH-ACCT         PIC X(8).                                 
DJ0013     05  FILLER REDEFINES WF-BRANCH-ACCT.                                 
DJ0013         07  WF-BRANCH-CD       PIC X(3).                                 
DJ0013         07  WF-ACCT-CD         PIC X(5).                                 
                                                                                
       01  WF-AREA.                                                             
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
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
           05 W-ACTITRF-TRNFR-TYPE-RJCT-CD PIC X(026).                          
                                                                                
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
                                                                                
      ******************************************************************        
      * RESTRICTED BROKER   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTBRKR'.           
           EXEC SQL INCLUDE VRSTBRKR     END-EXEC.                              
                                                                                
DJ0018******************************************************************        
DJ0018* ASSET DELIVERY RULE - MMF DELIVER AS CASH                      *        
DJ0018******************************************************************        
DJ0018 01  FILLER                        PIC X(008) VALUE 'ACTRBSC '.           
DJ0018     EXEC SQL INCLUDE ACTRBSC      END-EXEC.                              
                                                                                
LRM028******************************************************************        
LRM028* MSD MATURITY DATE LOOKUP                                       *        
LRM028******************************************************************        
LRM028 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM028     EXEC SQL INCLUDE VBNDDT       END-EXEC.                              
                                                                                
LRM029******************************************************************        
LRM029* MSD CALLED BOND LOOKUP                                         *        
LRM029******************************************************************        
LRM029 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM029     EXEC SQL INCLUDE VBNDFTRV     END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR INITIAL ASSET   TABLE                       *        
      * TO DELETE INIT ASSETS FOR A GIVEN CONTROL NUMBER ONE AT A TIME *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'ACTIASTCURSOR'.              
           EXEC SQL                                                             
                DECLARE ACTIAST_CURSOR CURSOR WITH HOLD FOR                     
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_RSN_CD                                                
                   ,CSH_MGN_SHRT_CD                                             
                   ,SBMTG_PRTCP_NBR                                             
                   ,ACAT_CONTROL_NBR                                            
                   ,ASSET_SEQ_NBR                                               
                   ,TRANS_TYPE_CD                                               
                   ,ASSET_PRC_CTGY_CD                                           
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_QTY                                                   
                   ,ASSET_AMT                                                   
                FROM    ACTIAST                                                 
                                                                                
               WHERE CLIENT_NBR       = :W-NSCC-KEY-CLIENT-NBR                  
                 AND ACAT_CONTROL_NBR = :W-NSCC-ACAT-CTL-NBR                    
           END-EXEC.                                                            
      /                                                                         
DJ0007******************************************************************        
DJ0007* DECLARE CURSOR FOR INITIAL ASSET   TABLE                       *        
DJ0007* TO DELETE INIT ASSETS FOR A GENERIC KEY          ONE AT A TIME *        
DJ0007******************************************************************        
DJ0007 01  FILLER                PIC X(016) VALUE 'ACTIASTCURSOR2'.             
DJ0007     EXEC SQL                                                             
DJ0007          DECLARE ACTIAST_CURSOR2 CURSOR WITH HOLD FOR                    
DJ0007          SELECT                                                          
DJ0007              CLIENT_NBR                                                  
DJ0007             ,DLVR_NBR                                                    
DJ0007             ,ACCT_DLVR_NBR                                               
DJ0007             ,RCV_NBR                                                     
DJ0007             ,ACCT_RCV_NBR                                                
DJ0007             ,ISIN_CNTRY_CD                                               
DJ0007             ,ISIN_SEC_ISSUE_CD                                           
DJ0007             ,ISIN_SEC_CDG_CD                                             
DJ0007             ,STTLM_LCTN_CD                                               
DJ0007             ,STTLM_RSN_CD                                                
DJ0007             ,CSH_MGN_SHRT_CD                                             
DJ0007             ,SBMTG_PRTCP_NBR                                             
DJ0007             ,ACAT_CONTROL_NBR                                            
DJ0007             ,ASSET_SEQ_NBR                                               
DJ0007             ,TRANS_TYPE_CD                                               
DJ0007             ,ASSET_PRC_CTGY_CD                                           
DJ0007             ,ASSET_DESC_TXT                                              
DJ0007             ,ASSET_QTY                                                   
DJ0007             ,ASSET_AMT                                                   
DJ0007          FROM    ACTIAST                                                 
DJ0007                                                                          
DJ0007         WHERE CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR                 
DJ0007           AND RCV_NBR           = :W-NSCC-TI-RCV-NBR                     
DJ0007           AND DLVR_NBR          = :W-NSCC-TI-DEL-NBR                     
DJ0007           AND ACCT_DLVR_NBR     = :W-NSCC-TI-DEL-ACCT-NBR                
DJ0007           AND ACCT_RCV_NBR      = :W-NSCC-TI-RCV-ACCT-NBR                
DJ0007           AND TRNFR_TYPE_CD     = :W-NSCC-TI-TFR-TYPE                    
DJ0007           AND TRANS_RFRN_ID_CD  = :W-NSCC-TI-TRAN-REF-ID                 
DJ0007     END-EXEC.                                                            
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
           05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) COMP-3 VALUE 0.            
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-SQLERRD-3               PIC   9(9).                            
           05  W-AST-SQLCODE             PIC S9(9) COMP-4.                      
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
           05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.           
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
LRM002     03  CKDIGIT                   PIC X(8)  VALUE 'CKDIGIT '.            
LRM002     03  BNWNTWIO                  PIC X(8)  VALUE 'BNWNTWIO'.            
      ***<=== COBOL LE                                                          
                                                                                
LRM002     COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.                    
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
           05  L-RERUN-SW                PIC  X(001).                           
               88  L-RERUN                           VALUE '1'.                 
LRM023     05  L-STREAM-IND              PIC  X(001).                           
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT519 - CREATE ASSETS FOR FULL TRANSFER DELIVERS'.         
           DISPLAY '         UPDATE INIT ASSET, OPTION, MF TABLES'.             
           DISPLAY '         UPDATE TRANSFER ROW FOR EXCEPTIONS'.               
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                            
                   UNTIL END-OF-INPUT.                                          
                                                                                
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
               DISPLAY 'CAT519: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT519: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT519: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY 'CAT519: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT519: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT519: L-RERUN-SW       = '                                
                            L-RERUN-SW                                          
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOTFNDS.)'                     
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT519: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT519: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT519: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT519: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT519: THIS IS A RERUN.'                               
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT519'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
LRM043     MOVE BPD-PROC-DATE             TO WK-BPD-PROC-DATE                   
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
           MOVE BPD-PROC-DATE             TO W-TODAY-DATE.                      
LRM029     MOVE BPD-PROC-DATE(1:4)        TO WK-TODAY-DB2-CCYY.                 
LRM029     MOVE BPD-PROC-DATE(5:2)        TO WK-TODAY-DB2-MM.                   
LRM029     MOVE BPD-PROC-DATE(7:2)        TO WK-TODAY-DB2-DD.                   
LRM029     MOVE '-'                       TO WK-TODAY-DB2-DASH1                 
LRM029                                       WK-TODAY-DB2-DASH2.                
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT519:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT519: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.         
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
LRM038        DISPLAY '   PROJECTED-SETTLE-DATE '                               
LRM038                                          WK-PROJECTED-SETTLE-DATE        
LRM038     END-IF.                                                              
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT519: INFILE   OPENED FOR INPUT.  STATUS = '              
                                               INFILE-FILE-STATUS.              
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING INFILE'                           
               DISPLAY 'CAT519: OPEN STATUS = ' INFILE-FILE-STATUS              
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           PERFORM 1500-CHECK-HDR-REC  THRU 1500-EXIT.                          
                                                                                
ET0002     OPEN INPUT MMF-FILE.                                                 
ET0002     PERFORM 3600-READ-MMF-FILE                                           
ET0002        THRU 3600-EXIT.                                                   
ET0002                                                                          
ET0005     MOVE 'O'    TO GETVBAL-FUNC                                          
ET0005     PERFORM 9500-CALL-GETVBAL                                            
           DISPLAY 'CAT519: BALNC    OPENED FOR INPUT.  STATUS = '              
                                              BALNC-STATUS                      
                                                                                
           IF  BALNC-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING BALNC'                            
               DISPLAY 'CAT519: OPEN STATUS = ' BALNC-STATUS                    
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
ET0005     MOVE LOW-VALUES TO GETVHOL-PARM                                      
ET0005     MOVE 'CAT519'   TO GETVHOL-CALLING-PROGRAM                           
LRM052     MOVE 'N'        TO GETVHOL-FILE                                      
ET0005     MOVE 'O'        TO GETVHOL-FUNC                                      
ET0005     PERFORM 9600-CALL-GETVHOL                                            
           DISPLAY 'CAT519: POSVSAM  OPENED FOR INPUT.  STATUS = '              
                                              POSVSAM-STATUS                    
                                                                                
           IF  POSVSAM-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING POSVSAM'                          
               DISPLAY 'CAT519: OPEN STATUS = ' POSVSAM-STATUS                  
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT MRGIMM.                                                   
           DISPLAY 'CAT519: MRGIMM   OPENED FOR INPUT.  STATUS = '              
                                              MRGIMM-STATUS                     
                                                                                
           IF  MRGIMM-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING MRGIMM'                           
               DISPLAY 'CAT519: OPEN STATUS = ' MRGIMM-STATUS                   
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT PRNGFL.                                                   
           DISPLAY 'CAT519: PRNGFL   OPENED FOR INPUT.  STATUS = '              
                                              PRNGFL-STATUS                     
                                                                                
           IF  PRNGFL-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING PRNGFL'                           
               DISPLAY 'CAT519: OPEN STATUS = ' PRNGFL-STATUS                   
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
LRM033     OPEN INPUT DVNDFL.                                                   
LRM033     DISPLAY 'CAT519: DVNDFL   OPENED FOR INPUT.  STATUS = '              
LRM033                                        DVNDFL-STATUS                     
LRM033                                                                          
LRM033     IF  DVNDFL-OKAY                                                      
LRM033         CONTINUE                                                         
LRM033     ELSE                                                                 
LRM033         DISPLAY 'CAT519: ERROR OPENING DVNDFL'                           
LRM033         DISPLAY 'CAT519: OPEN STATUS = ' DVNDFL-STATUS                   
LRM033         DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
LRM033         MOVE +3002    TO ABEND-CODE                                      
LRM033         CALL ABEND USING ABEND-CODE                                      
LRM033     END-IF.                                                              
                                                                                
           OPEN INPUT MFMSD.                                                    
           DISPLAY 'CAT519: MFMSD    OPENED FOR INPUT.  STATUS = '              
                                              MFMSD-STATUS                      
                                                                                
           IF  MFMSD-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING MFMSD'                            
               DISPLAY 'CAT519: OPEN STATUS = ' MFMSD-STATUS                    
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWMAST.                                                  
           DISPLAY 'CAT519: BNWMAST  OPENED FOR INPUT.  STATUS = '              
                                              BNWMAST-STATUS                    
                                                                                
           IF  BNWMAST-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING BNWMAST'                          
               DISPLAY 'CAT519: OPEN STATUS = ' BNWMAST-STATUS                  
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWREGOP.                                                 
           DISPLAY 'CAT519: BNWREGOP OPENED FOR INPUT.  STATUS = '              
                                              BNWREGOP-STATUS                   
                                                                                
           IF  BNWREGOP-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR OPENING BNWREGOP'                         
               DISPLAY 'CAT519: OPEN STATUS = ' BNWREGOP-STATUS                 
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
LRM002     MOVE  SPACES      TO NTWIO-PARAMETERS.                               
LRM002     MOVE  'CAT519'    TO NTWIO-PGM-NAME.                                 
LRM002     MOVE  'O'         TO NTWIO-FUNCTION-CODE.                            
LRM002     MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                             
LRM002     CALL  BNWNTWIO USING NTWIO-PARAMETERS.                               
                                                                                
DJ0021     OPEN INPUT MFEXBR.                                                   
DJ0021     DISPLAY 'CAT519: MFEXBR   OPENED FOR INPUT.  STATUS = '              
DJ0021                                        MFEXBR-STATUS                     
DJ0021                                                                          
DJ0021     IF  MFEXBR-OKAY                                                      
DJ0021         CONTINUE                                                         
DJ0021     ELSE                                                                 
DJ0021         DISPLAY 'CAT519: ERROR OPENING MFEXBR'                           
DJ0021         DISPLAY 'CAT519: OPEN STATUS = ' MFEXBR-STATUS                   
DJ0021         DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0021         MOVE +3001    TO ABEND-CODE                                      
DJ0021         CALL ABEND USING ABEND-CODE                                      
DJ0021     END-IF.                                                              
                                                                                
DJ0010     OPEN OUTPUT ACATDLVF.                                                
DJ0010     DISPLAY 'CAT519: ACATDLVF OPENED FOR OUTPUT. STATUS = '              
DJ0010                                         ACATDLVF-FILE-STATUS.            
                                                                                
DJ0010     IF  ACATDLVF-OKAY                                                    
DJ0010         CONTINUE                                                         
DJ0010     ELSE                                                                 
DJ0010         DISPLAY 'CAT519: ERROR OPENING ACATDLVF'                         
DJ0010         DISPLAY 'CAT519: OPEN STATUS = ' ACATDLVF-FILE-STATUS            
DJ0010                      '.  OUTPUT-CNT = ' W-ACATDLVF-CNT                   
DJ0010         DISPLAY 'CAT519: U3008 - ABENDING ON BAD FILE STATUS'            
DJ0010         MOVE +3008    TO ABEND-CODE                                      
DJ0010         CALL ABEND USING ABEND-CODE                                      
DJ0010     END-IF.                                                              
                                                                                
DJ0018     OPEN OUTPUT CATWHLD.                                                 
DJ0018     DISPLAY 'CAT519: CATWHLD  OPENED FOR OUTPUT. STATUS = '              
DJ0018                                         CATWHLD-FILE-STATUS.             
                                                                                
DJ0018     IF  CATWHLD-OKAY                                                     
DJ0018         CONTINUE                                                         
DJ0018     ELSE                                                                 
DJ0018         DISPLAY 'CAT519: ERROR OPENING CATWHLD'                          
DJ0018         DISPLAY 'CAT519: OPEN STATUS = ' CATWHLD-FILE-STATUS             
DJ0018                      '.  OUTPUT-CNT = ' W-CATWHLD-CNT                    
DJ0018         DISPLAY 'CAT519: U3008 - ABENDING ON BAD FILE STATUS'            
DJ0018         MOVE +3008    TO ABEND-CODE                                      
DJ0018         CALL ABEND USING ABEND-CODE                                      
DJ0018     END-IF.                                                              
                                                                                
LRM042     OPEN OUTPUT CATEXCP.                                                 
LRM042     DISPLAY 'CAT519: CATEXCP  OPENED FOR OUTPUT. STATUS = '              
LRM042                                         CATEXCP-FILE-STATUS.             
                                                                                
LRM042     IF  CATEXCP-OKAY                                                     
LRM042         CONTINUE                                                         
LRM042     ELSE                                                                 
LRM042         DISPLAY 'CAT519: ERROR OPENING CATEXCP'                          
LRM042         DISPLAY 'CAT519: OPEN STATUS = ' CATEXCP-FILE-STATUS             
LRM042                      '.  OUTPUT-CNT = ' W-CATEXCP-CNT                    
LRM042         DISPLAY 'CAT519: U3009 - ABENDING ON BAD FILE STATUS'            
LRM042         MOVE +3009    TO ABEND-CODE                                      
LRM042         CALL ABEND USING ABEND-CODE                                      
LRM042     END-IF.                                                              
                                                                                
DJ0010     MOVE INFILE-HDR-CYCLE-NBR TO W-SAVE-CYCLE-NBR.                       
DJ0010     MOVE ' '                      TO ACATDLVF-HEADER-RECORD              
DJ0010     MOVE 'H'                      TO CP2-REQUEST-CODE.                   
DJ0010     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
DJ0010     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
DJ0010     CALL P2HDTR                USING CP2-AREA                            
DJ0010                                      ACATDLVF.                           
DJ0010     MOVE CP2-RETURN-RECORD        TO ACATDLVF-HEADER-RECORD              
DJ0018     MOVE LD-PROC-DATE             TO ACATDLVF-HDR-PROC-DATE              
DJ0010     MOVE 'CYCLE='                 TO ACATDLVF-HDR-CYCLE-LIT              
DJ0010     MOVE W-SAVE-CYCLE-NBR         TO ACATDLVF-HDR-CYCLE-NO               
DJ0010     DISPLAY 'CAT519: ACATDLVF-HDR= ' ACATDLVF-HEADER-RECORD              
DJ0010     WRITE ACATDLVF-RECORD.                                               
DJ0010     DISPLAY 'CAT519: ACATDLVF HEADER WRITTEN.    STATUS = '              
DJ0010                                         ACATDLVF-FILE-STATUS.            
                                                                                
DJ0018     MOVE INFILE-HDR-CYCLE-NBR TO W-SAVE-CYCLE-NBR.                       
DJ0018     MOVE ' '                      TO CATWHLD-HEADER-RECORD               
DJ0018     MOVE 'H'                      TO CP2-REQUEST-CODE.                   
DJ0018     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
DJ0018     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
DJ0018     CALL P2HDTR                USING CP2-AREA                            
DJ0018                                      CATWHLD.                            
DJ0018     MOVE CP2-RETURN-RECORD        TO CATWHLD-HEADER-RECORD               
DJ0018     MOVE LD-PROC-DATE             TO CATWHLD-HDR-PROC-DATE               
DJ0018     MOVE 'CYCLE='                 TO CATWHLD-HDR-CYCLE-LIT               
DJ0018     MOVE W-SAVE-CYCLE-NBR         TO CATWHLD-HDR-CYCLE-NO                
DJ0018     DISPLAY 'CAT519: CATWHLD-HDR= ' CATWHLD-HEADER-RECORD                
DJ0018     WRITE CATWHLD-RECORD.                                                
DJ0018     DISPLAY 'CAT519: CATWHLD HEADER WRITTEN.    STATUS = '               
DJ0018                                         CATWHLD-FILE-STATUS.             
                                                                                
LRM042     MOVE ' '                      TO CATEXCP-HEADER-RECORD               
LRM042     MOVE 'H'                      TO CP2-REQUEST-CODE.                   
LRM042     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
LRM042     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
LRM042     CALL P2HDTR                USING CP2-AREA                            
LRM042                                      CATEXCP.                            
LRM042     MOVE CP2-RETURN-RECORD        TO CATEXCP-HEADER-RECORD               
LRM042     MOVE LD-PROC-DATE             TO CATEXCP-HDR-PROC-DATE               
LRM042     MOVE 'CYCLE='                 TO CATEXCP-HDR-CYCLE-LIT               
LRM042     MOVE W-SAVE-CYCLE-NBR         TO CATEXCP-HDR-CYCLE-NO                
LRM042     DISPLAY 'CAT519: CATEXCP-HDR= ' CATEXCP-HEADER-RECORD                
LRM042     WRITE CATEXCP-RECORD.                                                
LRM042     DISPLAY 'CAT519: CATEXCP HEADER WRITTEN.    STATUS = '               
LRM042                                         CATEXCP-FILE-STATUS.             
                                                                                
ET0002     MOVE SPACES       TO GETNA-PARAMETERS.                               
ET0002     MOVE 'CAT519 '    TO GETNA-PGM-NAME.                                 
ET0002     MOVE 'R'          TO GETNA-REQ-FUNC.                                 
ET0002     MOVE 'R'          TO GETNA-REQ-FILE.                                 
ET0002     MOVE 'R'          TO GETNA-REQ-FUNC2.                                
ET0002     MOVE 'N'          TO GETNA-REQ-YEAREND.                              
ET0002                                                                          
           DISPLAY 'CAT519: INBOUND-CYCLE-NBR = '                               
                                         INFILE-HDR-CYCLE-NBR                   
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE HDR REC  TO GET THE TIMESTAMP                                 
      *  FOR THE LAST TIME WE TRANSMITTED TO NSCC                               
      ******************************************************************        
       1500-CHECK-HDR-REC  SECTION.                                             
           MOVE '1500-CHECK-HDR-REC            ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT519: END OF INPUT REACHED'                           
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT519: BYPASSING FILE CHECK PER JCLPARM'           
                   GO TO 1500-EXIT                                              
               ELSE                                                             
                   DISPLAY 'CAT519: U3003 - ABENDING ON EMPTY FILE'             
                   MOVE +3003    TO ABEND-CODE                                  
                   CALL ABEND USING ABEND-CODE                                  
               END-IF                                                           
           END-IF.                                                              
           IF  INFILE-HDR-RECORD                                                
               SET INFILE-DATE-FOUND TO TRUE                                    
               DISPLAY 'CAT519: INFILE  DATE = '                                
                                              INFILE-HDR-PROC-DATE              
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME               
                                     ' DATE=' INFILE-HDR-SYS-DATE               
                                     ' TIME=' INFILE-HDR-SYS-TIME               
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                          
                   DISPLAY 'CAT519: INFILE  DATE = PROC DATE. OKAY'             
               ELSE                                                             
                   DISPLAY 'CAT519: INFILE  DATE NOT = PROC DATE'               
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT519: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT519: U3004 - ABENDING ON BAD DATE'            
                      MOVE +3004    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
               END-IF                                                           
           ELSE                                                                 
               DISPLAY 'CAT519: INFILE  DATE RECORD MISSING'                    
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT519: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT519: U3005 - ABENDING ON BAD DATE'            
                      MOVE +3005    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND PROCESS ONLY TRANSFER ('T') RECORDS             
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,                    
      *     LOAD ASSETS                                                         
      ******************************************************************        
       2000-PROCESS-INPUT SECTION.                                              
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.                   
                                                                                
LRM008     MOVE ' ' TO W-PTR-TRANSFER-SW                                        
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  W-NSCC-REC-SUBTYPE      = 'T'                                    
           AND W-NSCC-DAYS-IN-STATUS NOT NUMERIC                                
               MOVE ZEROS TO W-NSCC-DAYS-IN-STATUS                              
           END-IF.                                                              
                                                                                
           IF  END-OF-INPUT                                                     
               CONTINUE                                                         
           ELSE                                                                 
            IF  (W-NSCC-REC-SUBTYPE      = 'T'               AND                
                 W-NSCC-TI-TRAN-TYPE     = 'A'               AND                
                 W-NSCC-TI-TFR-TYPE      = 'FUL'             AND                
                 W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND                
                 W-NSCC-STATUS           < '200')                               
                 PERFORM 4000-LOAD     THRU 4000-EXIT                           
                                                                                
            ELSE                                                                
             IF  (W-NSCC-REC-SUBTYPE      = 'T'               AND               
                  W-NSCC-TI-TRAN-TYPE     = 'C'               AND               
                  W-NSCC-TI-TFR-TYPE      = 'FUL'             AND               
                  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND               
                  W-NSCC-STATUS           = '110')                              
                  DISPLAY 'INP=' W-INFILE-CNT                                   
                                     ' ' W-NSCC-KEY-CLIENT-NBR                  
                                     ' ' W-NSCC-TI-ACAT-CTL-NBR                 
                                     ' ' W-NSCC-TI-DEL-ACCT-NBR (1:8)           
                                     ' ' W-NSCC-TI-TFR-TYPE                     
                                 ' TRN=' W-NSCC-TI-TRAN-TYPE                    
                                 ' STA=' W-NSCC-STATUS                          
                                  ' REQ-ADJ DELETE AND RELOAD '                 
                                                                                
                  PERFORM 6930-DELETE-INIT THRU 6930-EXIT                       
                  PERFORM 4000-LOAD        THRU 4000-EXIT                       
                                                                                
             ELSE                                                               
              IF (W-NSCC-REC-SUBTYPE      = 'T'               AND               
                  W-NSCC-TI-TRAN-TYPE     = 'C'               AND               
                  W-NSCC-TI-TFR-TYPE      = 'FUL'             AND               
                  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND               
                  W-NSCC-TI-DEL-ACCT-NBR-ST = '1')                              
                  DISPLAY 'INP=' W-INFILE-CNT                                   
                                     ' ' W-NSCC-KEY-CLIENT-NBR                  
                                     ' ' W-NSCC-TI-ACAT-CTL-NBR                 
                                     ' ' W-NSCC-TI-DEL-ACCT-NBR (1:8)           
                                     ' ' W-NSCC-TI-TFR-TYPE                     
                                 ' TRN=' W-NSCC-TI-TRAN-TYPE                    
                                 ' STA=' W-NSCC-STATUS                          
                                  ' DEL-ACCT-CHG DELETE AND RELOAD '            
                                                                                
                  PERFORM 6930-DELETE-INIT THRU 6930-EXIT                       
                  PERFORM 4000-LOAD        THRU 4000-EXIT                       
              ELSE                                                              
               IF (W-NSCC-REC-SUBTYPE      = 'T'               AND              
                   W-NSCC-TI-TRAN-TYPE     = 'C'               AND              
                   W-NSCC-TI-TFR-TYPE      = 'FUL'             AND              
                   W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND              
                   W-NSCC-TI-RCV-ACCT-NBR-ST = '1')                             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                                     ' ' W-NSCC-KEY-CLIENT-NBR                  
                                     ' ' W-NSCC-TI-ACAT-CTL-NBR                 
                                     ' ' W-NSCC-TI-RCV-ACCT-NBR (1:15)          
                                     ' ' W-NSCC-TI-TFR-TYPE                     
                                 ' TRN=' W-NSCC-TI-TRAN-TYPE                    
                                 ' STA=' W-NSCC-STATUS                          
                                  ' RCV-ACCT-CHG DELETE AND RELOAD '            
                                                                                
                   PERFORM 6930-DELETE-INIT THRU 6930-EXIT                      
                   PERFORM 4000-LOAD        THRU 4000-EXIT                      
DJ0007         ELSE                                                             
DJ0007*---------EDIT PTR FOR FLAT ACCOUNT                                       
DJ0007          IF   BH-ACAT-REJ-PEND-PTR-DEL-FL-IN = '1'                       
DJ0007          AND (W-NSCC-REC-SUBTYPE      = 'T'               AND            
DJ0007               W-NSCC-TI-TFR-TYPE      = 'PTR'             AND            
DJ0007               W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND            
LRM008              (W-NSCC-SYSTEM-ACTION NOT = '2')             AND            
DJ0007               W-NSCC-STATUS           < '200')                           
DJ0007               PERFORM 4200-PTR-EDIT THRU 4200-EXIT                       
DJ0007          ELSE                                                            
DJ0007*----------PURGE INIT ASSETS FOR REJECTED NON-FUL                         
DJ0007           IF (W-NSCC-REC-SUBTYPE      = 'T'               AND            
DJ0007              (W-NSCC-TI-TFR-TYPE  NOT = 'FUL')            AND            
DJ0007***************W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND            
DJ0007               W-NSCC-SYSTEM-ACTION  = '2')                               
DJ0007             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0007                        ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0007                        ' ' W-NSCC-TI-ACAT-CTL-NBR                        
DJ0007                        ' ' W-NSCC-TI-TFR-TYPE                            
DJ0007                    ' TRN=' W-NSCC-TI-TRAN-TYPE                           
DJ0007                    ' STA=' W-NSCC-STATUS                                 
DJ0007                    ' ACT=' W-NSCC-SYSTEM-ACTION                          
DJ0007                    ' REJ=' W-NSCC-SYSTEM-REJ-RSN                         
DJ0007                           ' NON-FUL SYSTEM REJECT BY NSCC'               
DJ0007             DISPLAY '    '                                               
DJ0007                            'DEL=' W-NSCC-TI-DEL-NBR                      
DJ0007                               ' ' W-NSCC-TI-DEL-ACCT-NBR                 
DJ0007                           ' REC=' W-NSCC-TI-RCV-NBR                      
DJ0007                               ' ' W-NSCC-TI-RCV-ACCT-NBR                 
DJ0007                        ' REF-ID=' W-NSCC-TI-TRAN-REF-ID                  
DJ0007                PERFORM 6940-DELETE-NON-FUL THRU 6940-EXIT                
DJ0007           END-IF                                                         
DJ0007          END-IF                                                          
               END-IF                                                           
              END-IF                                                            
             END-IF                                                             
            END-IF                                                              
           END-IF.                                                              
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND MOVE TO WORKING-STORAGE.                        
      ******************************************************************        
       3000-READ-INPUT SECTION.                                                 
           MOVE '3000-READ-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT519: WARNING - READING AFTER EOF'                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INPUT-SW                     
                   DISPLAY 'CAT519: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT519: ERROR READING INFILE'                           
               DISPLAY 'CAT519: READ STATUS = ' INFILE-FILE-STATUS              
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT519: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           MOVE SPACES                   TO W-NSCC-RECORD.                      
           MOVE W-REC-LEN-IN             TO W-REC-LEN-OUT.                      
                                                                                
           MOVE INFILE-RECORD   (1 : W-REC-LEN-IN) TO                           
                W-NSCC-RECORD   (1 : W-REC-LEN-IN).                             
                                                                                
           IF  INFILE-HDR-RECORD                                                
               DISPLAY 'CAT519: INFILE-HDR-REC = '                              
                                                 INFILE-HDR-REC (1:120)         
               GO TO 3000-EXIT                                                  
           ELSE                                                                 
               IF  INFILE-TRL-RECORD                                            
                   DISPLAY 'CAT519: INFILE-TRL-REC = '                          
                                                 INFILE-TRL-REC (1:120)         
                   GO TO 3000-READ-INPUT                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
           ADD  1                        TO W-DETAIL-CNT.                       
                                                                                
           EVALUATE W-NSCC-REC-SUBTYPE                                          
                    WHEN 'T'      ADD 1 TO W-TI-CNT                             
           END-EVALUATE                                                         
                                                                                
           MOVE W-NSCC-KEY-CLIENT-NBR    TO W-CURRENT-CLIENT                    
                                                                                
           IF  W-CURRENT-CLIENT (2:3)     > '000'                               
               IF  W-CURRENT-CLIENT (2:3) = BH-BROKER-NUMBER                    
                   CONTINUE                                                     
               ELSE                                                             
                   PERFORM 3500-GETB1 THRU 3500-EXIT                            
               END-IF                                                           
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
       3500-GETB1          SECTION.                                             
           MOVE '3500-GETB1                    ' TO W-ROUTINE-1.                
                                                                                
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
           CALL  GETB1V          USING BH-BROKER-HEADER-INFO                    
                                       BH-MF3-INFO                              
           END-CALL.                                                            
                                                                                
DJ0013     MOVE ' '                TO  BH-REQ-INFO                              
DJ0013     MOVE ' '                TO  BH-B2-INFO-ID                            
DJ0013     MOVE '114'              TO  BH-LOGICAL-RECORD-CODE                   
DJ0013     CALL  GETB1V          USING BH-BROKER-HEADER-INFO                    
DJ0013                                 BH-REQ-INFO                              
DJ0013     END-CALL.                                                            
                                                                                
           IF  BH-ACAT-WHOLD-STK-REC-MEMO-NO NOT NUMERIC                        
               MOVE 0 TO BH-ACAT-WHOLD-STK-REC-MEMO-NO                          
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-EXPIRING-OPT-DAYS  NOT NUMERIC                           
               MOVE '0000' TO BH-ACAT-EXPIRING-OPTION                           
           END-IF.                                                              
           MOVE  BH-ACAT-EXPIRING-OPT-DAYS TO W-NUM-TO-EXP.                     
           MOVE  BH-ACAT-EXPIRING-OPT-ACT TO W-EXP-OPT-ACT.                     
      ***                                                                       
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
                                                                                
LRM028     IF BH-ACAT-MATUR-CALL-BOND-DAYS NOT NUMERIC                          
LRM028        MOVE 0 TO BH-ACAT-MATUR-CALL-BOND-DAYS                            
LRM028     END-IF.                                                              
LRM028     MOVE BH-ACAT-MATUR-CALL-BOND-DAYS   TO W-NUM-BOND-TO-EXP.            
LRM028     MOVE BH-ACAT-MATUR-CALL-BOND-ACTION TO W-BOND-EXP-ACT.               
LRM028     MOVE 99991231 TO WK-BOND-EXP-DATE                                    
LRM028     IF W-BOND-EXP-ACT NOT = '0'                                          
LRM028       MOVE W-TODAY-DATE              TO BPDATES-BASE-DATE                
LRM028       SET BPD-DISPLACEMENT-DATE-INFO TO TRUE                             
LRM028       SET BPD-DISP-PLUS              TO TRUE                             
LRM028       SET BPD-DISP-CALENDAR          TO TRUE                             
LRM028       MOVE W-NUM-BOND-TO-EXP         TO BPDATES-DTSEARCH-DISP            
LRM028       MOVE '  '                      TO BPDATES-CALENDAR-TYPE            
LRM028       CALL  BPDATES  USING BPDATES-PARAMETERS                            
LRM028       IF NOT BPD-VALID-RETURN                                            
LRM028           DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                 
LRM028           DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE               
LRM028           DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                
LRM028           DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                 
LRM028       ELSE                                                               
LRM028           MOVE BPD-DT-CALDATE TO WK-BOND-EXP-DATE                        
LRM028       END-IF                                                             
LRM028     END-IF.                                                              
LRM028     MOVE WK-BOND-EXP-DATE(1:4) TO  WK-MS-BOND-EXP-CCYY                   
LRM028     MOVE WK-BOND-EXP-DATE(5:2) TO  WK-MS-BOND-EXP-MM                     
LRM028     MOVE WK-BOND-EXP-DATE(7:2) TO  WK-MS-BOND-EXP-DD                     
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT519: BH-ACAT-STATUS                 (434501) = '         
                            BH-ACAT-STATUS                                      
           DISPLAY 'CAT519: BH-ACAT-LIQUIDATE-MMF          (434510) = '         
                            BH-ACAT-LIQUIDATE-MMF                               
           DISPLAY 'CAT519: BH-ACAT-TYPE-3-BALANCES        (434512) = '         
                            BH-ACAT-TYPE-3-BALANCES                             
           DISPLAY 'CAT519: BH-ACAT-WH-ASSET-CONTRA-CUSIP  (434517) = '         
                            BH-ACAT-WH-ASSET-CONTRA-CUSIP                       
           DISPLAY 'CAT519: BH-ACAT-FRACT-ON-CNS-ELIG-SEC  (434521) = '         
                            BH-ACAT-FRACT-ON-CNS-ELIG-SEC                       
           DISPLAY 'CAT519: BH-ACAT-WHOLD-STK-REC-MEMO-NO  (434533) = '         
                            BH-ACAT-WHOLD-STK-REC-MEMO-NO                       
           DISPLAY '        BH-ACAT-WHOLD-STK-REC-MEMO     (434533) = '         
                            BH-ACAT-WHOLD-STK-REC-MEMO (1:60)                   
                                                                                
           DISPLAY 'CAT519: BH-ACAT-REJ-PEND-FULL-DEL-AMT  (434556) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-AMT                       
           DISPLAY 'CAT519: BH-ACAT-REJ-DEL-MARGIN-DEBIT   (434556) = '         
                            BH-ACAT-REJ-DEL-MARGIN-DEBIT                        
           DISPLAY 'CAT519: BH-ACAT-REJ-DEL-ASSET-VALUE    (434556) = '         
                            BH-ACAT-REJ-DEL-ASSET-VALUE                         
           DISPLAY 'CAT519: BH-ACAT-REJ-DEL-TOTL-ACT-VAL   (434556) = '         
                            BH-ACAT-REJ-DEL-TOTL-ACT-VAL                        
           DISPLAY 'CAT519: BH-ACAT-REJ-PEND-DEL-SPAD-NO   (434557) = '         
                            BH-ACAT-REJ-PEND-DEL-SPAD-NO                        
           DISPLAY '        BH-ACAT-REJ-PEND-DEL-SPADS     (434557) = '         
                            BH-ACAT-REJ-PEND-DEL-SPADS (1:60)                   
           DISPLAY 'CAT519: BH-ACAT-REJ-PEND-FULL-DEL-NTS  (434560) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-NTS                       
           DISPLAY 'CAT519: BH-ACAT-REJ-PEND-FULL-DEL-FLAT (434561) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-FLAT                      
           DISPLAY 'CAT519: BH-ACAT-REJ-PEND-FULL-DEL-LP   (434562) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-LP                        
           DISPLAY 'CAT519: BH-ACAT-REJ-PEND-FULL-DEL-PRIV (434567) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-PRIV                      
           DISPLAY 'CAT519: BH-ACAT-REJ-PEND-PTR-DEL-FLAT  (434572) = '         
                            BH-ACAT-REJ-PEND-PTR-DEL-FLAT                       
           DISPLAY 'CAT519: BH-ACAT-MF-FUND-SERV-CLIENT    (434606) = '         
                            BH-ACAT-MF-FUND-SERV-CLIENT                         
           DISPLAY 'CAT519: BH-ACAT-MF-REG-FUND-ACCT       (434608) = '         
                            BH-ACAT-MF-REG-FUND-ACCT                            
           DISPLAY 'CAT519: BH-ACAT-MF-REG-DIVD-PAYEE-IND  (434619) = '         
                            BH-ACAT-MF-REG-DIVD-PAYEE-IND                       
           DISPLAY 'CAT519: BH-ACAT-MF-REGIST-RECEIVE-BKR  (434636) = '         
                            BH-ACAT-MF-REGIST-RECEIVE-BKR                       
ET0001     DISPLAY 'CAT519: BH-ACAT-BALANCE-ADJUSTMENT     (434675) = '         
ET0001                      BH-ACAT-BALANCE-ADJUSTMENT                          
LRM005     DISPLAY 'CAT519: BH-ACAT-BLOCK-SECURITY-IND     (434679) = '         
LRM005                      BH-ACAT-BLOCK-SECURITY-IND                          
           DISPLAY 'CAT519: BH-ACAT-EXPIRING-OPT-DAYS      (434690) = '         
                            BH-ACAT-EXPIRING-OPT-DAYS                           
           DISPLAY '        BH-ACAT-EXPIRING-OPT-ACT       (434690) = '         
                            BH-ACAT-EXPIRING-OPT-ACT                            
LRM020     DISPLAY 'CAT519: BH-ACAT-MATUR-CALL-BOND-DAYS   (434748) = '         
LRM020                      BH-ACAT-MATUR-CALL-BOND-DAYS                        
LRM028     DISPLAY '        BH-ACAT-MATUR-CALL-BOND-ACTION (434748) = '         
LRM028                      BH-ACAT-MATUR-CALL-BOND-ACTION                      
LRM028     DISPLAY '        CALC MAT/CALL DATE ' WK-BOND-EXP-DATE               
DJ0018     DISPLAY 'CAT519: BH-ACAT-ASCENDIS-USER          (434735) = '         
DJ0018                      BH-ACAT-ASCENDIS-USER                               
           DISPLAY 'CAT519: BH-BTS2-ACAT-SK-MEMO-OVERRIDE  (511220) = '         
                            BH-BTS2-ACAT-SK-MEMO-OVERRIDE                       
           DISPLAY 'CAT519: BH-BTS2-ACAT-RESTRT-RN-RS-MEMO (511228) = '         
                            BH-BTS2-ACAT-RESTRT-RN-RS-MEMO                      
           DISPLAY 'CAT519: BH-MF-STATUS                   (537011) = '         
                            BH-MF-STATUS                                        
DJ0021     DISPLAY 'CAT519: BH-MF-EXBR-OPTION              (537483) = '         
DJ0021                      BH-MF-EXBR-OPTION                                   
DJ0013     DISPLAY 'CAT519: BH-MF-SINGLE-FUND-ACCOUNT      (537486) = '         
DJ0013                      BH-MF-SINGLE-FUND-ACCOUNT                           
           DISPLAY 'CAT519: BH-MFN-STATUS                  (537501) = '         
                            BH-MFN-STATUS                                       
           DISPLAY 'CAT519: BH-MFN-OMNIBUS-NSCC-BOX-ACCT   (537596) = '         
                            BH-MFN-OMNIBUS-NSCC-BOX-ACCT                        
LRM004     DISPLAY 'CAT519: BH-MFN-DST-MFE-NSCC-BOX-ACCT   (537601) = '         
LRM004                      BH-MFN-DST-MFE-NSCC-BOX-ACCT                        
LRM002     DISPLAY 'CAT519: BH-MFN-OMNIBUS-MULTI-PLAT-OPT  (537608) = '         
LRM002                      BH-MFN-OMNIBUS-MULTI-PLAT-OPT                       
           DISPLAY 'CAT519: BH-MF3-STATUS                  (540011) = '         
                            BH-MF3-STATUS                                       
           IF  BH-MF3-SUB-EXEC-BKR-REC-NO  NOT NUMERIC                          
               MOVE '0' TO BH-MF3-SUB-EXEC-BKR-REC-NO                           
           END-IF.                                                              
           DISPLAY 'CAT519: BH-MF3-SUB-EXEC-BKR-REC-NO     (540167) = '         
                            BH-MF3-SUB-EXEC-BKR-REC-NO.                         
LRM026     DISPLAY 'CAT519: BH-MF3-PNC-SURPAS-BOX-ACCOUNT  (540238) = '         
LRM026                      BH-MF3-PNC-SURPAS-BOX-ACCOUNT                       
           DISPLAY 'CAT519: OPT EXP DATE WITHIN   = ' W-OPT-EXP-DATE            
                   ' STATUS = ' BH-ACAT-EXPIRING-OPT-ACT.                       
LRM028     DISPLAY 'CAT519: BOND EXP / CALLED W/IN= ' WK-BOND-EXP-DATE          
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
                                                                                
LRM026     IF BH-MF3-ACTIVE                                                     
LRM026     AND BH-MF3-PNC-SURPAS-BOX-ACCOUNT NOT = SPACE                        
LRM026        MOVE BH-MF3-PNC-SURPAS-BOX-ACCOUNT TO WS-PNC-SURPAS-BOX-T         
LRM026        MOVE ' ' TO WS-PNC-SURPAS-CK                                      
LRM026        CALL  CKDIGIT  USING  WS-PNC-SURPAS-BOX-T                         
LRM026                              W-CKDIGIT-LEN                               
LRM026                              WS-PNC-SURPAS-CK                            
LRM026     ELSE                                                                 
LRM026        MOVE SPACES     TO WS-PNC-SURPAS-BOX-TC                           
LRM026     END-IF.                                                              
                                                                                
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
LRM024                  MOVE I-MMF-THRESHOLD-COUNT TO                           
LRM024                               W-THRESHOLD-TBL-CNT (TBL-SUB)              
LRM024                  PERFORM VARYING TH-SUB FROM 1 BY 1                      
LRM024                           UNTIL TH-SUB > I-MMF-THRESHOLD-COUNT           
LRM024                     MOVE I-MMF-THRESHOLD-FUND(TH-SUB) TO                 
LRM024                          W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)          
LRM024                  END-PERFORM                                             
ET0002              END-IF                                                      
ET0002           END-IF                                                         
ET0002           PERFORM 3600-READ-MMF-FILE THRU 3600-EXIT                      
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
       3500-EXIT. EXIT.                                                         
      /                                                                         
ET0002 3600-READ-MMF-FILE.                                                      
ET0002     READ MMF-FILE                                                        
ET0002        AT END                                                            
ET0002           SET EOF-MMF  TO TRUE.                                          
ET0002     IF NOT EOF-MMF                                                       
ET0002        ADD 1 TO W-MMF-CNT.                                               
ET0002 3600-EXIT.  EXIT.                                                        
ET0002/                                                                         
      ******************************************************************        
      *  FOR FULL TRANSFER REQUEST TO DELIVER                                   
      *  GET BALANCES AND POSITIONS AND LOAD TO THE INIT ASSET TABLES           
      *  FLAG ANY ERROR AND UPDATE THE TRANFER TABLE                            
      *  IF AUTO-REJECT, UPDATE/ADD TO THE INIT TRANSFER TABLE                  
      ******************************************************************        
       4000-LOAD                SECTION.                                        
           MOVE '4000-LOAD            ' TO W-ROUTINE-1.                         
                                                                                
           MOVE ' ' TO W-REJECT-AUTO-SW                                         
           MOVE ' ' TO W-REJECT-SWITCHES                                        
           MOVE ' ' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                           
DJ0019     MOVE ' ' TO W-MEMO-ONLY-SW                                           
DJ0019     MOVE 0   TO W-NOT-MEMO-CNT                                           
DJ0019     MOVE 0   TO W-IS-MEMO-CNT                                            
LRM034     MOVE 'N' TO WK-NTWRK-LVL4-IND                                        
                                                                                
      **SAVE IMPORTANT FIELDS                                                   
           MOVE W-NSCC-KEY-CLIENT-NBR    TO WF-CLIENT-NBR                       
           MOVE W-NSCC-ACAT-CTL-NBR      TO WF-ACAT-CONTROL-NBR                 
           MOVE W-NSCC-TI-SUB-PART-NBR   TO WF-SBMTG-PRTCP-NBR                  
           MOVE W-NSCC-TI-DEL-NBR        TO WF-DLVR-NBR                         
           MOVE W-NSCC-TI-DEL-ACCT-NBR   TO WF-ACCT-DLVR-NBR                    
           MOVE W-NSCC-TI-RCV-NBR        TO WF-RCV-NBR                          
           MOVE W-NSCC-TI-RCV-ACCT-NBR   TO WF-ACCT-RCV-NBR                     
           MOVE W-NSCC-TI-TFR-TYPE       TO WF-TRNFR-TYPE-CD                    
           MOVE W-NSCC-TI-TRAN-TYPE      TO WF-TRANS-TYPE-CD                    
      *****MOVE W-NSCC-DIST-SIDE         TO WF-DSTBN-SIDE-CD                    
           MOVE 'D'                      TO WF-DSTBN-SIDE-CD                    
                                                                                
           INITIALIZE                   W-DATE                                  
           IF   W-NSCC-PROC-DATE > ' '                                          
                MOVE W-NSCC-PROC-DATE (1:4) TO W-DATE-YEAR                      
                MOVE W-NSCC-PROC-DATE (5:2) TO W-DATE-MM                        
                MOVE W-NSCC-PROC-DATE (7:2) TO W-DATE-DD                        
           ELSE                                                                 
                MOVE '0001'                 TO W-DATE-YEAR                      
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF                                                               
                                                                                
           MOVE W-DATE                   TO WF-PRCS-DT                          
                                                                                
           MOVE W-NSCC-STATUS            TO WF-STTS-CD                          
           MOVE ' '                      TO WF-NSCC-PEND-CD                     
                                                                                
           MOVE W-NSCC-TI-TRAN-REF-ID    TO WF-TRANS-RFRN-ID-CD                 
                                                                                
DJ0013     MOVE WF-ACCT-DLVR-NBR(1:8)    TO WF-BRANCH-ACCT                      
                                                                                
           DISPLAY 'INP=' W-INFILE-CNT                                          
                                      ' ' WF-CLIENT-NBR                         
                                      ' ' WF-ACAT-CONTROL-NBR                   
                               ' BR-ACC=' WF-BRANCH-CD                          
                                      ' ' WF-ACCT-CD                            
                                  ' REC=' WF-RCV-NBR                            
                                  ' STA=' WF-STTS-CD                            
                                  ' DAY=' W-NSCC-DAYS-IN-STATUS                 
                                   ' PD=' W-NSCC-PROC-DATE                      
                                                                                
           MOVE WF-ACCT-DLVR-NBR(1:3) TO W-BR-X                                 
           MOVE WF-ACCT-DLVR-NBR(4:5) TO W-ACCT-X                               
                                                                                
      ***BYPASS REJECTED TRANSFERS                                              
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
DJ0020           IF  (BH-ACAT-ASCENDIS-USER = '1' OR '2')                       
DJ0018                DISPLAY '   FOR ASCENDIS REJECTS,'                        
DJ0018                   ' LOAD BYPASSED HOLDERS RECORDS ANYWAY.'               
DJ0018           ELSE                                                           
                       GO TO 4000-EXIT                                          
DJ0018           END-IF                                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
      ***BYPASS DUPLICATE TRANSFERS                                             
           PERFORM 6700-SELECT-VTRNFR  THRU 6700-EXIT                           
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               IF  ACCT-DPLCT-TRN-IND OF DCLVTRNFR NOT = 'Y'                    
                   CONTINUE                                                     
               ELSE                                                             
                   GO TO 4000-EXIT                                              
               END-IF                                                           
LRM049         IF (ACCT-FRZN-IND OF DCLVTRNFR = 'Y' OR 'O')                     
DJ0014             MOVE 'Y'                TO W-REJ-ACCT-FRZN                   
DJ0014             MOVE 'Y'                TO W-REJECT-AUTO-SW                  
DJ0014             DISPLAY 'ACCT-FRZN-IND = '                                   
DJ0014             ACCT-FRZN-IND OF DCLVTRNFR                                   
DJ0014         END-IF                                                           
           END-IF.                                                              
                                                                                
           ADD 1 TO W-LOAD-CNT.                                                 
                                                                                
LRM053     IF (W-CURRENT-CLIENT = '0313' AND CVRSN-ACCT-NBR > SPACES)           
LRM012         MOVE 'Y' TO W-REJ-FLAT                                           
LRM012         GO TO 4000-SKIP-LOAD                                             
LRM012     END-IF.                                                              
           PERFORM 5000-GET-BALANCES  THRU 5000-EXIT.                           
                                                                                
           PERFORM 5100-GET-POSITIONS THRU 5100-EXIT.                           
                                                                                
           PERFORM 5300-LOAD-BALANCES THRU 5300-EXIT.                           
                                                                                
LRM044     PERFORM 5010-GET-FCURR-BALS THRU 5010-EXIT.                          
LRM012 4000-SKIP-LOAD.                                                          
           IF  W-ASSET-ADDED-FOR-THIS-ACCT-SW = 'Y'                             
DJ0016         IF  GETNA-RETURN-FOUND                                           
DJ0016         AND NAPPA-90-DAY-RES = '1'                                       
DJ0016           IF  NAPPA-DATE-90DAY-ENDED NUMERIC                             
DJ0016           AND NAPPA-DATE-90DAY-ENDED > W-TODAY-DATE                      
DJ0016               PERFORM 5732-FORMAT-90DR THRU 5732-EXIT                    
DJ0016               PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                 
DJ0016           END-IF                                                         
DJ0016         END-IF                                                           
DJ0010         PERFORM 7100-WRITE-ACATDLVF-TYPE3 THRU 7100-EXIT                 
           ELSE                                                                 
               MOVE 'Y' TO W-REJ-FLAT                                           
           END-IF.                                                              
                                                                                
DJ0019***REJECT IF THERE IS ONLY MEMO ASSETS.                                   
DJ0019***COMMENT SHOULD BE: "MEMO ONLY - RESTRICTED ASSET".                     
DJ0019     IF  W-NOT-MEMO-CNT     = 0                                           
DJ0019     AND W-IS-MEMO-CNT  NOT = 0                                           
DJ0019         MOVE 'Y' TO W-MEMO-ONLY-SW                                       
DJ0019         MOVE 'Y' TO W-REJ-FLAT                                           
DJ0020         DISPLAY '   W-NOT-MEMO-CNT= ' W-NOT-MEMO-CNT                     
DJ0020                 '   W-IS-MEMO-CNT=  ' W-IS-MEMO-CNT                      
DJ0019     END-IF.                                                              
                                                                                
DJ0018***SET EXCEPTION INDICATORS ON VTRNFR                                     
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               PERFORM 6800-UPDATE-VTRNFR   THRU 6800-EXIT                      
           END-IF.                                                              
                                                                                
DJ0018***CREATE REJECT TIF ON ACTITRF FOR ANY REJECTS                           
           IF  W-REJECT-SWITCHES > ' '                                          
ET0006         IF W-REJ-FLAT = 'Y'                                              
ET0006             IF  W-TRANSFER-FND-SW = 'Y'                                  
LRM009             AND BH-ACAT-REJ-PEND-DEL-FLAT-IND = '1'                      
LRM009             AND BH-ACAT-REJ-PEND-DEL-FLAT-CODE > '00'                    
ET0006                MOVE WF-CLIENT-NBR (2:3) TO WS-FROM-CLT                   
ET0006                MOVE WF-BRANCH-CD        TO WS-FROM-BR                    
ET0006                MOVE WF-ACCT-CD          TO WS-FROM-ACCT                  
ET0006                MOVE SPACE TO WS-INTERNALY-TRANSFERED-IND                 
LRM010                MOVE ZEROS TO W-CATNACT-LOOP-COUNT                        
ET0006                PERFORM 4100-CHECK-INTERNAL-TRANSFER                      
ET0006                     UNTIL WS-INTERNALY-TRANSFERED-IND > SPACE            
ET0006                PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT                
ET0006                MOVE SPACES  TO  WS-INTERNALY-TRANSFERED-IND              
ET0006             END-IF                                                       
ET0006         ELSE                                                             
                   IF  W-REJECT-AUTO-SW = 'Y'                                   
                       PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT               
                   END-IF                                                       
ET0006         END-IF                                                           
           END-IF.                                                              
                                                                                
DJTEST     DISPLAY 'TEST W-ASSET-ADDED-FOR-THIS-ACCT-SW = '                     
DJTEST                   W-ASSET-ADDED-FOR-THIS-ACCT-SW                         
DJTEST                '  W-REJ-FLAT = ' W-REJ-FLAT.                             
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
ET0006*****************************************************************         
ET0006*  (1) IF TRANSFER IS REJECTED DUE TO FLAT ACCOUNT, CHECK IF THE          
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
LRM010     ADD 1 TO W-CATNACT-LOOP-COUNT                                        
LRM010     DISPLAY                                                              
LRM010     'CALLING CATNACT INTNL-FROM-ACCOUNT: ' WS-FROM-ACCOUNT               
LRM010     '  COUNT=' W-CATNACT-LOOP-COUNT                                      
ET0006     MOVE  SPACES               TO  INTERNAL-TRANSFER-PARM.               
ET0006     MOVE  WS-FROM-ACCOUNT      TO  INTNL-FROM-ACCOUNT.                   
ET0006     CALL  CATNACT           USING  INTERNAL-TRANSFER-PARM.               
ET0006                                                                          
ET0006     IF INTNL-ACCT-NOT-FND                                                
ET0006        MOVE 'N' TO WS-INTERNALY-TRANSFERED-IND                           
ET0006     ELSE                                                                 
ET0006     IF INTNL-ACCT-FND                                                    
TEST          DISPLAY 'CATNACT FOUND TO ' INTNL-TO-BR ' ' INTNL-TO-ACCT         
ET0006        MOVE INTNL-TO-BR       TO  W-BR-X                                 
ET0006        MOVE INTNL-TO-ACCT     TO  W-ACCT-X                               
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
LRM010     IF W-CATNACT-LOOP-COUNT > 19                                         
LRM010     AND WS-INTERNALY-TRANSFERED-IND = SPACE                              
LRM010        MOVE 'N' TO WS-INTERNALY-TRANSFERED-IND                           
LRM010        DISPLAY 'STOPPED CATNACT CALL AFTER 20X '                         
LRM010                WF-CLIENT-NBR                                             
LRM010            ' ' WF-BRANCH-CD                                              
LRM010            ' ' WF-ACCT-CD                                                
LRM010     END-IF.                                                              
ET0006 4100-EXIT. EXIT.                                                         
ET0006/                                                                         
DJ0007******************************************************************        
DJ0007*  PTR - CHECK IF ACCOUNT IS FLAT                                         
DJ0007******************************************************************        
DJ0007 4200-PTR-EDIT   SECTION.                                                 
DJ0007     MOVE '4200-PTR-EDIT        ' TO W-ROUTINE-1.                         
DJ0007                                                                          
DJ0007     MOVE ' ' TO W-REJECT-AUTO-SW                                         
DJ0007     MOVE ' ' TO W-REJECT-SWITCHES                                        
DJ0007     MOVE ' ' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                           
DJ0007                                                                          
DJ0007**SAVE IMPORTANT FIELDS                                                   
DJ0007     MOVE W-NSCC-KEY-CLIENT-NBR    TO WF-CLIENT-NBR                       
DJ0007     MOVE W-NSCC-ACAT-CTL-NBR      TO WF-ACAT-CONTROL-NBR                 
DJ0007     MOVE W-NSCC-TI-SUB-PART-NBR   TO WF-SBMTG-PRTCP-NBR                  
DJ0007     MOVE W-NSCC-TI-DEL-NBR        TO WF-DLVR-NBR                         
DJ0007     MOVE W-NSCC-TI-DEL-ACCT-NBR   TO WF-ACCT-DLVR-NBR                    
DJ0007     MOVE W-NSCC-TI-RCV-NBR        TO WF-RCV-NBR                          
DJ0007     MOVE W-NSCC-TI-RCV-ACCT-NBR   TO WF-ACCT-RCV-NBR                     
DJ0007     MOVE W-NSCC-TI-TFR-TYPE       TO WF-TRNFR-TYPE-CD                    
DJ0007     MOVE W-NSCC-TI-TRAN-TYPE      TO WF-TRANS-TYPE-CD                    
DJ0007*****MOVE W-NSCC-DIST-SIDE         TO WF-DSTBN-SIDE-CD                    
DJ0007     MOVE 'D'                      TO WF-DSTBN-SIDE-CD                    
DJ0007                                                                          
DJ0007     INITIALIZE                   W-DATE                                  
DJ0007     IF   W-NSCC-PROC-DATE > ' '                                          
DJ0007          MOVE W-NSCC-PROC-DATE (1:4) TO W-DATE-YEAR                      
DJ0007          MOVE W-NSCC-PROC-DATE (5:2) TO W-DATE-MM                        
DJ0007          MOVE W-NSCC-PROC-DATE (7:2) TO W-DATE-DD                        
DJ0007     ELSE                                                                 
DJ0007          MOVE '0001'                 TO W-DATE-YEAR                      
DJ0007          MOVE '01'                   TO W-DATE-MM                        
DJ0007          MOVE '01'                   TO W-DATE-DD                        
DJ0007     END-IF                                                               
DJ0007                                                                          
DJ0007     MOVE W-DATE                   TO WF-PRCS-DT                          
DJ0007                                                                          
DJ0007     MOVE W-NSCC-STATUS            TO WF-STTS-CD                          
DJ0007     MOVE ' '                      TO WF-NSCC-PEND-CD                     
DJ0007                                                                          
DJ0007     MOVE W-NSCC-TI-TRAN-REF-ID    TO WF-TRANS-RFRN-ID-CD                 
DJ0007                                                                          
DJ0013     MOVE WF-ACCT-DLVR-NBR(1:8)    TO WF-BRANCH-ACCT                      
DJ0007                                                                          
DJ0007     DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0007                                ' ' WF-CLIENT-NBR                         
DJ0007                                ' ' WF-ACAT-CONTROL-NBR                   
DJ0007                         ' BR-ACC=' WF-BRANCH-CD                          
DJ0007                                ' ' WF-ACCT-CD                            
DJ0007                            ' REC=' WF-RCV-NBR                            
DJ0007                            ' STA=' WF-STTS-CD                            
DJ0007                            ' DAY=' W-NSCC-DAYS-IN-STATUS                 
DJ0007                             ' PD=' W-NSCC-PROC-DATE                      
DJ0007                                                                          
DJ0007     MOVE WF-ACCT-DLVR-NBR(1:3) TO W-BR-X                                 
DJ0007     MOVE WF-ACCT-DLVR-NBR(4:5) TO W-ACCT-X                               
DJ0007                                                                          
DJ0007***BYPASS REJECTED  TRANSFERS                                             
DJ0007     PERFORM 6920-SELECT-ACTITRF THRU 6920-EXIT                           
DJ0007     IF  W-ACTITRF-FND-SW = 'Y'                                           
DJ0007         DISPLAY '   ACTITRF FOUND '                                      
DJ0007                 ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF                
DJ0007                 ' PEND=' NSCC-PEND-CD       OF DCLACTITRF                
DJ0007                 ' PRGM=' PRGM-NM            OF DCLACTITRF                
DJ0007                 ' UPDT=' UPDT-TMSTP         OF DCLACTITRF                
DJ0007                 ' BYPASSED REJECT'                                       
DJ0007         IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF = '  ' OR '00'              
DJ0007             CONTINUE                                                     
DJ0007         ELSE                                                             
DJ0007             GO TO 4200-EXIT                                              
DJ0007         END-IF                                                           
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007***BYPASS DUPLICATE TRANSFERS                                             
DJ0007     PERFORM 6700-SELECT-VTRNFR  THRU 6700-EXIT                           
DJ0007     IF  W-TRANSFER-FND-SW = 'Y'                                          
DJ0007         IF  ACCT-DPLCT-TRN-IND OF DCLVTRNFR NOT = 'Y'                    
DJ0007             CONTINUE                                                     
DJ0007         ELSE                                                             
DJ0007             GO TO 4200-EXIT                                              
DJ0007         END-IF                                                           
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007     MOVE 'Y'     TO W-PTR-TRANSFER-SW                                    
DJ0007     MOVE ' '     TO W-PTR-ASSET-FOUND-SW                                 
DJ0007                                                                          
DJ0007     PERFORM 5000-GET-BALANCES  THRU 5000-EXIT                            
DJ0007                                                                          
DJ0007     PERFORM 5100-GET-POSITIONS THRU 5100-EXIT                            
DJ0007                                                                          
DJ0007     IF  W-PTR-ASSET-FOUND-SW = 'Y'                                       
DJ0007         CONTINUE                                                         
DJ0007     ELSE                                                                 
DJ0007         MOVE 'Y' TO W-REJ-FLAT                                           
DJ0007         IF  W-TRANSFER-FND-SW = 'Y'                                      
DJ0007             PERFORM 6800-UPDATE-VTRNFR   THRU 6800-EXIT                  
DJ0007         END-IF                                                           
DJ0007         IF  BH-ACAT-REJ-PEND-PTR-DEL-FL-CD > '00'                        
DJ0007             PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT                   
DJ0007             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0007                            ' ' W-NSCC-KEY-CLIENT-NBR                     
DJ0007                            ' ' W-NSCC-TI-ACAT-CTL-NBR                    
DJ0007                            ' ' W-NSCC-TI-DEL-ACCT-NBR (1:8)              
DJ0007                            ' ' W-NSCC-TI-TFR-TYPE                        
DJ0007                        ' TRN=' W-NSCC-TI-TRAN-TYPE                       
DJ0007                        ' STA=' W-NSCC-STATUS                             
DJ0007                         ' PTR-IS-FLAT'                                   
DJ0007         END-IF                                                           
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007 4200-EXIT. EXIT.                                                         
      /                                                                         
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
           MOVE W-BR-X                      TO W-BAL-BR                         
           MOVE W-ACCT-X                    TO W-BAL-ACCT                       
           MOVE '28'                        TO W-BAL-REC-TYPE                   
           MOVE '000000'                    TO W-BAL-CUR                        
           MOVE W-BAL-KEY                   TO CMBL-KEY                         
                                                                                
ET0005***  MOVE  LOW-VALUES                TO  GETVBAL-PARM.                    
ET0005     MOVE  'CAT519  '                TO  GETVBAL-CALLING-PROGRAM.         
ET0005     MOVE  'O'                       TO  GETVBAL-FILE.                    
ET0005     MOVE  'R'                       TO  GETVBAL-FUNC.                    
ET0005     MOVE W-CURRENT-CLIENT-N         TO  GETVBAL-OLD-CLIENT.              
ET0005     MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
ET0005     MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
ET0005     MOVE ZEROES                     TO  GETVBAL-OLD-CUR-CODE.            
ET0005     SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
ET0005     PERFORM 9500-CALL-GETVBAL                                            
                                                                                
           IF BALNC-OKAY                                                        
              CONTINUE                                                          
           ELSE                                                                 
             IF BALNC-END-OF-FILE                                               
             OR BALNC-NOT-FOUND                                                 
                GO TO 5000-EXIT                                                 
             ELSE                                                               
ET0005          DISPLAY ' ** CAT519  CALL GETVBAL PROBLEM'                      
                DISPLAY 'W-BAL-KEY = ' W-BAL-CLT                                
                                   ' ' W-BAL-BR                                 
                                   ' ' W-BAL-ACCT                               
                MOVE +3999    TO ABEND-CODE                                     
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
               DISPLAY '   '                                                    
                        'BAL NEXT REC =  '                                      
                                      CMBL-COMPANY-CODE                         
                                  ' ' CMBL-OFFICE-CODE                          
                                  ' ' CMBL-ACCOUNT-NUMBER                       
                                  ' ' CMBL-RECORD-TYPE                          
                                  ' ' CMBL-CURR-TYPE (4:3)                      
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
           IF CMBL-TOTAL-SMA <     0                                            
              MOVE CMBL-TOTAL-SMA                 TO W-BAL-SMA                  
           END-IF.                                                              
ET0006                                                                          
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
                                                                                
DJ0007     IF  W-PTR-TRANSFER-SW = 'Y'                                          
DJ0007         IF  (W-BAL-TYPE1 NOT = ZERO)                                     
DJ0007         OR  (W-BAL-TYPE2 NOT = ZERO)                                     
DJ0007         OR  (W-BAL-TYPE3 NOT = ZERO)                                     
DJ0007         OR  (W-BAL-TYPE5 NOT = ZERO)                                     
DJ0007         OR  (W-BAL-SMA   NOT = ZERO)                                     
DJ0007             MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                             
DJ0007         END-IF                                                           
DJ0007         GO TO 5000-EXIT                                                  
DJ0007     END-IF.                                                              
                                                                                
           MOVE CMBL-TOTAL-MARKET-VALUE   TO W-BAL-TOTAL-MARKET-VALUE           
           MOVE CMBL-TOTL-LIQDATNG-EQUITY TO W-BAL-TOTL-LIQDATNG-EQUITY         
ET0001     MOVE CMBL-PENDING-AMOUNT       TO W-BAL-PENDING-AMOUNT               
                                                                                
           MOVE W-BAL-TYPE1  TO W-BAL-TYPE1-DISPLAY                             
           MOVE W-BAL-TYPE2  TO W-BAL-TYPE2-DISPLAY                             
           MOVE W-BAL-TYPE3  TO W-BAL-TYPE3-DISPLAY                             
           MOVE W-BAL-TYPE5  TO W-BAL-TYPE5-DISPLAY                             
           MOVE W-BAL-SMA    TO W-BAL-SMA-DISPLAY                               
           MOVE W-BAL-REGT   TO W-BAL-REGT-DISPLAY                              
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
LRM044     MOVE W-BR-X                      TO W-BAL-BR                         
LRM044     MOVE W-ACCT-X                    TO W-BAL-ACCT                       
LRM044     MOVE '28'                        TO W-BAL-REC-TYPE                   
LRM044     MOVE '000001'                    TO W-BAL-CUR                        
LRM044     MOVE W-BAL-KEY                   TO CMBL-KEY                         
LRM044                                                                          
LRM044     MOVE  'CAT519  '                TO  GETVBAL-CALLING-PROGRAM.         
LRM044     MOVE  'O'                       TO  GETVBAL-FILE.                    
LRM044     MOVE  'R'                       TO  GETVBAL-FUNC.                    
LRM044     MOVE W-CURRENT-CLIENT-N         TO  GETVBAL-OLD-CLIENT.              
LRM044     MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
LRM044     MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
LRM044     MOVE W-BAL-CUR                  TO  GETVBAL-OLD-CUR-CODE.            
LRM044     SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
LRM044 5010-LOOP.                                                               
LRM044     PERFORM 9500-CALL-GETVBAL                                            
LRM044     MOVE  'N'                       TO  GETVBAL-FUNC.                    
LRM044                                                                          
LRM044     IF BALNC-OKAY                                                        
LRM044        CONTINUE                                                          
LRM044     ELSE                                                                 
LRM044       IF BALNC-END-OF-FILE                                               
LRM044       OR BALNC-NOT-FOUND                                                 
LRM044          GO TO 5010-EXIT                                                 
LRM044       ELSE                                                               
LRM044          DISPLAY ' ** CAT519  CALL GETVBAL PROBLEM IN 5010-'             
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
TEST           DISPLAY 'HAVE FCUR BAL '                                         
                        CMBL-COMPANY-CODE                                       
                    ' ' CMBL-OFFICE-CODE                                        
                    ' ' CMBL-ACCOUNT-NUMBER                                     
                    ' ' CMBL-RECORD-TYPE                                        
                    ' ' CMBL-CURR-TYPE (4:3)                                    
LRM044****     CONTINUE                                                         
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
DJ0008*  BYPASS IRA, ANNUITY, SPAD, MONEY MARKET FUND SECURITIES.               
LRM052*  BYPASS OPEN ORDERS - CUSHOL DEFINED                                    
      *  BYPASS ZERO QTY RECORD                                                 
      *****************************************************************         
           MOVE '5100-GET-POSITIONS            ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                         TO W-POS-FND-SW                     
DJ0007     MOVE ' '                    TO W-CKDIGIT-ACCT-TC                     
DJ0007                                    W-CKDIGIT-ACCT-TC-1                   
ET0005     MOVE LOW-VALUES             TO W-CUSHOL-KEY                          
ET0005     MOVE W-CURRENT-CLIENT(2:3)  TO W-CUSHOL-CLIENT                       
ET0005     MOVE W-BR-X                 TO W-CUSHOL-BRANCH                       
ET0005     MOVE W-ACCT-X               TO W-CUSHOL-ACCOUNT                      
ET0005     MOVE ZEROS                  TO W-CUSHOL-FRGN-CURR-CODE               
LRM052     MOVE W-CUSHOL-KEY           TO GETVHOL-KEY                           
ET0005     MOVE SPACES                 TO GETVHOL-RETURN-PARAMETERS.            
ET0005                                                                          
LRM052     MOVE 'N'                    TO GETVHOL-FILE.                         
ET0005                                                                          
ET0005**---DO A SKIP SEQUENTIAL READ TO GET RECORDS FOR THAT ACCOUNT.           
ET0005     MOVE 'S'                    TO GETVHOL-FUNC.                         
ET0005     MOVE SPACES                 TO GETVHOL-PREV-KEY.                     
ET0005                                                                          
       5100-READ-POS-NEXT.                                                      
ET0005**---DO READNEXT FOR NEXT RECORD FOR THAT ACCOUNT.                        
ET0005                                                                          
ET0005     PERFORM 9600-CALL-GETVHOL.                                           
ET0005                                                                          
ET0005     IF GETVHOL-END-OF-FILE                                               
                GO TO 5100-EXIT                                                 
ET0005     END-IF.                                                              
ET0005                                                                          
ET0005     IF NOT GETVHOL-SUCCESSFUL                                            
ET0005          DISPLAY 'CAT519: CUSHOLV VSAM FILE, READ ERROR'                 
ET0005          DISPLAY 'CAT519: GETVHOL-RETURN-CODE = '                        
ET0005                          GETVHOL-RETURN-CODE                             
ET0005          DISPLAY 'CAT519: GETVHOL-FILE-STATUS = '                        
ET0005                         GETVHOL-FILE-STATUS                              
                MOVE +3999    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
           END-IF.                                                              
                                                                                
           ADD 1 TO W-POS-CNT                                                   
                                                                                
ET0005**---MOVE THE NEW RECORD FROM THE PARM AREA                               
LRM052     MOVE GETVHOL-NEW-RECORD   TO CUSHOL-RECORD.                          
ET0005                                                                          
LRM052     IF CUSHOL-REC-TYPE = HIGH-VALUES                                     
ET0005        GO TO 5100-READ-POS-NEXT.                                         
ET0005                                                                          
ET0005     IF CUSHOL-ACCOUNT-TYPE NOT NUMERIC                                   
ET0005        GO TO 5100-READ-POS-NEXT.                                         
ET0005                                                                          
ET0005     IF CUSHOL-KEY(1:11) NOT = W-CUSHOL-KEY(1:11)                         
ET0005        GO TO 5100-EXIT.                                                  
                                                                                
      ** BYPASS NON-ZERO CURRENCY                                               
LRM052     IF (CUSHOL-FRGN-CURR-CODE NOT = 000                                  
LRM043                   AND 254 AND 998 AND 999)                               
LRM043       IF BH-ACAT-DLVR-FCUR-POSN NOT = '1'                                
DJ0018         MOVE 'CURR' TO W-ASCENDIS-WHLD-REASON                            
DJ0018         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
               GO TO 5100-READ-POS-NEXT                                         
LRM043       END-IF                                                             
           END-IF                                                               
                                                                                
LRM043     IF CUSHOL-FRGN-CURR-CODE = 254 OR 998 OR 999                         
LRM043        GO TO 5100-READ-POS-NEXT                                          
LRM043     END-IF                                                               
                                                                                
      ** BYPASS OPEN ORDERS                                                     
LRM052**** IF  CUSHOL-ACCOUNT-TYPE NOT NUMERIC                                  
LRM052     IF  CUSHOL-OPEN-ORDER                                                
DJ0018         MOVE 'OPOR' TO W-ASCENDIS-WHLD-REASON                            
DJ0018         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** SELECT ONLY TYPES 1,2,3,5                                              
LRM039** OR TYPE 04 FOR CLIENT 10 TO CONSIDER CREATING A FAIL.                  
           IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '2' OR '3' OR '5')                 
                CONTINUE                                                        
           ELSE                                                                 
DJ0018         MOVE 'TYPE' TO W-ASCENDIS-WHLD-REASON                            
DJ0018          PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                 
                GO TO 5100-READ-POS-NEXT                                        
           END-IF                                                               
                                                                                
DJ0008** BYPASS THESE SECURITIES                                                
DJ0008     MOVE CUSHOL-SECURITY-NO  TO W-SEC-TO-BYPASS-FIELD                    
LRM035                                 VALIDATE-MMF-SECURITY                    
DJ0008     IF  W-IRA-SECURITY                                                   
DJ0018         MOVE 'IRAA' TO W-ASCENDIS-WHLD-REASON                            
DJ0018         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
DJ0008         GO TO 5100-READ-POS-NEXT                                         
DJ0008     END-IF                                                               
DJ0008     IF  W-ANNUITY-SECURITY                                               
DJ0018         MOVE 'ANNU' TO W-ASCENDIS-WHLD-REASON                            
DJ0018         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
DJ0008         GO TO 5100-READ-POS-NEXT                                         
DJ0008     END-IF                                                               
DJ0008     IF  W-SPAD-SECURITY                                                  
               PERFORM 5110-CHECK-SPAD-POSITIONS THRU 5110-EXIT                 
DJ0018         MOVE 'SPAD' TO W-ASCENDIS-WHLD-REASON                            
DJ0018         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
LRM042         IF W-SPAD-FND-SW = 'Y'                                           
LRM042            PERFORM 7500-WRITE-ASCENDIS-EXCP THRU 7500-EXIT               
LRM042         END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
DJ0008     END-IF                                                               
                                                                                
      ** MAKE SURE QUANTITY IS GREATER THAN ZERO                                
           IF  (CUSHOL-CPH-TD-QTY NOT NUMERIC)                                  
                   OR                                                           
               (CUSHOL-CPH-TD-QTY = ZERO)                                       
DJ0018         MOVE 'QTY0' TO W-ASCENDIS-WHLD-REASON                            
DJ0018         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
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
DJ0013     IF  W-CURRENT-CLIENT (2:3) = GETNA-KEY-CLIENT                        
DJ0013     AND W-CUSHOL-BRANCH        = GETNA-KEY-BRANCH3-5                     
DJ0013     AND W-CUSHOL-ACCOUNT       = GETNA-KEY-ACCOUNT6-10                   
DJ0013         CONTINUE                                                         
DJ0013     ELSE                                                                 
ET0002         MOVE W-CURRENT-CLIENT (2:3) TO GETNA-KEY-CLIENT                  
ET0002         MOVE '00'             TO GETNA-KEY-BRANCH1-2                     
ET0002         MOVE  W-CUSHOL-BRANCH TO GETNA-KEY-BRANCH3-5                     
ET0002         MOVE '00000'          TO GETNA-KEY-ACCOUNT1-5                    
ET0002         MOVE  W-CUSHOL-ACCOUNT TO GETNA-KEY-ACCOUNT6-10                  
ET0002         CALL  GETNA        USING GETNA-SENDING-PARAMETERS                
ET0002                                  GETNA-SEGMENT-INCLUDES                  
ET0002         IF  GETNA-RETURN-FOUND                                           
ET0002             ADD 1 TO W-GETNA-FND-CNT                                     
ET0002         ELSE                                                             
ET0002             ADD 1 TO W-GETNA-NOTFND-CNT                                  
ET0002         END-IF                                                           
DJ0013     END-IF.                                                              
ET0002     IF  GETNA-RETURN-FOUND                                               
ET0002         ADD 1 TO W-GETNA-FND-CNT                                         
ET0002     ELSE                                                                 
ET0002         ADD 1 TO W-GETNA-NOTFND-CNT                                      
ET0002     END-IF.                                                              
ET0002                                                                          
ET0002     MOVE  SPACE             TO  W-MMF-FOUND                              
ET0002     IF GETNA-RETURN-FOUND                                                
ET0002     AND (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                             
LRM043     AND CUSHOL-FRGN-CURR-CODE = '000'                                    
ET0002        PERFORM VARYING  TBL-SUB FROM 1 BY 1                              
ET0002                  UNTIL  TBL-SUB > W-MMF-TBL-CNT                          
LRM009                     OR  W-MMF-FOUND = 'Y' OR 'T'                         
LRM051           IF W-MMF-SWEEP-CD (TBL-SUB) = NAPPA-EXP-FUND-NBR-N             
ET0002              IF W-MMF-SEC (TBL-SUB) = CUSHOL-SECURITY-NO                 
ET0002                 MOVE 'Y' TO W-MMF-FOUND                                  
LRM009              ELSE                                                        
LRM024                 PERFORM VARYING TH-SUB FROM 1 BY 1                       
LRM024                    UNTIL TH-SUB > W-THRESHOLD-TBL-CNT (TBL-SUB)          
LRM024                      IF W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)           
LRM024                                    = CUSHOL-SECURITY-NO                  
LRM024                         MOVE 'T' TO W-MMF-FOUND                          
LRM024                      END-IF                                              
LRM024                 END-PERFORM                                              
ET0002              END-IF                                                      
ET0002           END-IF                                                         
ET0002        END-PERFORM                                                       
ET0002        IF W-MMF-FOUND = 'Y'                                              
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
LRM052********                      + CUSHOL-CPH-TD-QTY                         
LRM052                              + CUSHOL-CPH-MKT-VAL                        
LRM052           MOVE CUSHOL-CPH-MKT-VAL TO W-AMT-DISPLAY                       
ET0002           DISPLAY '   PRIMARY MMKT FNDS FOUND   '                        
ET0002                     CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1                
ET0002                                              ' ' MS-DESC2                
LRM052                     ' AMT=' W-AMT-DISPLAY                                
LRM018           PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                
ET0002           GO TO 5100-READ-POS-NEXT                                       
LRM009        ELSE                                                              
LRM009        IF W-MMF-FOUND = 'T'                                              
LRM009           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
LRM052********                      + CUSHOL-CPH-TD-QTY                         
LRM052                              + CUSHOL-CPH-MKT-VAL                        
LRM009           DISPLAY ' THRESHOLD FUND SLOT ' TBL-SUB                        
LRM009                 ' ' CUSHOL-SECURITY-NO (1:7)                             
LRM052                   ' AMT=' CUSHOL-CPH-MKT-VAL                             
LRM009                 ' ' MS-DESC1 ' ' MS-DESC2                                
LRM018           PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                
LRM009           GO TO 5100-READ-POS-NEXT                                       
LRM009        END-IF                                                            
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
ET0002                                                                          
ET0002** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '3'                                
ET0002** LIQUIDATE IF IN SECONDARY REDEMPTION LIST                              
ET0002**                                                                        
ET0002     IF BH-ACAT-LIQUIDATE-MMF = '3'                                       
LRM043     AND CUSHOL-FRGN-CURR-CODE = '000'                                    
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
LRM052           MOVE CUSHOL-CPH-MKT-VAL TO W-AMT-DISPLAY                       
ET0002           DISPLAY '   SECONDARY MMKT FNDS FOUND '                        
ET0002                   CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1                  
ET0002                                            ' ' MS-DESC2                  
LRM052                       ' AMT=' W-AMT-DISPLAY                              
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT +                              
ET0002********                        CUSHOL-CPH-TD-QTY                         
LRM052                                CUSHOL-CPH-MKT-VAL                        
LRM018           PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                
ET0002           GO TO 5100-READ-POS-NEXT                                       
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
                                                                                
DJ0018***IF SECURITY IS ON ACTRBSC TABLE,                                       
DJ0018***DELIVER MONEY MARKET FUND AS CASH                                      
DJ0018     PERFORM 5530-CHECK-ACTRBSC THRU 5530-EXIT                            
DJ0018     IF  W-ACTRBSC-FOUND                                                  
DJ0018******   MOVE CUSHOL-CPH-TD-QTY  TO W-QTY-DISPLAY                         
LRM052         MOVE CUSHOL-CPH-MKT-VAL TO W-AMT-DISPLAY                         
DJ0018         DISPLAY '   ACTRBSC MMF DLVR AS CASH  '                          
DJ0018           CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1 ' ' MS-DESC2             
LRM052           ' AMT=' W-AMT-DISPLAY                                          
DJ0018         COMPUTE W-BAL-MMKT = W-BAL-MMKT +                                
DJ0018********                      CUSHOL-CPH-TD-QTY                           
LRM052                              CUSHOL-CPH-MKT-VAL                          
DJ0018         PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT                  
DJ0018         GO TO 5100-READ-POS-NEXT                                         
DJ0018     END-IF                                                               
                                                                                
LRM035     IF CUSHOL-SECURITY-NO = 'A000928'                                    
LRM035         GO TO 5100-READ-POS-NEXT                                         
LRM035     END-IF.                                                              
                                                                                
      ** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '1'                                
LRM003** THE FOLLOWING 5 LINES ADDED TO CAUSE MMF FUNDS TO CREATE               
LRM003** ASSETS RATHER THAN BE SKIPPED FOR NEW B1 SETTINGS 2, 3.                
LRM043     IF CUSHOL-FRGN-CURR-CODE NOT = '000'                                 
LRM043        CONTINUE                                                          
LRM043     ELSE                                                                 
LRM003     IF (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                              
LRM003     AND ((WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')                
LRM003       OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6'))               
LRM003           DISPLAY 'CREATE ASSET FOR MMF ' CUSHOL-SECURITY-NO             
LRM003     ELSE                                                                 
                                                                                
LRM037       IF (W-MONEY-MARKET-SECURITY                                        
LRM035       OR  VALID-MMF-SECURITY)                                            
               IF (WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')              
               OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6')              
                   MOVE CUSHOL-CPH-MKT-VAL TO W-AMT-DISPLAY                     
                   DISPLAY '   MONEY MARKET FOUND '                             
                               CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1            
                                                        ' ' MS-DESC2            
                                   ' QTY=' W-QTY-DISPLAY                        
                   IF BH-ACAT-LIQUIDATE-MMF = '1'                               
                      COMPUTE W-BAL-MMKT = W-BAL-MMKT +                         
LRM052                                     CUSHOL-CPH-MKT-VAL                   
LRM018                PERFORM 7300-WRITE-ACATDLVF-MMF  THRU 7300-EXIT           
                   END-IF                                                       
LRM035         ELSE                                                             
LRM035             DISPLAY 'UNEXPECTED CLASS CODE ' WK-MS-CLASS                 
LRM035               ' ON MMF SECURITY ' CUSHOL-SECURITY-NO (1:7)               
               END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
DJ0008       END-IF                                                             
           END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-POS-FND-SW.                                            
                                                                                
DJ0007     IF  W-PTR-TRANSFER-SW = 'Y'                                          
DJ0007         MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                                 
LRM008         DISPLAY 'PTR ASSET FOUND'                                        
DJ0007         GO TO 5100-EXIT                                                  
DJ0007     END-IF.                                                              
                                                                                
           MOVE ' '                      TO W-POS-DESC1                         
           MOVE ' '                      TO W-POS-DESC2                         
           MOVE ' '                      TO W-POS-DESC3                         
           MOVE ' '                      TO WK-POS-DESC4                        
           INITIALIZE                       WK-POS-DESC5                        
           MOVE ZEROS                    TO W-POS-MEMO-QTY-EXCLUDED             
LRM005     MOVE ' '                TO W-ASSET-CMNT-TXT                          
                                                                                
           MOVE CUSHOL-CPH-TD-QTY TO W-POS-QTY.                                 
                                                                                
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
           MOVE WORK-POS-QTY        TO WORK-POS-QTY-SIGNED-INTEGER              
                                       WORK-POS-QTY-DECIMAL                     
LRM043     IF CUSHOL-FRGN-CURR-CODE NOT = '000'                                 
LRM043        MOVE W-CURRENT-CLIENT(2:3) TO CURR-CLIENT-NUMBER                  
LRM043        MOVE 'CAT519  '            TO CURR-CALLING-PGM-NAME               
LRM043        MOVE '  '                  TO CURR-RETURN-CODE                    
LRM043        MOVE CUSHOL-FRGN-CURR-CODE TO CURR-CURRENCY-NUMBER                
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
                                   ' ' CUSHOL-CPH-CUSIP                         
                                   ' ' W-QTY-DISPLAY                            
                                   ' ' W-POS-DESC1                              
                                                                                
           IF  BH-ACAT-REJ-DEL-ASSET-VALUE  > 0                                 
               IF  WORK-POS-VALUE     NOT < BH-ACAT-REJ-DEL-ASSET-VALUE         
                   MOVE 'Y' TO W-REJ-ASSET-VALUE                                
               END-IF                                                           
           END-IF                                                               
                                                                                
LRM043     IF CUSHOL-FRGN-CURR-CODE NOT = '000'                                 
LRM043        GO TO 5100-SKIP-RESTRICTED-EDIT                                   
LRM043     END-IF.                                                              
                                                                                
           IF  CUSHOL-WI                                                        
               ADD 1 TO W-WHEN-ISSUE-CNT                                        
DJ0018*********PERFORM 5730-FORMAT-WHEN-ISSUE THRU 5730-EXIT                    
DJ0016***------ FYI, THIS IS NOT BEING INSERTED INTO THE DATABASE               
DJ0018         MOVE 'WHIS' TO W-ASCENDIS-WHLD-REASON                            
DJ0018         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      **** IF SECURITY IS RESTRICTED, CREATE ASSET WITH 'WITHHOLD'              
      ****    AND GO TO READNEXT                                                
           PERFORM 5500-CHECK-RESTRICTED THRU 5500-EXIT                         
LRM005     PERFORM 5520-CHECK-SEC-BLOCK THRU 5520-EXIT                          
                                                                                
LRM028     MOVE 'N' TO W-MATURE-CALLED-BOND-SW.                                 
LRM028     IF  WK-MS-SEC-ID = 'B'                                               
LRM028     AND W-BOND-EXP-ACT NOT = '0'                                         
LRM028         PERFORM 5515-CHECK-BOND-MAT-RTN   THRU 5515-EXIT                 
LRM028     END-IF                                                               
                                                                                
LRM028     IF W-BOND-EXP-ACT = '1'                                              
LRM028     AND (W-MATURE-CALLED-BOND-SW  = 'Y')                                 
LRM028         DISPLAY 'CALLED/MATURE BOND BYPASSED '                           
LRM028                  CUSHOL-SECURITY-NO                                      
LRM028         MOVE 'MATU' TO W-ASCENDIS-WHLD-REASON                            
LRM028         PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT                  
LRM028         GO TO 5100-READ-POS-NEXT                                         
LRM028     END-IF.                                                              
                                                                                
LRM043 5100-SKIP-RESTRICTED-EDIT.                                               
LRM030     IF  WK-MSD-ISIN > SPACES                                             
LRM030     AND WK-MSD-ISIN(1:2) NOT = 'US'                                      
LRM030     AND WK-CNS-IND NOT = 'Y'                                             
TEST***********DISPLAY 'SET FFEE IND ON ' CUSHOL-SECURITY-NO                    
LRM030         SET FOREIGN-FEE-ELIGIBLE TO TRUE                                 
LRM030     ELSE                                                                 
TEST***********DISPLAY 'SET FFEE IND OFF ' CUSHOL-SECURITY-NO                   
LRM030         SET FOREIGN-FEE-NOT-APPLY TO TRUE                                
LRM030     END-IF.                                                              
                                                                                
LRM043     IF CUSHOL-FRGN-CURR-CODE NOT = '000'                                 
LRM043        GO TO 5100-SKIP-RESTRICTED-EDIT2                                  
LRM043     END-IF.                                                              
                                                                                
           IF (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-ROW-CNT = 0)              
           OR (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-FND-SW  = 'Y')            
LRM005     OR (W-VRSDBLK-SEC-FND-SW  = 'Y')                                     
LRM028     OR (W-MATURE-CALLED-BOND-SW  = 'Y')                                  
ET0006         IF WS-INTNL-TRNFR-MODE                                           
ET0006            GO TO 5100-READ-POS-NEXT                                      
ET0006         END-IF                                                           
               ADD 1 TO W-RESTRICTED-CNT                                        
               PERFORM 5720-FORMAT-RESTRICTED    THRU 5720-EXIT                 
               PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT                 
               IF  BH-ACAT-REJ-PEND-DEL-NTS-IND = '1'                           
                   MOVE 'Y' TO W-REJ-NTS                                        
               END-IF                                                           
LRM028         IF W-BOND-EXP-ACT = '3'                                          
LRM028         AND W-MATURE-CALLED-BOND-SW  = 'Y'                               
LRM028            PERFORM 6020-INSERT-ACTIAST-AUD   THRU 6020-EXIT              
LRM028         END-IF                                                           
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
DJ0018             MOVE 'QTL0' TO W-ASCENDIS-WHLD-REASON                        
DJ0018             PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT              
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
DJ0013         PERFORM 5105-CHECK-DIGIT      THRU 5105-EXIT                     
               PERFORM 5910-MFMSD            THRU 5910-EXIT                     
               PERFORM 5920-BNWREGOP         THRU 5920-EXIT                     
               PERFORM 5930-GET-BNWMAST-INFO THRU 5930-EXIT                     
           END-IF                                                               
                                                                                
LRM034     IF BH-ACAT-DELIVER-NTW-LVL4-FUND = '0'                               
LRM034     AND BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
LRM034     AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
LRM034     AND W-FUND-SERV-ELIGIBLE-SW = 'Y'                                    
LRM034**** SET NTWLVL IN PARA 5940- FIRST (FOR REFERENCE).                      
LRM034**** THEN BYPASS LVL 4                                                    
LRM034         PERFORM 5940-FORMAT-MF-RTN  THRU 5940-EXIT                       
TEST           DISPLAY 'HAVE NETWORK LEVEL ' NTWRK-CNTL-CD                      
LRM034         IF  NTWRK-CNTL-CD  OF DCLACTIMF = '4'                            
LRM034             DISPLAY 'NTW LVL4 FOUND, CREATE MEMO'                        
LRM034             MOVE 'Y' TO WK-NTWRK-LVL4-IND                                
LRM034             PERFORM 5740-FORMAT-WHOLD-MEMO    THRU 5740-EXIT             
LRM034             MOVE 'LEVEL 4 ASSET MUST BE DELIVERED BY THE FUND'           
LRM034                                        TO W-ASSET-CMNT-TXT               
LRM034             PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT             
LRM034             PERFORM 6020-INSERT-ACTIAST-AUD   THRU 6020-EXIT             
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
                   MOVE WORK-POS-QTY-LEFT     TO W-QTY-DISPLAY                  
                   MOVE WORK-SFK-MEMO-QTY     TO W-QTY-DISPLAY-2                
                   DISPLAY '   WORK-POS-QTY-LEFT(' W-QTY-DISPLAY                
                           ' < WORK-SFK-MEMO-QTY(' W-QTY-DISPLAY-2   ')'        
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
                                                                                
DJ0022     IF (WK-MS-CLASS-1   = 1 OR 7)                                        
DJ0022     OR (WK-MS-CLASS-1-2 = '65')                                          
DJ0022     OR (WK-MS-CLASS-1   = 4 AND WK-MS-CLASS-7 = 3)                       
DJ0022         MOVE 'Y' TO W-FRACTION-EQUITY-IND                                
DJ0022         IF (WK-MS-CLASS-1 = 4 AND WK-MS-CLASS-7 = 3)                     
DJ0022            DISPLAY '   MUNI-TAX-EXEMPT-UNITS: '                          
DJ0022                        CUSHOL-SECURITY-NO                                
DJ0022         END-IF                                                           
DJ0022     ELSE                                                                 
DJ0022         MOVE 'N' TO W-FRACTION-EQUITY-IND                                
DJ0022     END-IF                                                               
                                                                                
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
DJ0022******IF CNS AND MUNI TAX EXEMPT UNITS AND B1 ON, REMOVE.                 
      ******ALL OTHERS, REMOVE THE FRACTION.                                    
      ******CNS EQUITY INCLUDES CLASS CODE 1(EQUITY) AND 7(UNITS).              
DJ0022******MUNI TAX EXEMPT UNITS CLASS CODE 1=4, CODE 7=3.                     
      *************************************************************             
ET0003       IF  WK-CNS-IND = 'Y'                                               
DJ0022       AND W-FRACTION-EQUITY-IND NOT = 'Y'                                
                 CONTINUE                                                       
             ELSE                                                               
ET0003         IF  WK-CNS-IND = 'Y'                                             
DJ0022         AND W-FRACTION-EQUITY-IND = 'Y'                                  
               AND BH-ACAT-FRACT-ON-CNS-ELIG-SEC NOT = '1'                      
                   CONTINUE                                                     
               ELSE                                                             
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
                                                                                
LRM043 5100-SKIP-RESTRICTED-EDIT2.                                              
           IF  WORK-POS-QTY      <  0                                           
           AND W-POS-QTY         >  0                                           
               MOVE W-POS-QTY             TO W-QTY-DISPLAY                      
               MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                    
               DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)                  
                      ' QTY < 0 AND ORIG-QTY > 0'                               
                      ' QTY=' W-QTY-DISPLAY-2                                   
                      ' ORG=' W-QTY-DISPLAY                                     
                    ' ' MS-DESC1                                                
DJ0018             MOVE 'QTL0' TO W-ASCENDIS-WHLD-REASON                        
DJ0018             PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT              
           ELSE                                                                 
               IF  WORK-POS-QTY      > -.0001                                   
               AND WORK-POS-QTY      <  .0001                                   
                   MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                
                   DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)              
                          ' QTY < .0001'                                        
                          ' QTY=' W-QTY-DISPLAY-2                               
                        ' ' MS-DESC1                                            
DJ0018             MOVE 'QTL1' TO W-ASCENDIS-WHLD-REASON                        
DJ0018             PERFORM 7400-WRITE-ASCENDIS-WHLD THRU 7400-EXIT              
               ELSE                                                             
ET0006           IF WS-INTNL-TRNFR-MODE                                         
ET0006              SET WS-POSITION-FOUND TO TRUE                               
ET0006              GO TO 5100-EXIT                                             
ET0006           ELSE                                                           
                   PERFORM 5150-FORMAT-AND-LOAD-ASSET THRU 5150-EXIT            
ET0006           END-IF                                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0010     IF  W-REMOVE-FRACTION-SW = 'Y'                                       
LRM043     AND CUSHOL-FRGN-CURR-CODE = '000'                                    
LRM030         SET ACATDLVF-FRAC-QTY-REC TO TRUE                                
DJ0010         PERFORM 7200-WRITE-ACATDLVF-FRAC  THRU 7200-EXIT                 
DJ0010     END-IF.                                                              
                                                                                
      *************************************************************             
LRM030*  IF FOREIGN FEE POTENTIAL CHARGE EXISTS, CREATE AN                      
LRM030*  THE ACATDLVF "F" RECORD TO DRIVE CAT820 LOOKUP.                        
      *************************************************************             
LRM030     IF FOREIGN-FEE-ELIGIBLE                                              
LRM030         SET ACATDLVF-FRGN-FEE-REC TO TRUE                                
LRM030         PERFORM 7200-WRITE-ACATDLVF-FRAC THRU 7200-EXIT                  
LRM030     END-IF.                                                              
                                                                                
           GO TO 5100-READ-POS-NEXT.                                            
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       5105-CHECK-DIGIT              SECTION.                                   
                                                                                
DJ0013     IF  WF-BRANCH-ACCT         = W-CKDIGIT-BRN-ACCT                      
DJ0013     AND CUSHOL-ACCOUNT-TYPE    = W-CKDIGIT-TYPE                          
DJ0013         CONTINUE                                                         
DJ0013     ELSE                                                                 
DJ0013         MOVE WF-BRANCH-ACCT         TO W-CKDIGIT-BRN-ACCT                
DJ0013         MOVE CUSHOL-ACCOUNT-TYPE    TO W-CKDIGIT-TYPE                    
DJ0013         MOVE ' '            TO W-CKDIGIT-CK                              
DJ0013         CALL CKDIGIT USING W-CKDIGIT-ACCT-T                              
DJ0013                            W-CKDIGIT-LEN                                 
DJ0013                            W-CKDIGIT-CK                                  
DJ0013         ADD 1 TO W-CKDIGIT-CNT                                           
DJ0013     END-IF                                                               
DJ0013     IF  BH-MF-SINGLE-FUND-ACCOUNT = '1'                                  
DJ0013     AND (W-CKDIGIT-BRN-ACCT-1 NOT = W-CKDIGIT-BRN-ACCT)                  
DJ0013         MOVE W-CKDIGIT-ACCT-TC TO W-CKDIGIT-ACCT-TC-1                    
DJ0013         IF  W-CKDIGIT-TYPE = '1'                                         
DJ0013             CONTINUE                                                     
DJ0013         ELSE                                                             
DJ0013             MOVE '1'        TO W-CKDIGIT-TYPE-1                          
DJ0013             MOVE ' '        TO W-CKDIGIT-CK-1                            
DJ0013             CALL CKDIGIT USING W-CKDIGIT-ACCT-T-1                        
DJ0013                                W-CKDIGIT-LEN                             
DJ0013                                W-CKDIGIT-CK-1                            
DJ0013             ADD 1 TO W-CKDIGIT-CNT                                       
DJ0013             DISPLAY ' W-CKDIGIT-ACCT-TC=' W-CKDIGIT-ACCT-TC              
DJ0013                     ' W-CKDIGIT-ACCT-TC-1=' W-CKDIGIT-ACCT-TC-1          
DJ0013         END-IF                                                           
DJ0013     END-IF.                                                              
                                                                                
       5105-EXIT. EXIT.                                                         
      /                                                                         
       5110-CHECK-SPAD-POSITIONS     SECTION.                                   
      *--- SPAD SECURITIES: '9997291' TO '9999999'                              
      *--- IF SPAD SECURITY MATCHES B1 434557, REJECT THE TRANSFER              
                                                                                
           DISPLAY '   SPAD POSITION FOUND '                                    
                       CUSHOL-SECURITY-NO                                       
           MOVE 'N' TO W-SPAD-FND-SW                                            
                                                                                
           IF  BH-ACAT-REJ-PEND-DEL-SPAD-NO > 0                                 
                                                                                
               PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL                           
                   SUB1 > BH-ACAT-REJ-PEND-DEL-SPAD-NO                          
                   OR  W-SPAD-FND-SW = 'Y'                                      
                                                                                
                 IF CUSHOL-SECURITY-NO (4:4) =                                  
                                   BH-ACAT-REJ-PEND-DEL-SPAD (SUB1)             
                    MOVE BH-ACAT-REJ-PEND-DEL-CODE (SUB1)                       
                             TO W-REJ-SPAD-CODE                                 
                    MOVE 'Y' TO W-REJ-SPAD                                      
                    MOVE 'Y' TO W-SPAD-FND-SW                                   
                    DISPLAY '   SPAD ON B1 REJECTED '                           
                                CUSHOL-SECURITY-NO (1:7)                        
                            '. TRANSFER WILL BE REJECTED WITH '                 
                            'REJ-CODE ' W-REJ-SPAD-CODE                         
                 END-IF                                                         
                                                                                
               END-PERFORM                                                      
                                                                                
           END-IF.                                                              
                                                                                
DJ0016***REG T MOVED TO BALANCE LOADING                                         
DJ0016***PASS RESTRICTION INFORMATION TO CONTRA PARTY                           
DJ0016***  IF  CUSHOL-SECURITY-NO (1:7) = '9999200'                             
DJ0016****     PERFORM 5731-FORMAT-REGT THRU 5731-EXIT                          
DJ0016****     PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
DJ0016**** END-IF.                                                              
                                                                                
       5110-EXIT. EXIT.                                                         
      /                                                                         
       5150-FORMAT-AND-LOAD-ASSET    SECTION.                                   
                                                                                
      **** FORMAT AND LOAD ASSET                                                
      **** IF OPTIONS, LOAD OPTION TABLE - ACTIOPN                              
      **** IF MUTUAL FUNDS, LOAD MUTUAL FUND TABLE - ACTIMF                     
                                                                                
           PERFORM 5700-FORMAT-ACTIAST       THRU 5700-EXIT                     
                                                                                
           IF  WK-MS-SEC-ID = 'O'                                               
               PERFORM 5800-FORMAT-OPT-RTN    THRU 5800-EXIT                    
           END-IF                                                               
                                                                                
                                                                                
           PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT                     
                                                                                
           IF  W-ACTIAST-INSERT-SW = 'Y'                                        
                                                                                
                 IF  WK-MS-SEC-ID = 'O'                                         
                     PERFORM 6100-INSERT-ACTIOPN    THRU 6100-EXIT              
                 ELSE                                                           
                                                                                
      **** IF CLIENT IS A FUND/SERV CLIENT                                      
      **** AND ASSET IS A MUTUAL FUND BASED ON MSD                              
      **** LOOK UP FUND ELIGIBILITY ON MFMSD FILE                               
      **** LOOK UP ON MF NETWORKING TABLE IF IT IS A LEGG MASON FUND            
                   IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                        
                   AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                 
                                                                                
      **** FUND MUST BE FUND/SERV ELIGIBLE                                      
      **** BYPASS LEGG-MASON PROPRIETARY FUNDS                                  
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
ET0001                                                                          
ET0001**<< B1=434675 - CASH BALANCE ADJUST BY PENDING AMT >>                    
ET0001     IF BH-ACAT-BALANCE-ADJUSTMENT = '1'                                  
ET0001        IF W-BAL-PENDING-AMOUNT NOT = ZERO                                
ET0001           ADD W-BAL-PENDING-AMOUNT TO W-WORK-BAL                         
ET0001           MOVE W-BAL-PENDING-AMOUNT TO W-AMT-DISPLAY                     
ET0001           DISPLAY '   *CASH BALANCE ADJUSTED BY PENDING AMOUNT '         
ET0001                       W-AMT-DISPLAY                                      
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
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
DJ0016         PERFORM 5731-FORMAT-REGT THRU 5731-EXIT                          
DJ0016         PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT                       
DJ0016     END-IF.                                                              
                                                                                
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
LRM030                                      WK-MS-CUSIP-10-12                   
LRM030                                      WK-MSD-ISIN                         
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
DJ0017     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           MOVE CUSHOL-SECURITY-NO       TO GETMSD-SEARCH-KEY.                  
LRM052     IF CUSHOL-WI                                                         
              MOVE '1'                   TO GETMSD-WI-CODE                      
LRM052     ELSE                                                                 
              MOVE '0'                   TO GETMSD-WI-CODE                      
LRM052     END-IF.                                                              
DJ0017     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2.                  
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               CONTINUE                                                         
           ELSE                                                                 
               GO TO 5400-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE MS-CUSIP-NO              TO WK-MS-CUSIP                         
LRM030     MOVE MS-CUSIP-AREA(10 : 3)    TO WK-MS-CUSIP-10-12                   
           MOVE MS-SYMBOL                TO WK-MS-SYMBOL-9                      
           MOVE MS-DESC1                 TO WK-MS-DESC1                         
           MOVE MS-DESC2                 TO WK-MS-DESC2                         
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
LRM030     IF  MSD-SEG-14-ABSENT                                                
LRM030         MOVE SPACES               TO WK-MSD-ISIN                         
LRM030     ELSE                                                                 
LRM030         MOVE MSD-ISIN             TO WK-MSD-ISIN                         
LRM030         IF  MSD-ISIN(1:2) NOT = 'US'                                     
LRM030         AND MSD-ISIN(1:2) > SPACES                                       
LRM030            DISPLAY 'HAVE FOREIGN MSD ISIN ' CUSHOL-SECURITY-NO           
LRM030          ' ' MSD-ISIN                                                    
LRM030         END-IF                                                           
LRM030     END-IF.                                                              
                                                                                
DJ0015     EVALUATE TRUE                                                        
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-1                                        
DJ0015            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1            
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-10                                       
DJ0015            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 10           
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-100                                      
DJ0015            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 100          
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-1000                                     
DJ0015            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1000         
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-10000                                    
DJ0015            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0015                                     MS-CLOSING-PRICE * 10000             
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-100000                                   
DJ0015            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0015                                     MS-CLOSING-PRICE * 100000            
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-1000000                                  
DJ0015            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0015                                     MS-CLOSING-PRICE * 1000000           
DJ0015       WHEN MS-MULTIPLY-PRICE-BY-10000000                                 
DJ0015            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0015                                     MS-CLOSING-PRICE * 10000000          
DJ0015       WHEN OTHER                                                         
                  MOVE MS-CLOSING-PRICE  TO WK-MS-CLOSING-PRICE                 
DJ0015     END-EVALUATE.                                                        
                                                                                
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
LRM023     IF MS-EXP-OPT-STRIKE-PRC NOT = ZERO                                  
LRM023        MOVE MS-EXP-OPT-STRIKE-PRC TO WK-MS-OPT-PRICE-NEW                 
LRM023     ELSE                                                                 
LRM023        DISPLAY 'EXPANDED OPT STRIKE ZEROS, FORCING OLD PRC '             
LRM023          'WAS ' WK-MS-OPT-PRICE  ' ' MS-ADP-NO                           
LRM023        MOVE WK-MS-OPT-PRC   TO WK-MS-OPT-PRC-NEW                         
LRM023        DIVIDE WK-MS-OPT-FRAC BY 100                                      
LRM023                    GIVING WK-MS-OPT-FRAC-NEW                             
LRM023     END-IF.                                                              
LRM054*****MOVE MS-OPTION-FACTOR           TO WK-MS-OPTION-FACTOR               
LRM054     MOVE MSD-OPTION-FACTOR-N        TO WK-MS-OPTION-FACTOR               
                                                                                
           IF  WK-MS-OPT-FRAC = ZERO                                            
               MOVE ZERO                 TO WK-MS-OPT-FRAC-1                    
LRM007                                   WK-MS-OPT-DECI-ROUNDED                 
           ELSE                                                                 
LRM007     IF MSD-FRACTION-DECIMAL-IND = 'D'                                    
LRM007        COMPUTE WK-MS-OPT-DECI-ROUNDED = WK-MS-OPT-FRAC / 1000            
LRM007        END-COMPUTE                                                       
LRM007        DISPLAY 'USING DECIMAL STRIKE PRICE FOR '                         
LRM007          WK-MS-SEC ' ' WK-MS-OPT-DECI-ROUNDED                            
LRM007     ELSE                                                                 
              COMPUTE WK-MS-OPT-FRAC-6 = WK-MS-OPT-FRAC * 8                     
              END-COMPUTE                                                       
           END-IF.                                                              
                                                                                
LRM024**** IF L-STREAM-IND = 'Q'                                                
LRM023        MOVE MSD-OCC-OPTN-SYM-ID TO WK-MS-SYMBOL.                         
LRM023**** END-IF.                                                              
       5410-EXIT. EXIT.                                                         
      /                                                                         
       5415-GETMSD-OPT-SYMBOL.                                                  
                                                                                
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
DJ0017     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           MOVE WK-MS-XREF-NO            TO GETMSD-SEARCH-KEY.                  
           MOVE '0'                      TO GETMSD-WI-CODE                      
DJ0017     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2.                  
                                                                                
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
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *                   UNITS (TREATED AS STOCK)                  *           
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
       5430-GETMSDC-UNITS-RTN.                                                  
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((WK-MS-SEC-1 = '4')                                        
                 OR                                                             
DJ0008         (WK-MS-SEC > '1999999' AND < '2200000'))                         
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
               WK-MS-CLASS-5-6-7 = '211' OR '711')                              
           OR (WK-MS-CLASS-1 = '2'  AND                                         
               WK-MS-CLASS-5-6-7 = '210' OR '710')                              
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
                DISPLAY ' ** CAT519 - PRNGFL FILE, START BROWSE ERROR'          
                        ' FILE-STATUS = ' PRNGFL-STATUS                         
                DISPLAY 'W-PRNGFL-KEY = ' CUSHOL-SECURITY-NO                    
                MOVE +3999    TO ABEND-CODE                                     
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
                DISPLAY ' ** CAT519 - PRNGFL FILE, READ NEXT ERROR'             
                        ' FILE-STATUS = ' PRNGFL-STATUS                         
                DISPLAY 'W-PRNGFL-KEY = ' PRNGKEY                               
                MOVE +3999    TO ABEND-CODE                                     
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
LRM033          DISPLAY ' ** CAT519 - DVNDFL FILE, START BROWSE ERROR'          
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
LRM033          DISPLAY ' ** CAT519 - DVNDFL FILE, READ NEXT ERROR'             
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
LRM033              DISPLAY '   PENDING DIVIDEND FOUND '                        
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
                                               ' ' WK-MS-SYMBOL-9               
                       ' MEMO=' TRNFR-MEMO-IND     OF DCLVRSTSEC                
                        ' TFR=' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                
                       ' (IF MEMO=N, WILL BE WITHHELD)'                         
               MOVE 'Y'               TO W-VRSTSEC-FND-SW                       
           ELSE                                                                 
               ADD 1 TO W-VRSTSEC-NOTFND-CNT                                    
               MOVE 'N'               TO W-VRSTSEC-FND-SW                       
DJ0020         IF SQLCODE  <  +0                                                
DJ0020            MOVE SQLCODE      TO W-DB2-SQLCODE                            
DJ0020            DISPLAY '   VRSTSEC ERROR: ' WF-CLIENT-NBR                    
DJ0020                                     ' ' WK-MS-SEC                        
DJ0020                  ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                    
DJ0020                    ' SQLCODE = ' W-DB2-SQLCODE                           
DJ0020         END-IF                                                           
           END-IF.                                                              
                                                                                
       5500-EXIT. EXIT.                                                         
      /                                                                         
LRM028 5515-CHECK-BOND-MAT-RTN   SECTION.                                       
TEST       DISPLAY 'WE ARE IN 5515- CALL/MAT LOOKUP'.                           
TEST       DISPLAY 'PRE-IND ' CUSHOL-CPH-CALL-PRE-IND                           
            ' PRE-DATE ' CUSHOL-CPH-CALL-PRE-DATE                               
            ' CALC EXP ' WK-BOND-EXP-DATE                                       
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR FULLY CALLED ' WK-MS-SEC               
                                                                                
LRM029**** READ DB2 MSD...                                                      
LRM029     EXEC SQL SELECT                                                      
LRM029            RATE_BOND_DT                                                  
LRM029           ,TYPE_RATE_CD                                                  
LRM029         INTO                                                             
LRM029              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM029             ,:DCLVBNDFTRV.TYPE-RATE-CD                                   
LRM029         FROM VBNDFTRV                                                    
LRM029        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM029          AND TYPE_RATE_CD      = 'FC'                                    
LRM029     END-EXEC                                                             
LRM029                                                                          
LRM029     IF (SQLCODE  =  +0 OR -811)                                          
LRM029       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM029         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM029         DISPLAY 'FULLY CALLED BOND: CUSIP=' WK-MS-CUSIP                  
LRM029                                       ' ' WK-MS-SEC                      
LRM029                                  ' MSD=' RATE-BOND-DT                    
LRM029                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM029         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM029         MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM029         MOVE 'FC'              TO W-ASSET-CMNT-TXT (20 : 2)              
LRM029         MOVE RATE-BOND-DT      TO W-ASSET-CMNT-TXT (23 : 10)             
LRM029         ADD 1 TO W-MATURE-FND-CNT                                        
LRM029         GO TO 5515-EXIT                                                  
LRM029       ELSE                                                               
LRM029          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM029          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM029     ELSE                                                                 
LRM029         IF SQLCODE  <  +0                                                
LRM029            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM029            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM029                                     ' ' WK-MS-SEC                        
LRM029                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM029         END-IF                                                           
LRM029     END-IF.                                                              
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR PRTL CALLED ' WK-MS-SEC                
                                                                                
LRM029     EXEC SQL SELECT                                                      
LRM029            RATE_BOND_DT                                                  
LRM029         INTO                                                             
LRM029              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM029         FROM VBNDFTRV                                                    
LRM029        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM029          AND TYPE_RATE_CD      = 'PD'                                    
LRM029          AND FEATURE_FRQNC_CD  = 'AC'                                    
LRM029          AND RATE_BOND_DT      > :WK-TODAY-DB2                           
LRM029     END-EXEC                                                             
LRM029                                                                          
TEST       DISPLAY 'SQLCODE ' SQLCODE                                           
LRM029     IF (SQLCODE  =  +0 OR -811)                                          
LRM029       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM029       AND RATE-BOND-DT > WK-TODAY-DB2                                    
LRM029         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM029         DISPLAY 'PRTL CALLED BOND: CUSIP=' WK-MS-CUSIP                   
LRM029                                       ' ' WK-MS-SEC                      
LRM029                                  ' MSD=' RATE-BOND-DT                    
LRM029                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM029         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM029         MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM029         MOVE 'PC'              TO W-ASSET-CMNT-TXT (20 : 2)              
LRM029         MOVE RATE-BOND-DT      TO W-ASSET-CMNT-TXT (23 : 10)             
LRM029         ADD 1 TO W-MATURE-FND-CNT                                        
LRM029         GO TO 5515-EXIT                                                  
LRM029       ELSE                                                               
LRM029         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM029         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM029          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM029          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM029          ' AND GREATER THAN TODAY ' WK-TODAY-DB2                         
LRM029     ELSE                                                                 
LRM029         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM029         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM029         IF SQLCODE  <  +0                                                
LRM029            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM029            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM029                                     ' ' WK-MS-SEC                        
LRM029                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM029         END-IF                                                           
LRM029     END-IF.                                                              
LRM029                                                                          
TEST       DISPLAY 'READING VBNDDT FOR ' WK-MS-SEC                              
                                                                                
LRM028**** READ DB2 MSD...                                                      
LRM028     EXEC SQL SELECT                                                      
LRM028            MATURITY_DT                                                   
LRM028         INTO                                                             
LRM028              :DCLVBNDDT.MATURITY-DT                                      
LRM028         FROM VBNDDT                                                      
LRM028        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM028     END-EXEC                                                             
LRM028                                                                          
LRM028     IF  SQLCODE  =  +0                                                   
LRM028     AND MATURITY-DT NOT > WK-MS-BOND-EXP-DATE-DB2                        
LRM028         ADD 1 TO W-VBNDDT-FND-CNT                                        
LRM028         DISPLAY '   MATURED BOND: CUSIP=' WK-MS-CUSIP                    
LRM028                                       ' ' WK-MS-SEC                      
LRM028                                  ' MSD=' MATURITY-DT                     
LRM028                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM028         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM028         MOVE 'MATURE BOND'     TO W-ASSET-CMNT-TXT                       
LRM028     ELSE                                                                 
LRM028         ADD 1 TO W-VBNDDT-NOTFND-CNT                                     
LRM028         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM028         IF SQLCODE  <  +0                                                
LRM028            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM028            DISPLAY '   VBNDDT ERROR: ' WF-CLIENT-NBR                     
LRM028                                     ' ' WK-MS-SEC                        
LRM028                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM028         END-IF                                                           
LRM028     END-IF.                                                              
LRM028                                                                          
LRM028 5515-EXIT. EXIT.                                                         
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
DJ0012          AND BRANCH_CD         = :WF-BRANCH-CD                           
DJ0012          AND ACCT_CD           = :WF-ACCT-CD                             
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND BLOCK_CD = 'S'                                              
                AND NOT ACTION_CD = 'D'                                         
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDBLK '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSDBLK-SEC-FND-CNT                                   
               MOVE 'Y'               TO W-VRSDBLK-SEC-FND-SW                   
               MOVE CMNT-TXT OF DCLVRSDBLK TO W-ASSET-CMNT-TXT                  
DJ0012         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0012            '    SECURITY BLOCK FOUND FOR'                                
DJ0012                             ' '  WF-CLIENT-NBR                           
DJ0012                             ' '  WF-BRANCH-CD                            
DJ0012                             ' '  WF-ACCT-CD                              
DJ0012                             ' '  WK-MS-SEC                               
           ELSE                                                                 
               MOVE 'N'               TO W-VRSDBLK-SEC-FND-SW                   
           END-IF.                                                              
                                                                                
       5520-EXIT. EXIT.                                                         
      /                                                                         
DJ0018 5530-CHECK-ACTRBSC         SECTION.                                      
DJ0018     MOVE '5530-CHECK-ACTRBSC            ' TO W-ROUTINE-1.                
DJ0018                                                                          
DJ0018     MOVE ' '                TO DCLACTRBSC                                
DJ0018     MOVE ' '                TO W-ACTRBSC-FND-SW                          
DJ0018                                                                          
DJ0018     EXEC SQL SELECT                                                      
DJ0018              CLIENT_NBR                                                  
DJ0018             ,SECURITY_ADP_NBR                                            
DJ0018         INTO                                                             
DJ0018              :DCLACTRBSC.CLIENT-NBR                                      
DJ0018             ,:DCLACTRBSC.SECURITY-ADP-NBR                                
DJ0018         FROM ACTRBSC                                                     
DJ0018        WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
DJ0018          AND BRANCH_CD         = :WF-BRANCH-CD                           
DJ0018          AND ACCT_CD           = :WF-ACCT-CD                             
DJ0018          AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
DJ0018          AND BLOCK_CD          = 'M'                                     
DJ0018     END-EXEC                                                             
DJ0018                                                                          
DJ0018     MOVE 'ACTRBSC '               TO W-DB2-TABLE-NAME                    
DJ0018     MOVE 'SELECT'                 TO W-DB2-ACTION                        
DJ0018     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0018                                                                          
DJ0018     IF  SQLCODE  =  +0                                                   
DJ0018         ADD 1 TO W-ACTRBSC-FND-CNT                                       
DJ0018         MOVE 'Y'               TO W-ACTRBSC-FND-SW                       
DJ0018     ELSE                                                                 
DJ0018         ADD 1 TO W-ACTRBSC-NOTFND-CNT                                    
DJ0018         MOVE 'N'               TO W-ACTRBSC-FND-SW                       
DJ0018     END-IF.                                                              
DJ0018                                                                          
DJ0018 5530-EXIT. EXIT.                                                         
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
                   ELSE                                                         
                     IF MRGI-FAM-IND (W-MM-SUB) = 'TL' OR 'TF'                  
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                             TO W-POS-MEMO-QTY-EXCLUDED         
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY '   MRGIMM TF MEMO '                            
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
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
LRM005     MOVE ' '                TO W-ASSET-CMNT-TXT                          
                                                                                
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
DJ0009     MOVE ' '                TO TRANS-RFRN-ID-CD   OF DCLACTIAST          
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
           MOVE 'H'                TO NSCC-PEND-CD       OF DCLACTIAST          
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
                                                                                
LRM043     IF  CUSHOL-FRGN-CURR-CODE NOT = 000                                  
LRM043         MOVE '50'           TO STTLM-LCTN-CD      OF DCLACTIAST          
LRM043         MOVE 'XSET'         TO  STTLM-RSN-CD      OF DCLACTIAST          
LRM043         MOVE SPACES TO CURLOOK-DATA                                      
LRM043         MOVE CUSHOL-FRGN-CURR-CODE TO CU-ARGUMENT                        
LRM043         MOVE 'DTC CODE REQUESTED' TO CU-DTC-CD                           
LRM043         CALL CURLOOK USING CURLOOK-DATA                                  
LRM043         MOVE 'ORIGINAL CURRENCY '    TO W-ASSET-CMNT-TXT                 
LRM043         MOVE CUSHOL-FRGN-CURR-CODE TO W-ASSET-CMNT-TXT(19:3)             
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
           MOVE ' '                 TO NSCC-WTHLD-CD     OF DCLACTIAST          
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
                                                                                
LRM005     IF  W-VRSDBLK-SEC-FND-SW = 'Y'                                       
LRM005         IF BH-ACAT-BLOCK-SECURITY-IND   = '2'                            
LRM005            MOVE 'W'          TO NSCC-WTHLD-CD     OF DCLACTIAST          
LRM005         ELSE                                                             
LRM005            MOVE ' '          TO NSCC-WTHLD-CD     OF DCLACTIAST          
LRM005     ELSE                                                                 
           IF  TRNFR-MEMO-IND OF DCLVRSTSEC = 'N'                               
               MOVE 'W'             TO NSCC-WTHLD-CD     OF DCLACTIAST          
           ELSE                                                                 
               MOVE ' '             TO NSCC-WTHLD-CD     OF DCLACTIAST          
LRM025         IF RSTRD-MSG-TXT OF DCLVRSTSEC (1:38) =                          
LRM025                  'REORG - VOLUNTARY OFFER CONTRA CUSIP  '                
LRM025               OR 'FOR DELIVERER: REORG - VOLUNTARY OFFER'                
LRM025            MOVE 'UNDER VOLUNTARY REORG' TO W-ASSET-CMNT-TXT              
LRM025         END-IF                                                           
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
                                                                                
DJ0016 5731-FORMAT-REGT       SECTION.                                          
DJ0016*****************************************************************         
DJ0016**** SETTLING LOCATION = 45, SETTLING REASON = REGT                       
DJ0016**** 9999200 REGT RESTRICTION EXP                                         
DJ0016**** REG T CALLS (CREATE DATE AND AMOUNT REQUIRED)                        
DJ0016**** THE CREATE DATE IS IN THE DLA FIELD                                  
DJ0016**** PUT IT (CCYYMMDD) IN THE ASSET COMMENTS FIELD                        
DJ0016*****************************************************************         
DJ0016     MOVE '5731-FORMAT-REGT               ' TO W-ROUTINE-1.               
DJ0016                                                                          
DJ0016     MOVE W-TODAY-DATE               TO W-ASSET-CMNT-TXT                  
DJ0016     MOVE W-BAL-REGT-DISPLAY         TO W-ASSET-CMNT-TXT(10:15)           
DJ0016                                                                          
DJ0016     MOVE 0                    TO W-ASSET-QTY-SIGN                        
DJ0016                                  W-ASSET-QTY-UNSIGN                      
DJ0016                                                                          
LRM038     MOVE 0 TO WK-MS-ASSET-TYPE                                           
DJ0016     PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
DJ0016                                                                          
DJ0016     MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
DJ0016     MOVE 'REGT'             TO STTLM-RSN-CD       OF DCLACTIAST          
DJ0016     MOVE W-WORK-BAL-UNSIGN  TO ASSET-AMT          OF DCLACTIAST          
DJ0016     MOVE 0                  TO ASSET-QTY          OF DCLACTIAST          
DJ0016     MOVE ' '                TO ASSET-PRC-CTGY-CD  OF DCLACTIAST          
LRM039                                SECURITY-ADP-NBR   OF DCLACTIAST          
LRM039                                ISIN-CNTRY-CD      OF DCLACTIAST          
LRM039                                ISIN-SEC-ISSUE-CD  OF DCLACTIAST          
LRM039                                ISIN-SEC-CDG-CD    OF DCLACTIAST          
DJ0016     MOVE 'TOTAL FED CALL AMOUNT'                                         
DJ0016                       TO ASSET-DESC-TXT OF DCLACTIAST                    
DJ0016                                                                          
DJ0016     MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
DJ0016     DISPLAY         '   REGT ' W-ASSET-CMNT-TXT(1:8)                     
DJ0016     .                                                                    
DJ0016 5731-EXIT. EXIT.                                                         
                                                                                
DJ0016 5732-FORMAT-90DR       SECTION.                                          
DJ0016*****************************************************************         
DJ0016**** SETTLING LOCATION = 45, SETTLING REASON = 90DR                       
DJ0016**** 90-DAY RESTRICTION (EXPIRATION DATE REQUIRED)                        
DJ0016**** THE EXPIRATION DATE IS IN NAPPA-DATE-90DAY-ENDED                     
DJ0016**** PUT IT (CCYYMMDD) IN THE ASSET COMMENTS FIELD                        
DJ0016*****************************************************************         
DJ0016     MOVE '5732-FORMAT-90DR               ' TO W-ROUTINE-1.               
DJ0016                                                                          
DJ0016     MOVE ' '                                      TO DCLACTIAST          
DJ0016     MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
DJ0016     MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
DJ0016     MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
DJ0016     MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
DJ0016     MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
DJ0016     MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
DJ0016     MOVE WF-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR  OF DCLACTIAST          
DJ0016     MOVE WF-TRNFR-TYPE-CD   TO TRNFR-TYPE-CD      OF DCLACTIAST          
DJ0016     MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
DJ0016                             TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
DJ0016     MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
DJ0016     MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
DJ0016     MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
DJ0016     MOVE '00'               TO OPTN-CTGY-CD       OF DCLACTIAST          
DJ0016     MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
DJ0016     MOVE ZEROES             TO ASSET-QTY          OF DCLACTIAST          
DJ0016     MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
DJ0016     MOVE ZEROES             TO ASSET-AMT          OF DCLACTIAST          
DJ0016     MOVE W-PGM-NAME         TO PRGM-NM            OF DCLACTIAST          
DJ0016     MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
DJ0016     MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
DJ0016     MOVE 'H'                TO NSCC-PEND-CD       OF DCLACTIAST          
DJ0016                                                                          
DJ0016     MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
DJ0016     MOVE '90DR'             TO STTLM-RSN-CD       OF DCLACTIAST          
DJ0016     MOVE NAPPA-DATE-90DAY-ENDED TO W-NAPPA-DATE-90DAY                    
DJ0016     MOVE W-NAPPA-DATE-90DAY TO W-ASSET-CMNT-TXT                          
DJ0016     MOVE '90 DAY RESTRICTION'                                            
DJ0016                             TO ASSET-DESC-TXT     OF DCLACTIAST          
DJ0016     DISPLAY         '   90DR ' W-ASSET-CMNT-TXT(1:8)                     
DJ0016     .                                                                    
DJ0016 5732-EXIT. EXIT.                                                         
                                                                                
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
                                                                                
       5790-FORMAT-COMMON-FIELDS SECTION.                                       
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
DJ0009     MOVE ' '                TO TRANS-RFRN-ID-CD   OF DCLACTIAST          
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
                                                                                
           MOVE W-POS-DESC1  TO ASSET-DESC-TXT OF DCLACTIAST (1:30)             
           MOVE W-POS-DESC2  TO ASSET-DESC-TXT OF DCLACTIAST (31:30)            
           MOVE W-POS-DESC3  TO ASSET-DESC-TXT OF DCLACTIAST (61:30)            
           MOVE WK-POS-DESC4 TO ASSET-DESC-TXT OF DCLACTIAST (91:30)            
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
           MOVE 'H'                 TO NSCC-PEND-CD      OF DCLACTIAST          
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
                                                                                
           MOVE '35'               TO STTLM-LCTN-CD      OF DCLACTIOPN          
                                                                                
                                                                                
           MOVE ISIN-CNTRY-CD      OF DCLACTIAST                                
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
LRM024**** IF L-STREAM-IND = 'Q'                                                
LRM023       MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLACTIOPN         
LRM023                                 STPRC-INTEGER2-AMT OF DCLACTIOPN         
LRM023       MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT   OF DCLACTIOPN.        
LRM023**** ELSE                                                                 
      ****    MOVE WK-MS-OPT-PRC    TO STPRC-INTEGER-AMT OF DCLACTIOPN          
LRM023****                             STPRC-INTEGER2-AMT OF DCLACTIOPN         
LRM007****    IF MSD-FRACTION-DECIMAL-IND = 'D'                                 
LRM007****       MOVE WK-MS-OPT-DECI-ROUNDED                                    
LRM007****                           TO STPRC-FRCTN-AMT   OF DCLACTIOPN         
LRM007****    ELSE                                                              
      ****       MOVE WK-MS-OPT-FRAC-1 TO STPRC-FRCTN-AMT OF DCLACTIOPN         
LRM023****    END-IF                                                            
LRM007**** END-IF.                                                              
           MOVE ' '                 TO DLVR-OCC-NBR      OF DCLACTIOPN          
           MOVE 'C'                 TO OPTN-ACCT-TYPE-CD OF DCLACTIOPN          
           MOVE ' '                 TO ACCT-SUB-CD       OF DCLACTIOPN          
           MOVE WK-MS-DESC1         TO OPTN-CMNT-TXT     OF DCLACTIOPN          
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIOPN          
           MOVE 'H'                 TO NSCC-PEND-CD      OF DCLACTIOPN          
                                                                                
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
           MOVE MS-SYMBOL                      TO W-OPT-MS-SYMBOL               
LRM024**** IF L-STREAM-IND = 'Q'                                                
LRM023        MOVE WK-MS-SYMBOL              TO W-OPT-UNDLY-SYMBOL              
LRM023        MOVE WK-MS-EXP-MM-NEW          TO W-OPT-EXPTN-MM-NEW              
LRM023        MOVE '/'                       TO W-OPT-EXPTN-S1-NEW              
LRM023                                          W-OPT-EXPTN-S2-NEW              
LRM023        MOVE WK-MS-EXP-DD-NEW          TO W-OPT-EXPTN-DD-NEW              
LRM023        MOVE WK-MS-EXP-YY-NEW          TO W-OPT-EXPTN-YY-NEW              
LRM023        MOVE WK-MS-OPT-PRC-NEW         TO W-OPT-STRIKE-PRIC-NEW           
LRM023        IF WK-MS-OPT-FRAC-NEW = ZEROS                                     
LRM023           MOVE SPACES                 TO W-OPT-STRIKE-FRAC-NEW           
LRM023        ELSE                                                              
LRM023           MOVE WK-MS-OPT-FRAC-NEW     TO W-OPT-STRIKE-FRAC-NEW           
LRM023       END-IF                                                             
LRM023**** ELSE                                                                 
      ****    MOVE WK-MS-EXP-DATE(5:2)       TO W-OPT-EXPTN-MM                  
      ****    MOVE '/'                       TO W-OPT-EXPTN-S1                  
      ****    MOVE WK-MS-EXP-DATE(1:2)       TO W-OPT-EXPTN-CC                  
      ****    MOVE WK-MS-EXP-DATE(3:2)       TO W-OPT-EXPTN-YY                  
      ****    MOVE WK-MS-OPT-PRC             TO W-STPRC-INTEGER-AMT             
      ****    MOVE WK-MS-OPT-FRAC-1          TO W-STPRC-FRCTN-AMT               
      ****    MOVE W-STPRC-INTEGER-AMT       TO W-OPT-STRIKE-PRIC               
      ****    IF   W-STPRC-FRCTN = '00'                                         
LRM007****    AND  MSD-FRACTION-DECIMAL-IND NOT = 'D'                           
      ****          MOVE ' '            TO W-OPT-STRIKE-FRAC                    
      ****          MOVE ' '            TO W-OPT-SLASH-8                        
      ****    ELSE                                                              
LRM007****          IF MSD-FRACTION-DECIMAL-IND = 'D'                           
LRM007****             MOVE '0'            TO W-OPT-STRIKE-FRAC                 
LRM007****          ELSE                                                        
      ****             MOVE W-STPRC-FRCTN (2:1)                                 
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
             IF  W-EXP-OPT-ACT  > '0'                                           
               MOVE  'Y'       TO W-EXP-OPT-POSN                                
               DISPLAY ' EXP OPT FOR ' CUSHOL-KEY                               
               IF  W-EXP-OPT-ACT  = '2'                                         
                 MOVE 'W'        TO NSCC-WTHLD-CD     OF DCLACTIAST             
                 MOVE 'H'        TO NSCC-PEND-CD      OF DCLACTIAST             
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
DJ0008     MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
DJ0008                             TO ACAT-CONTROL-NBR   OF DCLACTIOPN          
DJ0008     MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
DJ0008                             TO ASSET-SEQ-NBR      OF DCLACTIOPN          
DJ0008     MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
DJ0008                             TO TRNFR-TYPE-CD      OF DCLACTIOPN.         
                                                                                
       5800-EXIT. EXIT.                                                         
      /                                                                         
       5910-MFMSD           SECTION.                                            
           MOVE '5910-MFMSD                    ' TO W-ROUTINE-1.                
                                                                                
DJ0021     MOVE 'N'          TO W-MFMSD-FND-SW                                  
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
                DISPLAY '   MFMSD-NOTFND'                                       
                          ' FOR ' MAIN-KEY                                      
                        ' ' W-ASSET-PRC-CTGY-CD                                 
                         '. NOT FUND SERV ELIGIBILE'                            
                GO  TO  5910-EXIT.                                              
                                                                                
           ADD 1 TO W-MFMSD-FND-CNT                                             
                                                                                
DJ0021     MOVE 'Y'          TO W-MFMSD-FND-SW                                  
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
                DISPLAY '   BNWREGOP-NOTFND FOR ' REG-OPT-KEY-AREA              
                GO TO 5920-EXIT.                                                
                                                                                
           ADD 1 TO W-BNWREGOP-FND-CNT                                          
           MOVE 'Y'         TO W-BNWREGOP-FND-SW                                
           DISPLAY '   BNWREGOP-FOUND  FOR ' REG-OPT-KEY-AREA                   
                     ' PROCESSING-CODE='                                        
                       PROCESSING-CODE OF BNWREGOP-RECORD                       
                     ' HOUSE-ACCOUNT=' REG-OP-HOUSE-ACCT                        
                                                                                
LRM002     IF  BH-MF-ACTIVE                                                     
LRM002             AND                                                          
LRM002         BH-MFN-OMNIBUS-MULTI-PLAT-OPT  =  '1'                            
LRM002             AND                                                          
LRM002         (OMNIBUS-PROCESSING OF BNWREGOP-RECORD                           
LRM004              OR DST-DIRECT  OF BNWREGOP-RECORD                           
LRM026              OR PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD)                
LRM002         MOVE 'R'                 TO NTWIO-FUNCTION-CODE                  
LRM002         MOVE CUSHOL-CLIENT-N     TO NTWIO-CLIENT                         
LRM002         MOVE CUSHOL-CPH-CUSIP    TO NTWIO-CUSIP-9                        
LRM002         IF MS-SYMBOL > SPACES                                            
LRM002            MOVE MS-SYMBOL        TO NTWIO-SYMBOL                         
LRM002         ELSE                                                             
LRM002            MOVE MS-CUSIP-NO      TO NTWIO-SYMBOL                         
LRM002         END-IF                                                           
DJ0013         MOVE W-CKDIGIT-ACCT-TC        TO NTWIO-ACCT-ID                   
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
LRM004        ADD 1 TO W-DST-MFE-CNT                                            
LRM004        SET NTW-DST-MFE-ACCT TO TRUE                                      
LRM004     END-IF.                                                              
LRM026     IF PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD                          
LRM026         ADD 1 TO W-PNC-SURPAS-CNT                                        
LRM026         SET NTW-PNC-SURPAS-ACCT TO TRUE                                  
LRM026     END-IF.                                                              
                                                                                
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
TEST*******DISPLAY 'ABOUT TO READ BNWMAST W/KEY ' W-BNWMAST-KEY                 
                                                                                
           READ BNWMAST.                                                        
                                                                                
           ADD 1 TO W-BNWMAST-CNT                                               
                                                                                
           IF  BNWMAST-OKAY                                                     
               MOVE 'Y'               TO W-BNWMAST-FND-SW                       
               ADD 1 TO W-BNWMAST-FND-CNT                                       
               DISPLAY         '   BNWMAST-FND'                                 
                               ' FOR ' MAST-KEY-AREA                            
                                   ' LEVEL=' MATRIX-LEVEL                       
           ELSE                                                                 
               IF BNWMAST-END-OF-FILE                                           
               OR BNWMAST-NOT-FOUND                                             
                  MOVE 'N'                 TO W-BNWMAST-FND-SW                  
                  DISPLAY         '   BNWMAST--NOTFND'                          
                              ' FOR ' MAST-KEY-AREA                             
               ELSE                                                             
                  DISPLAY ' ** CAT519 - BNWMAST FILE, READ ERROR'               
                          ' FILE-STATUS = ' BNWMAST-STATUS                      
                  DISPLAY 'MAST-KEY-AREA = ' MAST-KEY-AREA                      
                  MOVE +3999    TO ABEND-CODE                                   
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
LRM026     IF  PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                  
               CONTINUE                                                         
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
NS             IF (MATRIX-LEVEL = '1' OR '2' OR '3' OR '4')                     
DJ0013          IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                              
DJ0013            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0013                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0013            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
DJ0013          ELSE                                                            
DJ0013            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0013                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0013            MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
DJ0013          END-IF                                                          
               ELSE                                                             
                 IF MATRIX-LEVEL = '6'                                          
                    MOVE CUST-ACCT-NO       TO FNBR OF DCLACTIMF                
                 END-IF                                                         
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
           IF  FNBR OF DCLACTIMF = ' '                                          
DJ0013         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0013            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0013                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0013            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
DJ0013         ELSE                                                             
                  MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
                                            TO FNBR OF DCLACTIMF (1:3)          
                  MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
DJ0013         END-IF                                                           
           END-IF.                                                              
                                                                                
      ***FUND ACCOUNT NUMBER                                                    
      ***B1#434608 1 = BBBAAAAATC                                               
           IF  BH-ACAT-MF-REG-FUND-ACCT = '1'                                   
DJ0013         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0013            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (1:10)         
DJ0013         ELSE                                                             
                  MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (1:10)         
DJ0013         END-IF                                                           
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
      ***DVDND-CD      -  DEFAULT = 1 = R,R,R                                   
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
DJ0021***BRKR-EXCTG-NBR: DEFAULT=BH-ACAT-MF-REGIST-RECEIVE-BKR(434636)          
DJ0021***BH-MF-EXBR-OPTION = '1', USE MFEXBR FILE                               
DJ0021***PROCESSING CODE = 'O', USE B1 434636.                                  
DJ0021***ELSE,USE B1 540167.IF NOT ON B1 540167, USE B1 434636                  
DJ0021     MOVE 'N'                    TO W-MFEXBR-FND-SW                       
DJ0021     IF BH-MF-EXBR-OPTION = '1'                                           
DJ0021         PERFORM 5951-GET-MFEXBR THRU 5951-EXIT                           
DJ0021         IF W-MFEXBR-FND-SW = 'Y'                                         
DJ0021            MOVE EXBR-EXECUTING-BROKER                                    
DJ0021                                 TO BRKR-EXCTG-NBR OF DCLACTIMF           
DJ0021         END-IF                                                           
DJ0021     END-IF                                                               
DJ0021     IF W-MFEXBR-FND-SW = 'N'                                             
             MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                            
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             IF BH-ACAT-MF-REGIST-RECEIVE-BKR > '0000'                          
                MOVE BH-ACAT-MF-REGIST-RECEIVE-BKR                              
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             END-IF                                                             
LRM026       IF PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                 
                CONTINUE                                                        
             ELSE                                                               
               MOVE CUSHOL-BRANCH            TO WK-BR                           
               PERFORM 5950-GET-EXEC-BRKR    THRU 5950-EXIT                     
               IF  W-BH-MF3-SEBR-CLEAR-FOUND                                    
                   MOVE W-BH-MF3-SEBR-CLEAR                                     
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
DJ0021     END-IF.                                                              
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
LRM004       DISPLAY 'APPLY O-NSCC B1 537601 TO FNBR: '                         
LRM004                WS-DST-BOX-ACCT-TC                                        
DJ0013       MOVE CLIENT-NBR OF DCLACTIAST (2:3)                                
LRM004                               TO FNBR OF DCLACTIMF (1:3)                 
LRM004       MOVE WS-DST-BOX-ACCT-TC TO FNBR OF DCLACTIMF (4: )                 
LRM004       MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM004       MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM004     ELSE                                                                 
LRM026     IF NTW-PNC-SURPAS-ACCT                                               
LRM026        IF  W-BNWMAST-FOUND                                               
LRM026        AND MATRIX-LEVEL = '6'                                            
LRM026        AND (WS-PNC-SURPAS-BOX-TC NOT = SPACE AND LOW-VALUE)              
LRM026           DISPLAY 'APPLY O-NSCC B1 540238 TO FUND NBR: '                 
LRM026                WS-PNC-SURPAS-BOX-TC                                      
LRM026           MOVE CLIENT-NBR OF DCLACTIAST (2:3)                            
LRM026                                     TO FNBR OF DCLACTIMF (1:3)           
LRM026           MOVE WS-PNC-SURPAS-BOX-TC TO FNBR OF DCLACTIMF (4: )           
LRM026       END-IF                                                             
LRM026       MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM026       MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM026       IF TBL-TENDER                                                      
LRM026          MOVE 'C'    TO DVDND-CD OF DCLACTIMF                            
LRM026          MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                            
LRM026          MOVE 'C'    TO STCG-CD  OF DCLACTIMF                            
LRM026       ELSE                                                               
LRM026          MOVE 'R'    TO DVDND-CD OF DCLACTIMF                            
LRM026          MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                            
LRM026          MOVE 'R'    TO STCG-CD  OF DCLACTIMF                            
LRM026       END-IF                                                             
LRM026       MOVE  '2'            TO ACCT-TYPE-CD     OF DCLACTIMF              
LRM026       MOVE  '1'            TO DVDND-PAYEE-CD   OF DCLACTIMF              
LRM026       MOVE  '2'            TO MF-FULL-PRTL-CD  OF DCLACTIMF              
LRM026     ELSE                                                                 
           IF     NTW-NSCCSRC-ACCT                                              
             AND (NS-BRCH-ACCT-TC NOT = SPACE AND LOW-VALUE)                    
             DISPLAY 'APPLY O-NSCC B1 537596 TO FNBR: '                         
                      NS-BRCH-ACCT-TC                                           
DJ0013       MOVE CLIENT-NBR OF DCLACTIAST (2:3)                                
                                     TO FNBR OF DCLACTIMF (1:3)                 
             MOVE NS-BRCH-ACCT-TC    TO FNBR OF DCLACTIMF (4: )                 
             MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
             MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
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
LRM053       MOVE '1'               TO FND-AGNT-CD    OF DCLACTIMF              
LRM050     END-IF.                                                              
DJ0008     MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
DJ0008                             TO ACAT-CONTROL-NBR   OF DCLACTIMF           
DJ0008     MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
DJ0008                             TO ASSET-SEQ-NBR      OF DCLACTIMF           
DJ0008     MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
DJ0008                             TO TRNFR-TYPE-CD      OF DCLACTIMF           
DJ0008     MOVE ' '                TO FCST-ACCT-RCVR-NBR OF DCLACTIMF.          
                                                                                
       5940-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
DJ0021*****************************************************************         
DJ0021*  USE THE EXECUTING BROKER NUMBER(BH-MF3-SEBR-CLEAR) FROM                
DJ0021*  B1 540167 = MF3 SUB-EXECUTOR,BKR OF RECORD.                            
DJ0021*  SEARCH USING THE BRANCH NUMBER OF THE ACCOUNT.                         
DJ0021*****************************************************************         
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
DJ0021*****************************************************************         
DJ0021*  IF B1 537483(BH-MF-EXBR-OPTION)=1                                      
DJ0021*  GET THE EXECUTING BROKER NUMBER FROM THE MFEXBR FILE.                  
DJ0021*  USE THE FUND NUMBER FROM MFMSD TO READ THE MFEXBR FILE.                
DJ0021*****************************************************************         
DJ0021 5951-GET-MFEXBR.                                                         
DJ0021     MOVE '5951-GET-MFEXBR               ' TO W-ROUTINE-1.                
DJ0021                                                                          
DJ0021     IF W-MFMSD-FND-SW = 'Y'                                              
DJ0021        MOVE ' '                   TO MFEXBR-REC                          
DJ0021        MOVE WF-CLIENT-NBR (2:3)   TO EXBR-CLIENT                         
DJ0021        MOVE WF-BRANCH-CD          TO EXBR-BRANCH                         
DJ0021        MOVE FUND-NO OF MFMSD-REC  TO EXBR-FUND-NO                        
DJ0021        ADD 1 TO W-MFEXBR-CNT                                             
DJ0021        READ MFEXBR                                                       
DJ0021        IF MFEXBR-STATUS = '00'                                           
DJ0021           ADD 1 TO W-MFEXBR-FND-CNT                                      
DJ0021           MOVE 'Y'                TO W-MFEXBR-FND-SW                     
DJ0021           DISPLAY '   MFEXBR FND: ' EXBR-CLIENT                          
DJ0021                          ' BRANCH ' EXBR-BRANCH                          
DJ0021                         ' FUND-NO ' EXBR-FUND-NO                         
DJ0021              ' EXECUTING-BROKER = ' EXBR-EXECUTING-BROKER                
DJ0021        END-IF                                                            
DJ0021     END-IF.                                                              
DJ0021                                                                          
DJ0021 5951-EXIT.                                                               
DJ0021     EXIT.                                                                
      /                                                                         
      *****************************************************************         
      *  FOR NEW ASSETS FROM OTHER BROKERS,                                     
      *  ADD THE NEW ROW TO THE ACTIVE-TABLE                                    
      *****************************************************************         
       6000-INSERT-ACTIAST SECTION.                                             
           MOVE '6000-INSERT-ACTIAST           ' TO W-ROUTINE-1.                
                                                                                
DJ0020****CHECK TO SEE IF THERE ARE MEMO('45') ASSETS                           
DJ0020     IF STTLM-LCTN-CD OF DCLACTIAST = '45'                                
DJ0020        ADD 1 TO W-IS-MEMO-CNT                                            
DJ0020     ELSE                                                                 
DJ0020        ADD 1 TO W-NOT-MEMO-CNT                                           
DJ0020     END-IF                                                               
                                                                                
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
CSG001     PERFORM 6025-EDIT-ASSET-DESC-TXT  THRU 6025-EXIT                     
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLACTIAST                
CSG001                                                                          
LRM005     MOVE W-ASSET-CMNT-TXT TO ASSET-CMNT-TXT OF DCLACTIAST                
                                                                                
LRM056     IF  STTLM-LCTN-CD OF DCLACTIAST = '35' OR '40' OR '45'               
               CONTINUE                                                         
           ELSE                                                                 
               IF  ISIN-SEC-ISSUE-CD OF DCLACTIAST > ' '                        
               AND CUSHOL-CPH-CUSIP (10:3)       = '090'                        
LRM032         AND (BH-ACAT-WH-ASSET-CONTRA-CUSIP = '1' OR '3')                 
                   MOVE 'W'          TO NSCC-WTHLD-CD OF DCLACTIAST             
LRM056             MOVE 'C'          TO WHI-STTS-CD   OF DCLACTIAST             
                   DISPLAY '   WITHHELD-CUSIP:'                                 
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                            ' CUS=' CUSHOL-CPH-CUSIP                            
                            ' SEC=' CUSHOL-SECURITY-NO (1:7)                    
               END-IF                                                           
           END-IF                                                               
                                                                                
DJ0019     EVALUATE BH-ACAT-ASCENDIS-USER                                       
DJ0019        WHEN '1'   MOVE 'A'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0019        WHEN '2'   MOVE 'P'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0019        WHEN OTHER MOVE ' '  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0019     END-EVALUATE                                                         
                                                                                
LRM030     IF FOREIGN-FEE-ELIGIBLE                                              
LRM030        MOVE 'Y' TO FOREIGN-FEE-IND OF DCLACTIAST                         
LRM030        ADD 1 TO W-FRGN-ASSET-CNT                                         
LRM030     END-IF.                                                              
                                                                                
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
LRM030            ,FOREIGN_FEE_IND                                              
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
LRM030            ,:DCLACTIAST.FOREIGN-FEE-IND                                  
LRM043            ,:DCLACTIAST.CRNCY-CD                                         
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-ADD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
               MOVE 'Y' TO W-ACTIAST-INSERT-SW                                  
               MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                       
                                                                                
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-ADD-CNT                                   
                   DISPLAY '   ACTIAST NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
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
               IF  SQLCODE  =  -803                                             
                   PERFORM 6300-UPDATE-ACTIAST THRU 6300-EXIT                   
                   MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                   
                   MOVE 'Y' TO W-ACTIAST-INSERT-SW                              
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT519: ERROR INSERTING A ROW INTO ACTIAST'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT519: DCLACTIAST  ='                              
                        '(' DCLACTIAST ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
LRM028******************************************************************        
LRM028*  CREATE AUDIT ROW WITH CLIENT NUMBER W### TO DRIVE X SCREEN             
LRM028*  UPDATE IN CAT755.                                                      
LRM028*****************************************************************         
LRM028 6020-INSERT-ACTIAST-AUD  SECTION.                                        
LRM028     MOVE '6020-INSERT-ACTIAST-AUD       ' TO W-ROUTINE-1.                
LRM028                                                                          
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLACTIAST   TO W-ASSET-DESC-TXT              
CSG001     PERFORM 6025-EDIT-ASSET-DESC-TXT    THRU 6025-EXIT                   
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLACTIAST                
CSG001                                                                          
LRM034     IF W-MATURE-CALLED-BOND-SW  = 'Y'                                    
LRM028        MOVE  'W'                        TO W-CLIENT-NBR-AUD-PFX          
LRM034     ELSE                                                                 
LRM034        MOVE  'L'                        TO W-CLIENT-NBR-AUD-PFX          
LRM034     END-IF.                                                              
LRM028     MOVE  CLIENT-NBR OF DCLACTIAST (2:3) TO W-CLIENT-NBR-AUD-SFX.        
LRM028                                                                          
LRM028     EXEC SQL                                                             
LRM028         INSERT INTO ACTIAST                                              
LRM028           (                                                              
LRM028             CLIENT_NBR                                                   
LRM028            ,ACAT_CONTROL_NBR                                             
LRM028            ,ASSET_SEQ_NBR                                                
LRM028            ,RCRD_STTS_CD                                                 
LRM028            ,RCRD_LNGTH_STTS_CD                                           
LRM028            ,PHSCL_SEQ_STTS_CD                                            
LRM028            ,LGCL_SEQ_NR_STS_CD                                           
LRM028            ,TRANS_TYPE_STTS_CD                                           
LRM028            ,TRNFR_TYPE_STTS_CD                                           
LRM028            ,CONTROL_NBR_STS_CD                                           
LRM028            ,SBMT_PRT_NR_STS_CD                                           
LRM028            ,RCV_NBR_STTS_CD                                              
LRM028            ,DLVR_NBR_STTS_CD                                             
LRM028            ,TRANS_RFRN_STTS_CD                                           
LRM028            ,AST_SEQ_NBR_STS_CD                                           
LRM028            ,AST_PRC_CTG_STS_CD                                           
LRM028            ,OPTN_CTGY_STTS_CD                                            
LRM028            ,STTLM_LCTN_STTS_CD                                           
LRM028            ,STTLM_RSN_STTS_CD                                            
LRM028            ,ISIN_CNTRY_STTS_CD                                           
LRM028            ,ISIN_SEC_IS_STS_CD                                           
LRM028            ,ISIN_SEC_CD_STS_CD                                           
LRM028            ,ASSET_DESC_STTS_CD                                           
LRM028            ,ASSET_RQST_STS_CD                                            
LRM028            ,AST_RQ_TRAN_STS_CD                                           
LRM028            ,ASSET_QTY_STTS_CD                                            
LRM028            ,ASSET_PCT_STTS_CD                                            
LRM028            ,PSTN_CD_STTS_CD                                              
LRM028            ,ISO_CRNCY_STTS_CD                                            
LRM028            ,ASSET_AMT_STTS_CD                                            
LRM028            ,BEARER_BND_STTS_CD                                           
LRM028            ,CSH_MRG_SHT_STS_CD                                           
LRM028            ,WHI_STTS_CD                                                  
LRM028            ,TRN_TYP_RSN_STS_CD                                           
LRM028            ,MBS_SERIAL_STTS_CD                                           
LRM028            ,ASSET_CMNT_STTS_CD                                           
LRM028            ,PHSCL_SEQ_NBR                                                
LRM028            ,LGCL_SEQ_NBR                                                 
LRM028            ,TRANS_TYPE_CD                                                
LRM028            ,TRNFR_TYPE_CD                                                
LRM028            ,SBMTG_PRTCP_NBR                                              
LRM028            ,RCV_NBR                                                      
LRM028            ,DLVR_NBR                                                     
LRM028            ,TRANS_RFRN_ID_CD                                             
LRM028            ,ASSET_PRC_CTGY_CD                                            
LRM028            ,OPTN_CTGY_CD                                                 
LRM028            ,STTLM_LCTN_CD                                                
LRM028            ,STTLM_RSN_CD                                                 
LRM028            ,ISIN_CNTRY_CD                                                
LRM028            ,ISIN_SEC_ISSUE_CD                                            
LRM028            ,ISIN_SEC_CDG_CD                                              
LRM028            ,ASSET_DESC_TXT                                               
LRM028            ,ASSET_RQST_QTY_CD                                            
LRM028            ,AST_RQST_TRANS_CD                                            
LRM028            ,ASSET_QTY                                                    
LRM028            ,ASSET_PCT                                                    
LRM028            ,PSTN_CD                                                      
LRM028            ,ISO_CRNCY_CD                                                 
LRM028            ,ASSET_AMT                                                    
LRM028            ,BEARER_BOND_CD                                               
LRM028            ,CSH_MGN_SHRT_CD                                              
LRM028            ,WHI_CD                                                       
LRM028            ,TRNFR_TYPE_RSN_CD                                            
LRM028            ,MBS_SERIAL_NBR                                               
LRM028            ,ASSET_CMNT_TXT                                               
LRM028            ,PRGM_NM                                                      
LRM028            ,CICS_TERM_ID_CD                                              
LRM028            ,CRT_TMSTP                                                    
LRM028            ,UPDT_TMSTP                                                   
LRM028            ,ACCT_DLVR_NBR                                                
LRM028            ,ACCT_RCV_NBR                                                 
LRM028            ,SECURITY_ADP_NBR                                             
LRM028            ,NSCC_ACK_IND                                                 
LRM028            ,NSCC_PEND_CD                                                 
LRM028            ,NSCC_WTHLD_CD                                                
LRM030            ,FOREIGN_FEE_IND                                              
LRM028           )                                                              
LRM028           VALUES                                                         
LRM028           (                                                              
LRM028             :W-CLIENT-NBR-AUD                                            
LRM028            ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
LRM028            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
LRM028            ,:DCLACTIAST.RCRD-STTS-CD                                     
LRM028            ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
LRM028            ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
LRM028            ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
LRM028            ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
LRM028            ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
LRM028            ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
LRM028            ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
LRM028            ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
LRM028            ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
LRM028            ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
LRM028            ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
LRM028            ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
LRM028            ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
LRM028            ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
LRM028            ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
LRM028            ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
LRM028            ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
LRM028            ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
LRM028            ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
LRM028            ,:DCLACTIAST.ASSET-RQST-STS-CD                                
LRM028            ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
LRM028            ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
LRM028            ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
LRM028            ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
LRM028            ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
LRM028            ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
LRM028            ,:DCLACTIAST.BEARER-BND-STTS-CD                               
LRM028            ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
LRM028            ,:DCLACTIAST.WHI-STTS-CD                                      
LRM028            ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
LRM028            ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
LRM028            ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
LRM028            ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
LRM028            ,:DCLACTIAST.LGCL-SEQ-NBR                                     
LRM028            ,:DCLACTIAST.TRANS-TYPE-CD                                    
LRM028            ,:DCLACTIAST.TRNFR-TYPE-CD                                    
LRM028            ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
LRM028            ,:DCLACTIAST.RCV-NBR                                          
LRM028            ,:DCLACTIAST.DLVR-NBR                                         
LRM028            ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
LRM028            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
LRM028            ,:DCLACTIAST.OPTN-CTGY-CD                                     
LRM028            ,:DCLACTIAST.STTLM-LCTN-CD                                    
LRM028            ,:DCLACTIAST.STTLM-RSN-CD                                     
LRM028            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
LRM028            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
LRM028            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
LRM028            ,:DCLACTIAST.ASSET-DESC-TXT                                   
LRM028            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
LRM028            ,:DCLACTIAST.AST-RQST-TRANS-CD                                
LRM028            ,:DCLACTIAST.ASSET-QTY                                        
LRM028            ,:DCLACTIAST.ASSET-PCT                                        
LRM028            ,:DCLACTIAST.PSTN-CD                                          
LRM028            ,:DCLACTIAST.ISO-CRNCY-CD                                     
LRM028            ,:DCLACTIAST.ASSET-AMT                                        
LRM028            ,:DCLACTIAST.BEARER-BOND-CD                                   
LRM028            ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
LRM028            ,:DCLACTIAST.WHI-CD                                           
LRM028            ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
LRM028            ,:DCLACTIAST.MBS-SERIAL-NBR                                   
LRM028            ,:DCLACTIAST.ASSET-CMNT-TXT                                   
LRM028            ,:DCLACTIAST.PRGM-NM                                          
LRM028            ,:DCLACTIAST.CICS-TERM-ID-CD                                  
LRM028            ,:DCLACTIAST.CRT-TMSTP                                        
LRM028            ,:DCLACTIAST.UPDT-TMSTP                                       
LRM028            ,:DCLACTIAST.ACCT-DLVR-NBR                                    
LRM028            ,:DCLACTIAST.ACCT-RCV-NBR                                     
LRM028            ,:DCLACTIAST.SECURITY-ADP-NBR                                 
LRM028            ,:DCLACTIAST.NSCC-ACK-IND                                     
LRM028            ,:DCLACTIAST.NSCC-PEND-CD                                     
LRM028            ,:DCLACTIAST.NSCC-WTHLD-CD                                    
LRM030            ,:DCLACTIAST.FOREIGN-FEE-IND                                  
LRM028           )                                                              
LRM028     END-EXEC.                                                            
LRM028                                                                          
LRM028     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
LRM028     IF  SQLCODE  =  +0                                                   
LRM034         IF W-MATURE-CALLED-BOND-SW  = 'Y'                                
LRM028            ADD 1 TO W-BOND-AUDIT-ADD                                     
LRM034         ELSE                                                             
LRM034            ADD 1 TO W-LVL4-AUDIT-ADD                                     
LRM034         END-IF                                                           
LRM028     ELSE                                                                 
LRM034             IF W-MATURE-CALLED-BOND-SW  = 'Y'                            
LRM028                ADD 1 TO W-BOND-AUDIT-NOTADD                              
LRM034             ELSE                                                         
LRM034                ADD 1 TO W-LVL4-AUDIT-NOTADD                              
LRM034             END-IF                                                       
LRM028             DISPLAY '   ACTIAST AUDIT NOT ADDED.'                        
LRM028                       ' SQLCODE = ' W-DB2-SQLCODE                        
LRM028             DISPLAY '   ACTIAST PRIMARY KEY:'                            
LRM028                      ' CLT=' W-CLIENT-NBR-AUD                            
LRM028                       ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
LRM028                      ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
LRM028                       ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
LRM028                       ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
LRM028                      ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
LRM028             DISPLAY '           '                                        
LRM028                      ' DLV=' DLVR-NBR          OF DCLACTIAST             
LRM028                   ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
LRM028                      ' RCV=' RCV-NBR           OF DCLACTIAST             
LRM028                   ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
LRM028     END-IF.                                                              
LRM028                                                                          
LRM028 6020-EXIT. EXIT.                                                         
      /                                                                         
CSG001 6025-EDIT-ASSET-DESC-TXT SECTION.                                        
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
CSG001 6025-EXIT. EXIT.                                                         
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
LRM023            ,STPRC_INTEGER2_AMT                                           
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
DJ0008            ,ACAT_CONTROL_NBR                                             
DJ0008            ,ASSET_SEQ_NBR                                                
DJ0008            ,TRNFR_TYPE_CD                                                
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
LRM023            ,:DCLACTIOPN.STPRC-INTEGER2-AMT                               
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
DJ0008            ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
DJ0008            ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
DJ0008            ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIOPN'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIOPN-ADD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIOPN-NOT-ADD-CNT                                   
                   DISPLAY '   ACTIOPN NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
                   DISPLAY '   ACTIOPN PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                            ' EXP DT=' EXPTN-DT       OF DCLACTIOPN             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
               IF  SQLCODE  =  -803                                             
                   PERFORM 6400-UPDATE-ACTIOPN THRU 6400-EXIT                   
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT519: ERROR INSERTING A ROW INTO ACTIOPN'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT519: DCLACTIOPN  ='                              
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
DJ0008            ,ACAT_CONTROL_NBR                                             
DJ0008            ,ASSET_SEQ_NBR                                                
DJ0008            ,TRNFR_TYPE_CD                                                
DJ0008            ,FCST_ACCT_RCVR_NBR                                           
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
DJ0008            ,:DCLACTIMF.ACAT-CONTROL-NBR                                  
DJ0008            ,:DCLACTIMF.ASSET-SEQ-NBR                                     
DJ0008            ,:DCLACTIMF.TRNFR-TYPE-CD                                     
DJ0008            ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIMF '                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIMF-ADD-CNT                                        
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIMF-NOT-ADD-CNT                                    
                   DISPLAY '   ACTIMF  NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
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
               IF  SQLCODE  =  -803                                             
                   PERFORM 6500-UPDATE-ACTIMF   THRU 6500-EXIT                  
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT519: ERROR INSERTING A ROW INTO ACTIMF'          
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT519: DCLACTIMF  ='                               
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
LRM030            ,FOREIGN_FEE_IND     = :DCLACTIAST.FOREIGN-FEE-IND            
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
                  AND  TRNFR_TYPE_CD     = 'FUL'                                
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIAST  '              TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-UPD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-UPD-CNT                                   
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
LRM023            ,STPRC_INTEGER2_AMT  = :DCLACTIOPN.STPRC-INTEGER2-AMT         
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
DJ0008            ,ACAT_CONTROL_NBR    = :DCLACTIOPN.ACAT-CONTROL-NBR           
DJ0008            ,ASSET_SEQ_NBR       = :DCLACTIOPN.ASSET-SEQ-NBR              
DJ0008            ,TRNFR_TYPE_CD       = :DCLACTIOPN.TRNFR-TYPE-CD              
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
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
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
DJ0008            ,ACAT_CONTROL_NBR    = :DCLACTIMF.ACAT-CONTROL-NBR            
DJ0008            ,ASSET_SEQ_NBR       = :DCLACTIMF.ASSET-SEQ-NBR               
DJ0008            ,TRNFR_TYPE_CD       = :DCLACTIMF.TRNFR-TYPE-CD               
DJ0008            ,FCST_ACCT_RCVR_NBR  = :DCLACTIMF.FCST-ACCT-RCVR-NBR          
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
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIMF-NOT-UPD-CNT                                    
           END-IF.                                                              
                                                                                
       6500-EXIT. EXIT.                                                         
      /                                                                         
       6700-SELECT-VTRNFR         SECTION.                                      
           MOVE '6700-SELECT-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO W-TRANSFER-FND-SW                         
           INITIALIZE DCLVTRNFR                                                 
                                                                                
           EXEC SQL SELECT                                                      
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
                   ,ALERT_IND                                                   
DJ0014             ,ACCT_FRZN_IND                                               
LRM012             ,CVRSN_ACCT_NBR                                              
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
                   ,:DCLVTRNFR.ALERT-IND                                        
DJ0014             ,:DCLVTRNFR.ACCT-FRZN-IND                                    
LRM012             ,:DCLVTRNFR.CVRSN-ACCT-NBR                                   
               FROM  VTRNFR                                                     
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
           END-EXEC                                                             
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y'                TO W-TRANSFER-FND-SW                     
           ELSE                                                                 
               DISPLAY '   VTRNFR   NOTFND:'                                    
                                 ' CLT=' WF-CLIENT-NBR                          
                                 ' CTL=' WF-ACAT-CONTROL-NBR                    
           END-IF.                                                              
                                                                                
       6700-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  SET FLAGS IN VTRNFR                                                    
      *  UPDATE VTRNFR                                                          
      *****************************************************************         
       6800-UPDATE-VTRNFR          SECTION.                                     
           MOVE '6800-UPDATE-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM            OF DCLVTRNFR          
           MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVTRNFR          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVTRNFR          
                                                                                
           IF  W-REJ-MARGIN-DEBIT = 'Y'                                         
               DISPLAY '   W-REJ-MARGIN-DEBIT'                                  
               MOVE 'Y'             TO ACCT-MRGN-DB-IND   OF DCLVTRNFR          
           ELSE                                                                 
               MOVE 'N'             TO ACCT-MRGN-DB-IND   OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-ASSET-VALUE  = 'Y'                                         
           OR  W-REJ-TOTL-ACT-VAL = 'Y'                                         
               DISPLAY '   W-REJ-ASSET-VALUE'                                   
               MOVE 'Y'             TO ACCT-AST-EXCS-IND  OF DCLVTRNFR          
           ELSE                                                                 
               MOVE 'N'             TO ACCT-AST-EXCS-IND  OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-LP           = 'Y'                                         
               DISPLAY '   W-REJ-LP'                                            
               IF BH-ACAT-REJ-PEND-DEL-LP-CODE > '00'                           
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
               MOVE 'Y'             TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR          
           ELSE                                                                 
               MOVE 'N'             TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-PRIV         = 'Y'                                         
               DISPLAY '   W-REJ-PRIV'                                          
               MOVE 'Y'             TO ACCT-PRVT-RNG-IND  OF DCLVTRNFR          
               IF BH-ACAT-REJ-PEND-DEL-PRIV-CODE > '00'                         
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-NTS          = 'Y'                                         
               DISPLAY '   W-REJ-NTS'                                           
               IF  BH-ACAT-REJ-PEND-DEL-NTS-CODE > '00'                         
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
               MOVE 'Y'             TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR          
           ELSE                                                                 
               MOVE 'N'             TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-FLAT         = 'Y'                                         
               DISPLAY '   W-REJ-FLAT'                                          
DJ0007         IF  W-PTR-TRANSFER-SW = 'Y'                                      
DJ0007             IF BH-ACAT-REJ-PEND-PTR-DEL-FL-CD > '00'                     
DJ0007                MOVE 'Y' TO W-REJECT-AUTO-SW                              
DJ0007             END-IF                                                       
DJ0007         ELSE                                                             
DJ0011             IF  BH-ACAT-REJ-PEND-DEL-FLAT-IND = '1'                      
DJ0011             AND BH-ACAT-REJ-PEND-DEL-FLAT-CODE > '00'                    
                       MOVE 'Y' TO W-REJECT-AUTO-SW                             
                   END-IF                                                       
DJ0007         END-IF                                                           
               MOVE 'F'     TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
           ELSE                                                                 
               MOVE ' '     TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
           END-IF                                                               
                                                                                
LRM005     IF  W-VRSDBLK-SEC-FND-SW = 'Y'                                       
LRM005         MOVE 'F'     TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
LRM005         MOVE 'Y'     TO ACCT-RB-SEC-IND    OF DCLVTRNFR                  
LRM005     END-IF                                                               
           IF  W-REJ-SPAD         = 'Y'                                         
               DISPLAY '   W-REJ-SPAD'                                          
                  ' REJ-CODE = ' W-REJ-SPAD-CODE                                
               IF W-REJ-SPAD-CODE  > '00'                                       
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  W-BAL-FND-SW = 'Y'                                               
               MOVE W-BAL-TOTL-LIQDATNG-EQUITY                                  
                                       TO ACCT-EQUITY-AMT OF DCLVTRNFR          
           ELSE                                                                 
               MOVE ZEROES             TO ACCT-EQUITY-AMT OF DCLVTRNFR          
           END-IF                                                               
                                                                                
           IF  W-EXP-OPT-POSN = 'Y'                                             
               MOVE 'X'          TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR             
           END-IF                                                               
                                                                                
LRM005     IF  W-VRSDBLK-SEC-FND-SW = 'Y'                                       
LRM005         MOVE 'Y'          TO ACCT-RB-SEC-IND    OF DCLVTRNFR             
LRM005     ELSE                                                                 
LRM005         MOVE 'N'          TO ACCT-RB-SEC-IND    OF DCLVTRNFR             
LRM005     END-IF                                                               
                                                                                
DJ0019     IF  W-MEMO-ONLY-SW = 'Y'                                             
DJ0019         MOVE 'N'             TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR          
DJ0019     END-IF                                                               
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
                  ,ACCT_OPTN_PSTN_IND  = :DCLVTRNFR.ACCT-OPTN-PSTN-IND          
                  ,ACCT_SEC_RSTRD_IND  = :DCLVTRNFR.ACCT-SEC-RSTRD-IND          
                  ,ACCT_EQUITY_AMT     = :DCLVTRNFR.ACCT-EQUITY-AMT             
                  ,TRNFR_TYPE_RJC2_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC2-CD          
LRM005            ,ACCT_RB_SEC_IND     = :DCLVTRNFR.ACCT-RB-SEC-IND             
LRM033            ,PEND_DVDND_DB_AMT   = :DCLVTRNFR.PEND-DVDND-DB-AMT           
LRM034            ,NTWRK_LVL4_FND_IND  = :DCLVTRNFR.NTWRK-LVL4-FND-IND          
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
               DISPLAY '   VTRNFR NOT UPDATED.'                                 
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               DISPLAY '   VTRNFR PRIMARY KEY:'                                 
                         ' CLT=' WF-CLIENT-NBR                                  
                         ' CTL=' WF-ACAT-CONTROL-NBR                            
                        ' EQTY=' ACCT-EQUITY-AMT OF DCLVTRNFR                   
               IF  L-RERUN                                                      
               AND SQLCODE  =  +100                                             
                   DISPLAY '   BYPASSING VTRNFR UPDATE NOT FOUND.'              
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT519: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT519: DCLVTRNFR  ='                               
                           '(' DCLVTRNFR ')'                                    
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
           MOVE ' '                                                             
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
                                                                                
           MOVE ' '                TO CMNT-TXT           OF DCLACTITRF          
           MOVE CICS-TERM-ID-CD    OF DCLVTRNFR                                 
                                   TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE CRT-TMSTP          OF DCLVTRNFR                                 
                                   TO CRT-TMSTP          OF DCLACTITRF          
           MOVE DB-CR-CD           OF DCLVTRNFR                                 
                                   TO DB-CR-CD           OF DCLACTITRF          
           MOVE NSCC-ACK-IND       OF DCLVTRNFR                                 
                                   TO NSCC-ACK-IND       OF DCLACTITRF          
                                                                                
           MOVE ' '                TO NSCC-PEND-CD       OF DCLACTITRF          
                                                                                
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
               IF  BH-ACAT-REJ-PEND-DEL-LP-CODE > '00'                          
                   MOVE BH-ACAT-REJ-PEND-DEL-LP-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-PRIV         = 'Y'                                         
               IF  BH-ACAT-REJ-PEND-DEL-PRIV-CODE > '00'                        
                   MOVE BH-ACAT-REJ-PEND-DEL-PRIV-CODE                          
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-NTS          = 'Y'                                         
               IF  BH-ACAT-REJ-PEND-DEL-NTS-CODE > '00'                         
                   MOVE BH-ACAT-REJ-PEND-DEL-NTS-CODE                           
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-FLAT         = 'Y'                                         
DJ0007         IF  W-PTR-TRANSFER-SW = 'Y'                                      
DJ0007          IF BH-ACAT-REJ-PEND-PTR-DEL-FL-CD > '00'                        
DJ0007             MOVE BH-ACAT-REJ-PEND-PTR-DEL-FL-CD                          
DJ0007                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0007          END-IF                                                          
DJ0007         ELSE                                                             
                IF BH-ACAT-REJ-PEND-DEL-FLAT-CODE > '00'                        
                   MOVE BH-ACAT-REJ-PEND-DEL-FLAT-CODE                          
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                END-IF                                                          
DJ0007         END-IF                                                           
DJ0019         IF  W-MEMO-ONLY-SW = 'Y'                                         
DJ0019             DISPLAY '   REJECT: MEMO ONLY - RESTRICTED ASSET.'           
DJ0019                     ' FLAT'                                              
DJ0019             MOVE 'MEMO ONLY - RESTRICTED ASSET'                          
DJ0019                                       TO CMNT-TXT OF DCLACTITRF          
DJ0019         END-IF                                                           
           END-IF                                                               
                                                                                
           IF  W-REJ-SPAD         = 'Y'                                         
               IF  W-REJ-SPAD-CODE > '00'                                       
                   MOVE W-REJ-SPAD-CODE                                         
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
                                                                                
LRM049     IF (W-REJ-ACCT-FRZN    = 'Y' OR 'O')                                 
DJ0014     AND TRNFR-TYPE-RJCT-CD OF DCLACTITRF = ' '                           
DJ0014         MOVE '03'           TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0014         DISPLAY '   REJECT: ACCOUNT IS FROZEN (HOLD)'                    
DJ0014         MOVE 'ACCOUNT IS FROZEN'      TO CMNT-TXT OF DCLACTITRF          
DJ0014         MOVE 'H'            TO NSCC-PEND-CD       OF DCLACTITRF          
DJ0014     END-IF                                                               
                                                                                
           MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF          
                                                                                
LRM027     IF CVRSN-ACCT-NBR OF DCLVTRNFR (1 : 4) = 'CONV'                      
LRM027        DISPLAY 'BYPASS NACT DUE TO CONVERSION '                          
LRM027             ACAT-CONTROL-NBR   OF DCLVTRNFR                              
LRM027        GO TO 6900-EXIT                                                   
LRM027     END-IF.                                                              
                                                                                
LRM033     MOVE W-BAL-PEND-DVND    TO PEND-DVDND-DB-AMT   OF DCLACTITRF         
ET0006**<  CREATE A CHANGE RECORD FOR THE INTERNALLY TRANSFERED ACCT >          
ET0006     IF WS-INTERNALY-TRANSFERED-IND = 'Y'                                 
LRM012     OR (W-CURRENT-CLIENT = '0313' AND CVRSN-ACCT-NBR > SPACES)           
ET0006        MOVE SPACES          TO  W-CHANGED-DLVR-NBR                       
ET0006        MOVE INTNL-TO-BR     TO  W-CHANGED-BRANCH                         
ET0006        MOVE INTNL-TO-ACCT   TO  W-CHANGED-ACCT                           
LRM012        IF (W-CURRENT-CLIENT = '0313' AND CVRSN-ACCT-NBR > SPACES)        
LRM012           DISPLAY 'CL 313 CONV CHANGE BEING CREATED FROM '               
LRM012           CVRSN-ACCT-NBR ' TO ' ACCT-DLVR-NBR      OF DCLACTITRF         
LRM012        ELSE                                                              
DJ0018           MOVE '1'         TO ACCT-DLVR-STTS-CD   OF DCLACTITRF          
ET0006           MOVE W-CHANGED-DLVR-NBR                                        
ET0006                             TO ACCT-DLVR-NBR      OF DCLACTITRF          
LRM012        END-IF                                                            
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
DJ0018        MOVE PRCS-DT            OF DCLVTRNFR                              
ET0006                             TO PRCS-DT            OF DCLACTITRF          
ET0006        MOVE 'CAT519'                                                     
ET0006                             TO PRGM-NM            OF DCLACTITRF          
ET0006        DISPLAY '   * ACCOUNT FOUND IN INTERNAL ACCT TRNFR FILE'          
ET0006        DISPLAY '   * ACCT ' ACCT-DLVR-NBR OF DCLVTRNFR (1:8)             
ET0006                ' WAS INTERNALLY TRANSFERED TO ACCT# '                    
ET0006                                W-CHANGED-DLVR-NBR (1:8)                  
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
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-ADD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
ET0006       IF WS-INTERNALY-TRANSFERED-IND = 'Y'                               
ET0006         DISPLAY '   ACTITRF ADDED FOR CHANGE RECORD.'                    
ET0006         ' TRANS-TYPE-CD=' TRANS-TYPE-CD OF DCLACTITRF                    
ET0006       ELSE                                                               
               DISPLAY '   ACTITRF ADDED.'                                      
              ' TRANS-TYPE-CD=' TRANS-TYPE-CD OF DCLACTITRF                     
              ' TRNFR-TYPE-RJCT-CD=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF           
ET0006       END-IF                                                             
           ELSE                                                                 
                   DISPLAY '   ACTITRF NOT ADDED.'                              
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
               IF  SQLCODE  =  -803                                             
ET0006           IF WS-INTERNALY-TRANSFERED-IND = 'Y'                           
ET0006             PERFORM 6911-UPD-ACTITRF-INTRNL-TRNF THRU 6911-EXIT          
ET0006           ELSE                                                           
                   PERFORM 6910-UPDATE-ACTITRF     THRU 6910-EXIT               
ET0006           END-IF                                                         
               ELSE                                                             
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' WF-CLIENT-NBR                             
                              ' TFR=' WF-TRNFR-TYPE-CD                          
                   DISPLAY '    DLV=' WF-DLVR-NBR                               
                           ' DLV-AC=' WF-ACCT-DLVR-NBR                          
                              ' RCV=' WF-RCV-NBR                                
                           ' RCV-AC=' WF-ACCT-RCV-NBR                           
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT519: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT519: DCLACTITRF  ='                              
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
                                                                                
           DISPLAY '   ACTITRF FOUND'                                           
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
                                                                                
           IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF > '00'                          
               GO TO 6910-EXIT                                                  
           END-IF                                                               
                                                                                
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
           MOVE 'R'                 TO TRANS-TYPE-CD   OF DCLACTITRF            
           MOVE ' '                 TO CICS-TERM-ID-CD OF DCLACTITRF            
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP      OF DCLACTITRF            
           MOVE W-PGM-NAME          TO PRGM-NM         OF DCLACTITRF            
           MOVE ' '                 TO NSCC-PEND-CD    OF DCLACTITRF            
                                                                                
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
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-UPD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
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
                   DISPLAY 'CAT519: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT519: DCLACTITRF  ='                              
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
ET0006            ,PRGM_NM             = 'CAT519'                               
DJ0018            ,ACCT_DLVR_STTS_CD   = '1'                                    
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
ET0006             DISPLAY 'CAT519: ERROR UPDATING A ROW IN ACTITRF'            
ET0006                   ' (ACAT-TRNFR      TABLE)'                             
ET0006             DISPLAY 'CAT519: DCLACTITRF  ='                              
ET0006                     '(' DCLACTITRF ')'                                   
ET0006             PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
ET0006     END-IF.                                                              
ET0006                                                                          
ET0006 6911-EXIT.  EXIT.                                                        
ET0006/                                                                         
       6920-SELECT-ACTITRF SECTION.                                             
           MOVE '6920-SELECT-ACTITRF          ' TO W-ROUTINE-1.                 
                                                                                
           MOVE ' ' TO DCLACTITRF                                               
                                                                                
           EXEC SQL SELECT                                                      
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
               INTO                                                             
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
                                                                                
               FROM  ACTITRF                                                    
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD                    
           END-EXEC                                                             
                                                                                
LRM012***** REMOVE THE ACCT_DLVR_NBR QUALIFICATION AS CAN CHANGE                
LRM012************AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
LRM012               OR -811                                                    
               MOVE 'Y' TO W-ACTITRF-FND-SW                                     
           ELSE                                                                 
               MOVE ' ' TO W-ACTITRF-FND-SW                                     
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT519: ERROR SELECTING A ROW IN ACTITRF'           
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT519: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6920-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR INIT-TABLE ASSETS THAT WAS MOVED TO ACTIVE TABLE,                  
      *  DELETE THE ROW FROM THE INIT-TABLE                                     
      *****************************************************************         
       6930-DELETE-INIT           SECTION.                                      
           MOVE '6930-DELETE-INIT              ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL OPEN ACTIAST_CURSOR END-EXEC                                
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-AST-SQLCODE                                   
                                                                                
           IF  SQLCODE = +0                                                     
               CONTINUE                                                         
      *****    DISPLAY 'INP=' W-INFILE-CNT                                      
      *****           ' ACTIAST CURSOR OPENED FOR'                              
      *****         ' ' W-NSCC-KEY-CLIENT-NBR                                   
      *****         ' ' W-NSCC-ACAT-CTL-NBR                                     
      *****           ' SQLCODE = ' W-DB2-SQLCODE                               
           ELSE                                                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' ACTIAST CURSOR OPEN ERROR FOR'                          
                    ' ' W-NSCC-KEY-CLIENT-NBR                                   
                    ' ' W-NSCC-ACAT-CTL-NBR                                     
                      ' SQLCODE = ' W-DB2-SQLCODE                               
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
                                                                                
              EXEC SQL                                                          
                   FETCH ACTIAST_CURSOR                                         
               INTO                                                             
                   :DCLACTIAST.CLIENT-NBR                                       
                  ,:DCLACTIAST.DLVR-NBR                                         
                  ,:DCLACTIAST.ACCT-DLVR-NBR                                    
                  ,:DCLACTIAST.RCV-NBR                                          
                  ,:DCLACTIAST.ACCT-RCV-NBR                                     
                  ,:DCLACTIAST.ISIN-CNTRY-CD                                    
                  ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIAST.STTLM-LCTN-CD                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIAST.ASSET-SEQ-NBR                                    
                  ,:DCLACTIAST.TRANS-TYPE-CD                                    
                  ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
                  ,:DCLACTIAST.ASSET-DESC-TXT                                   
                  ,:DCLACTIAST.ASSET-QTY                                        
                  ,:DCLACTIAST.ASSET-AMT                                        
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-AST-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 6931-DELETE-ACTIAST THRU 6931-EXIT               
                  WHEN +100                                                     
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' ACTIAST CURSOR FETCH NOT FOUND '                
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                  WHEN OTHER                                                    
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' ACTIAST CURSOR FETCH ERROR '                    
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE ACTIAST_CURSOR                                            
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-AST-SQLCODE                                   
           IF  SQLCODE = +0                                                     
               CONTINUE                                                         
      *****    DISPLAY 'INP=' W-INFILE-CNT                                      
      *****           ' ACTIAST CURSOR CLOSED FOR'                              
      *****         ' ' W-NSCC-KEY-CLIENT-NBR                                   
      *****         ' ' W-NSCC-ACAT-CTL-NBR                                     
      *****           ' SQLCODE = ' W-DB2-SQLCODE                               
           ELSE                                                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' ACTIAST CURSOR CLOSE ERROR FOR'                         
                    ' ' W-NSCC-KEY-CLIENT-NBR                                   
                    ' ' W-NSCC-ACAT-CTL-NBR                                     
                      ' SQLCODE = ' W-DB2-SQLCODE                               
           END-IF.                                                              
                                                                                
       6930-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  DELETE ONE ROW AT TIME BASED ON FETCH                                  
      *****************************************************************         
       6931-DELETE-ACTIAST SECTION.                                             
                                                                                
           EXEC SQL                                                             
                DELETE FROM ACTIAST                                             
                WHERE  CURRENT OF ACTIAST_CURSOR                                
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
           MOVE 'DELETE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)               TO W-SQLERRD-3                         
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-DEL-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
               DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST DELETED'                   
                          ' ' CLIENT-NBR        OF DCLACTIAST                   
                          ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
                          ' ' ACCT-DLVR-NBR     OF DCLACTIAST(1:8)              
                          ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
                          ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
                          ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
                          ' ' STTLM-RSN-CD      OF DCLACTIAST                   
                          ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
                          ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:20)             
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-DEL-CNT                                   
               DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST NOT DEL'                   
                          ' ' CLIENT-NBR        OF DCLACTIAST                   
                          ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
                          ' ' ACCT-DLVR-NBR     OF DCLACTIAST(1:8)              
                          ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
                          ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
                          ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
                          ' ' STTLM-RSN-CD      OF DCLACTIAST                   
                          ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
                          ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:20)             
                      ' SQL=' W-DB2-SQLCODE                                     
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT519: ERROR DELETING A ROW FROM ACTIAST'          
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   DISPLAY 'CAT519: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT519: DCLACTIAST='                                
                           '(' DCLACTIAST ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6931-EXIT. EXIT.                                                         
DJ0007/                                                                         
DJ0007*****************************************************************         
DJ0007*  FOR INIT-TABLE ASSETS THAT WERE REJECTED FOR NON-FUL TRANSFERS         
DJ0007*  DELETE THE ROW FROM THE INIT-TABLE                                     
DJ0007*****************************************************************         
DJ0007 6940-DELETE-NON-FUL        SECTION.                                      
DJ0007     MOVE '6940-DELETE-NON-FUL           ' TO W-ROUTINE-1.                
DJ0007                                                                          
DJ0007     EXEC SQL OPEN ACTIAST_CURSOR2 END-EXEC                               
DJ0007                                                                          
DJ0007     MOVE SQLCODE      TO W-DB2-SQLCODE                                   
DJ0007     MOVE SQLCODE      TO W-AST-SQLCODE                                   
DJ0007                                                                          
DJ0007     IF  SQLCODE = +0                                                     
DJ0007         CONTINUE                                                         
DJ0007*****    DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0007*****           ' ACTIAST CURSOR2 OPENED FOR'                             
DJ0007*****         ' ' W-NSCC-KEY-CLIENT-NBR                                   
DJ0007*****         ' ' W-NSCC-ACAT-CTL-NBR                                     
DJ0007*****           ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0007     ELSE                                                                 
DJ0007         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0007                ' ACTIAST CURSOR2 OPEN ERROR FOR'                         
DJ0007              ' ' W-NSCC-KEY-CLIENT-NBR                                   
DJ0007              ' ' W-NSCC-ACAT-CTL-NBR                                     
DJ0007                ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0007     END-IF                                                               
DJ0007                                                                          
DJ0007     PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
DJ0007                                                                          
DJ0007        EXEC SQL                                                          
DJ0007             FETCH ACTIAST_CURSOR2                                        
DJ0007         INTO                                                             
DJ0007             :DCLACTIAST.CLIENT-NBR                                       
DJ0007            ,:DCLACTIAST.DLVR-NBR                                         
DJ0007            ,:DCLACTIAST.ACCT-DLVR-NBR                                    
DJ0007            ,:DCLACTIAST.RCV-NBR                                          
DJ0007            ,:DCLACTIAST.ACCT-RCV-NBR                                     
DJ0007            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
DJ0007            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
DJ0007            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
DJ0007            ,:DCLACTIAST.STTLM-LCTN-CD                                    
DJ0007            ,:DCLACTIAST.STTLM-RSN-CD                                     
DJ0007            ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
DJ0007            ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
DJ0007            ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
DJ0007            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
DJ0007            ,:DCLACTIAST.TRANS-TYPE-CD                                    
DJ0007            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
DJ0007            ,:DCLACTIAST.ASSET-DESC-TXT                                   
DJ0007            ,:DCLACTIAST.ASSET-QTY                                        
DJ0007            ,:DCLACTIAST.ASSET-AMT                                        
DJ0007        END-EXEC                                                          
DJ0007                                                                          
DJ0007        MOVE SQLCODE      TO W-DB2-SQLCODE                                
DJ0007        MOVE SQLCODE      TO W-AST-SQLCODE                                
DJ0007        EVALUATE SQLCODE                                                  
DJ0007            WHEN +0                                                       
DJ0007                 PERFORM 6941-DELETE-ACTIAST THRU 6941-EXIT               
DJ0007            WHEN +100                                                     
DJ0007                 DISPLAY 'INP=' W-INFILE-CNT                              
DJ0007                        ' ACTIAST CURSOR2 FETCH NOT FOUND '               
DJ0007                        ' SQLCODE = ' W-DB2-SQLCODE                       
DJ0007            WHEN OTHER                                                    
DJ0007                 DISPLAY 'INP=' W-INFILE-CNT                              
DJ0007                        ' ACTIAST CURSOR2 FETCH ERROR '                   
DJ0007                        ' SQLCODE = ' W-DB2-SQLCODE                       
DJ0007                 PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
DJ0007        END-EVALUATE                                                      
DJ0007                                                                          
DJ0007     END-PERFORM                                                          
DJ0007                                                                          
DJ0007     EXEC SQL                                                             
DJ0007          CLOSE ACTIAST_CURSOR2                                           
DJ0007     END-EXEC                                                             
DJ0007                                                                          
DJ0007     MOVE SQLCODE      TO W-DB2-SQLCODE                                   
DJ0007     MOVE SQLCODE      TO W-AST-SQLCODE                                   
DJ0007     IF  SQLCODE = +0                                                     
DJ0007         CONTINUE                                                         
DJ0007*****    DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0007*****           ' ACTIAST CURSOR2 CLOSED FOR'                             
DJ0007*****         ' ' W-NSCC-KEY-CLIENT-NBR                                   
DJ0007*****         ' ' W-NSCC-ACAT-CTL-NBR                                     
DJ0007*****           ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0007     ELSE                                                                 
DJ0007         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0007                ' ACTIAST CURSOR2 CLOSE ERROR FOR'                        
DJ0007              ' ' W-NSCC-KEY-CLIENT-NBR                                   
DJ0007              ' ' W-NSCC-ACAT-CTL-NBR                                     
DJ0007                ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007 6940-EXIT. EXIT.                                                         
DJ0007/                                                                         
DJ0007*****************************************************************         
DJ0007*  DELETE ONE ROW AT TIME BASED ON FETCH                                  
DJ0007*****************************************************************         
DJ0007 6941-DELETE-ACTIAST SECTION.                                             
DJ0007                                                                          
DJ0007     EXEC SQL                                                             
DJ0007          DELETE FROM ACTIAST                                             
DJ0007          WHERE  CURRENT OF ACTIAST_CURSOR2                               
DJ0007     END-EXEC.                                                            
DJ0007                                                                          
DJ0007     MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
DJ0007     MOVE 'DELETE'                 TO W-DB2-ACTION                        
DJ0007     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0007     MOVE SQLERRD(3)               TO W-SQLERRD-3                         
DJ0007                                                                          
DJ0007     ADD 1 TO W-SQL-CNT                                                   
DJ0007     IF  SQLCODE  =  +0                                                   
DJ0007         ADD 1 TO W-ACTIAST-DEL-CNT                                       
DJ0007         PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
DJ0007         DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST DELETED'                   
DJ0007                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0007                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0007                    ' ' ACCT-DLVR-NBR     OF DCLACTIAST(1:8)              
DJ0007                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0007                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0007                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0007                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0007                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0007                    ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:20)             
DJ0007     ELSE                                                                 
DJ0007         ADD 1 TO W-ACTIAST-NOT-DEL-CNT                                   
DJ0007         DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST NOT DEL'                   
DJ0007                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0007                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0007                    ' ' ACCT-DLVR-NBR     OF DCLACTIAST(1:8)              
DJ0007                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0007                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0007                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0007                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0007                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0007                    ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:20)             
DJ0007                ' SQL=' W-DB2-SQLCODE                                     
DJ0007         IF  SQLCODE  =  +100                                             
DJ0007             CONTINUE                                                     
DJ0007         ELSE                                                             
DJ0007             DISPLAY ' '                                                  
DJ0007             DISPLAY 'CAT519: ERROR DELETING A ROW FROM ACTIAST'          
DJ0007                   ' (ACAT-INIT-ASSET TABLE)'                             
DJ0007             DISPLAY 'CAT519: INPUT  REC ='                               
DJ0007                  '(' W-NSCC-RECORD ')'                                   
DJ0007             DISPLAY 'CAT519: DCLACTIAST='                                
DJ0007                     '(' DCLACTIAST ')'                                   
DJ0007             PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
DJ0007             PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
DJ0007         END-IF                                                           
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007 6941-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 7100-WRITE-ACATDLVF-TYPE3 SECTION.                                       
DJ0010     MOVE '7100-WRITE-ACATDLVF-TYPE3         ' TO W-ROUTINE-1.            
DJ0010     MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
DJ0010     MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
DJ0010     MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
DJ0010     MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
DJ0010     MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
DJ0010     MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
DJ0010     MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
DJ0010     MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
DJ0010     MOVE 'B'                      TO ACATDLVF-RECORD-TYPE                
DJ0010     MOVE W-BAL-TYPE1              TO ACATDLVF-TYPE1-BALANCE              
DJ0010     MOVE W-BAL-TYPE2              TO ACATDLVF-TYPE2-BALANCE              
DJ0010     MOVE W-BAL-TYPE3              TO ACATDLVF-TYPE3-BALANCE              
DJ0010     MOVE W-BAL-TYPE5              TO ACATDLVF-TYPE5-BALANCE              
DJ0010     MOVE W-BAL-SMA                TO ACATDLVF-SMA-BALANCE                
LRM033     MOVE W-BAL-PEND-DVND          TO ACATDLVF-PEND-DVDND-DB-AMT          
DJ0010     MOVE ZERO                     TO ACATDLVF-DAYS-STTS-QTY.             
DJ0010     MOVE NSCC-PEND-CD OF DCLACTIAST TO ACATDLVF-BAL-NSCC-PEND-CD         
DJ0010     MOVE STTS-CD OF DCLVTRNFR     TO ACATDLVF-STTS-CD.                   
DJ0010                                                                          
DJ0010     WRITE ACATDLVF-RECORD.                                               
DJ0010     ADD 1 TO W-ACATDLVF-CNT.                                             
DJ0010 7100-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 7200-WRITE-ACATDLVF-FRAC SECTION.                                        
DJ0010     MOVE '7200-WRITE-ACATDLVF-FRAC        ' TO W-ROUTINE-1.              
DJ0010                                                                          
DJ0010     MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
DJ0010     MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
DJ0010     MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
DJ0010     MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
DJ0010     MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
DJ0010     MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
DJ0010     MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
DJ0010     MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
LRM030     IF ACATDLVF-FRGN-FEE-REC                                             
LRM030        MOVE 'F'                   TO ACATDLVF-RECORD-TYPE                
LRM030     ELSE                                                                 
DJ0010        MOVE 'A'                   TO ACATDLVF-RECORD-TYPE                
LRM030     END-IF.                                                              
DJ0010                                                                          
DJ0010     IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '3')                               
DJ0010         MOVE 'C'                  TO ACATDLVF-CASH-MGN-IND               
DJ0010     ELSE                                                                 
DJ0010       IF  (CUSHOL-ACCOUNT-TYPE = '2')                                    
DJ0010           MOVE 'M'                TO ACATDLVF-CASH-MGN-IND               
DJ0010       ELSE                                                               
DJ0010*******IF**(CUSHOL-ACCOUNT-TYPE = '5')                                    
DJ0010           MOVE 'S'                TO ACATDLVF-CASH-MGN-IND               
DJ0010       END-IF                                                             
DJ0010     END-IF                                                               
DJ0010                                                                          
DJ0010     IF  WORK-POS-QTY < 0                                                 
DJ0010         MOVE 'S'                  TO ACATDLVF-PSTN-CD                    
DJ0010     ELSE                                                                 
DJ0010         MOVE 'L'                  TO ACATDLVF-PSTN-CD                    
DJ0010     END-IF                                                               
DJ0010                                                                          
DJ0010     MOVE WK-MS-SEC                TO ACATDLVF-ADP-SECURITY               
DJ0010     MOVE WK-MS-CUSIP              TO ACATDLVF-CUSIP-NUM                  
DJ0010     MOVE W-ASSET-QTY-UNSIGN       TO ACATDLVF-QTY                        
DJ0010     MOVE WORK-POS-VALUE           TO ACATDLVF-MARKET-VALUE               
DJ0010     MOVE WORK-POS-QTY-DECIMAL     TO ACATDLVF-FRAC-QTY                   
DJ0010                                                                          
DJ0010     COMPUTE ACATDLVF-FRAC-MARKET-VALUE ROUNDED =                         
DJ0010                       WORK-POS-QTY-DECIMAL * WK-MS-CLOSING-PRICE         
DJ0010     IF  WK-MS-BOND                                                       
DJ0010             AND ACATDLVF-FRAC-MARKET-VALUE NOT = 0                       
DJ0010         COMPUTE ACATDLVF-FRAC-MARKET-VALUE =                             
DJ0010                 ACATDLVF-FRAC-MARKET-VALUE / 100                         
DJ0010     END-IF                                                               
DJ0010                                                                          
DJ0010     MOVE STTLM-LCTN-CD OF DCLACTIAST TO ACATDLVF-SETTLING-LOC            
DJ0010     MOVE STTLM-RSN-CD  OF DCLACTIAST                                     
DJ0010                                      TO ACATDLVF-SETTLING-REASON         
DJ0010     MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST                                 
DJ0010                                      TO ACATDLVF-ASSET-CATEGORY          
DJ0010     MOVE CUSHOL-CPH-SEC-DESC(1)                                          
DJ0010                                      TO ACATDLVF-ASSET-DESC              
DJ0010     MOVE NSCC-PEND-CD OF DCLACTIAST TO ACATDLVF-NSCC-PEND-CD.            
DJ0010                                                                          
DJ0010     WRITE ACATDLVF-RECORD.                                               
DJ0010     ADD 1 TO W-ACATDLVF-CNT.                                             
DJ0010                                                                          
DJ0010 7200-EXIT. EXIT.                                                         
      /                                                                         
LRM018 7300-WRITE-ACATDLVF-MMF SECTION.                                         
LRM018     MOVE '7300-WRITE-ACATDLVF-MMF         ' TO W-ROUTINE-1.              
LRM018                                                                          
LRM018     MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
LRM018     MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
LRM018     MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
LRM018     MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
LRM018     MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
LRM018     MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
LRM018     MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
LRM018     MOVE 'FUL'                    TO ACATDLVF-TRNFR-TYPE-CD              
LRM018     MOVE 'M'                      TO ACATDLVF-RECORD-TYPE                
LRM018     MOVE 'C'                      TO ACATDLVF-CASH-MGN-IND               
LRM018                                                                          
LRM018     IF  CUSHOL-CPH-TD-QTY < 0                                            
LRM018         MOVE 'S'                  TO ACATDLVF-PSTN-CD                    
LRM018     ELSE                                                                 
LRM018         MOVE 'L'                  TO ACATDLVF-PSTN-CD                    
LRM018     END-IF                                                               
LRM018                                                                          
LRM018     MOVE WK-MS-SEC                TO ACATDLVF-ADP-SECURITY               
LRM018     MOVE WK-MS-CUSIP              TO ACATDLVF-CUSIP-NUM                  
LRM030     MOVE WK-MS-CUSIP-10-12        TO ACATDLVF-CUSIP-10-12                
LRM030     MOVE WK-MSD-ISIN              TO ACATDLVF-MSD-ISIN.                  
LRM018     MOVE CUSHOL-CPH-TD-QTY        TO ACATDLVF-QTY                        
LRM052     MOVE CUSHOL-CPH-MKT-VAL       TO ACATDLVF-MARKET-VALUE               
LRM018     MOVE WORK-POS-QTY-DECIMAL     TO ACATDLVF-FRAC-QTY                   
LRM018     MOVE ZERO                     TO ACATDLVF-FRAC-MARKET-VALUE          
LRM018                                                                          
LRM018     MOVE SPACES                   TO ACATDLVF-SETTLING-LOC               
LRM018                                      ACATDLVF-SETTLING-REASON            
LRM018                                      ACATDLVF-ASSET-CATEGORY             
LRM018     MOVE 'MUTUAL FUND DLVR AS CASH'                                      
LRM018                                   TO ACATDLVF-ASSET-DESC                 
LRM018     MOVE ' '                      TO ACATDLVF-NSCC-PEND-CD.              
LRM030     MOVE WK-MSD-ISIN              TO ACATDLVF-MSD-ISIN.                  
LRM018                                                                          
LRM018     WRITE ACATDLVF-RECORD.                                               
LRM018     ADD 1 TO W-ACATDLVF-CNT.                                             
LRM018                                                                          
LRM018 7300-EXIT. EXIT.                                                         
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
       7400-WRITE-ASCENDIS-WHLD SECTION.                                        
DJ0018     MOVE '7400-WRITE-ASCENDIS-WHLD        ' TO W-ROUTINE-1.              
DJ0018                                                                          
DJ0018     MOVE SPACES                   TO CATWHLD-RECORD                      
DJ0018     MOVE WF-CLIENT-NBR            TO CATWHLD-CLIENT-NBR                  
DJ0018     MOVE WF-ACAT-CONTROL-NBR      TO CATWHLD-ACAT-CONTROL-NBR            
DJ0018     MOVE WF-BRANCH-ACCT           TO CATWHLD-BRN-ACCT                    
DJ0018     MOVE CUSHOL-FRGN-CURR-CODE    TO CATWHLD-CURR-CODE                   
DJ0018     MOVE CUSHOL-ACCOUNT-TYPE      TO CATWHLD-TYPE                        
DJ0018     MOVE CUSHOL-SECURITY-NO       TO CATWHLD-ASSET-ADP-NBR               
DJ0018     IF  CUSHOL-WI                                                        
DJ0018         MOVE 'W'                  TO CATWHLD-WI-CODE                     
DJ0018     ELSE                                                                 
DJ0018         MOVE 'N'                  TO CATWHLD-WI-CODE                     
DJ0018     END-IF                                                               
DJ0018     MOVE W-ASCENDIS-WHLD-REASON   TO CATWHLD-ASSET-WHLD-RSN-CD           
DJ0018     WRITE CATWHLD-RECORD.                                                
DJ0018     ADD 1 TO W-CATWHLD-CNT.                                              
DJ0018                                                                          
DJ0018 7400-EXIT. EXIT.                                                         
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
           MOVE '8100-SQL-COMMIT               ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT519: '                                               
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
                                ' STA=' WF-STTS-CD                              
                                ' DAY=' W-NSCC-DAYS-IN-STATUS                   
                                ' ACT=' W-NSCC-SYSTEM-ACTION                    
                                ' REJ=' W-NSCC-SYSTEM-REJ-RSN                   
                                ' SUB=' W-NSCC-TI-SUB-PART-NBR                  
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
           CALL DSNTIAR         USING SQLCA W-DB2-MESSAGE-AREA                  
                                            W-DB2-MESSAGE-LEN.                  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                             
                                                                                
           DISPLAY 'CAT519: U3999 - ABENDING ON BAD DB2 STATUS'                 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT519: PROGRAM ENDED ABNORMALLY'                           
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
           DISPLAY 'CAT519: INFILE  COUNT      = ' W-INFILE-CNT                 
                 ' (INCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT519: DETAIL  COUNT      = ' W-DETAIL-CNT                 
                 ' (EXCLUDES HEADER AND TRAILER)'                               
ET0002     DISPLAY 'CAT519: MMF FILE READ CNT  = ' W-MMF-CNT                    
ET0002           ' (INCLUDES HEADER)'                                           
DJ0010     DISPLAY 'CAT519: ACATDLVF COUNT     = ' W-ACATDLVF-CNT               
DJ0010           ' (EXCLUDES HEADER AND TRAILER)'                               
DJ0018     DISPLAY 'CAT519: CATWHLD  COUNT     = ' W-CATWHLD-CNT                
DJ0018           ' (EXCLUDES HEADER AND TRAILER)'                               
LRM042     DISPLAY 'CAT519: CATEXCP  COUNT     = ' W-CATEXCP-CNT                
LRM042           ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT519: W-TI-CNT           = ' W-TI-CNT                     
           DISPLAY 'CAT519: FUL-TFR-DLVR-CNT   = ' W-LOAD-CNT                   
           DISPLAY 'CAT519: BAL-READ-CNT       = ' W-BAL-CNT                    
           DISPLAY 'CAT519: POS-READ-CNT       = ' W-POS-CNT                    
           DISPLAY 'CAT519: POSIT-OUTPUT-CNT   = ' W-POSIT-CNT                  
           DISPLAY 'CAT519: W-WHEN-ISSUE-CNT   = ' W-WHEN-ISSUE-CNT             
           DISPLAY 'CAT519: W-RESTRICTED-CNT   = ' W-RESTRICTED-CNT             
DJ0018     DISPLAY 'CAT519: W-ASCENDIS-WHLD-CNT= ' W-ASCENDIS-WHLD-CNT          
           DISPLAY 'CAT519: W-MRGIMM-CNT       = ' W-MRGIMM-CNT                 
           DISPLAY 'CAT519: W-MRGIMM-FND-CNT   = ' W-MRGIMM-FND-CNT             
                          ' W-MRGIMM-NOTFND-CNT= ' W-MRGIMM-NOTFND-CNT          
DJ0018     DISPLAY 'CAT519: ACTRBSC-FND-CNT    = ' W-ACTRBSC-FND-CNT            
DJ0018                    ' ACTRBSC-NOTFND     = ' W-ACTRBSC-NOTFND-CNT         
           DISPLAY 'CAT519: VRSTSEC-FND-CNT    = ' W-VRSTSEC-FND-CNT            
                          ' VRSTSEC-NOTFND-CNT = ' W-VRSTSEC-NOTFND-CNT         
LRM005     DISPLAY 'CAT519: VRSDBLK-SEC-FND-CNT= ' W-VRSDBLK-SEC-FND-CNT        
           DISPLAY 'CAT519: W-PRNGFL-CNT       = ' W-PRNGFL-CNT                 
                          ' W-PRNGFL-FND-CNT   = ' W-PRNGFL-FND-CNT             
LRM033     DISPLAY 'CAT519: W-DVNDFL-CNT       = ' W-DVNDFL-CNT                 
LRM033                    ' W-DVNDFL-FND-CNT   = ' W-DVNDFL-FND-CNT             
LRM028     DISPLAY 'CAT519: W-MATURE-FND-CNT   = ' W-MATURE-FND-CNT             
LRM028     DISPLAY 'CAT519: W-VBNDDT-FND-CNT   = ' W-VBNDDT-FND-CNT             
LRM028                    ' W-VBNDDT-NOTFND-CNT= ' W-VBNDDT-NOTFND-CNT          
LRM029     DISPLAY 'CAT519: W-VBNDFTRV-FND-CNT = ' W-VBNDFTRV-FND-CNT           
LRM029                    ' W-VBNDFTRV-NOTFND  = ' W-VBNDFTRV-NOTFND            
LRM028     DISPLAY 'CAT519: W-BOND-AUDIT-ADD   = ' W-BOND-AUDIT-ADD             
LRM028     DISPLAY 'CAT519: W-BOND-AUDIT-NOTADD= ' W-BOND-AUDIT-NOTADD          
LRM034     DISPLAY 'CAT519: W-LVL4-AUDIT-ADD   = ' W-LVL4-AUDIT-ADD             
LRM034     DISPLAY 'CAT519: W-LVL4-AUDIT-NOTADD= ' W-LVL4-AUDIT-NOTADD          
           DISPLAY 'CAT519: BNWMAST-READ-CNT   = ' W-BNWMAST-CNT                
                          ' BNWMAST-FND-CNT    = ' W-BNWMAST-FND-CNT            
           DISPLAY 'CAT519: BNWREGOP-READ-CNT  = ' W-BNWREGOP-CNT               
                          ' BNWREGOP-FND-CNT   = ' W-BNWREGOP-FND-CNT           
           DISPLAY 'CAT519: W-MFMSD-CNT        = ' W-MFMSD-CNT                  
                          ' W-MFMSD-FND-CNT    = ' W-MFMSD-FND-CNT              
DJ0021     DISPLAY 'CAT519: W-MFEXBR-CNT       = ' W-MFEXBR-CNT                 
DJ0021                    ' W-MFEXBR-FND-CNT   = ' W-MFEXBR-FND-CNT             
           DISPLAY 'CAT519: W-LEGG-CNT         = ' W-LEGG-CNT                   
           DISPLAY 'CAT519: W-OMNIBUS-CNT      = ' W-OMNIBUS-CNT                
LRM004     DISPLAY 'CAT519: W-DST-MFE-CNT      = ' W-DST-MFE-CNT                
LRM026     DISPLAY 'CAT519: W-PNC-SURPAS-CNT   = ' W-PNC-SURPAS-CNT             
           DISPLAY 'CAT519: W-CKDIGIT-CNT      = ' W-CKDIGIT-CNT                
ET0002     DISPLAY 'CAT519: W-GETNA-FND-CNT    = ' W-GETNA-FND-CNT              
ET0002     DISPLAY 'CAT519: W-GETNA-NOT-FND    = ' W-GETNA-NOTFND-CNT           
LRM030     DISPLAY 'CAT519: W-FRGN-ASSET-CNT   = ' W-FRGN-ASSET-CNT             
           DISPLAY 'CAT519: SQL-CNT            = ' W-SQL-CNT                    
           DISPLAY 'CAT519: W-COMMIT-CNT       = ' W-COMMIT-CNT                 
           DISPLAY 'CAT519: ACTIAST-ADD-CNT    = '   W-ACTIAST-ADD-CNT          
                          ' ACTIAST-NOT-ADD-CNT = '                             
                                                  W-ACTIAST-NOT-ADD-CNT         
           DISPLAY 'CAT519: ACTIAST-UPD-CNT    = '   W-ACTIAST-UPD-CNT          
                          ' ACTIAST-NOT-UPD-CNT = '                             
                                                  W-ACTIAST-NOT-UPD-CNT         
           DISPLAY 'CAT519: ACTIAST-DEL-CNT    = '   W-ACTIAST-DEL-CNT          
                          ' ACTIAST-NOT-DEL-CNT = '                             
                                                  W-ACTIAST-NOT-DEL-CNT         
           DISPLAY 'CAT519: ACTIOPN-ADD-CNT    = '   W-ACTIOPN-ADD-CNT          
                          ' ACTIOPN-NOT-ADD-CNT = '                             
                                                  W-ACTIOPN-NOT-ADD-CNT         
           DISPLAY 'CAT519: ACTIOPN-UPD-CNT    = '   W-ACTIOPN-UPD-CNT          
                          ' ACTIOPN-NOT-UPD-CNT = '                             
                                                  W-ACTIOPN-NOT-UPD-CNT         
           DISPLAY 'CAT519: ACTIMF-ADD-CNT     = '    W-ACTIMF-ADD-CNT          
                          ' ACTIMF-NOT-ADD-CNT  = '                             
                                                   W-ACTIMF-NOT-ADD-CNT         
           DISPLAY 'CAT519: ACTIMF-UPD-CNT     = '    W-ACTIMF-UPD-CNT          
                          ' ACTIMF-NOT-UPD-CNT  = '                             
                                                   W-ACTIMF-NOT-UPD-CNT         
           DISPLAY 'CAT519: ACTITRF-ADD-CNT    = ' W-ACTITRF-ADD-CNT            
                          ' ACTITRF-NOT-ADD-CNT = '                             
                                                 W-ACTITRF-NOT-ADD-CNT          
           DISPLAY 'CAT519: ACTITRF-UPD-CNT    = ' W-ACTITRF-UPD-CNT            
                          ' ACTITRF-NOT-UPD-CNT = '                             
                                                 W-ACTITRF-NOT-UPD-CNT          
           DISPLAY 'CAT519: VTRNFR-UPD-CNT     = ' W-VTRNFR-UPD-CNT             
                          ' VTRNFR-NOT-UPD-CNT   = '                            
                                                 W-VTRNFR-NOT-UPD-CNT           
DJ0018     DISPLAY 'CAT810: ACTRBSC-FND-CNT    = ' W-ACTRBSC-FND-CNT            
DJ0018                    ' ACTRBSC-NOTFND       = '                            
DJ0018                                           W-ACTRBSC-NOTFND-CNT           
           .                                                                    
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
                                                                                
DJ0010     DISPLAY ' '.                                                         
DJ0010     MOVE ' '                      TO ACATDLVF-TRAILER-RECORD             
DJ0010     MOVE 'T'                      TO CP2-REQUEST-CODE.                   
DJ0010     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
DJ0010     MOVE W-ACATDLVF-CNT           TO CP2-RECORD-COUNT.                   
DJ0010     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
DJ0010     CALL P2HDTR                USING CP2-AREA                            
DJ0010                                      ACATDLVF.                           
DJ0010     MOVE CP2-RETURN-RECORD        TO ACATDLVF-TRAILER-RECORD             
DJ0010     MOVE LD-PROC-DATE             TO ACATDLVF-TRL-PROC-DATE              
DJ0010     MOVE 'CYCLE='                 TO ACATDLVF-TRL-CYCLE-LIT              
DJ0010     MOVE W-SAVE-CYCLE-NBR         TO ACATDLVF-TRL-CYCLE-NO               
DJ0010     DISPLAY 'CAT519: ACATDLVF-TRL= ' ACATDLVF-TRAILER-RECORD             
DJ0010     WRITE ACATDLVF-RECORD.                                               
DJ0010     DISPLAY 'CAT519: ACATDLVF  TRAILER WRITTEN. STATUS = '               
DJ0010                                         ACATDLVF-FILE-STATUS.            
                                                                                
DJ0018     DISPLAY ' '.                                                         
DJ0018     MOVE ' '                      TO CATWHLD-TRAILER-RECORD              
DJ0018     MOVE 'T'                      TO CP2-REQUEST-CODE.                   
DJ0018     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
DJ0018     MOVE W-CATWHLD-CNT            TO CP2-RECORD-COUNT.                   
DJ0018     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
DJ0018     CALL P2HDTR                USING CP2-AREA                            
DJ0018                                      CATWHLD.                            
DJ0018     MOVE CP2-RETURN-RECORD        TO CATWHLD-TRAILER-RECORD              
DJ0018     MOVE LD-PROC-DATE             TO CATWHLD-TRL-PROC-DATE               
DJ0018     MOVE 'CYCLE='                 TO CATWHLD-TRL-CYCLE-LIT               
DJ0018     MOVE W-SAVE-CYCLE-NBR         TO CATWHLD-TRL-CYCLE-NO                
DJ0018     DISPLAY 'CAT519: CATWHLD-TRL= ' CATWHLD-TRAILER-RECORD               
DJ0018     WRITE CATWHLD-RECORD.                                                
DJ0018     DISPLAY 'CAT519: CATWHLD  TRAILER WRITTEN. STATUS = '                
DJ0018                                         CATWHLD-FILE-STATUS.             
                                                                                
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
LRM042     MOVE W-SAVE-CYCLE-NBR         TO CATEXCP-TRL-CYCLE-NO                
LRM042     DISPLAY 'CAT519: CATEXCP-TRL= ' CATEXCP-TRAILER-RECORD               
LRM042     WRITE CATEXCP-RECORD.                                                
LRM042     DISPLAY 'CAT519: CATEXCP  TRAILER WRITTEN. STATUS = '                
LRM042                                         CATEXCP-FILE-STATUS.             
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           CLOSE INFILE                                                         
           DISPLAY 'CAT519: INFILE   CLOSED. STATUS = '                         
                                             INFILE-FILE-STATUS.                
ET0002     CLOSE MMF-FILE.                                                      
ET0005     MOVE 'C' TO GETVBAL-FUNC.                                            
ET0005     PERFORM 9500-CALL-GETVBAL.                                           
ET0005     DISPLAY 'CAT519: GETVBAL  CLOSED. STATUS = '                         
                                             BALNC-STATUS.                      
ET0005     MOVE 'C'        TO GETVHOL-FUNC                                      
ET0005     PERFORM 9600-CALL-GETVHOL.                                           
ET0005     DISPLAY 'CAT519: GETVHOL  CLOSED. STATUS = '                         
                                             POSVSAM-STATUS.                    
           CLOSE MRGIMM                                                         
           DISPLAY 'CAT519: MRGIMM   CLOSED. STATUS = '                         
                                             MRGIMM-STATUS.                     
           CLOSE PRNGFL                                                         
           DISPLAY 'CAT519: PRNGFL   CLOSED. STATUS = '                         
                                             PRNGFL-STATUS.                     
LRM033     CLOSE DVNDFL                                                         
LRM033     DISPLAY 'CAT519: DVNDFL   CLOSED. STATUS = '                         
LRM033                                       DVNDFL-STATUS.                     
           CLOSE MFMSD                                                          
           DISPLAY 'CAT519: MFMSD    CLOSED. STATUS = '                         
                                             MFMSD-STATUS.                      
           CLOSE BNWMAST                                                        
           DISPLAY 'CAT519: BNWMAST  CLOSED. STATUS = '                         
                                             BNWMAST-STATUS.                    
           CLOSE BNWREGOP                                                       
           DISPLAY 'CAT519: BNWREGOP CLOSED. STATUS = '                         
                                             BNWREGOP-STATUS.                   
DJ0021     CLOSE MFEXBR                                                         
DJ0021     DISPLAY 'CAT519: MFEXBR   CLOSED. STATUS = '                         
DJ0021                                       MFEXBR-STATUS.                     
                                                                                
DJ0010     CLOSE ACATDLVF                                                       
DJ0010     DISPLAY 'CAT519: ACATDLVF CLOSED. STATUS = '                         
DJ0010                                       ACATDLVF-FILE-STATUS.              
DJ0018     CLOSE CATWHLD                                                        
DJ0018     DISPLAY 'CAT519: CATWHLD  CLOSED. STATUS = '                         
DJ0018                                       CATWHLD-FILE-STATUS.               
LRM042     CLOSE CATEXCP                                                        
LRM042     DISPLAY 'CAT519: CATEXCP  CLOSED. STATUS = '                         
LRM042                                       CATEXCP-FILE-STATUS.               
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT519: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT. EXIT.                                                         
ET0005*                                                                         
ET0005 9500-CALL-GETVBAL.                                                       
ET0005     CALL GETVBAL USING GETVBAL-PARM.                                     
ET0005     MOVE GETVBAL-FILE-STATUS TO BALNC-STATUS                             
ET0005     IF GETVBAL-FILE = 'N'                                                
ET0005        MOVE GETVBAL-NEW-RECORD TO BAL-REC                                
ET0005     ELSE                                                                 
ET0005        MOVE GETVBAL-OLD-RECORD TO CMBL-CUSTOMER-BALANCE-SEGMENT.         
ET0005 9600-CALL-GETVHOL.                                                       
ET0005     CALL GETVHOL USING GETVHOL-PARM.                                     
ET0005     MOVE GETVHOL-FILE-STATUS TO       POSVSAM-STATUS.                    
      *################################################################         
