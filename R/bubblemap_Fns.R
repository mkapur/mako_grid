
## Plot Heatmaps
heatmap_fn1 <- function(rootdir = NA,
                       subgroup = NA,
                       par1 = "BETA",
                       par2 = "SFRAC",
                       fillpar = 'RMSE_S4',
                       write = F) {

  df0 <-  na.omit(read.csv(paste0(rootdir, "results/management_quantities.csv")))
  # df0 <- read.csv("G:/MAKO/mako_sim-archive/FullRun_0306/results/management_quantities.csv")
  # df0 <-  na.omit(read.csv(paste0(RootFile, "results/management_quantities.csv")))
   df <-  aggregate(df0[, fillpar] ~ df0[, par1] + df0[,par2], FUN = mean) %>% 
    plyr::rename(c('df0[, par1]' = par1,
                   'df0[, par2]' = par2,
                   'df0[, fillpar]' = fillpar))
  
  df %>%  ggplot(., aes(x = .[, par1],
                        y =  .[, par2],
                        fill = .[, fillpar])) +
    theme_bw() +
    theme(
      panel.grid = element_blank(),
      panel.border = element_blank(),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      legend.title = element_text(size = 12),
      legend.key.size = unit(4, "line")
    ) +
    scale_x_continuous(breaks = unique(df[, par1]), expand = c(0, 0)) +
    labs(title = paste0("mean ",fillpar," for ", par2, " vs ", par1),
         fill = fillpar) +
    xlab(par1) +
    ylab(par2) +
    geom_tile() +
    scale_fill_distiller(palette = "Spectral", direction = 1) 
  ggsave(
    filename = paste0(rootdir, 'plots\\', fillpar, "_", par2, "_", par1, ".jpg"),
    plot = last_plot(),
    device = 'jpeg',
    path = NULL,
    scale = 1,
    width = 7,
    height = 5,
    units = "in",
    dpi = 1020,
    limitsize = TRUE
  )
}


heatmap_fn2 <- function(rootdir = NA,
                        subgroup = NA,
                        par1 = "BETA",
                        par2 = "BINIT",
                        fillpar = 'RMSE_S4',
                        write = F) {
  df0 <-  na.omit(read.csv(paste0(rootdir, "results/management_quantities.csv")))
  # df0 <-  na.omit(read.csv(paste0(RootFile, "results/management_quantities.csv")))
  # df0 <- read.csv("G:/MAKO/mako_sim-archive/FullRun_0306/results/management_quantities.csv") 
  df <-  aggregate(df0[, fillpar] ~ df0[, par1] + df0[,par2], FUN = mean) %>% 
    plyr::rename(c('df0[, par1]' = par1,
                   'df0[, par2]' = par2,
                   'df0[, fillpar]' = fillpar))

 df %>%  ggplot(., aes(x = as.factor(.[, par1]),
                        y =  as.factor(.[, par2]),
                        fill = .[, fillpar])) +

    theme_bw() +
    theme(
      panel.grid = element_blank(),
      panel.border = element_blank(),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      legend.title = element_text(size = 12),
      legend.key.size = unit(4, "line")
    ) +
    scale_x_discrete( breaks = unique(df[, par1]),expand = c(0, 0)) +
    scale_y_discrete(breaks = unique(df[,par2]), expand = c(0, 0)) +
    labs(title = paste0("mean ",fillpar, " for ", par2, " vs ", par1),
         fill = fillpar) +
    xlab(par1) +
    ylab(par2) +
    geom_tile() +
    scale_fill_distiller(palette = "Spectral", direction = 1) 

    ggsave(
    filename = paste0(rootdir, 'plots\\', fillpar, "_", par2, "_", par1, ".jpg"),
    plot = last_plot(),
    device = 'jpeg',
    path = NULL,
    scale = 1,
    width = 7,
    height = 5,
    units = "in",
    dpi = 1020,
    limitsize = TRUE
  )
}


statusplot1 <- function(rootdir = NA,
                        subgroup = NA,
                        par1 = "BETA",
                        par2 = "SFRAC",
                        fillpar = 'STATUS',
                        write = F) {
  df <-
    read.csv(paste0(rootdir, "results/management_quantities.csv")) %>%
    group_by(.[, par1], .[, par2]) %>%
    summarise(meanB = mean(SPB_SSBMSY), meanF = mean(F_FMSY)) %>%
    mutate('STATUS' = ifelse(
      meanB > 1 & meanF < 1,
      'green',
      ifelse(
        meanB < 1 &
          meanF > 1,
        'red',
        ifelse(meanB > 1  & meanF > 1, 'orange',
               "yellow")
      )
    )) %>%
    plyr::rename(c('.[, par1]' = par1,
                   '.[, par2]' = par2)) %>% as.data.frame()
  df %>%  ggplot(., aes(x = .[, par1],
                        y =  .[, par2],
                        fill = .[, fillpar])) +
    theme_bw() +
    theme(
      panel.grid = element_blank(),
      panel.border = element_blank(),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      legend.title = element_text(size = 12),
      legend.key.size = unit(4, "line")
    ) +
    scale_x_continuous(breaks = unique(df[, par1]), expand = c(0, 0)) +
    scale_fill_manual(values = c(
      'green' = 'darkseagreen',
      'red' = 'firebrick',
      'yellow' = 'gold',
      'orange' = 'orange'
    )) +
    labs(title = paste0(fillpar, " for ", par2, " vs ", par1),
         subtitle = "status based on mean biomass and harvest ratio",
         fill = fillpar) +
    xlab(par1) +
    ylab(par2) +
    geom_tile()
  ggsave(
    filename = paste0(rootdir, 'plots\\', fillpar, "_", par2, "_", par1, ".jpg"),
    plot = last_plot(),
    device = 'jpeg',
    path = NULL,
    scale = 1,
    width = 7,
    height = 5,
    units = "in",
    dpi = 1020,
    limitsize = TRUE
  )
  
}

statusplot2 <- function(rootdir = NA,
                        subgroup = NA,
                        par1 = "BETA",
                        par2 = "SFRAC",
                        fillpar = 'STATUS',
                        write = F) {
  df <-
    read.csv(paste0(rootdir, "results/management_quantities.csv")) %>%
    group_by(.[, par1], .[, par2]) %>%
    summarise(meanB = mean(SPB_SSBMSY), meanF = mean(F_FMSY)) %>%
    mutate('STATUS' = ifelse(
      meanB > 1 & meanF < 1,
      'green',
      ifelse(
        meanB < 1 &
          meanF > 1,
        'red',
        ifelse(meanB > 1  & meanF > 1, 'orange',
               "yellow")
      )
    )) %>%
    plyr::rename(c('.[, par1]' = par1,
                   '.[, par2]' = par2)) %>% as.data.frame()
  
  df %>%  ggplot(., aes(x = as.factor(.[, par1]),
                        y =  as.factor(.[, par2]),
                        fill = .[, fillpar])) +
    theme_bw() +
    theme(
      panel.grid = element_blank(),
      panel.border = element_blank(),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      legend.title = element_text(size = 12),
      legend.key.size = unit(4, "line")
    ) +
    scale_x_discrete( breaks = unique(df[, par1]),expand = c(0, 0)) +
    scale_y_discrete(breaks = unique(df[,par2]), expand = c(0, 0)) +
    scale_fill_manual(values = c(
      'green' = 'darkseagreen',
      'red' = 'firebrick',
      'yellow' = 'gold',
      'orange' = 'orange'
    )) +
    labs(title = paste0(fillpar, " for ", par2, " vs ", par1),
         subtitle = "status based on mean biomass and mean harvest ratio",
         fill = fillpar) +
    xlab(par1) +
    ylab(par2) +
    geom_tile()
  ggsave(
    filename = paste0(rootdir, 'plots\\', fillpar, "_", par2, "_", par1, ".jpg"),
    plot = last_plot(),
    device = 'jpeg',
    path = NULL,
    scale = 1,
    width = 7,
    height = 5,
    units = "in",
    dpi = 1020,
    limitsize = TRUE
  )
  
}



bubbleplot <- function(rootdir = NA,
                      subgroup = NA,
                      par1 = "BETA",
                      par2 = "SFRAC",
                      fillpar = "VECTOR",
                      sizepar = 'RMSE_S4',
                      write = F) {
  df <-  read.csv(paste0(rootdir, "results/management_quantities.csv"))
  # df <-  read.csv(paste0(RootFile, "results/management_quantities.csv"))
    # df <- read.csv("G:/MAKO/mako_sim-archive/FullRun_0306/results/management_quantities.csv")

  df %>%  
    ggplot(., aes(
    x = jitter(.[, par1]),
    y =  jitter(.[, par2]),
    col =  as.factor(.[, fillpar]),
    size = .[, sizepar]
  )) +
    theme_bw() +
    theme(
      panel.grid.minor = element_blank(),
      panel.border = element_blank(),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      legend.title = element_text(size = 12),
      # legend.key.size = unit(c(4,0), "line"),
      legend.justification = "top",
      legend.box.margin = unit(rep(0, 4), 'line'),
      legend.box.spacing = unit(0, "line")
    ) +
    labs(title = paste0(par2, " vs ", par1, " colored by ",fillpar),
         subtitle = paste0('"X" and bounding box indicate model with lowest ', 
                           sizepar),
         col = fillpar,
         size = sizepar) +
    xlab(par1) +
    ylab(par2) +
    
    guides(colour = guide_legend(override.aes = list(size = 10, pch = 15))) +
    scale_color_manual(values = c('dodgerblue','seagreen','grey22')) +
    ## shade in special box
    geom_rect(xmin = df[which.min(df[,sizepar]),par1]*0.85,
              xmax = df[which.min(df[,sizepar]),par1]*1.15,
              ymin = df[which.min(df[,sizepar]),par2]*0.95,
              ymax = df[which.min(df[,sizepar]),par2]*1.05,
              color = 'red', lwd = 0.8, fill = NA,
              show.legend = F) +
    geom_point() + ## add all points
    geom_point(data = df, aes(x =  df[which.min(df[,sizepar]),par1], 
                              y = df[which.min(df[,sizepar]),par2],
                              col = as.factor(.[, fillpar])), 
                              pch = 4, size = 5, stroke = 2, fill = 'black') 
  
  ggsave(
    filename = paste0(rootdir, 'plots\\',"bubble", sizepar, "_",fillpar, "_", par2, "_", par1, ".jpg"),
    plot = last_plot(),
    device = 'jpeg',
    path = NULL,
    scale = 1,
    width = 10,
    height = 8,
    units = "in",
    dpi = 1020,
    limitsize = TRUE
  )


  
}

loop_bubbles <- function(rootdir) {
  parcombos = t(combn(c('SFRAC', 'BETA', 'BINIT', 'VECTOR'), 3)) %>% data.frame()
  for (sp in c("LIKELIHOOD_SURVEY", 'RMSE_S4')) {
    for (i in 1:nrow(parcombos)) {
      bubbleplot(
        rootdir = rootdir,
        par1 = as.character(parcombos[i, 'X1']),
        par2 = as.character(parcombos[i, 'X2']),
        fillpar = as.character(parcombos[i, 'X3']),
        sizepar = sp,
        write = T
      )
    }
  }
}

loop_heat <- function(rootdir) {
  parcombos = t(combn(c('SFRAC', 'BETA','BINIT','VECTOR'), 2)) %>% data.frame()
  ## diagnostic & status plots
  for (fp in c("LIKELIHOOD_SURVEY",'RMSE_S4')) {
    for (i in 1:nrow(parcombos)) {

      # cat(paste0(parcombos[i,]),"\n")
      if (parcombos[i, 'X1'] == 'BINIT'  |
          parcombos[i, 'X2'] == 'BINIT') {
        ## special y axis scaling for binit
        heatmap_fn2(
          rootdir = rootdir,
          par1 = as.character(parcombos[i, 'X1']),
          par2 = as.character(parcombos[i, 'X2']),
          fillpar = fp,
          write = F
        )
        # statusplot2(
        #   rootdir = rootdir,
        #   par1 = as.character(parcombos[i, 'X1']),
        #   par2 = as.character(parcombos[i, 'X2']),
        #   fillpar = 'STATUS',
        #   write = F
        # )
      } else {
        heatmap_fn1(
          rootdir = rootdir,
          par1 = as.character(parcombos[i, 'X1']),
          par2 = as.character(parcombos[i, 'X2']),
          fillpar = fp,
          write = F
        )
        # statusplot1(
        #   rootdir = rootdir,
        #   par1 = as.character(parcombos[i, 'X1']),
        #   par2 = as.character(parcombos[i, 'X2']),
        #   fillpar = 'STATUS',
        #   write = F
        # )
      }
    } ## end parcombos
  } ## end response variables
} ## end function
