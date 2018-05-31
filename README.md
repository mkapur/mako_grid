# mako_grid
Grid of Uncertainty Simulation for 2018 Mako Shark Stock Assessment (Carvalho et al., 2018 / forthcoming)

This R code was used to explore alternative model configurations of different levels of complexity  in order to formulate a base model that would realistically describe the population dynamics of the Pacific Shortfin mako stock and would balance realism and parsimony.  The R code enclosed enables us to manipulate and execute SS3 models corresponding to all permutations of s_Frac, β, initial biomass, and sex-specific natural mortality vector. The results were tabulated and summarized visually with the RMSE for S4_JPN and the overall likelihood for models containing a given combination of patterns. Note that a few of the plotting functions used at the end of the simulation require the kaputils 'package' available <a href = "https://github.com/mkapur/kaputils"> here </href>

Materials in the sensitivityplots/ folder were used to generate separate visualizations of sensitivity runs based on biology, catch, and late-index uncertainty.
