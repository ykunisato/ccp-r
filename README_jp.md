# Dockerfile of writing paper by R Markdown

これは，RstudioでR Markdownを用いて論文執筆を行う際に便利なパッケージやアドインを含めたDockerファイルのリポジトリです。本Dockerファイルは，rocker/rstudioをベースにしています. このDockerイメージのGithubリポジトリは[ykunisato/ccp-r](https://github.com/ykunisato/ccp-r)です。

作成者は専修大学人間科学部心理学科の国里愛彦です (ykunisato@psy.senshu-u.ac.jp)。エラーや追加してほしいパッケージなどがありましたら，気軽にご連絡ください。

Keywords: 心理学, 認知モデリング，心理学的ネットワーク分析，メタ分析，論文執筆，rstudio, rmarkdown, Quarto, cmdstan

## 使用法

Docker Desktopがインストールされていて，ある程度の通信速度があれば，数分で使用可能です。

1.Docker Desktop ( https://www.docker.com/products/docker-desktop )をインストールする。

2.ターミナル（Macの場合。Winはコマンドプロンプト)を開く

3.ターミナルに以下を打ち込んで、コンテナーをrunする(runの前にPullが自動的なされます)。パスワードとコンテナ名はご自身の好きなように設定ください。

**Mac(apple silicon)**


```
docker run -e PASSWORD=password -p 8787:8787 -v $(pwd):/home/rstudio -d --name ccpr ykunisato/ccp-r:latest-arm64
```
or

```
docker run -e PASSWORD=password -e DISABLE_AUTH=true -p 8787:8787 -v $(pwd):/home/rstudio -d --name ccpr ykunisato/ccp-r:latest-arm64
```

**Mac(intel)**


```
docker run -e PASSWORD=password -p 8787:8787 -v $(pwd):/home/rstudio -d --name ccpr ykunisato/ccp-r:latest-amd64
```
or

```
docker run -e PASSWORD=password -e DISABLE_AUTH=true -p 8787:8787 -v $(pwd):/home/rstudio -d --name ccpr ykunisato/ccp-r:latest-amd64
```

**Windows**


```
docker run -e PASSWORD=password -p 8787:8787 -v "%cd%":/home/rstudio -d --name ccpr ykunisato/ccp-r:latest
```


4.ブラウザを開いて，urlバー（アドレスバー）に，http://localhost:8787/ とタイプする

5.ブラウザ上にRstudioが出てくるので，IDにrstudio，パスに上記で設定したパスワードをいれる。

## オプション的な使用法

1. cmdstanを使う場合は，以下のコードをRstudioのRコンソール上で実行してください。

```
cmdstanr::install_cmdstan(cores = 2)
```

cmdstanがインストールできたら, 以下のコードをRstudioのRコンソール上で実行して，動作確認をしてください(コードは[cmdstanrのウェブサイト](https://mc-stan.org/cmdstanr/articles/cmdstanr.html)を参照しています).


```
# packages
library(cmdstanr)
library(posterior)
library(bayesplot)
color_scheme_set("brightblue")
# Compiling a model
file <- file.path(cmdstan_path(), "examples", "bernoulli", "bernoulli.stan")
mod <- cmdstan_model(file)
# Running MCMC
data_list <- list(N = 10, y = c(0,1,0,0,0,0,0,0,0,1))

fit <- mod$sample(
  data = data_list,
  seed = 123,
  chains = 4,
  parallel_chains = 4,
  refresh = 500 # print update every 500 iters
)
# Result
fit$summary()
mcmc_hist(fit$draws("theta"))
```

2. tinytexを使う場合は，以下のコードをRstudioのRコンソール上で実行してください。

```
tinytex::install_tinytex()
```

## List of installed packages

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Package</th>
<th style="text-align: left;">Version</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">abind</td>
<td style="text-align: left;">1.4-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">acepack</td>
<td style="text-align: left;">1.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">admisc</td>
<td style="text-align: left;">0.34</td>
</tr>
<tr class="even">
<td style="text-align: left;">AER</td>
<td style="text-align: left;">1.2-12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">afex</td>
<td style="text-align: left;">1.3-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">AlgDesign</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">alr4</td>
<td style="text-align: left;">1.0.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">antiword</td>
<td style="text-align: left;">1.3.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">anytime</td>
<td style="text-align: left;">0.3.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">aod</td>
<td style="text-align: left;">1.3.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">apaTables</td>
<td style="text-align: left;">2.0.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">ape</td>
<td style="text-align: left;">5.7-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">archive</td>
<td style="text-align: left;">1.1.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">arm</td>
<td style="text-align: left;">1.13-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">arrayhelpers</td>
<td style="text-align: left;">1.1-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">AsioHeaders</td>
<td style="text-align: left;">1.22.1-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">askpass</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">assertthat</td>
<td style="text-align: left;">0.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">assortnet</td>
<td style="text-align: left;">0.20</td>
</tr>
<tr class="even">
<td style="text-align: left;">av</td>
<td style="text-align: left;">0.9.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">backports</td>
<td style="text-align: left;">1.4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">bain</td>
<td style="text-align: left;">0.2.10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">base64enc</td>
<td style="text-align: left;">0.1-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">BayesFactor</td>
<td style="text-align: left;">0.9.12-4.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BayesFM</td>
<td style="text-align: left;">0.1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">bayesplot</td>
<td style="text-align: left;">1.11.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bayesQR</td>
<td style="text-align: left;">2.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">bayestestR</td>
<td style="text-align: left;">0.13.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bbmle</td>
<td style="text-align: left;">1.0.25.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">BDgraph</td>
<td style="text-align: left;">2.72</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bdsmatrix</td>
<td style="text-align: left;">1.3-7</td>
</tr>
<tr class="even">
<td style="text-align: left;">beeswarm</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bench</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">benchmarkme</td>
<td style="text-align: left;">1.0.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">benchmarkmeData</td>
<td style="text-align: left;">1.0.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">Bergm</td>
<td style="text-align: left;">5.0.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bestglm</td>
<td style="text-align: left;">0.37.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">betareg</td>
<td style="text-align: left;">3.1-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BFpack</td>
<td style="text-align: left;">1.2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">BGGM</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BH</td>
<td style="text-align: left;">1.84.0-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">BiasedUrn</td>
<td style="text-align: left;">2.0.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bife</td>
<td style="text-align: left;">0.7.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">bigassertr</td>
<td style="text-align: left;">0.1.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bigD</td>
<td style="text-align: left;">0.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">biglm</td>
<td style="text-align: left;">0.9-2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bigmemory</td>
<td style="text-align: left;">4.6.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">bigmemory.sri</td>
<td style="text-align: left;">0.1.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bigparallelr</td>
<td style="text-align: left;">0.3.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">bigutilsr</td>
<td style="text-align: left;">0.3.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bindr</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">bindrcpp</td>
<td style="text-align: left;">0.2.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">binom</td>
<td style="text-align: left;">1.1-1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">BiocGenerics</td>
<td style="text-align: left;">0.48.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BiocManager</td>
<td style="text-align: left;">1.30.22</td>
</tr>
<tr class="even">
<td style="text-align: left;">BiocVersion</td>
<td style="text-align: left;">3.18.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bit</td>
<td style="text-align: left;">4.0.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">bit64</td>
<td style="text-align: left;">4.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bitops</td>
<td style="text-align: left;">1.0-7</td>
</tr>
<tr class="even">
<td style="text-align: left;">blavaan</td>
<td style="text-align: left;">0.5-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">blme</td>
<td style="text-align: left;">1.0-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">blob</td>
<td style="text-align: left;">1.2.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">blogdown</td>
<td style="text-align: left;">1.19</td>
</tr>
<tr class="even">
<td style="text-align: left;">bmp</td>
<td style="text-align: left;">0.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bnlearn</td>
<td style="text-align: left;">4.9.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">bookdown</td>
<td style="text-align: left;">0.37</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bootnet</td>
<td style="text-align: left;">1.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">BradleyTerry2</td>
<td style="text-align: left;">1.1-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">brew</td>
<td style="text-align: left;">1.0-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">brglm</td>
<td style="text-align: left;">0.7.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">brglm2</td>
<td style="text-align: left;">0.9.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">bridgesampling</td>
<td style="text-align: left;">1.1-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">brio</td>
<td style="text-align: left;">1.1.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">brms</td>
<td style="text-align: left;">2.20.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Brobdingnag</td>
<td style="text-align: left;">1.2-9</td>
</tr>
<tr class="even">
<td style="text-align: left;">broom</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">broom.helpers</td>
<td style="text-align: left;">1.14.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">broom.mixed</td>
<td style="text-align: left;">0.2.9.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bslib</td>
<td style="text-align: left;">0.6.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">BWStest</td>
<td style="text-align: left;">0.2.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cachem</td>
<td style="text-align: left;">1.0.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">cAIC4</td>
<td style="text-align: left;">1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Cairo</td>
<td style="text-align: left;">1.6-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">callr</td>
<td style="text-align: left;">3.7.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">candisc</td>
<td style="text-align: left;">0.8-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">car</td>
<td style="text-align: left;">3.1-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">carData</td>
<td style="text-align: left;">3.0-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">caret</td>
<td style="text-align: left;">6.0-94</td>
</tr>
<tr class="odd">
<td style="text-align: left;">carrier</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">catIrt</td>
<td style="text-align: left;">0.5.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">caTools</td>
<td style="text-align: left;">1.18.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">catR</td>
<td style="text-align: left;">3.17</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cccp</td>
<td style="text-align: left;">0.3-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">cellranger</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">censReg</td>
<td style="text-align: left;">0.5-36</td>
</tr>
<tr class="even">
<td style="text-align: left;">cgam</td>
<td style="text-align: left;">1.21</td>
</tr>
<tr class="odd">
<td style="text-align: left;">changepoint</td>
<td style="text-align: left;">2.2.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">checkmate</td>
<td style="text-align: left;">2.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">checkpoint</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">chemometrics</td>
<td style="text-align: left;">1.4.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">chromote</td>
<td style="text-align: left;">0.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">chron</td>
<td style="text-align: left;">2.3-61</td>
</tr>
<tr class="odd">
<td style="text-align: left;">classInt</td>
<td style="text-align: left;">0.4-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">cleanrmd</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cli</td>
<td style="text-align: left;">3.6.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">clipr</td>
<td style="text-align: left;">0.8.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">clisymbols</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">clock</td>
<td style="text-align: left;">0.7.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">clubSandwich</td>
<td style="text-align: left;">0.5.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">clue</td>
<td style="text-align: left;">0.3-65</td>
</tr>
<tr class="odd">
<td style="text-align: left;">clusterGeneration</td>
<td style="text-align: left;">1.3.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">cmdstanr</td>
<td style="text-align: left;">0.7.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cmprsk</td>
<td style="text-align: left;">2.2-11</td>
</tr>
<tr class="even">
<td style="text-align: left;">cocor</td>
<td style="text-align: left;">1.1-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">coda</td>
<td style="text-align: left;">0.19-4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">coin</td>
<td style="text-align: left;">1.4-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">collapse</td>
<td style="text-align: left;">2.0.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">colorspace</td>
<td style="text-align: left;">2.1-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">colourpicker</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">combinat</td>
<td style="text-align: left;">0.0-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">commonmark</td>
<td style="text-align: left;">1.9.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">CompQuadForm</td>
<td style="text-align: left;">1.4.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">coneproj</td>
<td style="text-align: left;">1.17</td>
</tr>
<tr class="even">
<td style="text-align: left;">conf.design</td>
<td style="text-align: left;">2.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">conflicted</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">contfrac</td>
<td style="text-align: left;">1.1-12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">corpcor</td>
<td style="text-align: left;">1.6.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">correlation</td>
<td style="text-align: left;">0.8.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">corrplot</td>
<td style="text-align: left;">0.92</td>
</tr>
<tr class="even">
<td style="text-align: left;">covr</td>
<td style="text-align: left;">3.6.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cowplot</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">cplm</td>
<td style="text-align: left;">0.7-12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cpm</td>
<td style="text-align: left;">2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">cpp11</td>
<td style="text-align: left;">0.4.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">crayon</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">crch</td>
<td style="text-align: left;">1.1-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">credentials</td>
<td style="text-align: left;">2.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">crosstalk</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">crul</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">cubature</td>
<td style="text-align: left;">2.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Cubist</td>
<td style="text-align: left;">0.4.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">curl</td>
<td style="text-align: left;">5.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">CVST</td>
<td style="text-align: left;">0.2-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">CVXR</td>
<td style="text-align: left;">1.0-12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cyclocomp</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">data.table</td>
<td style="text-align: left;">1.15.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">data.tree</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">datawizard</td>
<td style="text-align: left;">0.9.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DBI</td>
<td style="text-align: left;">1.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">dbplyr</td>
<td style="text-align: left;">2.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dbscan</td>
<td style="text-align: left;">1.1-12</td>
</tr>
<tr class="even">
<td style="text-align: left;">deldir</td>
<td style="text-align: left;">2.0-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dendextend</td>
<td style="text-align: left;">1.17.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">DEoptim</td>
<td style="text-align: left;">2.2-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DEoptimR</td>
<td style="text-align: left;">1.1-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">Deriv</td>
<td style="text-align: left;">4.1.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">desc</td>
<td style="text-align: left;">1.4.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">deSolve</td>
<td style="text-align: left;">1.40</td>
</tr>
<tr class="odd">
<td style="text-align: left;">devtools</td>
<td style="text-align: left;">2.4.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">dfidx</td>
<td style="text-align: left;">0.0-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dfoptim</td>
<td style="text-align: left;">2023.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">diagram</td>
<td style="text-align: left;">1.6.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DiagrammeR</td>
<td style="text-align: left;">1.0.11</td>
</tr>
<tr class="even">
<td style="text-align: left;">DiagrammeRsvg</td>
<td style="text-align: left;">0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DiceDesign</td>
<td style="text-align: left;">1.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">dichromat</td>
<td style="text-align: left;">2.0-0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">diffobj</td>
<td style="text-align: left;">0.3.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">digest</td>
<td style="text-align: left;">0.6.34</td>
</tr>
<tr class="odd">
<td style="text-align: left;">diptest</td>
<td style="text-align: left;">0.77-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">distill</td>
<td style="text-align: left;">1.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distributional</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">dmetar</td>
<td style="text-align: left;">0.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">doconv</td>
<td style="text-align: left;">0.3.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">docopt</td>
<td style="text-align: left;">0.7.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DoE.base</td>
<td style="text-align: left;">1.2-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">DoE.wrapper</td>
<td style="text-align: left;">0.12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">doFuture</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">domir</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">doParallel</td>
<td style="text-align: left;">1.0.17</td>
</tr>
<tr class="even">
<td style="text-align: left;">doRNG</td>
<td style="text-align: left;">1.8.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dotCall64</td>
<td style="text-align: left;">1.1-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">dotwhisker</td>
<td style="text-align: left;">0.7.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">downlit</td>
<td style="text-align: left;">0.4.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">downloader</td>
<td style="text-align: left;">0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dplyr</td>
<td style="text-align: left;">1.1.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">drc</td>
<td style="text-align: left;">3.0-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dreamerr</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">DRR</td>
<td style="text-align: left;">0.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DstarM</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">DT</td>
<td style="text-align: left;">0.32</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dtplyr</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">dygraphs</td>
<td style="text-align: left;">1.1.1.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">e1071</td>
<td style="text-align: left;">1.7-14</td>
</tr>
<tr class="even">
<td style="text-align: left;">earth</td>
<td style="text-align: left;">5.3.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ECOSolveR</td>
<td style="text-align: left;">0.5.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">effects</td>
<td style="text-align: left;">4.2-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">effectsize</td>
<td style="text-align: left;">0.8.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">EGAnet</td>
<td style="text-align: left;">2.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">egg</td>
<td style="text-align: left;">0.4.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">eigenmodel</td>
<td style="text-align: left;">1.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ellipse</td>
<td style="text-align: left;">0.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ellipsis</td>
<td style="text-align: left;">0.3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">elliptic</td>
<td style="text-align: left;">1.4-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">emmeans</td>
<td style="text-align: left;">1.10.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">energy</td>
<td style="text-align: left;">1.7-11</td>
</tr>
<tr class="even">
<td style="text-align: left;">enrichwith</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">epiR</td>
<td style="text-align: left;">2.0.68</td>
</tr>
<tr class="even">
<td style="text-align: left;">equatags</td>
<td style="text-align: left;">0.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ergm</td>
<td style="text-align: left;">4.6.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">esc</td>
<td style="text-align: left;">0.5.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">estimability</td>
<td style="text-align: left;">1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">estimatr</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">evaluate</td>
<td style="text-align: left;">0.23</td>
</tr>
<tr class="even">
<td style="text-align: left;">evd</td>
<td style="text-align: left;">2.3-6.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ExpertChoice</td>
<td style="text-align: left;">0.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">expm</td>
<td style="text-align: left;">0.999-9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">extraDistr</td>
<td style="text-align: left;">1.10.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">extrafont</td>
<td style="text-align: left;">0.19</td>
</tr>
<tr class="odd">
<td style="text-align: left;">extrafontdb</td>
<td style="text-align: left;">1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">factoextra</td>
<td style="text-align: left;">1.0.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FactoMineR</td>
<td style="text-align: left;">2.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">fansi</td>
<td style="text-align: left;">1.0.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">far</td>
<td style="text-align: left;">0.6-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">faraway</td>
<td style="text-align: left;">1.0.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">farver</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fastDummies</td>
<td style="text-align: left;">1.7.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fastGHQuad</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fastICA</td>
<td style="text-align: left;">1.2-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fastmap</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fastmatch</td>
<td style="text-align: left;">1.1-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fauxpas</td>
<td style="text-align: left;">0.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">fdrtool</td>
<td style="text-align: left;">1.2.17</td>
</tr>
<tr class="odd">
<td style="text-align: left;">feather</td>
<td style="text-align: left;">0.3.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">feisr</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fields</td>
<td style="text-align: left;">15.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">filehash</td>
<td style="text-align: left;">2.4-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">filelock</td>
<td style="text-align: left;">1.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">fitdistrplus</td>
<td style="text-align: left;">1.1-11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fixest</td>
<td style="text-align: left;">0.11.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">flashClust</td>
<td style="text-align: left;">1.01-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">flexmix</td>
<td style="text-align: left;">2.3-19</td>
</tr>
<tr class="even">
<td style="text-align: left;">flextable</td>
<td style="text-align: left;">0.9.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">float</td>
<td style="text-align: left;">0.3-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">flock</td>
<td style="text-align: left;">0.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fmsb</td>
<td style="text-align: left;">0.7.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">FNN</td>
<td style="text-align: left;">1.1.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">foghorn</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">fontawesome</td>
<td style="text-align: left;">0.5.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fontBitstreamVera</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fontLiberation</td>
<td style="text-align: left;">0.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fontquiver</td>
<td style="text-align: left;">0.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">forcats</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">foreach</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">forecast</td>
<td style="text-align: left;">8.21.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">formattable</td>
<td style="text-align: left;">0.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">Formula</td>
<td style="text-align: left;">1.2-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">formula.tools</td>
<td style="text-align: left;">1.7.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fpc</td>
<td style="text-align: left;">2.2-11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fracdiff</td>
<td style="text-align: left;">1.5-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">FrF2</td>
<td style="text-align: left;">2.3-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fs</td>
<td style="text-align: left;">1.6.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">ftExtra</td>
<td style="text-align: left;">0.6.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fungible</td>
<td style="text-align: left;">2.4.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">furrr</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">future</td>
<td style="text-align: left;">1.33.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">future.apply</td>
<td style="text-align: left;">1.11.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">future.callr</td>
<td style="text-align: left;">0.8.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">fxregime</td>
<td style="text-align: left;">1.0-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">GA</td>
<td style="text-align: left;">3.2.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">gam</td>
<td style="text-align: left;">1.22-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gamlss</td>
<td style="text-align: left;">5.4-20</td>
</tr>
<tr class="even">
<td style="text-align: left;">gamlss.data</td>
<td style="text-align: left;">6.0-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gamlss.dist</td>
<td style="text-align: left;">6.1-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">gamm4</td>
<td style="text-align: left;">0.2-6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gapminder</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">gargle</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gbm</td>
<td style="text-align: left;">2.1.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">gdata</td>
<td style="text-align: left;">3.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gdtools</td>
<td style="text-align: left;">0.3.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">gee</td>
<td style="text-align: left;">4.13-26</td>
</tr>
<tr class="odd">
<td style="text-align: left;">geepack</td>
<td style="text-align: left;">1.3.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">gemtc</td>
<td style="text-align: left;">1.0-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">generics</td>
<td style="text-align: left;">0.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">geoR</td>
<td style="text-align: left;">1.9-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">geosphere</td>
<td style="text-align: left;">1.5-18</td>
</tr>
<tr class="even">
<td style="text-align: left;">gert</td>
<td style="text-align: left;">2.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">getPass</td>
<td style="text-align: left;">0.2-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">gfonts</td>
<td style="text-align: left;">0.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">GGally</td>
<td style="text-align: left;">2.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">gganimate</td>
<td style="text-align: left;">1.0.9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggdist</td>
<td style="text-align: left;">3.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggdmc</td>
<td style="text-align: left;">0.2.6.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggeffects</td>
<td style="text-align: left;">1.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggExtra</td>
<td style="text-align: left;">0.10.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggforce</td>
<td style="text-align: left;">0.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggfortify</td>
<td style="text-align: left;">0.4.16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggmcmc</td>
<td style="text-align: left;">1.5.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">GGMncv</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">GGMnonreg</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggnetwork</td>
<td style="text-align: left;">0.5.13</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggplot2</td>
<td style="text-align: left;">3.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggplot2movies</td>
<td style="text-align: left;">0.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggpubr</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggraph</td>
<td style="text-align: left;">2.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggrepel</td>
<td style="text-align: left;">0.9.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggridges</td>
<td style="text-align: left;">0.5.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggsci</td>
<td style="text-align: left;">3.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggside</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggsignif</td>
<td style="text-align: left;">0.6.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggstance</td>
<td style="text-align: left;">0.3.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggstats</td>
<td style="text-align: left;">0.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggtext</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggthemes</td>
<td style="text-align: left;">5.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">gh</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gifski</td>
<td style="text-align: left;">1.12.0-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">gimme</td>
<td style="text-align: left;">0.7-16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gitcreds</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">glasso</td>
<td style="text-align: left;">1.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">glassoFast</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">glba</td>
<td style="text-align: left;">0.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">GLMMadaptive</td>
<td style="text-align: left;">0.9-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">glmmML</td>
<td style="text-align: left;">1.1.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">glmmTMB</td>
<td style="text-align: left;">1.1.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">glmnet</td>
<td style="text-align: left;">4.1-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">globals</td>
<td style="text-align: left;">0.16.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">glue</td>
<td style="text-align: left;">1.7.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gmailr</td>
<td style="text-align: left;">2.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">gmnl</td>
<td style="text-align: left;">1.1-3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gmp</td>
<td style="text-align: left;">0.7-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">gnm</td>
<td style="text-align: left;">1.1-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">googledrive</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">googlesheets4</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gower</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">GPArotation</td>
<td style="text-align: left;">2024.3-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gplots</td>
<td style="text-align: left;">3.1.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">gptstudio</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gRain</td>
<td style="text-align: left;">1.4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">graph</td>
<td style="text-align: left;">1.80.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">graphicalVAR</td>
<td style="text-align: left;">0.3.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">graphlayouts</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gRbase</td>
<td style="text-align: left;">2.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">gridBase</td>
<td style="text-align: left;">0.4-7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gridExtra</td>
<td style="text-align: left;">2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">gridGraphics</td>
<td style="text-align: left;">0.5-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gridtext</td>
<td style="text-align: left;">0.1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">grpreg</td>
<td style="text-align: left;">3.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gsl</td>
<td style="text-align: left;">2.1-8</td>
</tr>
<tr class="even">
<td style="text-align: left;">gsubfn</td>
<td style="text-align: left;">0.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gt</td>
<td style="text-align: left;">0.10.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">gtable</td>
<td style="text-align: left;">0.3.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gtools</td>
<td style="text-align: left;">3.9.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">gtrendsR</td>
<td style="text-align: left;">1.5.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gtsummary</td>
<td style="text-align: left;">1.7.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">hardhat</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">hash</td>
<td style="text-align: left;">2.2.6.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">haven</td>
<td style="text-align: left;">2.5.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">hBayesDM</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">heplots</td>
<td style="text-align: left;">1.6.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">here</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">hexbin</td>
<td style="text-align: left;">1.28.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">highr</td>
<td style="text-align: left;">0.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">Hmisc</td>
<td style="text-align: left;">5.1-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">hms</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">HSAUR3</td>
<td style="text-align: left;">1.0-14</td>
</tr>
<tr class="odd">
<td style="text-align: left;">htmlTable</td>
<td style="text-align: left;">2.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">htmltools</td>
<td style="text-align: left;">0.5.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">htmlwidgets</td>
<td style="text-align: left;">1.6.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">httpcode</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">httpuv</td>
<td style="text-align: left;">1.6.14</td>
</tr>
<tr class="even">
<td style="text-align: left;">httr</td>
<td style="text-align: left;">1.4.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">httr2</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">huge</td>
<td style="text-align: left;">1.3.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">humaniformat</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">hunspell</td>
<td style="text-align: left;">3.0.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">huxtable</td>
<td style="text-align: left;">5.5.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">hypergeo</td>
<td style="text-align: left;">1.2-13</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ICS</td>
<td style="text-align: left;">1.4-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ICSOutlier</td>
<td style="text-align: left;">0.4-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ids</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">igraph</td>
<td style="text-align: left;">2.0.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">imager</td>
<td style="text-align: left;">0.45.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">imputeTS</td>
<td style="text-align: left;">3.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ini</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">inline</td>
<td style="text-align: left;">0.3.19</td>
</tr>
<tr class="odd">
<td style="text-align: left;">insight</td>
<td style="text-align: left;">0.19.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">intergraph</td>
<td style="text-align: left;">2.0-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">interp</td>
<td style="text-align: left;">1.1-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">inum</td>
<td style="text-align: left;">1.0-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ipred</td>
<td style="text-align: left;">0.9-14</td>
</tr>
<tr class="even">
<td style="text-align: left;">IRdisplay</td>
<td style="text-align: left;">1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">irr</td>
<td style="text-align: left;">0.84.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">irtoys</td>
<td style="text-align: left;">0.2.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">IsingFit</td>
<td style="text-align: left;">0.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">IsingSampler</td>
<td style="text-align: left;">0.2.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ISLR</td>
<td style="text-align: left;">1.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">isoband</td>
<td style="text-align: left;">0.2.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ISOcodes</td>
<td style="text-align: left;">2024.02.12</td>
</tr>
<tr class="even">
<td style="text-align: left;">ISwR</td>
<td style="text-align: left;">2.0-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">iterators</td>
<td style="text-align: left;">1.0.14</td>
</tr>
<tr class="even">
<td style="text-align: left;">ivprobit</td>
<td style="text-align: left;">1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ivreg</td>
<td style="text-align: left;">0.6-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">jagsUI</td>
<td style="text-align: left;">1.6.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">janeaustenr</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">JM</td>
<td style="text-align: left;">1.5-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">jomo</td>
<td style="text-align: left;">2.7-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">jpaRmd</td>
<td style="text-align: left;">0.5.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">jpeg</td>
<td style="text-align: left;">0.1-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">jquerylib</td>
<td style="text-align: left;">0.1.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">jsonlite</td>
<td style="text-align: left;">1.8.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">jtools</td>
<td style="text-align: left;">2.2.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">juicyjuice</td>
<td style="text-align: left;">0.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">JuliaCall</td>
<td style="text-align: left;">0.17.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">JuliaConnectoR</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">kableExtra</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">katex</td>
<td style="text-align: left;">1.4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">kernlab</td>
<td style="text-align: left;">0.9-32</td>
</tr>
<tr class="odd">
<td style="text-align: left;">keyring</td>
<td style="text-align: left;">1.3.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">klaR</td>
<td style="text-align: left;">1.7-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">knitr</td>
<td style="text-align: left;">1.45</td>
</tr>
<tr class="even">
<td style="text-align: left;">ks</td>
<td style="text-align: left;">1.14.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">kSamples</td>
<td style="text-align: left;">1.2-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">kutils</td>
<td style="text-align: left;">1.73</td>
</tr>
<tr class="odd">
<td style="text-align: left;">labeling</td>
<td style="text-align: left;">0.4.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">labelled</td>
<td style="text-align: left;">2.12.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">labelVector</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">laeken</td>
<td style="text-align: left;">0.5.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">LaplacesDemon</td>
<td style="text-align: left;">16.1.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">lars</td>
<td style="text-align: left;">1.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">later</td>
<td style="text-align: left;">1.3.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">latex2exp</td>
<td style="text-align: left;">0.9.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">latticeExtra</td>
<td style="text-align: left;">0.6-30</td>
</tr>
<tr class="even">
<td style="text-align: left;">lava</td>
<td style="text-align: left;">1.7.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lavaan</td>
<td style="text-align: left;">0.6-17</td>
</tr>
<tr class="even">
<td style="text-align: left;">lavaSearch2</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lazyeval</td>
<td style="text-align: left;">0.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">lda</td>
<td style="text-align: left;">1.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">LDATS</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ldatuning</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">leaps</td>
<td style="text-align: left;">3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">lfe</td>
<td style="text-align: left;">3.0-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lgr</td>
<td style="text-align: left;">0.4.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">lhs</td>
<td style="text-align: left;">1.1.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">libcoin</td>
<td style="text-align: left;">1.0-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">lifecycle</td>
<td style="text-align: left;">1.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">linprog</td>
<td style="text-align: left;">0.9-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">lintr</td>
<td style="text-align: left;">3.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lisrelToR</td>
<td style="text-align: left;">0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">listenv</td>
<td style="text-align: left;">0.9.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">littler</td>
<td style="text-align: left;">0.3.19</td>
</tr>
<tr class="even">
<td style="text-align: left;">lm.beta</td>
<td style="text-align: left;">1.7-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lme4</td>
<td style="text-align: left;">1.1-35.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">lmerTest</td>
<td style="text-align: left;">3.1-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lmtest</td>
<td style="text-align: left;">0.9-40</td>
</tr>
<tr class="even">
<td style="text-align: left;">lobstr</td>
<td style="text-align: left;">1.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">locatexec</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">logcondens</td>
<td style="text-align: left;">2.1.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">logger</td>
<td style="text-align: left;">0.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">logging</td>
<td style="text-align: left;">0.10-108</td>
</tr>
<tr class="odd">
<td style="text-align: left;">logistf</td>
<td style="text-align: left;">1.26.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">logitr</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">logspline</td>
<td style="text-align: left;">2.1.21</td>
</tr>
<tr class="even">
<td style="text-align: left;">loo</td>
<td style="text-align: left;">2.7.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lpSolve</td>
<td style="text-align: left;">5.6.20</td>
</tr>
<tr class="even">
<td style="text-align: left;">lpSolveAPI</td>
<td style="text-align: left;">5.5.2.0-17.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lqmm</td>
<td style="text-align: left;">1.5.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">ltm</td>
<td style="text-align: left;">1.2-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lubridate</td>
<td style="text-align: left;">1.9.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">magic</td>
<td style="text-align: left;">1.6-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">magick</td>
<td style="text-align: left;">2.8.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">magrittr</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mallet</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">mapproj</td>
<td style="text-align: left;">1.2.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">maps</td>
<td style="text-align: left;">3.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">marginaleffects</td>
<td style="text-align: left;">0.18.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">margins</td>
<td style="text-align: left;">0.3.26</td>
</tr>
<tr class="even">
<td style="text-align: left;">markdown</td>
<td style="text-align: left;">1.12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mathjaxr</td>
<td style="text-align: left;">1.6-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">matrixcalc</td>
<td style="text-align: left;">1.0-6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">MatrixExtra</td>
<td style="text-align: left;">0.1.15</td>
</tr>
<tr class="even">
<td style="text-align: left;">MatrixModels</td>
<td style="text-align: left;">0.5-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">matrixStats</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">maxLik</td>
<td style="text-align: left;">1.5-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mbend</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">MBESS</td>
<td style="text-align: left;">4.9.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mbest</td>
<td style="text-align: left;">0.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">mclogit</td>
<td style="text-align: left;">0.9.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mclust</td>
<td style="text-align: left;">6.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">mcmc</td>
<td style="text-align: left;">0.9-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">MCMCglmm</td>
<td style="text-align: left;">2.35</td>
</tr>
<tr class="even">
<td style="text-align: left;">MCMCpack</td>
<td style="text-align: left;">1.7-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mda</td>
<td style="text-align: left;">0.5-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">mded</td>
<td style="text-align: left;">0.1-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">MDPtoolbox</td>
<td style="text-align: left;">4.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">mediation</td>
<td style="text-align: left;">4.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">memisc</td>
<td style="text-align: left;">0.99.31.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">memoise</td>
<td style="text-align: left;">2.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">MEMSS</td>
<td style="text-align: left;">0.9-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">memuse</td>
<td style="text-align: left;">4.2-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">merDeriv</td>
<td style="text-align: left;">0.2-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">merTools</td>
<td style="text-align: left;">0.6.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">meta</td>
<td style="text-align: left;">7.0-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">metaBMA</td>
<td style="text-align: left;">0.6.9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">metadat</td>
<td style="text-align: left;">1.2-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">metafor</td>
<td style="text-align: left;">4.4-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">metaplus</td>
<td style="text-align: left;">1.0-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">metaSEM</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mfx</td>
<td style="text-align: left;">1.2-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">mgm</td>
<td style="text-align: left;">1.2-14</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mhurdle</td>
<td style="text-align: left;">1.3-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">mi</td>
<td style="text-align: left;">1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mice</td>
<td style="text-align: left;">3.16.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">miceadds</td>
<td style="text-align: left;">3.17-44</td>
</tr>
<tr class="odd">
<td style="text-align: left;">microbenchmark</td>
<td style="text-align: left;">1.4.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">MIIVsem</td>
<td style="text-align: left;">0.5.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mime</td>
<td style="text-align: left;">0.12</td>
</tr>
<tr class="even">
<td style="text-align: left;">miniUI</td>
<td style="text-align: left;">0.1.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">minqa</td>
<td style="text-align: left;">1.2.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">miscTools</td>
<td style="text-align: left;">0.6-28</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mitml</td>
<td style="text-align: left;">0.4-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">mitools</td>
<td style="text-align: left;">2.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mlapi</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">mlbench</td>
<td style="text-align: left;">2.1-3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">MLmetrics</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">mlmRev</td>
<td style="text-align: left;">1.0-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mlogit</td>
<td style="text-align: left;">1.1-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">mlVAR</td>
<td style="text-align: left;">0.5.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mmrm</td>
<td style="text-align: left;">0.3.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">mnormt</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mockery</td>
<td style="text-align: left;">0.4.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">mockr</td>
<td style="text-align: left;">0.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">modelbased</td>
<td style="text-align: left;">0.8.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">modelenv</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ModelMetrics</td>
<td style="text-align: left;">1.2.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">modelr</td>
<td style="text-align: left;">0.1.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">modeltools</td>
<td style="text-align: left;">0.2-23</td>
</tr>
<tr class="even">
<td style="text-align: left;">moments</td>
<td style="text-align: left;">0.14.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">MplusAutomation</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">msm</td>
<td style="text-align: left;">1.7.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">multcomp</td>
<td style="text-align: left;">1.4-25</td>
</tr>
<tr class="even">
<td style="text-align: left;">multcompView</td>
<td style="text-align: left;">0.1-9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">multgee</td>
<td style="text-align: left;">1.9.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">multicool</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">multimode</td>
<td style="text-align: left;">1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">MuMIn</td>
<td style="text-align: left;">1.47.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">munsell</td>
<td style="text-align: left;">0.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">mvnfast</td>
<td style="text-align: left;">0.2.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mvtnorm</td>
<td style="text-align: left;">1.2-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">nabor</td>
<td style="text-align: left;">0.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NbClust</td>
<td style="text-align: left;">3.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">nestedLogit</td>
<td style="text-align: left;">0.3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">netmeta</td>
<td style="text-align: left;">2.9-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">network</td>
<td style="text-align: left;">1.18.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NetworkComparisonTest</td>
<td style="text-align: left;">2.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">NetworkToolbox</td>
<td style="text-align: left;">1.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">networktools</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">networktree</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">neuralnet</td>
<td style="text-align: left;">1.44.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">nFactors</td>
<td style="text-align: left;">2.4.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NlcOptim</td>
<td style="text-align: left;">0.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">nleqslv</td>
<td style="text-align: left;">3.3.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">nloptr</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">NLP</td>
<td style="text-align: left;">0.2-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">nnls</td>
<td style="text-align: left;">1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">nonnest2</td>
<td style="text-align: left;">0.5-6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">numbers</td>
<td style="text-align: left;">0.8-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">numDeriv</td>
<td style="text-align: left;">2016.8-1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">OAIHarvester</td>
<td style="text-align: left;">0.3-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">officedown</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">officer</td>
<td style="text-align: left;">0.6.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">oompaBase</td>
<td style="text-align: left;">3.2.9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">oompaData</td>
<td style="text-align: left;">3.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">opdisDownsampling</td>
<td style="text-align: left;">0.8.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">OpenMx</td>
<td style="text-align: left;">2.21.11</td>
</tr>
<tr class="even">
<td style="text-align: left;">openssl</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">openxlsx</td>
<td style="text-align: left;">4.2.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">operator.tools</td>
<td style="text-align: left;">1.6.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">optimx</td>
<td style="text-align: left;">2023-10.21</td>
</tr>
<tr class="even">
<td style="text-align: left;">ordinal</td>
<td style="text-align: left;">2023.12-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">osfr</td>
<td style="text-align: left;">0.2.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">osqp</td>
<td style="text-align: left;">0.6.3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">packrat</td>
<td style="text-align: left;">0.9.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">pak</td>
<td style="text-align: left;">0.7.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pals</td>
<td style="text-align: left;">1.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">pamr</td>
<td style="text-align: left;">1.56.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pan</td>
<td style="text-align: left;">1.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">pander</td>
<td style="text-align: left;">0.6.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">panelr</td>
<td style="text-align: left;">0.7.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">papaja</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">parallelly</td>
<td style="text-align: left;">1.37.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">parameters</td>
<td style="text-align: left;">0.21.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">parsedate</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">parsnip</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">partitions</td>
<td style="text-align: left;">1.10-7</td>
</tr>
<tr class="even">
<td style="text-align: left;">party</td>
<td style="text-align: left;">1.3-14</td>
</tr>
<tr class="odd">
<td style="text-align: left;">partykit</td>
<td style="text-align: left;">1.2-20</td>
</tr>
<tr class="even">
<td style="text-align: left;">patchwork</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pbapply</td>
<td style="text-align: left;">1.7-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">pbivnorm</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pbkrtest</td>
<td style="text-align: left;">0.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">pbmcapply</td>
<td style="text-align: left;">1.5.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pbv</td>
<td style="text-align: left;">0.5-47</td>
</tr>
<tr class="even">
<td style="text-align: left;">pcaPP</td>
<td style="text-align: left;">2.0-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pdftools</td>
<td style="text-align: left;">3.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">penalized</td>
<td style="text-align: left;">0.9-52</td>
</tr>
<tr class="odd">
<td style="text-align: left;">performance</td>
<td style="text-align: left;">0.10.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">phylolm</td>
<td style="text-align: left;">2.6.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">phyr</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">pillar</td>
<td style="text-align: left;">1.9.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pingr</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">pixiedust</td>
<td style="text-align: left;">0.9.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pkgbuild</td>
<td style="text-align: left;">1.4.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">pkgcache</td>
<td style="text-align: left;">2.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pkgconfig</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">pkgdepends</td>
<td style="text-align: left;">0.7.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pkgdown</td>
<td style="text-align: left;">2.0.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">pkgload</td>
<td style="text-align: left;">1.3.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">plm</td>
<td style="text-align: left;">2.6-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">plogr</td>
<td style="text-align: left;">0.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">plotly</td>
<td style="text-align: left;">4.10.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">plotmo</td>
<td style="text-align: left;">3.6.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">plotrix</td>
<td style="text-align: left;">3.8-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">pls</td>
<td style="text-align: left;">2.8-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">plyr</td>
<td style="text-align: left;">1.8.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">PMCMRplus</td>
<td style="text-align: left;">1.9.10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">png</td>
<td style="text-align: left;">0.1-8</td>
</tr>
<tr class="even">
<td style="text-align: left;">poibin</td>
<td style="text-align: left;">1.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">polspline</td>
<td style="text-align: left;">1.1.24</td>
</tr>
<tr class="even">
<td style="text-align: left;">polyclip</td>
<td style="text-align: left;">1.10-6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">polycor</td>
<td style="text-align: left;">0.8-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">polynom</td>
<td style="text-align: left;">1.4-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">poorman</td>
<td style="text-align: left;">0.2.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">posterior</td>
<td style="text-align: left;">1.5.0.9000</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ppcor</td>
<td style="text-align: left;">1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">prabclus</td>
<td style="text-align: left;">2.3-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pracma</td>
<td style="text-align: left;">2.4.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">praise</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">prediction</td>
<td style="text-align: left;">0.3.14</td>
</tr>
<tr class="even">
<td style="text-align: left;">prereg</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">prettyunits</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">pROC</td>
<td style="text-align: left;">1.18.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">processx</td>
<td style="text-align: left;">3.8.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">prodlim</td>
<td style="text-align: left;">2023.08.28</td>
</tr>
<tr class="odd">
<td style="text-align: left;">profileModel</td>
<td style="text-align: left;">0.6.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">profmem</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">profvis</td>
<td style="text-align: left;">0.3.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">progress</td>
<td style="text-align: left;">1.2.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">progressr</td>
<td style="text-align: left;">0.14.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">projpred</td>
<td style="text-align: left;">2.8.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">promises</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">PROreg</td>
<td style="text-align: left;">1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">proto</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">proxy</td>
<td style="text-align: left;">0.4-27</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ps</td>
<td style="text-align: left;">1.7.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">pscl</td>
<td style="text-align: left;">1.5.9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pso</td>
<td style="text-align: left;">1.0.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">psych</td>
<td style="text-align: left;">2.4.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">psycho</td>
<td style="text-align: left;">0.6.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">psychonetrics</td>
<td style="text-align: left;">0.11.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">psychTools</td>
<td style="text-align: left;">2.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">psyinfr</td>
<td style="text-align: left;">0.1.9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">purrr</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">pvclust</td>
<td style="text-align: left;">2.2-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pwr</td>
<td style="text-align: left;">1.3-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">qgraph</td>
<td style="text-align: left;">1.9.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">qpdf</td>
<td style="text-align: left;">1.3.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">qqconf</td>
<td style="text-align: left;">1.3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">qqplotr</td>
<td style="text-align: left;">0.0.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">qreport</td>
<td style="text-align: left;">1.0-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">QRM</td>
<td style="text-align: left;">0.4-31</td>
</tr>
<tr class="even">
<td style="text-align: left;">qs</td>
<td style="text-align: left;">0.25.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">quadprog</td>
<td style="text-align: left;">1.5-8</td>
</tr>
<tr class="even">
<td style="text-align: left;">quanteda</td>
<td style="text-align: left;">3.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">quantmod</td>
<td style="text-align: left;">0.4.26</td>
</tr>
<tr class="even">
<td style="text-align: left;">quantreg</td>
<td style="text-align: left;">5.97</td>
</tr>
<tr class="odd">
<td style="text-align: left;">questionr</td>
<td style="text-align: left;">0.7.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">QuickJSR</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">qvcalc</td>
<td style="text-align: left;">1.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">R.cache</td>
<td style="text-align: left;">0.16.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">R.matlab</td>
<td style="text-align: left;">3.7.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">R.methodsS3</td>
<td style="text-align: left;">1.8.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">R.oo</td>
<td style="text-align: left;">1.26.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">R.rsp</td>
<td style="text-align: left;">0.46.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">R.utils</td>
<td style="text-align: left;">2.12.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">r2d3</td>
<td style="text-align: left;">0.2.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">R6</td>
<td style="text-align: left;">2.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ragg</td>
<td style="text-align: left;">1.2.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">randomForest</td>
<td style="text-align: left;">4.7-1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">randtoolbox</td>
<td style="text-align: left;">2.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ranger</td>
<td style="text-align: left;">0.16.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">RApiSerialize</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rappdirs</td>
<td style="text-align: left;">0.3.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">raster</td>
<td style="text-align: left;">3.6-26</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RBGL</td>
<td style="text-align: left;">1.78.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rbibutils</td>
<td style="text-align: left;">2.2.16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rcmdcheck</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">RColorBrewer</td>
<td style="text-align: left;">1.1-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Rcpp</td>
<td style="text-align: left;">1.0.12</td>
</tr>
<tr class="even">
<td style="text-align: left;">RcppArmadillo</td>
<td style="text-align: left;">0.12.8.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RcppDist</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">RcppEigen</td>
<td style="text-align: left;">0.3.4.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RcppGSL</td>
<td style="text-align: left;">0.3.13</td>
</tr>
<tr class="even">
<td style="text-align: left;">RcppParallel</td>
<td style="text-align: left;">5.1.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RcppProgress</td>
<td style="text-align: left;">0.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">RcppTOML</td>
<td style="text-align: left;">0.2.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RcppZiggurat</td>
<td style="text-align: left;">0.1.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">Rcsdp</td>
<td style="text-align: left;">0.1.57.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RCurl</td>
<td style="text-align: left;">1.98-1.14</td>
</tr>
<tr class="even">
<td style="text-align: left;">Rdpack</td>
<td style="text-align: left;">2.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">reactable</td>
<td style="text-align: left;">0.4.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">reactR</td>
<td style="text-align: left;">0.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">readbitmap</td>
<td style="text-align: left;">0.1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">readr</td>
<td style="text-align: left;">2.1.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">readxl</td>
<td style="text-align: left;">1.4.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">recipes</td>
<td style="text-align: left;">1.0.10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ReinforcementLearning</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">relaimpo</td>
<td style="text-align: left;">2.2-7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">relimp</td>
<td style="text-align: left;">1.0-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">rematch</td>
<td style="text-align: left;">2.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rematch2</td>
<td style="text-align: left;">2.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">remotes</td>
<td style="text-align: left;">2.4.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rempsyc</td>
<td style="text-align: left;">0.1.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">renv</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">repr</td>
<td style="text-align: left;">1.1.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">reprex</td>
<td style="text-align: left;">2.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">reshape</td>
<td style="text-align: left;">0.8.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">reshape2</td>
<td style="text-align: left;">1.4.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">reticulate</td>
<td style="text-align: left;">1.35.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rex</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Rfast</td>
<td style="text-align: left;">2.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rgl</td>
<td style="text-align: left;">1.2.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Rglpk</td>
<td style="text-align: left;">0.6-5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">Rgraphviz</td>
<td style="text-align: left;">2.46.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RhpcBLASctl</td>
<td style="text-align: left;">0.23-42</td>
</tr>
<tr class="even">
<td style="text-align: left;">rhub</td>
<td style="text-align: left;">1.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rintrojs</td>
<td style="text-align: left;">0.3.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">rio</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rjags</td>
<td style="text-align: left;">4-15</td>
</tr>
<tr class="even">
<td style="text-align: left;">rJava</td>
<td style="text-align: left;">1.0-11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rjson</td>
<td style="text-align: left;">0.2.21</td>
</tr>
<tr class="even">
<td style="text-align: left;">rlang</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rle</td>
<td style="text-align: left;">0.9.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">rlecuyer</td>
<td style="text-align: left;">0.3-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rlist</td>
<td style="text-align: left;">0.4.6.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">RLRsim</td>
<td style="text-align: left;">3.1-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rmarkdown</td>
<td style="text-align: left;">2.25</td>
</tr>
<tr class="even">
<td style="text-align: left;">rmcorr</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rmdfiltr</td>
<td style="text-align: left;">0.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">RMeCab</td>
<td style="text-align: left;">1.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Rmpfr</td>
<td style="text-align: left;">0.9-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">rms</td>
<td style="text-align: left;">6.7-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rngtools</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">rngWELL</td>
<td style="text-align: left;">0.10-9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">robustbase</td>
<td style="text-align: left;">0.99-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">robustlmm</td>
<td style="text-align: left;">3.3-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">robvis</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rockchalk</td>
<td style="text-align: left;">1.8.157</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ROCR</td>
<td style="text-align: left;">1.0-11</td>
</tr>
<tr class="even">
<td style="text-align: left;">rootSolve</td>
<td style="text-align: left;">1.8.2.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">roptim</td>
<td style="text-align: left;">0.1.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">ROSE</td>
<td style="text-align: left;">0.0-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">roxygen2</td>
<td style="text-align: left;">7.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">roxygen2md</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rpf</td>
<td style="text-align: left;">1.0.14</td>
</tr>
<tr class="even">
<td style="text-align: left;">rprojroot</td>
<td style="text-align: left;">2.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rr2</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">rsconnect</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rsm</td>
<td style="text-align: left;">2.10.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">Rsolnp</td>
<td style="text-align: left;">1.16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rsparse</td>
<td style="text-align: left;">0.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">RSpectra</td>
<td style="text-align: left;">0.16-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rstan</td>
<td style="text-align: left;">2.32.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">rstanarm</td>
<td style="text-align: left;">2.32.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rstantools</td>
<td style="text-align: left;">2.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rstatix</td>
<td style="text-align: left;">0.7.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rstudioapi</td>
<td style="text-align: left;">0.15.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rsvd</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rsvg</td>
<td style="text-align: left;">2.6.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rtdists</td>
<td style="text-align: left;">0.11-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rticles</td>
<td style="text-align: left;">0.26</td>
</tr>
<tr class="even">
<td style="text-align: left;">Rttf2pt1</td>
<td style="text-align: left;">1.3.12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RUnit</td>
<td style="text-align: left;">0.4.33</td>
</tr>
<tr class="even">
<td style="text-align: left;">runjags</td>
<td style="text-align: left;">2.2.2-1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rversions</td>
<td style="text-align: left;">2.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">rvest</td>
<td style="text-align: left;">1.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rvg</td>
<td style="text-align: left;">0.3.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">RWiener</td>
<td style="text-align: left;">1.3-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">s2</td>
<td style="text-align: left;">1.1.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">safer</td>
<td style="text-align: left;">0.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sandwich</td>
<td style="text-align: left;">3.1-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">sass</td>
<td style="text-align: left;">0.4.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">scagnostics</td>
<td style="text-align: left;">0.2-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">scales</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">scatterplot3d</td>
<td style="text-align: left;">0.3-44</td>
</tr>
<tr class="even">
<td style="text-align: left;">scoringRules</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">scs</td>
<td style="text-align: left;">3.2.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">see</td>
<td style="text-align: left;">0.8.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">selectr</td>
<td style="text-align: left;">0.4-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">sem</td>
<td style="text-align: left;">3.1-15</td>
</tr>
<tr class="odd">
<td style="text-align: left;">semEff</td>
<td style="text-align: left;">0.6.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">semPlot</td>
<td style="text-align: left;">1.1.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">semTools</td>
<td style="text-align: left;">0.5-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">servr</td>
<td style="text-align: left;">0.29</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sessioninfo</td>
<td style="text-align: left;">1.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">sets</td>
<td style="text-align: left;">1.0-25</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sf</td>
<td style="text-align: left;">1.0-15</td>
</tr>
<tr class="even">
<td style="text-align: left;">sfsmisc</td>
<td style="text-align: left;">1.1-17</td>
</tr>
<tr class="odd">
<td style="text-align: left;">shape</td>
<td style="text-align: left;">1.4.6.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">shiny</td>
<td style="text-align: left;">1.8.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">shiny.i18n</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">shinyjs</td>
<td style="text-align: left;">2.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">shinystan</td>
<td style="text-align: left;">2.6.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">shinytest2</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">shinythemes</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">showtext</td>
<td style="text-align: left;">0.9-7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">showtextdb</td>
<td style="text-align: left;">3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">sigr</td>
<td style="text-align: left;">1.1.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">simex</td>
<td style="text-align: left;">1.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">skimr</td>
<td style="text-align: left;">2.1.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">skpr</td>
<td style="text-align: left;">1.6.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">slam</td>
<td style="text-align: left;">0.1-50</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sm</td>
<td style="text-align: left;">2.2-6.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">smacof</td>
<td style="text-align: left;">2.1-6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">smd</td>
<td style="text-align: left;">0.6.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">sna</td>
<td style="text-align: left;">2.7-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">snow</td>
<td style="text-align: left;">0.4-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">SnowballC</td>
<td style="text-align: left;">0.7.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">snowfall</td>
<td style="text-align: left;">1.84-6.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">sodium</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">som</td>
<td style="text-align: left;">0.3-5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">sourcetools</td>
<td style="text-align: left;">0.1.7-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sp</td>
<td style="text-align: left;">2.1-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">spam</td>
<td style="text-align: left;">2.10-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sparkline</td>
<td style="text-align: left;">2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">SparseGrid</td>
<td style="text-align: left;">0.8.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">SparseM</td>
<td style="text-align: left;">1.81</td>
</tr>
<tr class="even">
<td style="text-align: left;">sparsepca</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">spatstat.data</td>
<td style="text-align: left;">3.0-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">spatstat.geom</td>
<td style="text-align: left;">3.2-9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">spatstat.utils</td>
<td style="text-align: left;">3.0-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">spData</td>
<td style="text-align: left;">2.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">spdep</td>
<td style="text-align: left;">1.3-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">speedglm</td>
<td style="text-align: left;">0.3-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">spelling</td>
<td style="text-align: left;">2.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">splancs</td>
<td style="text-align: left;">2.01-44</td>
</tr>
<tr class="odd">
<td style="text-align: left;">splines2</td>
<td style="text-align: left;">0.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">spls</td>
<td style="text-align: left;">2.2-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">SQUAREM</td>
<td style="text-align: left;">2021.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">StanHeaders</td>
<td style="text-align: left;">2.32.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">stargazer</td>
<td style="text-align: left;">5.2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">statmod</td>
<td style="text-align: left;">1.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">statnet.common</td>
<td style="text-align: left;">4.9.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">stinepack</td>
<td style="text-align: left;">1.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">stm</td>
<td style="text-align: left;">1.3.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">stopwords</td>
<td style="text-align: left;">2.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">stringfish</td>
<td style="text-align: left;">0.16.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">stringi</td>
<td style="text-align: left;">1.8.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">stringmagic</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">stringr</td>
<td style="text-align: left;">1.5.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">strucchange</td>
<td style="text-align: left;">1.5-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">styler</td>
<td style="text-align: left;">1.10.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">subselect</td>
<td style="text-align: left;">0.15.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">superpc</td>
<td style="text-align: left;">1.12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">SuppDists</td>
<td style="text-align: left;">1.1-9.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">support.CEs</td>
<td style="text-align: left;">0.7-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">survey</td>
<td style="text-align: left;">4.2-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">svDialogs</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">svglite</td>
<td style="text-align: left;">2.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">svGUI</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">svUnit</td>
<td style="text-align: left;">1.0.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">sys</td>
<td style="text-align: left;">3.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sysfonts</td>
<td style="text-align: left;">0.8.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">systemfonts</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tables</td>
<td style="text-align: left;">0.9.17</td>
</tr>
<tr class="even">
<td style="text-align: left;">tensorA</td>
<td style="text-align: left;">0.36.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">terra</td>
<td style="text-align: left;">1.7-71</td>
</tr>
<tr class="even">
<td style="text-align: left;">tesseract</td>
<td style="text-align: left;">5.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">testit</td>
<td style="text-align: left;">0.13</td>
</tr>
<tr class="even">
<td style="text-align: left;">testthat</td>
<td style="text-align: left;">3.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">texreg</td>
<td style="text-align: left;">1.39.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">text2vec</td>
<td style="text-align: left;">0.6.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">textdata</td>
<td style="text-align: left;">0.4.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">textmineR</td>
<td style="text-align: left;">3.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">textshaping</td>
<td style="text-align: left;">0.3.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">TH.data</td>
<td style="text-align: left;">1.1-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">themis</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">threejs</td>
<td style="text-align: left;">0.3.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tibble</td>
<td style="text-align: left;">3.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">tictoc</td>
<td style="text-align: left;">1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tidybayes</td>
<td style="text-align: left;">3.0.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">tidycmprsk</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tidygraph</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">tidyr</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tidyselect</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">tidytext</td>
<td style="text-align: left;">0.4.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tidyverse</td>
<td style="text-align: left;">2.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">tiff</td>
<td style="text-align: left;">0.1-12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">timechange</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">timeDate</td>
<td style="text-align: left;">4032.109</td>
</tr>
<tr class="odd">
<td style="text-align: left;">timeSeries</td>
<td style="text-align: left;">4032.109</td>
</tr>
<tr class="even">
<td style="text-align: left;">tinylabels</td>
<td style="text-align: left;">0.2.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tinytable</td>
<td style="text-align: left;">0.0.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">tinytest</td>
<td style="text-align: left;">1.4.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tinytex</td>
<td style="text-align: left;">0.49</td>
</tr>
<tr class="even">
<td style="text-align: left;">tm</td>
<td style="text-align: left;">0.7-11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">TMB</td>
<td style="text-align: left;">1.9.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">tmvnsim</td>
<td style="text-align: left;">1.0-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tokenizers</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">topicmodels</td>
<td style="text-align: left;">0.2-16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">transformr</td>
<td style="text-align: left;">0.1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">triebeard</td>
<td style="text-align: left;">0.4.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">truncdist</td>
<td style="text-align: left;">1.0-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">truncnorm</td>
<td style="text-align: left;">1.0-9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">truncreg</td>
<td style="text-align: left;">0.2-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">trust</td>
<td style="text-align: left;">0.1-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tseries</td>
<td style="text-align: left;">0.10-55</td>
</tr>
<tr class="even">
<td style="text-align: left;">TTR</td>
<td style="text-align: left;">0.24.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tufte</td>
<td style="text-align: left;">0.13</td>
</tr>
<tr class="even">
<td style="text-align: left;">tweedie</td>
<td style="text-align: left;">2.3.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tweenr</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">twosamples</td>
<td style="text-align: left;">2.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tzdb</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ucminf</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">udpipe</td>
<td style="text-align: left;">0.8.11</td>
</tr>
<tr class="even">
<td style="text-align: left;">units</td>
<td style="text-align: left;">0.8-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">unix</td>
<td style="text-align: left;">1.5.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">urca</td>
<td style="text-align: left;">1.3-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">urlchecker</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">urltools</td>
<td style="text-align: left;">1.7.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">usethis</td>
<td style="text-align: left;">2.2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">utf8</td>
<td style="text-align: left;">1.2.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">uuid</td>
<td style="text-align: left;">1.2-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">V8</td>
<td style="text-align: left;">4.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">VCA</td>
<td style="text-align: left;">1.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">vcd</td>
<td style="text-align: left;">1.4-12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">vcr</td>
<td style="text-align: left;">1.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">vctrs</td>
<td style="text-align: left;">0.6.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">vdiffr</td>
<td style="text-align: left;">1.0.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">VGAM</td>
<td style="text-align: left;">1.1-10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">VIM</td>
<td style="text-align: left;">6.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">vioplot</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">viridis</td>
<td style="text-align: left;">0.6.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">viridisLite</td>
<td style="text-align: left;">0.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">visNetwork</td>
<td style="text-align: left;">2.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">vroom</td>
<td style="text-align: left;">1.6.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">waiter</td>
<td style="text-align: left;">0.2.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">waldo</td>
<td style="text-align: left;">0.5.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">wdm</td>
<td style="text-align: left;">0.2.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">webfakes</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">webmockr</td>
<td style="text-align: left;">0.9.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">webp</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">webshot</td>
<td style="text-align: left;">0.5.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">webshot2</td>
<td style="text-align: left;">0.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">websocket</td>
<td style="text-align: left;">1.4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">weights</td>
<td style="text-align: left;">1.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">whisker</td>
<td style="text-align: left;">0.4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">whoami</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">withr</td>
<td style="text-align: left;">3.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">wk</td>
<td style="text-align: left;">0.9.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">wordcloud</td>
<td style="text-align: left;">2.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">workflows</td>
<td style="text-align: left;">1.1.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">wrapr</td>
<td style="text-align: left;">2.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">writexl</td>
<td style="text-align: left;">1.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">WRS2</td>
<td style="text-align: left;">1.1-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">xaringan</td>
<td style="text-align: left;">0.29</td>
</tr>
<tr class="odd">
<td style="text-align: left;">xaringanthemer</td>
<td style="text-align: left;">0.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">xfun</td>
<td style="text-align: left;">0.42</td>
</tr>
<tr class="odd">
<td style="text-align: left;">XML</td>
<td style="text-align: left;">3.99-0.16.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">xml2</td>
<td style="text-align: left;">1.3.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">xmlparsedata</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">xopen</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">xslt</td>
<td style="text-align: left;">1.4.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">xtable</td>
<td style="text-align: left;">1.8-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">xts</td>
<td style="text-align: left;">0.13.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">yaml</td>
<td style="text-align: left;">2.3.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">zip</td>
<td style="text-align: left;">2.3.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">zoo</td>
<td style="text-align: left;">1.8-12</td>
</tr>
</tbody>
</table>
