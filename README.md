# TMEtyper
TMEtyper is an advanced method for tumor microenvironment (TME) subtyping, powered by artificial intelligence
<img width="1164" height="1372" alt="TOC-01" src="https://github.com/user-attachments/assets/11e49b1e-fdb2-4094-af0c-4738ecec438e" />


## Installation
``` bash
install.packages("devtools")
library(devtools)
install_github("lydiaMyr/TMEtyper-Package/TMEtyper@main")
#if the "/bin/gtar: not found" error occured, please run the following command "export TAR="/bin/tar" before installation.
```
## Geting started
library(GSVA)

library(nnet)  
library(caret)   

### For rnaseq data
file_path <- system.file("extdata", "example_data.txt", package = "TMEtyper")

TMEtyper(file_path,"rnaseq")
### For microarray data
file_path <- system.file("extdata", "example_data.txt", package = "TMEtyper")

TMEtyper(file_path,"microarray")
