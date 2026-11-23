# Run this script the night before the workshop to verify your R environment.
# Usage: source("check_setup.R")  OR  Rscript check_setup.R

pkgs <- c(
  "tidyverse", "tidyplots", "survival", "survminer", "patchwork",
  "ggpubr", "viridis", "gtsummary", "gt", "flextable",
  "ggridges", "pROC", "svglite"
)

cat("R version:", R.version$major, paste0(R.version$minor), "\n\n")

failed <- character(0)
for (p in pkgs) {
  ok <- requireNamespace(p, quietly = TRUE)
  ver <- if (ok) as.character(packageVersion(p)) else "NOT INSTALLED"
  status <- if (ok) "OK" else "MISSING"
  cat(sprintf("  %-15s %s  [%s]\n", p, ver, status))
  if (!ok) failed <- c(failed, p)
}

cat("\n")
if (length(failed) == 0) {
  message("All packages found. You are ready for the workshop.")
} else {
  message("Missing packages: ", paste(failed, collapse = ", "))
  message("Run:  source(\"install_packages.R\")  to install them.")
  quit(status = 1)
}
