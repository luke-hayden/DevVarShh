# Nanostring analysis

Analysis of developmental variation dataset from mous developing teeth, created by Luke Hayden. Publication forthcoming



### Prerequisites

All analysis was performed in RStudio Version 1.0.136, running R version 3.x. 
Packages needed are:

ggplot2
rmarkdown
reshape2
gtools
knitr
dplyr
tidyr


Exact prerequisites depend on script in question. 


### Structure
DevVarShh.Rmd: Main analysis
*datagood.csv: combined scoring and age data for samples 
predic*: computed ages of samples based on Bayesian model (done separately to this analysis)

## Samples
Samples are from the following strains: DUHi, FVB and CD1
They are classified by embryo weight, given unique IDs and scored in relation to multiple developmental characteristics. 
md: mandible (upper jaw)
mx: maxillary (lower jaw)


## Repository

[https://github.com/luke-hayden/DevVarShh]

## Authors

* **Luke Hayden** 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Marie Semon & Sophie Pantalacci



