000001* PDX    - CATVCHAR C0355480 05/23/14 06:09:43 TBCHKOP            00001000
000001* PDX    - CATVCHAR C0354406 05/19/14 03:58:19 TBCHKOP            00010000
      ******************************************************************00020000
      *** CATVCHAR - VALID CHARACTER SET FROM ACATS-USER-GUIDE      ****00030000
      ***            (Section 19 "Special Characters") of DTCC.     ****00040000
      *** CREATED ON 05/15/14 FOR SSR 01101121 - 'REPLACE ILLEGAL   ****00050000
      *** CHARACTERS WITH SPACES IN MSD DESCRIPTION WHEN BUILDING   ****00060000
      *** ASSETS'                                                   ****00070000
      ******************************************************************00080000
       01 W-EDIT-CHAR-AREA.                                             00090000
          10 W-EDIT-CHAR-AREA1            PIC X(01).                    00100000
             88 W-VALID-CHARACTER1        VALUE                         00110000
                'A' THRU 'Z' 'a' THRU 'z' '0' thru '9'                  00120000
                '!' '@' '#' '$' '%' '&' '*'                             00130000
                '(' ')' '-' '_' '+' '=' '~' '{' '}'                     00140000
                '' '\' ':' ';' '"' '<' '>'                             00150000
                ',' '.' '?' '/' ' ' '`' QUOTE.                          00160000
                                                                        00170000
      ***FOR MSD DESCRIPTIONS '~','_','`','{' '}','\' CHARACTERS ARE    00180000
      ***INVALID. SO FOR MSD DSESC W-EDIT-CHAR-AREA2 IS VALID CHAR SET. 00190000
          10 W-EDIT-CHAR-AREA2            PIC X(01).                    00200000
             88 W-VALID-CHARACTER2        VALUE                         00210000
                'A' THRU 'Z' 'a' THRU 'z' '0' thru '9'                  00220000
                '!' '@' '#' '$' '%' '&' '*'                             00230000
                '(' ')' '-' '+' '='                                     00240000
                '' ':' ';' '"' '<' '>'                                 00250000
                ',' '.' '?' '/' ' ' QUOTE.                              00260000
