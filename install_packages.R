# Tested with R 4.6.1: tidyverse 2.0.0, tidyplots 0.4.0, survival 3.8.12, survminer 0.5.2,
# patchwork 1.3.2, ggpubr 1.0.0, viridis 0.6.5, gtsummary 2.6.1, gt 1.4.0,
# flextable 0.10.4, ggridges 0.5.7, pROC 1.19.1, svglite 2.2.2
pkgs <- c(
  "tidyverse", "tidyplots", "survival", "survminer", "patchwork",
  "ggpubr", "viridis", "gtsummary", "gt", "flextable",
  "ggridges", "pROC", "svglite"
)
missing <- pkgs[!pkgs %in% rownames(installed.packages())]
if (length(missing)) install.packages(missing)
message("All packages installed.")
