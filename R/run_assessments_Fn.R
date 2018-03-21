

run_assessments = function(RootFile,
                           Species = "SM",
                           parmgrid,
                           RepE = RepE,
                           SSPlots = F) {
  message("building EM ", RepE, " at ", Sys.time())
  
  EMRep <- paste0(RootFile,
                  Species,
                  "_EM_",
                  RepE,
                  "_",
                  with(parmgrid[parmgrid$EM == RepE,],
                       paste0(parmgrid[parmgrid$EM == RepE,-1], collapse = "-")),
                  "\\")
  
  # Modify EM starter file
  Starter = SS_readstarter(file = paste0(EMRep, "starter.ss"), verbose = F)
  Starter[['init_values_src']] = 0 ## read from par
  Starter[['N_bootstraps']] = 1 ## fit with NO obs error
  SS_writestarter(
    mylist = Starter,
    dir = EMRep,
    overwrite = TRUE,
    verbose = F,
    warn = F
  )
  
  # # Modify EM PAR File [beta = SR_Parm2, sfrac = SR_parm3]
  # Lines = readLines(con = paste0(EMRep, "ss3.par"))
  # LOI <- grep("SR_parm", Lines)[c(2,3)] + 1
  # NewLine = strsplit(Lines[LOI], " ")
  # for (a in 1:length(NewLine)) {
  #   pName = Lines[grep("SR_parm", Lines)[c(2,3)]][a] ## get parameter name to ensure match
  #   NewLine[[a]] = parmgrid[parmgrid$EM == RepE, pName] ## reassign parameter name
  #   cat("replacing ", pName, "\n")
  #   Lines[LOI][a] = paste0(NewLine[[a]], collapse = " ")
  # } ## end newlines
  # writeLines(text = Lines,  con = paste0(EMRep, "ss3.par"))
  #
  
  
  # EMRep <- "G:\\MAKO\\mako_sim\\MAK_EM_105_1-0.9-1-5779\\"
  
  # Modify EM Control File [Nat Mort Vector]
  Lines = readLines(con = paste0(EMRep, "CONTROL.ss"))
  for (i in 1:2) {
    ## replace both lines
    LOI <-
      grep(" #_Age_natmort_by gender x growthpattern", Lines) + i ## get natM vector section
    NewLine = strsplit(Lines[LOI], " ") ## break into bits
    NewLine <- paste0(natVecs[parmgrid[parmgrid$EM == RepE, 4], ])
    Lines[LOI] <- paste0(NewLine, collapse = " ")
  }
  LOI <- grep(paste0(names(parmgrid[, 2:3]), collapse = "|"), Lines)
  NewLine = strsplit(Lines[LOI], " ") ## br
  for (a in 1:length(NewLine)) {
    pName <- names(parmgrid)[grep(last(NewLine[[a]]), names(parmgrid))]
    NewLine[[a]][c(3, 4)] <- parmgrid[parmgrid$EM == RepE, pName]
    # NewLine[[a]] = parmgrid[parmgrid$EM == RepE, pName] ## reassign parameter name
    cat("replacing ", pName, "\n")
    Lines[LOI][a] = paste0(NewLine[[a]], collapse = " ")
  } ## end newlines
  
  writeLines(text = Lines,  con = paste0(EMRep, "CONTROL.ss"))
  cat("Updated Natural Mortality Vector", "\n")
  
  ## update Binit (dat file)
  sDat = readLines(con = paste0(EMRep, "DATA.ss"))
  LOI <-  grep("init_equil", sDat) ## get natM vector section
  NewLine = strsplit(sDat[LOI], "\t") ##
  NewLine[[1]][9] <-
    parmgrid[parmgrid$EM == RepE, 'BINIT'] ## reassign parameter name
  sDat[LOI][[1]] <- paste0(NewLine[[1]], collapse = "\t")
  writeLines(text = sDat,  con = paste0(EMRep, "DATA.ss"))
  cat("Updated B_init", "\n")
  
  ## run in here
  setwd(EMRep)
  shell("ss3.exe -nohess")
  
  ## save plots
  if (SSPlots == T) {
  
  model_1 <- SS_output(EMRep,
                       covar = FALSE,
                       forecast = F,
                       ncols = 313)
  SS_plots(
    model_1,
    datplot = TRUE,
    pdf = T,
    png = FALSE,
    uncertainty = T,
    pwidth = 9,
    pheight = 9,
    rows = 2,
    cols = 2
  )
} ## end ssplots = T

}## end function
