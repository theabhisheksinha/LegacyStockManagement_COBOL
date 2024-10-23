000001* PDX    - CAT510AB C0221281 08/08/05 10:17:00 TBDOJUN            00001000
      ***************************************************************** CAT510AB
      * CAT510AB - COPYBOOK TO REDEFINE CMNT-TXT OF DCLACTITRF (DB2)  * CAT510AB
      *          TO SAVE THE SWITCHES USED BY CAT510A AND CAT510B     * CAT510AB
      *          TO INDICATE WHEN A JOB STREAM IS FINISHED.           * CAT510AB
      * THE LENGTH OF CMNT-TXT IS 120 BYTES.                          * CAT510AB
      * ONLY 72 BYTES OUT OF 120 BYTES ARE USED.                      * CAT510AB
      * USED BY : CAT510A AND CAT510B                                 * CAT510AB
      ***************************************************************** CAT510AB
       01  CAT510AB-CMNT-TXT.                                           CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'A'.           CAT510AB
           03  CAT510AB-STREAM-A-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-A-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-A-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'B'.           CAT510AB
           03  CAT510AB-STREAM-B-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-B-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-B-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'C'.           CAT510AB
           03  CAT510AB-STREAM-C-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-C-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-C-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'D'.           CAT510AB
           03  CAT510AB-STREAM-D-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-D-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-D-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'E'.           CAT510AB
           03  CAT510AB-STREAM-E-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-E-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-E-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'F'.           CAT510AB
           03  CAT510AB-STREAM-F-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-F-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-F-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'G'.           CAT510AB
           03  CAT510AB-STREAM-G-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-G-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-G-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'H'.           CAT510AB
           03  CAT510AB-STREAM-H-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-H-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-H-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'I'.           CAT510AB
           03  CAT510AB-STREAM-I-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-I-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-I-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'J'.           CAT510AB
           03  CAT510AB-STREAM-J-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-J-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-J-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'K'.           CAT510AB
           03  CAT510AB-STREAM-K-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-K-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-K-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'L'.           CAT510AB
           03  CAT510AB-STREAM-L-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-L-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-L-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'M'.           CAT510AB
           03  CAT510AB-STREAM-M-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-M-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-M-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'N'.           CAT510AB
           03  CAT510AB-STREAM-N-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-N-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-N-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'O'.           CAT510AB
           03  CAT510AB-STREAM-O-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-O-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-O-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'P'.           CAT510AB
           03  CAT510AB-STREAM-P-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-P-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-P-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'Q'.           CAT510AB
           03  CAT510AB-STREAM-Q-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-Q-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-Q-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'R'.           CAT510AB
           03  CAT510AB-STREAM-R-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-R-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-R-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'S'.           CAT510AB
           03  CAT510AB-STREAM-S-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-S-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-S-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'T'.           CAT510AB
           03  CAT510AB-STREAM-T-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-T-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-T-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'U'.           CAT510AB
           03  CAT510AB-STREAM-U-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-U-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-U-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'V'.           CAT510AB
           03  CAT510AB-STREAM-V-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-V-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-V-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'W'.           CAT510AB
           03  CAT510AB-STREAM-W-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-W-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-W-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'X'.           CAT510AB
           03  CAT510AB-STREAM-X-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-X-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-X-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'Y'.           CAT510AB
           03  CAT510AB-STREAM-Y-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-Y-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-Y-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE 'Z'.           CAT510AB
           03  CAT510AB-STREAM-Z-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-Z-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-Z-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '0'.           CAT510AB
           03  CAT510AB-STREAM-0-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-0-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-0-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '1'.           CAT510AB
           03  CAT510AB-STREAM-1-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-1-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-1-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '2'.           CAT510AB
           03  CAT510AB-STREAM-2-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-2-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-2-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '3'.           CAT510AB
           03  CAT510AB-STREAM-3-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-3-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-3-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '4'.           CAT510AB
           03  CAT510AB-STREAM-4-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-4-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-4-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '5'.           CAT510AB
           03  CAT510AB-STREAM-5-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-5-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-5-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '6'.           CAT510AB
           03  CAT510AB-STREAM-6-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-6-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-6-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '7'.           CAT510AB
           03  CAT510AB-STREAM-7-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-7-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-7-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '8'.           CAT510AB
           03  CAT510AB-STREAM-8-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-8-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-8-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(001) VALUE '9'.           CAT510AB
           03  CAT510AB-STREAM-9-IND   PIC  X(001) VALUE ' '.           CAT510AB
               88 CAT510AB-STREAM-9-NOT-DONE               VALUE ' '.   CAT510AB
               88 CAT510AB-STREAM-9-DONE                   VALUE '1'.   CAT510AB
           03  FILLER                  PIC  X(048) VALUE ' '.           CAT510AB
      ***************************************************************** CAT510AB
      * CAT510AB - END OF COPYBOOK                                    * CAT510AB
      ***************************************************************** CAT510AB
