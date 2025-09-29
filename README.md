# TMEtyper
TMEtyper is an advanced method for tumor microenvironment (TME) subtyping, powered by artificial intelligence
![image text](https://github.com/lydiaMyr/TMEtyper-Package/raw/refs/heads/main/TMEtyper/data/TOC-01.tif)

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
