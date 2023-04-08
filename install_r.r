# install rstan
install.packages("rstan", type = "source")

dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, ifelse(.Platform$OS.type == "windows", "Makevars.win", "Makevars"))
if (!file.exists(M)) file.create(M)
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native",
    if( grepl("^darwin", R.version$os)) "CXX14FLAGS += -arch x86_64 -ftemplate-depth-256" else
    if (.Platform$OS.type == "windows") "CXX11FLAGS=-O3 -march=corei7 -mtune=corei7" else
    "CXX14FLAGS += -fPIC",
    file = M, sep = "\n", append = TRUE)

# install CMDSTAN_HOME
remotes::install_github("stan-dev/posterior")
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
install.packages(c("devtools",
"remotes",
"BiocManager"
), error = TRUE, dependencies = TRUE)

BiocManager::install(c("graph", "RBGL", "Rgraphviz"), update = TRUE, ask = FALSE)

# install R packages from CRAN
install.packages(c("memisc",
"imager",
"bayesplot",
"brms",
#"coda",
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
"rstanarm",
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
"googleComputeEngineR",
"googleCloudStorageR",
"future",
"checkpoint",
"packrat",
"VIM",
"mice",
"irr",
"DiagrammeR",
"magick",
"roxygen2md",
"googledrive",
"rdrop2",
"furrr",
"leaflet",
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
"equatiomatic",
"metaSEM",
"rticles",
"neuralnet",
"qlcMatrix",
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
"textmineR"
"text2vec"
), error = TRUE, dependencies = TRUE)
# install RMeCab
install.packages("RMeCab", repos = "https://rmecab.jp/R", type = "source")

# install R packages from GitHub
remotes::install_github(c("MathiasHarrer/dmetar",
"yihui/xaringan",
"ykunisato/jpaRmd",
"ykunisato/psyinfr",
"miraisolutions/compareWith",
"cjvanlissa/worcs",
"ropenscilabs/gramr",
"benmarwick/wordcountaddin",
"janajarecki/cognitivemodels"), dependencies = TRUE)
