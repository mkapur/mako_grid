

##With Hessian

 library(r4ss)
 model_5_dir <- "C:/Users/Felipe.Carvalho/Desktop/MAK_ISC/SD_MAK/Base-case/Size_Correct/March_14/Base_Case_S4"
 model_5 <- SS_output(model_5_dir, covar=FALSE,ncols = 500)
 SS_plots(model_5, datplot=TRUE,pdf=TRUE,png=FALSE,  uncertainty= T,pwidth=9, pheight=9, rows=2, cols=2)


###

(est <- cbind(Estimate = coef(tmp4), confint(tmp4)))
exp(est)


