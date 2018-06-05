#V3.24U
#C SS3_Control_NP_MAK.xlsx																																																																																																																																																																																								
#_data_and_control_files: DATA.ss // CONTROL.ss
#_SS-V3.24U-fast;_08/29/2014;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.2_Win64
1  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
#_Cond 0  #  N recruitment designs goes here if N_GP*nseas*area>1
#_Cond 0  #  placeholder for recruitment interaction request
#_Cond 1 1 1  # example recruitment design element for GP=1, seas=1, area=1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern 
# begin and end years of blocks
#
0.5 #_fracfemale 
4 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
 #_Age_natmort_by gender x growthpattern
0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128
0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128	0.128
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
0 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
#_placeholder for empirical age- or length- maturity by growth pattern (female only)
1 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 5 100 60 60 -1 99 -3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 50 600 293.1 293.1 -1 99 -4 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.7 0.128 0.128 -1 99 -5 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.3 0.1 0.1 -1 99 -2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.3 0.1 0.1 -1 99 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 5 100 60 60 -1 99 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 50 600 232 232 -1 99 -4 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.01 0.7 0.174 0.174 -1 99 -5 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 0.01 0.3 0.1 0.1 -1 99 -2 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 0.01 0.3 0.1 0.1 -1 99 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 -3 3 4.62e-005 4.62e-005 -1 99 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
 -3 5 2.77 2.77 -1 99 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
 1 300 233.654 233.654 -1 99 -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -200 3 -0.14652 -0.14652 -1 99 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 50 6.68e-006 1e-005 -1 99 -3 0 0 0 0 0 0 0 # Eggs_scalar_Fem
 -3 3 2.34 2.34442 -1 99 -3 0 0 0 0 0 0 0 # Eggs_exp_len_Fem
 -3 5 3.4e-006 3.4e-006 -1 99 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal
 -3 5 2.84 2.84 -1 99 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal
 -4 4 0 1 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 1 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 0 1 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_Seas_1
 -4 4 0 1 -1 99 -3 0 0 0 0 0 0 0 # CohortGrowDev
#
#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
#
#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_Cond No MG parm trends 
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Cond -4 #_MGparm_Dev_Phase
#
#_Spawner-Recruitment
7 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
#_LO HI INIT PRIOR PR_type SD PHASE
 2 15 6.66853 7 -1 99 1 # SR_LN(R0)
 0.01 1 1 1 -1 99 -1 # SR_surv_Sfrac
 0.01 10 4 4 -1 99 -1 # SR_surv_Beta
 0.2 1.9 0.3 0.28 -1 99 -4 # SR_sigmaR
 -5 5 0 0 -1 99 -3 # SR_envlink
 -5 5 -0.0948407 0 0 1 1 # SR_R1_offset
 -5 5 0 0 -1 99 -4 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1985 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
-1 #_recdev phase 
0 # (0/1) to read 13 advanced options
#_Cond 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
#_Cond -4 #_recdev_early_phase
#_Cond 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#_Cond 1 #_lambda for Fcast_recr_like occurring before endyr+1
#_Cond 994 #_last_early_yr_nobias_adj_in_MPD
#_Cond 1963 #_first_yr_fullbias_adj_in_MPD
#_Cond 2016 #_last_yr_fullbias_adj_in_MPD
#_Cond 2017 #_first_recent_yr_nobias_adj_in_MPD
#_Cond 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#_Cond 0 #_period of cycles in recruitment (N parms read below)
#_Cond -5 #min rec_dev
#_Cond 5 #max rec_dev
#_Cond 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#DisplayOnly -0.58884 # Main_RecrDev_1994
#DisplayOnly -0.511508 # Main_RecrDev_1995
#DisplayOnly -0.284003 # Main_RecrDev_1996
#DisplayOnly -0.293493 # Main_RecrDev_1997
#DisplayOnly -0.542465 # Main_RecrDev_1998
#DisplayOnly -0.671755 # Main_RecrDev_1999
#DisplayOnly -0.477952 # Main_RecrDev_2000
#DisplayOnly -0.0250049 # Main_RecrDev_2001
#DisplayOnly -0.105139 # Main_RecrDev_2002
#DisplayOnly -0.058177 # Main_RecrDev_2003
#DisplayOnly -0.100262 # Main_RecrDev_2004
#DisplayOnly 0.020353 # Main_RecrDev_2005
#DisplayOnly -0.0339175 # Main_RecrDev_2006
#DisplayOnly 0.0703853 # Main_RecrDev_2007
#DisplayOnly 0.232575 # Main_RecrDev_2008
#DisplayOnly 0.262947 # Main_RecrDev_2009
#DisplayOnly 0.305471 # Main_RecrDev_2010
#DisplayOnly 0.0670997 # Main_RecrDev_2011
#DisplayOnly 0.430646 # Main_RecrDev_2012
#DisplayOnly 0.530928 # Main_RecrDev_2013
#DisplayOnly 0.651255 # Main_RecrDev_2014
#DisplayOnly 0.317233 # Main_RecrDev_2015
#DisplayOnly 0.803625 # Main_RecrDev_2016
#
#Fishing Mortality info 
0.2 # F ballpark for annual F (=Z-M) for specified year
-2010 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
 0 5 0 0.01 -1 99 -1 # InitF_1F1_US_CA
 0 5 0 0.01 -1 99 -1 # InitF_2F2_US_HI_SS
 0 5 0 0.01 -1 99 -1 # InitF_3F3_US_HI_DS
 0 5 0 0.01 -1 99 -1 # InitF_4F4_US_DGN
 0 5 0 0.01 -1 99 -1 # InitF_5F5_US_REC
 0 5 0 0.01 -1 99 -1 # InitF_6F6_TW_LRG_N
 0 5 0 0.01 -1 99 -1 # InitF_7F7_TW_LRG_S
 0 5 0 0.01 -1 99 -1 # InitF_8F8_TW_SML
 0 5 0.2 0.01 -1 99 1 # InitF_9F9_JPN_SS
 0 5 0 0.01 -1 99 -1 # InitF_10F10_JPN_DS
 0 5 0 0.01 -1 99 -1 # InitF_11F11_JPN_CST
 0 5 0 0.01 -1 99 -1 # InitF_12F12_JPN_DFN
 0 5 0 0.01 -1 99 -1 # InitF_13F13_JPN_OTH
 0 5 0 0.01 -1 99 -1 # InitF_14F14_MEX_NOR
 0 5 0 0.01 -1 99 -1 # InitF_15F15_MEX_SOU
 0 5 0 0.01 -1 99 -1 # InitF_16F16_WCPFC
 0 5 0 0.01 -1 99 -1 # InitF_17F17_IATTC
 0 5 0 0.01 -1 99 -1 # InitF_18F18_JPN_SSII
#
#_Q_setup
 # Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den-dep  env-var  extra_se  Q_type
 0 0 0 0 # 1 F1_US_CA
 0 0 0 0 # 2 F2_US_HI_SS
 0 0 0 0 # 3 F3_US_HI_DS
 0 0 0 0 # 4 F4_US_DGN
 0 0 0 0 # 5 F5_US_REC
 0 0 0 0 # 6 F6_TW_LRG_N
 0 0 0 0 # 7 F7_TW_LRG_S
 0 0 0 0 # 8 F8_TW_SML
 0 0 0 0 # 9 F9_JPN_SS
 0 0 0 0 # 10 F10_JPN_DS
 0 0 0 0 # 11 F11_JPN_CST
 0 0 0 0 # 12 F12_JPN_DFN
 0 0 0 0 # 13 F13_JPN_OTH
 0 0 0 0 # 14 F14_MEX_NOR
 0 0 0 0 # 15 F15_MEX_SOU
 0 0 0 0 # 16 F16_WCPFC
 0 0 0 0 # 17 F17_IATTC
 0 0 0 0 # 18 F18_JPN_SSII
 0 0 0 0 # 19 S1_US_SS
 0 0 0 0 # 20 S2_US_DS
 0 0 0 0 # 21 S3_TW_LRG
 0 0 0 0 # 22 S4_JPN_SS
 0 0 0 0 # 23 S5_JPN_RTV
 0 0 0 0 # 24 S6_JPN_OBS
 0 0 0 0 # 25 S7_JPN_GEO
 0 0 0 0 # 26 S8_MEX
#
#_Cond 0 #_If q has random component, then 0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 24 0 0 0 # 1 F1_US_CA
 5 0 0 1 # 2 F2_US_HI_SS
 24 0 0 0 # 3 F3_US_HI_DS
 24 0 0 0 # 4 F4_US_DGN
 5 0 0 2 # 5 F5_US_REC
 24 0 0 0 # 6 F6_TW_LRG_N
 5 0 0 6 # 7 F7_TW_LRG_S
 5 0 0 6 # 8 F8_TW_SML
 5 0 0 6 # 9 F9_JPN_SS
 24 0 0 0 # 10 F10_JPN_DS
 5 0 0 9 # 11 F11_JPN_CST
 24 0 0 0 # 12 F12_JPN_DFN
 5 0 0 9 # 13 F13_JPN_OTH
 24 0 0 0 # 14 F14_MEX_NOR
 24 0 0 0 # 15 F15_MEX_SOU
 5 0 0 1 # 16 F16_WCPFC
 5 0 0 1 # 17 F17_IATTC
 5 0 0 9 # 18 F18_JPN_SSII
 5 0 0 2 # 19 S1_US_SS
 5 0 0 3 # 20 S2_US_DS
 5 0 0 6 # 21 S3_TW_LRG
 5 0 0 9 # 22 S4_JPN_SS
 5 0 0 9 # 23 S5_JPN_RTV
 5 0 0 9 # 24 S6_JPN_OBS
 5 0 0 9 # 25 S7_JPN_GEO
 5 0 0 14 # 26 S8_MEX
#
#_age_selex_types
#_Pattern ___ Male Special
 11 0 0 0 # 1 F1_US_CA
 11 0 0 0 # 2 F2_US_HI_SS
 11 0 0 0 # 3 F3_US_HI_DS
 11 0 0 0 # 4 F4_US_DGN
 11 0 0 0 # 5 F5_US_REC
 11 0 0 0 # 6 F6_TW_LRG_N
 11 0 0 0 # 7 F7_TW_LRG_S
 11 0 0 0 # 8 F8_TW_SML
 11 0 0 0 # 9 F9_JPN_SS
 11 0 0 0 # 10 F10_JPN_DS
 11 0 0 0 # 11 F11_JPN_CST
 11 0 0 0 # 12 F12_JPN_DFN
 11 0 0 0 # 13 F13_JPN_OTH
 11 0 0 0 # 14 F14_MEX_NOR
 11 0 0 0 # 15 F15_MEX_SOU
 11 0 0 0 # 16 F16_WCPFC
 11 0 0 0 # 17 F17_IATTC
 11 0 0 0 # 18 F18_JPN_SSII
 11 0 0 0 # 19 S1_US_SS
 11 0 0 0 # 20 S2_US_DS
 11 0 0 0 # 21 S3_TW_LRG
 11 0 0 0 # 22 S4_JPN_SS
 11 0 0 0 # 23 S5_JPN_RTV
 11 0 0 0 # 24 S6_JPN_OBS
 11 0 0 0 # 25 S7_JPN_GEO
 11 0 0 0 # 26 S8_MEX
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 62.5 297.5 62.9536 148.87 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_1P_1_F1_US_CA
 -6 4 -0.836245 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_1P_2_F1_US_CA
 -1 9 8.85873 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_1P_3_F1_US_CA
 -1 9 8.99857 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_1P_4_F1_US_CA
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_1P_5_F1_US_CA
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_1P_6_F1_US_CA
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_2P_1_F2_US_HI_SS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_2P_2_F2_US_HI_SS
 62.5 297.5 171.001 148.87 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_3P_1_F3_US_HI_DS
 -6 4 -5.98577 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_3P_2_F3_US_HI_DS
 -1 9 7.38705 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_3P_3_F3_US_HI_DS
 -1 9 7.45721 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_3P_4_F3_US_HI_DS
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_3P_5_F3_US_HI_DS
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_3P_6_F3_US_HI_DS
 62.5 297.5 100.841 148.87 -1 99 -2 0 0 0 0 0.5 0 0 # SizeSel_4P_1_F4_US_DGN
 -6 4 -5.98539 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_4P_2_F4_US_DGN
 -1 9 7.22531 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_4P_3_F4_US_DGN
 -1 9 7.59831 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_4P_4_F4_US_DGN
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_4P_5_F4_US_DGN
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_4P_6_F4_US_DGN
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_5P_1_F5_US_REC
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_5P_2_F5_US_REC
 62.5 297.5 141.071 148.87 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_6P_1_F6_TW_LRG_N
 -6 4 -5.99944 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_6P_2_F6_TW_LRG_N
 -1 9 6.94794 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_6P_3_F6_TW_LRG_N
 -1 9 7.39719 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_6P_4_F6_TW_LRG_N
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_6P_5_F6_TW_LRG_N
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_6P_6_F6_TW_LRG_N
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_7P_1_F7_TW_LRG_S
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_7P_2_F7_TW_LRG_S
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_8P_1_F8_TW_SML
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_8P_2_F8_TW_SML
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_9P_1_F9_JPN_SS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_9P_2_F9_JPN_SS
 62.5 297.5 164.62 148.87 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_10P_1_F10_JPN_DS
 -6 4 -5.95065 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_10P_2_F10_JPN_DS
 -1 9 6.15361 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_10P_3_F10_JPN_DS
 -1 9 7.46266 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_10P_4_F10_JPN_DS
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_10P_5_F10_JPN_DS
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_10P_6_F10_JPN_DS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_11P_1_F11_JPN_CST
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_11P_2_F11_JPN_CST
 62.5 297.5 125.81 148.87 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_12P_1_F12_JPN_DFN
 -6 4 -5.99604 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_12P_2_F12_JPN_DFN
 -1 9 6.82447 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_12P_3_F12_JPN_DFN
 -1 9 6.89017 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_12P_4_F12_JPN_DFN
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_12P_5_F12_JPN_DFN
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_12P_6_F12_JPN_DFN
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_13P_1_F13_JPN_OTH
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_13P_2_F13_JPN_OTH
 62.5 297.5 103.519 148.87 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_14P_1_F14_MEX_NOR
 -6 4 -5.99276 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_14P_2_F14_MEX_NOR
 -1 9 7.86862 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_14P_3_F14_MEX_NOR
 -1 9 7.50091 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_14P_4_F14_MEX_NOR
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_14P_5_F14_MEX_NOR
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_14P_6_F14_MEX_NOR
 62.5 297.5 126.867 148.87 -1 99 -2 0 0 0 0 0 0 0 # SizeSel_15P_1_F15_MEX_SOU
 -6 4 -5.98622 -4.56 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_15P_2_F15_MEX_SOU
 -1 9 7.32568 7.25 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_15P_3_F15_MEX_SOU
 -1 9 6.68226 7.61 -1 99 -3 0 0 0 0 0 0 0 # SizeSel_15P_4_F15_MEX_SOU
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_15P_5_F15_MEX_SOU
 -999 9 -999 -5 -1 99 -4 0 0 0 0 0 0 0 # SizeSel_15P_6_F15_MEX_SOU
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_16P_1_F16_WCPFC
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_16P_2_F16_WCPFC
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_17P_1_F17_IATTC
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_17P_2_F17_IATTC
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_18P_1_F18_JPN_SSII
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_18P_2_F18_JPN_SSII
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_19P_1_S1_US_SS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_19P_2_S1_US_SS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_20P_1_S2_US_DS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_20P_2_S2_US_DS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_21P_1_S3_TW_LRG
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_21P_2_S3_TW_LRG
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_22P_1_S4_JPN_SS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_22P_2_S4_JPN_SS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_23P_1_S5_JPN_RTV
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_23P_2_S5_JPN_RTV
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_24P_1_S6_JPN_OBS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_24P_2_S6_JPN_OBS
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_25P_1_S7_JPN_GEO
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_25P_2_S7_JPN_GEO
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_26P_1_S8_MEX
 -99 10 -99 1 -1 99 -99 0 0 0 0 0 0 0 # SizeSel_26P_2_S8_MEX
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_1P_1_F1_US_CA
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_1P_2_F1_US_CA
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_2P_1_F2_US_HI_SS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_2P_2_F2_US_HI_SS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_3P_1_F3_US_HI_DS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_3P_2_F3_US_HI_DS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_4P_1_F4_US_DGN
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_4P_2_F4_US_DGN
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_5P_1_F5_US_REC
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_5P_2_F5_US_REC
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_6P_1_F6_TW_LRG_N
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_6P_2_F6_TW_LRG_N
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_7P_1_F7_TW_LRG_S
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_7P_2_F7_TW_LRG_S
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_8P_1_F8_TW_SML
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_8P_2_F8_TW_SML
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_9P_1_F9_JPN_SS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_9P_2_F9_JPN_SS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_10P_1_F10_JPN_DS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_10P_2_F10_JPN_DS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_11P_1_F11_JPN_CST
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_11P_2_F11_JPN_CST
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_12P_1_F12_JPN_DFN
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_12P_2_F12_JPN_DFN
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_13P_1_F13_JPN_OTH
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_13P_2_F13_JPN_OTH
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_14P_1_F14_MEX_NOR
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_14P_2_F14_MEX_NOR
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_15P_1_F15_MEX_SOU
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_15P_2_F15_MEX_SOU
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_16P_1_F16_WCPFC
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_16P_2_F16_WCPFC
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_17P_1_F17_IATTC
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_17P_2_F17_IATTC
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_18P_1_F18_JPN_SSII
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_18P_2_F18_JPN_SSII
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_19P_1_S1_US_SS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_19P_2_S1_US_SS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_20P_1_S2_US_DS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_20P_2_S2_US_DS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_21P_1_S3_TW_LRG
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_21P_2_S3_TW_LRG
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_22P_1_S4_JPN_SS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_22P_2_S4_JPN_SS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_23P_1_S5_JPN_RTV
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_23P_2_S5_JPN_RTV
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_24P_1_S6_JPN_OBS
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_24P_2_S6_JPN_OBS
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_25P_1_S7_JPN_GEO
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_25P_2_S7_JPN_GEO
 0 10 0.01 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_26P_1_S8_MEX
 10 100 30 0 -1 99 -99 0 0 0 0 0 0 0 # AgeSel_26P_2_S8_MEX
#_Cond 0 #_custom_sel-env_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
#_Cond 0 #_custom_sel-blk_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no block usage
#_Cond No selex parm trends 
#_Cond -4 # placeholder for selparm_Dev_Phase
#_Cond 0 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_survey_CV
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
  0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2	0.2 #_mult_by_lencomp_N
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_mult_by_agecomp_N
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_mult_by_size-at-age_N
#
1 #_maxlambdaphase
1 #_sd_offset
#
58 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet/survey  phase  value  sizefreq_method
 1 1 1 0 1
 1 2 1 0 1
 1 3 1 0 1
 1 4 1 0 1
 1 5 1 0 1
 1 6 1 0 1
 1 7 1 0 1
 1 8 1 0 1
 1 9 1 0 1
 1 10 1 0 1
 1 11 1 0 1
 1 12 1 0 1
 1 13 1 0 1
 1 14 1 0 1
 1 15 1 0 1
 1 16 1 0 1
 1 17 1 0 1
 1 18 1 0 1
 1 19 1 1 1
 1 20 1 0 1
 1 21 1 0 1
 1 22 1 0 1
 1 23 1 0 1
 1 24 1 0 1
 1 25 1 0 1
 1 26 1 0 1
 4 1 1 0 0
 4 2 1 1 0
 4 3 1 1 0
 4 4 1 0 0
 4 5 1 0 0
 4 6 1 0 0
 4 7 1 0 0
 4 8 1 0 0
 4 9 1 1 0
 4 10 1 0 0
 4 11 1 0 0
 4 12 1 1 0
 4 13 1 0 0
 4 14 1 1 0
 4 15 1 1 0
 4 16 1 0 0
 4 17 1 0 0
 4 18 1 0 0
 4 19 1 0 0
 4 20 1 0 0
 4 21 1 0 0
 4 22 1 0 0
 4 23 1 0 0
 4 24 1 0 0
 4 25 1 0 0
 4 26 1 0 0
 6 4 1 1 2
 6 6 1 0 1
 7 4 1 0 0
 7 6 1 0 0
 11 1 1 0 0
 12 1 1 1 0
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  0 #_CPUE/survey:_6
#  0 #_CPUE/survey:_7
#  0 #_CPUE/survey:_8
#  0 #_CPUE/survey:_9
#  0 #_CPUE/survey:_10
#  0 #_CPUE/survey:_11
#  0 #_CPUE/survey:_12
#  0 #_CPUE/survey:_13
#  0 #_CPUE/survey:_14
#  0 #_CPUE/survey:_15
#  0 #_CPUE/survey:_16
#  0 #_CPUE/survey:_17
#  0 #_CPUE/survey:_18
#  0 #_CPUE/survey:_19
#  0 #_CPUE/survey:_20
#  0 #_CPUE/survey:_21
#  1 #_CPUE/survey:_22
#  0 #_CPUE/survey:_23
#  0 #_CPUE/survey:_24
#  0 #_CPUE/survey:_25
#  0 #_CPUE/survey:_26
#  0 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  0 #_lencomp:_4
#  0 #_lencomp:_5
#  0 #_lencomp:_6
#  0 #_lencomp:_7
#  0 #_lencomp:_8
#  1 #_lencomp:_9
#  0 #_lencomp:_10
#  0 #_lencomp:_11
#  1 #_lencomp:_12
#  0 #_lencomp:_13
#  1 #_lencomp:_14
#  1 #_lencomp:_15
#  0 #_lencomp:_16
#  0 #_lencomp:_17
#  0 #_lencomp:_18
#  0 #_lencomp:_19
#  0 #_lencomp:_20
#  0 #_lencomp:_21
#  0 #_lencomp:_22
#  0 #_lencomp:_23
#  0 #_lencomp:_24
#  0 #_lencomp:_25
#  0 #_lencomp:_26
#  0.07 #_sizefreq:_1
#  0 #_sizefreq:_2
#  1 #_init_equ_catch
#  1 #_recruitments
#  0 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

