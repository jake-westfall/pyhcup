/*******************************************************************            
*   FL_SID_2003_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CORE FILE INTO SAS                                        
*******************************************************************/            
                                                                                
                                                                                
***********************************************;                                
*  Create SAS informats for missing values     ;                                
***********************************************;                                
PROC FORMAT;                                                                    
  INVALUE N2PF                                                                  
    '-9' = .                                                                    
    '-8' = .A                                                                   
    '-6' = .C                                                                   
    '-5' = .N                                                                   
    OTHER = (|2.|)                                                              
  ;                                                                             
  INVALUE N3PF                                                                  
    '-99' = .                                                                   
    '-88' = .A                                                                  
    '-66' = .C                                                                  
    OTHER = (|3.|)                                                              
  ;                                                                             
  INVALUE N4PF                                                                  
    '-999' = .                                                                  
    '-888' = .A                                                                 
    '-666' = .C                                                                 
    OTHER = (|4.|)                                                              
  ;                                                                             
  INVALUE N4P1F                                                                 
    '-9.9' = .                                                                  
    '-8.8' = .A                                                                 
    '-6.6' = .C                                                                 
    OTHER = (|4.1|)                                                             
  ;                                                                             
  INVALUE N5PF                                                                  
    '-9999' = .                                                                 
    '-8888' = .A                                                                
    '-6666' = .C                                                                
    OTHER = (|5.|)                                                              
  ;                                                                             
  INVALUE N6PF                                                                  
    '-99999' = .                                                                
    '-88888' = .A                                                               
    '-66666' = .C                                                               
    OTHER = (|6.|)                                                              
  ;                                                                             
  INVALUE N6P2F                                                                 
    '-99.99' = .                                                                
    '-88.88' = .A                                                               
    '-66.66' = .C                                                               
    OTHER = (|6.2|)                                                             
  ;                                                                             
  INVALUE N7P2F                                                                 
    '-999.99' = .                                                               
    '-888.88' = .A                                                              
    '-666.66' = .C                                                              
    OTHER = (|7.2|)                                                             
  ;                                                                             
  INVALUE N7P4F                                                                 
    '-9.9999' = .                                                               
    '-8.8888' = .A                                                              
    '-6.6666' = .C                                                              
    OTHER = (|7.4|)                                                             
  ;                                                                             
  INVALUE N8PF                                                                  
    '-9999999' = .                                                              
    '-8888888' = .A                                                             
    '-6666666' = .C                                                             
    OTHER = (|8.|)                                                              
  ;                                                                             
  INVALUE N8P2F                                                                 
    '-9999.99' = .                                                              
    '-8888.88' = .A                                                             
    '-6666.66' = .C                                                             
    OTHER = (|8.2|)                                                             
  ;                                                                             
  INVALUE N9PF                                                                  
    '-99999999' = .                                                             
    '-88888888' = .A                                                            
    '-66666666' = .C                                                            
    OTHER = (|9.|)                                                              
  ;                                                                             
  INVALUE N10PF                                                                 
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|10.|)                                                             
  ;                                                                             
  INVALUE N10P4F                                                                
    '-9999.9999' = .                                                            
    '-8888.8888' = .A                                                           
    '-6666.6666' = .C                                                           
    OTHER = (|10.4|)                                                            
  ;                                                                             
  INVALUE DATE10F                                                               
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|MMDDYY10.|)                                                       
  ;                                                                             
  INVALUE N12P2F                                                                
    '-99999999.99' = .                                                          
    '-88888888.88' = .A                                                         
    '-66666666.66' = .C                                                         
    OTHER = (|12.2|)                                                            
  ;                                                                             
  INVALUE N15P2F                                                                
    '-99999999999.99' = .                                                       
    '-88888888888.88' = .A                                                      
    '-66666666666.66' = .C                                                      
    OTHER = (|15.2|)                                                            
  ;                                                                             
  RUN;                                                                          
                                                                                
                                                                                
*******************************;                                                
*  Data Step                  *;                                                
*******************************;                                                
DATA FL_SIDC_2003_CORE;                                                         
INFILE 'FL_SID_2003_CORE.ASC' LRECL = 399;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X          LENGTH=$2                                                  
  LABEL="Admission source (as received from source)"                            
                                                                                
  ASOURCEUB92        LENGTH=$1                                                  
  LABEL="Admission source (UB-92 standard coding)"                              
                                                                                
  ATYPE              LENGTH=3                                                   
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
                                                                                
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X             LENGTH=$2                                                  
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUB92           LENGTH=3                                                   
  LABEL="Disposition of patient (UB-92 standard coding)"                        
                                                                                
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DQTR               LENGTH=3                                                   
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                LENGTH=3                                                   
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG18              LENGTH=3                                                   
  LABEL="DRG, version 18"                                                       
                                                                                
  DRGVER             LENGTH=3                                                   
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DSHOSPID           LENGTH=$13                                                 
  LABEL="Data source hospital identifier"                                       
                                                                                
  DX1                LENGTH=$5                                                  
  LABEL="Principal diagnosis"                                                   
                                                                                
  DX2                LENGTH=$5                                                  
  LABEL="Diagnosis 2"                                                           
                                                                                
  DX3                LENGTH=$5                                                  
  LABEL="Diagnosis 3"                                                           
                                                                                
  DX4                LENGTH=$5                                                  
  LABEL="Diagnosis 4"                                                           
                                                                                
  DX5                LENGTH=$5                                                  
  LABEL="Diagnosis 5"                                                           
                                                                                
  DX6                LENGTH=$5                                                  
  LABEL="Diagnosis 6"                                                           
                                                                                
  DX7                LENGTH=$5                                                  
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                LENGTH=$5                                                  
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                LENGTH=$5                                                  
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10               LENGTH=$5                                                  
  LABEL="Diagnosis 10"                                                          
                                                                                
  DXCCS1             LENGTH=4                                                   
  LABEL="CCS: principal diagnosis"                                              
                                                                                
  DXCCS2             LENGTH=4                                                   
  LABEL="CCS: diagnosis 2"                                                      
                                                                                
  DXCCS3             LENGTH=4                                                   
  LABEL="CCS: diagnosis 3"                                                      
                                                                                
  DXCCS4             LENGTH=4                                                   
  LABEL="CCS: diagnosis 4"                                                      
                                                                                
  DXCCS5             LENGTH=4                                                   
  LABEL="CCS: diagnosis 5"                                                      
                                                                                
  DXCCS6             LENGTH=4                                                   
  LABEL="CCS: diagnosis 6"                                                      
                                                                                
  DXCCS7             LENGTH=4                                                   
  LABEL="CCS: diagnosis 7"                                                      
                                                                                
  DXCCS8             LENGTH=4                                                   
  LABEL="CCS: diagnosis 8"                                                      
                                                                                
  DXCCS9             LENGTH=4                                                   
  LABEL="CCS: diagnosis 9"                                                      
                                                                                
  DXCCS10            LENGTH=4                                                   
  LABEL="CCS: diagnosis 10"                                                     
                                                                                
  ECODE1             LENGTH=$5                                                  
  LABEL="E code 1"                                                              
                                                                                
  ECODE2             LENGTH=$5                                                  
  LABEL="E code 2"                                                              
                                                                                
  ECODE3             LENGTH=$5                                                  
  LABEL="E code 3"                                                              
                                                                                
  ECODE4             LENGTH=$5                                                  
  LABEL="E code 4"                                                              
                                                                                
  ECODE5             LENGTH=$5                                                  
  LABEL="E code 5"                                                              
                                                                                
  ECODE6             LENGTH=$5                                                  
  LABEL="E code 6"                                                              
                                                                                
  ECODE7             LENGTH=$5                                                  
  LABEL="E code 7"                                                              
                                                                                
  E_CCS1             LENGTH=3                                                   
  LABEL="CCS: E Code 1"                                                         
                                                                                
  E_CCS2             LENGTH=3                                                   
  LABEL="CCS: E Code 2"                                                         
                                                                                
  E_CCS3             LENGTH=3                                                   
  LABEL="CCS: E Code 3"                                                         
                                                                                
  E_CCS4             LENGTH=3                                                   
  LABEL="CCS: E Code 4"                                                         
                                                                                
  E_CCS5             LENGTH=3                                                   
  LABEL="CCS: E Code 5"                                                         
                                                                                
  E_CCS6             LENGTH=3                                                   
  LABEL="CCS: E Code 6"                                                         
                                                                                
  E_CCS7             LENGTH=3                                                   
  LABEL="CCS: E Code 7"                                                         
                                                                                
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  LOS                LENGTH=4                                                   
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X              LENGTH=4                                                   
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDC                LENGTH=3                                                   
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC18              LENGTH=3                                                   
  LABEL="MDC, version 18"                                                       
                                                                                
  MDNUM1_R           LENGTH=5                                                   
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R           LENGTH=5                                                   
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  NDX                LENGTH=3                                                   
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE             LENGTH=3                                                   
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT             LENGTH=3                                                   
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                LENGTH=3                                                   
  LABEL="Number of procedures on this record"                                   
                                                                                
  PAY1               LENGTH=3                                                   
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X             LENGTH=$1                                                  
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PL_CBSA            LENGTH=3                                                   
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993         LENGTH=3                                                   
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_RUCA            LENGTH=4          FORMAT=4.1                               
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA10          LENGTH=3                                                   
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA4           LENGTH=3                                                   
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC2003        LENGTH=3                                                   
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC), 2003"             
                                                                                
  PL_UIC2003         LENGTH=3                                                   
  LABEL="Patient location: Urban Influence Codes, 2003"                         
                                                                                
  PL_UR_CAT4         LENGTH=3                                                   
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PL_UR_CAT5         LENGTH=3                                                   
  LABEL="Patient Location: Urban-Rural 5 Categories"                            
                                                                                
  PR1                LENGTH=$4                                                  
  LABEL="Principal procedure"                                                   
                                                                                
  PR2                LENGTH=$4                                                  
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                LENGTH=$4                                                  
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                LENGTH=$4                                                  
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                LENGTH=$4                                                  
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                LENGTH=$4                                                  
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                LENGTH=$4                                                  
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                LENGTH=$4                                                  
  LABEL="Procedure 8"                                                           
                                                                                
  PR9                LENGTH=$4                                                  
  LABEL="Procedure 9"                                                           
                                                                                
  PR10               LENGTH=$4                                                  
  LABEL="Procedure 10"                                                          
                                                                                
  PRCCS1             LENGTH=3                                                   
  LABEL="CCS: principal procedure"                                              
                                                                                
  PRCCS2             LENGTH=3                                                   
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3             LENGTH=3                                                   
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4             LENGTH=3                                                   
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PRCCS5             LENGTH=3                                                   
  LABEL="CCS: procedure 5"                                                      
                                                                                
  PRCCS6             LENGTH=3                                                   
  LABEL="CCS: procedure 6"                                                      
                                                                                
  PRCCS7             LENGTH=3                                                   
  LABEL="CCS: procedure 7"                                                      
                                                                                
  PRCCS8             LENGTH=3                                                   
  LABEL="CCS: procedure 8"                                                      
                                                                                
  PRCCS9             LENGTH=3                                                   
  LABEL="CCS: procedure 9"                                                      
                                                                                
  PRCCS10            LENGTH=3                                                   
  LABEL="CCS: procedure 10"                                                     
                                                                                
  PRDAY1             LENGTH=4                                                   
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  PSTATE             LENGTH=$2                                                  
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2             LENGTH=4                                                   
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE               LENGTH=3                                                   
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X             LENGTH=$1                                                  
  LABEL="Race (as received from source)"                                        
                                                                                
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="Patient ZIP Code"                                                      
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     ASOURCE             N2PF.                                         
      @20     ASOURCE_X           $CHAR2.                                       
      @22     ASOURCEUB92         $CHAR1.                                       
      @23     ATYPE               N2PF.                                         
      @25     AWEEKEND            N2PF.                                         
      @27     DIED                N2PF.                                         
      @29     DISP_X              $CHAR2.                                       
      @31     DISPUB92            N2PF.                                         
      @33     DISPUNIFORM         N2PF.                                         
      @35     DQTR                N2PF.                                         
      @37     DRG                 N3PF.                                         
      @40     DRG18               N3PF.                                         
      @43     DRGVER              N2PF.                                         
      @45     DSHOSPID            $CHAR13.                                      
      @58     DX1                 $CHAR5.                                       
      @63     DX2                 $CHAR5.                                       
      @68     DX3                 $CHAR5.                                       
      @73     DX4                 $CHAR5.                                       
      @78     DX5                 $CHAR5.                                       
      @83     DX6                 $CHAR5.                                       
      @88     DX7                 $CHAR5.                                       
      @93     DX8                 $CHAR5.                                       
      @98     DX9                 $CHAR5.                                       
      @103    DX10                $CHAR5.                                       
      @108    DXCCS1              N4PF.                                         
      @112    DXCCS2              N4PF.                                         
      @116    DXCCS3              N4PF.                                         
      @120    DXCCS4              N4PF.                                         
      @124    DXCCS5              N4PF.                                         
      @128    DXCCS6              N4PF.                                         
      @132    DXCCS7              N4PF.                                         
      @136    DXCCS8              N4PF.                                         
      @140    DXCCS9              N4PF.                                         
      @144    DXCCS10             N4PF.                                         
      @148    ECODE1              $CHAR5.                                       
      @153    ECODE2              $CHAR5.                                       
      @158    ECODE3              $CHAR5.                                       
      @163    ECODE4              $CHAR5.                                       
      @168    ECODE5              $CHAR5.                                       
      @173    ECODE6              $CHAR5.                                       
      @178    ECODE7              $CHAR5.                                       
      @183    E_CCS1              N4PF.                                         
      @187    E_CCS2              N4PF.                                         
      @191    E_CCS3              N4PF.                                         
      @195    E_CCS4              N4PF.                                         
      @199    E_CCS5              N4PF.                                         
      @203    E_CCS6              N4PF.                                         
      @207    E_CCS7              N4PF.                                         
      @211    FEMALE              N2PF.                                         
      @213    HOSPST              $CHAR2.                                       
      @215    LOS                 N5PF.                                         
      @220    LOS_X               N6PF.                                         
      @226    MDC                 N2PF.                                         
      @228    MDC18               N2PF.                                         
      @230    MDNUM1_R            N9PF.                                         
      @239    MDNUM2_R            N9PF.                                         
      @248    NDX                 N2PF.                                         
      @250    NECODE              N2PF.                                         
      @252    NEOMAT              N2PF.                                         
      @254    NPR                 N2PF.                                         
      @256    PAY1                N2PF.                                         
      @258    PAY1_X              $CHAR1.                                       
      @259    PL_CBSA             N3PF.                                         
      @262    PL_MSA1993          N3PF.                                         
      @265    PL_RUCA             N4P1F.                                        
      @269    PL_RUCA10           N2PF.                                         
      @271    PL_RUCA4            N2PF.                                         
      @273    PL_RUCC2003         N2PF.                                         
      @275    PL_UIC2003          N2PF.                                         
      @277    PL_UR_CAT4          N2PF.                                         
      @279    PL_UR_CAT5          N2PF.                                         
      @281    PR1                 $CHAR4.                                       
      @285    PR2                 $CHAR4.                                       
      @289    PR3                 $CHAR4.                                       
      @293    PR4                 $CHAR4.                                       
      @297    PR5                 $CHAR4.                                       
      @301    PR6                 $CHAR4.                                       
      @305    PR7                 $CHAR4.                                       
      @309    PR8                 $CHAR4.                                       
      @313    PR9                 $CHAR4.                                       
      @317    PR10                $CHAR4.                                       
      @321    PRCCS1              N3PF.                                         
      @324    PRCCS2              N3PF.                                         
      @327    PRCCS3              N3PF.                                         
      @330    PRCCS4              N3PF.                                         
      @333    PRCCS5              N3PF.                                         
      @336    PRCCS6              N3PF.                                         
      @339    PRCCS7              N3PF.                                         
      @342    PRCCS8              N3PF.                                         
      @345    PRCCS9              N3PF.                                         
      @348    PRCCS10             N3PF.                                         
      @351    PRDAY1              N5PF.                                         
      @356    PSTATE              $CHAR2.                                       
      @358    PSTCO2              N5PF.                                         
      @363    RACE                N2PF.                                         
      @365    RACE_X              $CHAR1.                                       
      @366    TOTCHG              N10PF.                                        
      @376    TOTCHG_X            N15P2F.                                       
      @391    YEAR                N4PF.                                         
      @395    ZIP                 $CHAR5.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
