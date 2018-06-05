## Simulated Grid of SS3 Assessment Runs
## M Kapur maia.kapur@noaa.gov
## Spring 2018

rm(list = ls())
set.seed(731)


library(r4ss); #devtools::install_github("r4ss/r4ss")
library(dplyr)
library(ThorsonUtilities); # devtools::install_github("james-thorson/utilities")
library(gtools)
library(RColorBrewer)
library(jpeg)
library(beepr)
library(doParallel)
library(parallel)
library(ggplot2)
install.packages( "G:\\kaputils",  repos = NULL, type = "source", dependencies = T)
library(kaputils)

RootFile = "G:\\MAKO\\mako_sim\\"
setwd(RootFile)
mapply(source, list.files(paste0(RootFile,"R/"), full.names=TRUE)) ## Load packages and R functions
verbose = FALSE
Species = "MAK"
SpeciesOM = paste0(RootFile,Species,"_OM/")

# Parameter MisSpec with "Grid of Uncertainty" ----
parmgrid0 <- Build_Grid_Fn(
  beta = 1:4,
  Sfrac = seq(0.7, 1, 0.1),
  Binit = c(3853,5000,5779),
  M = c("V1","V2","V3")
)
natVecs = rbind("V1" =  c("",0.3,0.2, rep(0.1,32-2)),
               "V2" = c("", rep(0.128,32)),
               "V3" = c("",rep(0.0801,32-6),0.0795,0.0785,
                        0.0777,0.769,0.72,0.749))

# parmgrid <- sample_n(parmgrid0,2) ## for testing - three random mods
parmgrid <- parmgrid0 ## do for real, uncomment this and comment line above (194 mods = 11 hrs)
# parmgrid <- parmgrid0[1,]

# sets up EM folders, misspec hasn't happened yet
# for(RepE in unique(parmgrid[,'EM'])){
#   SpeciesEM = paste0(RootFile,Species,"_EM_",RepE,"_", with(parmgrid[parmgrid$EM == RepE,],
#                                                         paste0(parmgrid[parmgrid$EM == RepE,-1],collapse = "-")),"\\")
#   dir.create(SpeciesEM, recursive = T)   ## make a new folder for this em
#   write.table(as.data.frame(parmgrid[parmgrid$EM == RepE,]), file = paste0(SpeciesEM,"parmgrid.txt"), sep = '\t', row.names = F)
#   file.copy(
#     from = paste0(
#       SpeciesOM,
#       list.files(SpeciesOM,
#                  pattern = "starter.ss|par|Report|forecast.ss|DATA|CONTROL|.exe")
#     ),
#     to = SpeciesEM,
#     overwrite = TRUE
#   )
# }

# Run Simulation - Use this if Parallel isn't working ----
p <- proc.time()
for(RepE in unique(parmgrid[50:nrow(parmgrid),"EM"])){
  run_assessments(RootFile, Species = Species, parmgrid, RepE = RepE)
} ## end RepE
proc.time() - p

## run in parralel ---
# ## approx 11 hrs for all 194 mods; 3.5 mins per model
# p <- proc.time()
# # Calculate the number of cores
# no_cores <- detectCores() - 1
# # Initiate cluster
# cl <- makeCluster(no_cores)
# foreach(RepE = unique(parmgrid[, "EM"]),
#         .combine = rbind,
#         .multicombine=FALSE)  %dopar%
#   run_assessments(RootFile, Species = Species, parmgrid = parmgrid, RepE = RepE, SSPlots = F)
# stopCluster(cl)
proc.time() - p

## Compile Results ----
## check in results/ folder for three CSVs
kaputils::extractResults_grid(rootdir = RootFile,
                    pattern = "MAK_",
                    writeTables = T,
                    ## subset fleets for CPUE csv
                    FleetName = c("S4_JPN_SS","S7_JPN_GEO","All")[1])


## Plotting ----
## CPUE panel plot - if only one fleet available in your CSV, you will only see one fleet on plots
cpue_results <- read.csv(paste0(RootFile,"\\results\\cpue.csv"))

kaputils::plotCPUE_panel(
  cpue_results,
  saveplot = F,
  mods = NA,
  plotloc = paste0(RootFile,"/plots/"),
  pdfrows = 1,
  pdfcols = 1
)

## F Trajectory Plot
SPRseries <-read.csv(paste0(RootFile,"/results/SPRseries.csv")) %>% 
  plyr::rename(c('Yr' = 'Year', 'F.Z.M' = 'F_std'))

## if mods = NA will plot all trajectories; legend only prints if less than 5 mods
kaputils::plotF(
  SPRseries,
  saveplot = F,
  mods = NA,
  plotloc = paste0(RootFile,"/plots/"),
  pdfrows = 1,
  pdfcols = 1
)

## Input Selectivity Panels by fleet: will plot panels in each EM folder
## this is sortof slow
# kaputils::plotInputSel(
#   rootdir = RootFile,
#   pattern = NA,
#   year = 2016,
#   lmin = 35,
#   lmax = 350,
#   linc = 5,
#   pdfrows = 3,
#   pdfcols = 2
# )

## SRR panel plot in plots/
kaputils::plotSRR_panel(
  rootdir = RootFile,
  saveplot = F,
  pattern = NA,
  plotloc = paste0(RootFile,"/plots/"),
  pdfrows = 3,
  pdfcols = 2
)

## Bubble plots and heatmaps

loop_heat(rootdir = RootFile) ## save all heat maps to plots/

loop_bubbles(rootdir = RootFile) ## save all bubbleplots to plots/

## SSB, spawnbio, and recdevs from r4ss
nEMs <- length(unique(parmgrid[,"EM"]))

kaputils::ss_compare(
  rootdir = RootFile,
  plotloc =  paste0(RootFile,"/plots/"),
  subplots = c(1, 3, 9),
  pattern = NA,
  llabels =  c(paste0(rep("EM",nEMs),1:nEMs),  "OM"),
  likeCSV = F,
  likeLabel = c('Surv_like', 'SizeFreq_like:_2'),
  lambdaLabel = c('Surv_lambda', 'SizeFreq_lambda:_2'),
  fishery = "Generalized Shark",
  dolegend = F
)

## plots panel kobe pdf to plots/ 
## can change pattern to a single model (e.g. "basecase")
kaputils::plotKobe_panel(
  rootdir = RootFile,
  pattern = "0.7-4",
  plotloc = paste0(RootFile,"/plots/"),
  plotrows = 2,
  plotcols = 3,
  saveplot = T)

## for grid - all on one
kaputils::plotKobe_compare(
  rootdir = RootFile,
  mq_csv = paste0(RootFile,"results\\management_quantities.csv"),
  b.name = 'SPB_SSBMSY',
  f.name = 'F_FMSY',
  pattern = "MAK_",
  subpattern = NA,
  plotloc = paste0(RootFile,"/plots/"),
  saveplot = T,
  doLegend = F)





# # Run Simulation in Parallel----
# ## approx 11 hrs for all 194 mods; 3.5 mins per model
# p <- proc.time()
# # Calculate the number of cores
# no_cores <- detectCores() - 1
# # Initiate cluster
# cl <- makeCluster(no_cores)
# foreach(RepE = unique(parmgrid[, "EM"]),
#         .combine = rbind,
#         .multicombine=FALSE)  %dopar%
#   run_assessments(RootFile, Species = Species, parmgrid = parmgrid, RepE = RepE, SSPlots = F)
# stopCluster(cl)
# proc.time() - p