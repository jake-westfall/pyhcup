/*******************************************************************            
*   WV_SID_2003_CORE.SAS:                                                       
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
DATA WV_SIDC_2003_CORE;                                                         
INFILE 'WV_SID_2003_CORE.ASC' LRECL = 353;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH           LENGTH=3                                                   
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH             LENGTH=3                                                   
  LABEL="Admission month"                                                       
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X          LENGTH=$1                                                  
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
                                                                                
  PAY2               LENGTH=3                                                   
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY1_X             LENGTH=$2                                                  
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2_X             LENGTH=$2                                                  
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAYER1_X           LENGTH=$4                                                  
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PAYER2_X           LENGTH=$4                                                  
  LABEL="Secondary expected payer plan identifier (as received from source)"    
                                                                                
  PL_CBSA            LENGTH=3                                                   
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993         LENGTH=3                                                   
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_RUCA4           LENGTH=3                                                   
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
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
                                                                                
  PSTATE             LENGTH=$2                                                  
  LABEL="Patient State postal code"                                             
                                                                                
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
                                                                                
  ZIP_S              LENGTH=$5                                                  
  LABEL="Patient ZIP Code (synthetic)"                                          
                                                                                
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
                                                                                
  DMONTH             LENGTH=3                                                   
  LABEL="Discharge month"                                                       
                                                                                
  BMONTH             LENGTH=3                                                   
  LABEL="Birth month"                                                           
                                                                                
  BYEAR              LENGTH=3                                                   
  LABEL="Birth year"                                                            
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AGEDAY              N3PF.                                         
      @21     AGEMONTH            N3PF.                                         
      @24     AMONTH              N2PF.                                         
      @26     ASOURCE             N2PF.                                         
      @28     ASOURCE_X           $CHAR1.                                       
      @29     ASOURCEUB92         $CHAR1.                                       
      @30     ATYPE               N2PF.                                         
      @32     AWEEKEND            N2PF.                                         
      @34     DIED                N2PF.                                         
      @36     DISP_X              $CHAR2.                                       
      @38     DISPUB92            N2PF.                                         
      @40     DISPUNIFORM         N2PF.                                         
      @42     DQTR                N2PF.                                         
      @44     DRG                 N3PF.                                         
      @47     DRG18               N3PF.                                         
      @50     DRGVER              N2PF.                                         
      @52     DSHOSPID            $CHAR13.                                      
      @65     DX1                 $CHAR5.                                       
      @70     DX2                 $CHAR5.                                       
      @75     DX3                 $CHAR5.                                       
      @80     DX4                 $CHAR5.                                       
      @85     DX5                 $CHAR5.                                       
      @90     DX6                 $CHAR5.                                       
      @95     DX7                 $CHAR5.                                       
      @100    DX8                 $CHAR5.                                       
      @105    DX9                 $CHAR5.                                       
      @110    DXCCS1              N4PF.                                         
      @114    DXCCS2              N4PF.                                         
      @118    DXCCS3              N4PF.                                         
      @122    DXCCS4              N4PF.                                         
      @126    DXCCS5              N4PF.                                         
      @130    DXCCS6              N4PF.                                         
      @134    DXCCS7              N4PF.                                         
      @138    DXCCS8              N4PF.                                         
      @142    DXCCS9              N4PF.                                         
      @146    ECODE1              $CHAR5.                                       
      @151    ECODE2              $CHAR5.                                       
      @156    ECODE3              $CHAR5.                                       
      @161    ECODE4              $CHAR5.                                       
      @166    ECODE5              $CHAR5.                                       
      @171    E_CCS1              N4PF.                                         
      @175    E_CCS2              N4PF.                                         
      @179    E_CCS3              N4PF.                                         
      @183    E_CCS4              N4PF.                                         
      @187    E_CCS5              N4PF.                                         
      @191    FEMALE              N2PF.                                         
      @193    HOSPST              $CHAR2.                                       
      @195    LOS                 N5PF.                                         
      @200    LOS_X               N6PF.                                         
      @206    MDC                 N2PF.                                         
      @208    MDC18               N2PF.                                         
      @210    MDNUM1_R            N9PF.                                         
      @219    MDNUM2_R            N9PF.                                         
      @228    NDX                 N2PF.                                         
      @230    NECODE              N2PF.                                         
      @232    NEOMAT              N2PF.                                         
      @234    NPR                 N2PF.                                         
      @236    PAY1                N2PF.                                         
      @238    PAY2                N2PF.                                         
      @240    PAY1_X              $CHAR2.                                       
      @242    PAY2_X              $CHAR2.                                       
      @244    PAYER1_X            $CHAR4.                                       
      @248    PAYER2_X            $CHAR4.                                       
      @252    PL_CBSA             N3PF.                                         
      @255    PL_MSA1993          N3PF.                                         
      @258    PL_RUCA4            N2PF.                                         
      @260    PL_UR_CAT4          N2PF.                                         
      @262    PL_UR_CAT5          N2PF.                                         
      @264    PR1                 $CHAR4.                                       
      @268    PR2                 $CHAR4.                                       
      @272    PR3                 $CHAR4.                                       
      @276    PR4                 $CHAR4.                                       
      @280    PR5                 $CHAR4.                                       
      @284    PR6                 $CHAR4.                                       
      @288    PRCCS1              N3PF.                                         
      @291    PRCCS2              N3PF.                                         
      @294    PRCCS3              N3PF.                                         
      @297    PRCCS4              N3PF.                                         
      @300    PRCCS5              N3PF.                                         
      @303    PRCCS6              N3PF.                                         
      @306    PSTATE              $CHAR2.                                       
      @308    TOTCHG              N10PF.                                        
      @318    TOTCHG_X            N15P2F.                                       
      @333    YEAR                N4PF.                                         
      @337    ZIP_S               $CHAR5.                                       
      @342    AYEAR               N4PF.                                         
      @346    DMONTH              N2PF.                                         
      @348    BMONTH              N2PF.                                         
      @350    BYEAR               N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
