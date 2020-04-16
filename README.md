# MetaboAnalystR 3.0: Towards Optimized Workflow for Global Metabolomics

<p align="center">
  <img src="https://github.com/xia-lab/MetaboAnalystR/blob/master/docs/MetaboAnalystRlogo.png">
</p>

## Description 

**MetaboAnalystR 3.0** contains the R functions and libraries underlying the popular MetaboAnalyst web server, including metabolomic data analysis, visualization, and functional interpretation. The package is synchronized with the MetaboAnalyst web server. After installing and loading the package, users will be able to reproduce the same results from their local computers using the corresponding R command history downloaded from MetaboAnalyst, thereby achieving maximum flexibility and reproducibility. 

Besides, with version 3.0, we aim to optimize two important points for the whole pipeline. First, raw spectral processing parameters optimization. Second, we have enhanced the ability to correct batch effect by organising different algorithm. In addition, more support for functional interpretation directly from m/z peaks via mummichog2 (PMID: 23861661), and a new pathway-based method to integrate multiomics data has been added. To demonstrate this new functionality, we provide the "MetaboAnalystR 3.0 Workflow: Towards Optimized Workflow for Global Metabolomics" vignette, available [here](https://github.com/xia-lab/MetaboAnalystR3.0/blob/master/docs/MetaboAnalystR%203:%20Towards%20Optimized%20Workflow%20for%20Global%20Metabolomics.pdf) as a PDF. In this vignette, we perform end-to-end metabolomics data analysis on the full batch of clinical IBD samples.   
 

## Getting Started

### Step 1. Install package dependencies 

To use MetaboAnalystR 3.0, first install all package dependencies. Ensure that you have neceaary system environment configured. 

For Linux (e.g. Ubuntu): libcairo2-dev, libnetcdf-dev, libxml2 and libssl-dev should be installed at frist;

For Windows (e.g. 7/8/8.1/10): Rtools should be installed.

As for installation of package dependencies, there are two options:

**Option 1** 

Enter the R function (metanr_packages) and then use the function. A printed message will appear informing you whether or not any R packages were installed.

Function to download packages:

```R
metanr_packages <- function(){

  metr_pkgs <- c("impute", "pcaMethods", "globaltest", "GlobalAncova", "Rgraphviz", "preprocessCore", "genefilter", "SSPA", "sva", "limma", "KEGGgraph", "siggenes","BiocParallel", "MSnbase", "multtest","RBGL","edgeR","fgsea")
  
  list_installed <- installed.packages()
  
  new_pkgs <- subset(metr_pkgs, !(metr_pkgs %in% list_installed[, "Package"]))
  
  if(length(new_pkgs)!=0){
    
    if (!requireNamespace("BiocManager", quietly = TRUE))
        install.packages("BiocManager")
    BiocManager::install(new_pkgs)
    print(c(new_pkgs, " packages added..."))
  }
  
  if((length(new_pkgs)<1)){
    print("No new packages added...")
  }
}
```
Usage of function:
```R
metanr_packages()
```

**Option 2** 

Use the pacman R package (for those with >R 3.5.1). 

```R
install.packages("pacman")

library(pacman)

pacman::p_load(c("impute", "pcaMethods", "globaltest", "GlobalAncova", "Rgraphviz", "preprocessCore", "genefilter", "SSPA", "sva", "limma", "KEGGgraph", "siggenes","BiocParallel", "MSnbase", "multtest","RBGL","edgeR","fgsea"))
```
### Step 2. Install the package

MetaboAnalystR 3.0 is freely available from GitHub. The package documentation, including the vignettes for each module and user manual is available within the downloaded R package file. If all package dependencies were installed, you will be able to install the MetaboAnalylstR 3.0 . There are three options, A) using the R package devtools, B) cloning the github, C) manually downloading the .tar.gz file. Note that the MetaboAnalystR 3.0 github will have the most up-to-date version of the package. 

#### Option A) Install the package directly from github using the *devtools* package. Open R and enter:

Due to issues with Latex, some users may find that they are only able to install MetaboAnalystR 3.0 without any documentation (i.e. vignettes). 

```R
# Step 1: Install devtools
install.packages("devtools")
library(devtools)

# Step 2: Install MetaboAnalystR without documentation
devtools::install_github("xia-lab/MetaboAnalystR3.0", build = TRUE, build_vignettes = FALSE)

# Step 2: Install MetaboAnalystR with documentation
devtools::install_github("xia-lab/MetaboAnalystR3.0", build = TRUE, build_vignettes = TRUE, build_manual =T)

```

#### Option B) Clone Github and install locally

The * must be replaced by what is actually downloaded and built.  

```R
git clone https://github.com/xia-lab/MetaboAnalystR3.0.git
R CMD build MetaboAnalystR
R CMD INSTALL MetaboAnalystR_3.0.0.tar.gz

```

#### Option C) Manual download of MetaboAnalystR_3.0.0.tar.gz and install locally

Manually download the .tar.gz file from [here](https://drive.google.com/file/d/1l_5RI6tECZFL0VESsXchl-eFz6lx_wVM/view?usp=sharing). 

```R
cd ~/Downloads
R CMD INSTALL MetaboAnalystR_3.0.0.tar.gz

```

## Case Studies

### MetaboAnalyst 3.0 Workflow: Towards Optimized Workflow for Global Metabolomics

The case studies have been preformed in our article of this version [here]() (Under review, not available for now). The example running R code of this article have been provided as a vignette inside the R package.


### MetaboAnalyst 2.0 Workflow: From Raw Spectra to Biological Insights

The R scripts to perform all of the analysis from our previous manuscript "MetaboAnalystR 2.0: From Raw Spectra to Biological Insights" can be found [here](https://github.com/jsychong/MetaboAnalystR/tree/master/MetaboAnalystR_2_Supplementary_Data).

The detailed tutorial of the outdated version to perform a comprehensive end-to-end metabolomics data workflow from raw data preprocessing to knowledge-based analysis still works. The tutorial is available as a PDF is also available inside the R package as a vignette.

### MetaboAnalyst 1.0

To demonstrate the functionality, flexibility, and scalability of the MetaboAnalystR v1.0.0 package, three use-cases using two sets of metabolomics data is available [here](https://github.com/jsychong/MetaboAnalystR/tree/master/Supplementary_Material). In this folder you will find detailed discussions and comparisons with the MetaboAnalyst web-platform.

## Tutorials

For detailed tutorials on how to use MetaboAnalystR 2.0, please refer to the R package vignettes. These vignettes include detailed step-by-step workflows with example data for each of the main MetaboAnalytR 2.0 modules (11), a case-study showcasing the new end-to-end functionality of MetaboAnalystR 2.0, as well as an example that demonstrates the ease of using XCMS and MetaboAnalystR 1.0 for a holisitic metabolomic data analysis (deprecated). Note, the functions below work only if the R package vignettes were built. 

Within R:
```R
vignette(package="MetaboAnalystR")
```

Within a web-browser:
```R
browseVignettes("MetaboAnalystR")
```

## Citation

MetaboAnalystR 3.0 has been developed by the [XiaLab](https://www.xialab.ca/) at McGill University. The original manuscript (Version 1) can be found [here](https://doi.org/10.1093/bioinformatics/bty528) and last version 2 is [here](https://www.mdpi.com/2218-1989/9/3/57).

We encourage users to further develop the package to suit their needs. If you use the R package, please cite us: 

Zhiqiang Pang, Jasmine Chong, Shuzhao Li and Jianguo Xia. "MetaboAnalystR: Towards Optimized Workflow for Global Metabolomics".

Chong, Jasmine, Mai Yamamoto, and Jianguo Xia. "MetaboAnalystR 2.0: From Raw Spectra to Biological Insights." 
Metabolites 9.3 (2019): 57.

Chong, Jasmine, and Jianguo Xia. "MetaboAnalystR: an R package for flexible and reproducible analysis of metabolomics data." Bioinformatics 34.24 (2018): 4313-4314.

*From within R:*

```R
citation("MetaboAnalystR")
```

## Previous Version Releases

MetaboAnalystR 2.0.4 can be downloaded [here](https://www.dropbox.com/s/3nl69jzp9wh6sjh/MetaboAnalystR_2.0.4.tar.gz?dl=0).

## Bugs or feature requests

To inform us of any bugs or requests, please open a new issue (and @ Zhiqiang-PANG !!) or send an email to #jasmine.chong@mail.mcgill.ca or zhiqiang.pang@mail.mcgill.ca.

## MetaboAnalystR History & Updates

10-04-2020 - Version Updata:3.0.0 - adding parameters optimization and automatical batch effect correction and stable version for peaks to function

03-12-2020 - Version Update: 2.0.4 - adding retention time for MS Peaks to Paths (Beta)! + added troubleshooting for compound mapping

02-19-2020 - Version Update: 2.0.3 - update bug fixes w. web server

01-14-2020 - Version Update: 2.0.2 - updated gene mapping to use internal SQlite database (included in /inst), added Rserve engine (Rcode synchronized with web-server) + added functions for users to create their own mummichog libraries

01-08-2020 - Updating code for box plots + mummichog 

11-12-2019 - Update KEGG pathway libraries + updates to Pathway Analysis and MS Peaks to Paths vignettes

10-17-2019 - Updates w. web server, updated MS Peaks to Paths vignettes to show adduct/currency customization

09-24-2019 - Updates w. web server, bug-fixing + updates to MS Peaks to Paths and MetaboAnalystR 2.0 vignettes

09-10-2019 - Updates for MS Peaks to Paths, batch processing for preprocessing raw MS data

06-14-2019 - Bug fixing for t-test + volcano analysis

04-11-2019 - Version Update: 2.0.1 - updated underlying code of MS Peaks to Paths, new functions to create plots to summarize results of mummichog and GSEA analysis, fixed bugs with compound name matching, updated documentation

03-25-2019 - Updated MS Peaks to Paths to stop analysis if no significant peaks are identified. Updated underlying code with 
webserver and updated documentation 

03-19-2019 - Added support for MS2 data - function to read in MS2 data and extract/plot spectra for a specific m/z

03-18-2019 - Added function to plot m/z features hits in a pathway for the MS Peaks to Paths module, updated documentation and MetaboAnalystR 2.0 tutorial to reflect this new addition

03-17-2019 - Added method for combining p-values for MS Peaks to Paths (mummichog + fGSEA pvalues), updated documentation and MetaboAnalystR 2.0 workflow

03-11-2019 - Added code chunk to set the number of cores used for parallel preprocessing of raw MS data to half of the number of available cores to avoid user memory issues + updated filepath for ImportRawMSData, so users only have to provide the folder path to the samples

03-05-2019 - Version Update: 2.0.0! - added function for graphical integration of results from mummichog and fGSEA, added new tutorial with example data from the fecal metabolome of IBD patients

03-03-2019 - Version Update: 1.0.4 - added support for pathway activity prediction using fGSEA; major release coming soon after bug fixes

02-11-2019 - Version Update: 1.0.3 - updated underlying R code w. changes to MetaboAnalyst 4.53 + updated documentation

11-20-2018 - Version Update: 1.0.2 - updated links in R code (https) + underlying code w. changes to MetaboAnalyst 4.39 

07-03-2018 - Addition of XCMS to MetaboAnalystR tutorial  

06-25-2018 - Publication of MetaboAnalystR in Bioinformatics 

06-13-2018 - Addition of case studies + unit-testing + 3D visualization with plotly

05-25-2018 - Version Update: 1.0.1 - updated underlying R code w. changes to MetaboAnalyst 4.09

04-20-2018 - Submission to CRAN

04-16-2018 - Testing with R Version 3.4.4

04-10-2018 - Updated underlying R code w. changes to MetaboAnalyst 4.0 

03-23-2018 - Added 2 more package dependencies 

02-23-2018 - Minor bug fixes based on user feedback (MetaboAnalystR_1.0.0.6.tar.gz)

02-05-2018 - Update MetaboAnalystR with 3 new modules in conjunction with the release of MetaboAnalyst Version 4
