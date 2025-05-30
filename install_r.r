# install R packages from CRAN
install.packages(c("memisc",
"tidyverse",
"rmarkdown",
"devtools",
"BiocManager",
"vroom",
"gert",
"tinytex",
"blogdown",
"distill",
"xaringan",
"imager",
"caret",
"car",
"e1071",
"Hmisc",
"GGally",
"ggmcmc",
"ggsci",
"gridExtra",
"ggridges",
"glmnet",
"kableExtra",
"lme4",
"ltm",
"loo",
"MASS",
"pixiedust",
"pROC",
"projpred",
"rstantools",
"shinystan",
"sigr",
"stargazer",
"stringr",
"tidybayes",
"viridis",
"psycho",
"psych",
"apaTables",
"future",
"checkpoint",
"packrat",
"VIM",
"mice",
"irr",
"brms",
"DiagrammeR",
"magick",
"roxygen2md",
"furrr",
"osfr",
"xaringanthemer",
"patchwork",
"pso",
"latex2exp",
"parameters",
"effectsize",
"insight",
"bayestestR",
"performance",
"see",
"correlation",
"rjags",
"Rsolnp",
"ReinforcementLearning",
"MDPtoolbox",
"rtdists",
"DstarM",
"hBayesDM",
"truncdist",
"statmod",
"pracma",
"snowfall",
"rlecuyer",
"vioplot",
"gemtc",
"netmeta",
"ggnetwork",
"qgraph",
"IsingFit",
"IsingSampler",
"mlVAR",
"graphicalVAR",
"bootnet",
"mgm",
"NetworkComparisonTest",
"networktools",
"gimme",
"NetworkToolbox",
"networktree",
"bnlearn",
"semPlot",
"EGAnet",
"ggExtra",
"jtools",
"bookdown",
"prereg",
"metaSEM",
"rticles",
"neuralnet",
"gtrendsR",
"rjson",
"keyring",
"reticulate",
"JuliaCall",
"psychonetrics",
"BGGM",
"getPass",
"fields",
"JuliaConnectoR",
"gtsummary",
"esc",
"ExpertChoice",
"support.CEs",
"DoE.base",
"skpr",
"gptstudio",
"catIrt",
"renv",
"papaja",
"ggdmc",
"GGMnonreg",
"DT",
"tm",
"topicmodels",
"wordcloud",
"pals",
"SnowballC",
"lda",
"ldatuning",
"flextable",
"LDATS",
"tidytext",
"textmineR",
"text2vec",
"bayesplot",
"effsize"), dependencies = TRUE)

BiocManager::install(c("graph", "RBGL", "Rgraphviz"), update = TRUE, ask = FALSE)

# install CMDSTAN_HOME
remotes::install_github("stan-dev/posterior")
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))


# install RMeCab
install.packages("RMeCab", repos = "https://rmecab.jp/R", type = "source")

# install R packages from GitHub
remotes::install_github(c("MathiasHarrer/dmetar",
"ykunisato/jpaRmd",
"ykunisato/psyinfr",
"dstanley4/apaTables"), dependencies = TRUE)