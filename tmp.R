setwd("~/project/18.liyanyu/7.spatial_df/")
options(future.globals.maxSize = 1400000 * 1024^2)

library(Seurat)
library(ggplot2)
library(patchwork)
library(dplyr)
localdir <- "~/project/18.liyanyu/2.spatial/liyanyu_NEO-SP-60_20240509_10XHD_human_4672_report/202211842GAS/binned_outputs/square_008um/"
object <- Load10X_Spatial(data.dir = localdir)
object=object[,unname(which(colSums(GetAssayData(object)) >=20 ))]
object <- SCTransform(object, assay = "Spatial")
saveRDS(file = '~/project/18.liyanyu/7.spatial_df/gas.rds',object)
