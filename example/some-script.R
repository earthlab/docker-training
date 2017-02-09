# This is a simple example script that exports a pdf plot of a volcano dataset.
library(rasterVis)

pdf(file = "volcano.pdf")
levelplot(raster(volcano))
dev.off()
