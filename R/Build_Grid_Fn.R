Build_Grid_Fn <- function(beta = 1:4,
                          Sfrac = seq(0.5, 1, 0.05),
                          # M = c(0.22, 0.29),
                          M = rep(0.1,10),
                          Binit = c(1000, 2000, 10000)) {
  return(expand.grid(Sfrac, beta, M, Binit) %>%
           mutate('EM' = 1:nrow(.)) %>%
           plyr::rename(
             c(
               'Var1' = '# SR_surv_Sfrac',
               'Var2' = '# SR_surv_Beta',
               'Var3' = " #_Age_natmort_by gender x growthpattern",
               'Var4' = "BINIT"
             )
           )) %>%
    select(EM, everything())
}
