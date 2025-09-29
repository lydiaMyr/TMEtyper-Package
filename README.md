# TMEtyper
TMEtyper is an advanced method for tumor microenvironment (TME) subtyping, powered by artificial intelligence
[TOC-01.tif](https://github.com/user-attachments/files/22598051/TOC-01.tif)

## Installation
``` bash
install.packages("devtools")
library(devtools)
install_github("lydiaMyr/TMEtyper-Package/TMEtyper@main")
#if the "/bin/gtar: not found" error occured, please run the following command "export TAR="/bin/tar" before installation.
```
## Geting started
### For rnaseq data
TMEtyper("expression_file.txt","rnaseq")
### For microarray data
TMEtyper("expression_file.txt","microarray")
