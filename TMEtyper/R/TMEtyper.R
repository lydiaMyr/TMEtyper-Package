library(GSVA)
library(ggplot2)
library(nnet)    # 神经网络
library(caret)   # 数据预处理和模型评估

#library(pheatmap)
#library(tidyverse)
load("data/nnet_model.rda")
load("data/nnet_feature.rda")
load("data/train_data.rda")



#' Title
#'
#' @param file_name
#' @param data_type microarray or rnaseq
#'
#' @return sample TME subtype
#' @export
#'
#' @examples TMEtyper("example.txt","microarray")
TMEtyper = function(file_name,data_type){
  sample=read.table(file_name,header=T,sep="\t",row.names=1)
  sam = apply(sample,2,as.numeric)
  row.names(sam) = row.names(sample)
  if(data_type=="rnaseq"){
    sam = log2(sam+1)
  }
  genes = intersect(row.names(sam),as.vector(unlist(final_feature)))
  sam_exp = as.matrix(sam[genes,])
  colnames(sam_exp) = colnames(sample)
  if(data_type == "rnaseq"){
    sam_exp = log2(sam_exp+1)
  }
  ssgsea_param <- ssgseaParam(exprData = sam_exp,
                              geneSets = final_feature)

  # 运行SSGSEA
  result <- gsva(ssgsea_param, verbose = TRUE)
  miss_ft=setdiff(names(final_feature),row.names(result))
  if(length(miss_ft)>0){
    for(i in miss_ft){
      result=rbind(result,rep(0,ncol(result)))
    }
    row.names(result)[(nrow(result)-length(miss_ft)+1):nrow(result)]=miss_ft
  }

  test_data = t(result)
  preProc <- preProcess(train_data, method = c("center", "scale"))
  test_data_std <- predict(preProc, test_data)
  test_pred <- predict(model, test_data_std, type = "class")
  test_prob <- predict(model, test_data_std, type = "raw")

  group_fre = cbind(test_prob,test_pred)
  colnames(group_fre)[8]="Subtype"
  TME_sub<-group_fre
  ft_enrich<-round(result,4)

  return(list(TME_sub=TME_sub,ft_enrich=ft_enrich))
  # })
}

