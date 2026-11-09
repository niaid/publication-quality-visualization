# Publication-Quality Visualization with R & Python

Workshop materials for a hands-on code-along session on producing publication-ready figures and statistical tables from clinical trial data, Instructed by Yuyan Yi (December 4, 2026).

> Materials were drafted with assistance from Claude (Anthropic) and reviewed and edited by the instructor.

---

## Purpose

This workshop teaches participants how to move from raw tabular data to figures that meet the standards expected by biomedical journals — appropriate plot choice, colorblind-safe palettes, correct statistical tests, and export at publication DPI. All examples use a single simulated clinical trial dataset (200 synthetic patients, no real patient data) so every figure can be reproduced without any data-access requirements.

The materials exist in three parallel formats to suit different tool setups:

| Format | File | Best for |
|---|---|---|
| Quarto (R + Python side by side) | `workshop_positron.qmd` | Positron IDE with both kernels |
| R Markdown (R only) | `R_version/workshop_R.Rmd` | RStudio users |
| Jupyter Notebook (Python only) | `Python_version/workshop_Python.ipynb` | Jupyter users |

All three versions cover the same 16 sections and produce equivalent figures — the code is just expressed in the appropriate language and format for each tool.

---

## Repository Layout

```
training/
├── workshop_positron.qmd          # Combined R+Python Quarto document (Positron edition)
├── workshop_positron.html         # Pre-rendered HTML output of the Quarto document
├── BCBB_Intro_Workshop_Material.pptx  # Slide deck used during the live workshop
│
├── clinical_trial_data.csv        # Root-level copy of the main synthetic dataset
├── longitudinal_data.csv          # Root-level copy of the repeated-measures dataset
├── pca_data.csv                   # Root-level copy of the multi-biomarker PCA dataset
│
├── images/                        # Small SVG thumbnails used in Section 2 (chart-choice guide)
│   ├── example_boxplot.svg
│   ├── example_bar_meanSD.svg
│   ├── example_histogram.svg
│   ├── example_scatter_pca.svg
│   ├── example_linechart.svg
│   ├── example_km_curve.svg
│   ├── example_forest_plot.svg
│   ├── example_stacked_bar.svg
│   └── example_heatmap.svg
│
├── workshop_positron_files/       # Auto-generated assets from rendering the Quarto document
│   ├── figure-html/               # PNG renders of every code chunk figure (300 DPI)
│   └── libs/                      # Bootstrap/Quarto JS+CSS for the HTML output
│
├── R_version/
│   ├── workshop_R.Rmd             # R-only R Markdown document
│   ├── workshop_R.html            # Pre-rendered HTML output
│   ├── clinical_trial_data.csv    # Dataset copy used by the R version
│   ├── longitudinal_data.csv
│   └── pca_data.csv
│
├── Python_version/
│   ├── workshop_Python.ipynb      # Python-only Jupyter notebook
│   ├── clinical_trial_data.csv    # Dataset copy used by the Python version
│   ├── longitudinal_data.csv
│   └── pca_data.csv
│
└── Practice Exercise/
    ├── R_version/
    │   ├── Practice_Solutions_R.Rmd   # Worked solutions for all 9 options (R)
    │   ├── Practice_Solutions_R.html  # Pre-rendered HTML output
    │   ├── clinical_trial_data.csv
    │   ├── longitudinal_data.csv
    │   └── pca_data.csv
    └── Python_version/
        ├── Practice_Solutions_Python.ipynb  # Worked solutions for all 9 options (Python)
        ├── clinical_trial_data.csv
        ├── longitudinal_data.csv
        └── pca_data.csv
```

---

## Practice Exercise & Solutions

The `Practice Exercise/` folder contains worked solutions for the 20-minute hands-on exercise at the end of the workshop (Section 16). Both the R and Python versions cover all 9 exercise options:

| Option | Exercise prompt | Key technique |
|---|---|---|
| 1 | Table 1 comparing baseline characteristics by arm | `gtsummary` / `tableone`, t-test, chi-square |
| 2 | Density plot or ridgeline plot by group | `geom_density` / `kdeplot`, `ggridges` / `joypy` |
| 3 | Kaplan-Meier curve with risk table | `survminer::ggsurvplot` / `lifelines` + `add_at_risk_counts` |
| 4 | Forest plot: HR + 95% CI across 3+ subgroups | Manual `ggplot2` / `matplotlib` errorbar on log scale |
| 5 | ROC curve with AUC for biomarker predicting response | `pROC::ggroc` / `sklearn.metrics.roc_curve` |
| 6 | Line chart of score trajectory over time by arm | `geom_errorbar` / `ax.errorbar`, mean ± SE |
| 7 | Annotated boxplot / mean ± SD bar comparing scores across site | ANOVA + Tukey HSD, significance brackets |
| 8 | Stacked bar chart of smoker status by site | 3-category stacked bar, Okabe-Ito palette |
| 9 | PCA score plot or biplot of the biomarker panel | `prcomp` / `sklearn.PCA`, loading arrows, % variance labels |

Each solution file can be run independently — load the data in the first cell/chunk, then jump to whichever option(s) you worked on. The solution files read from dataset copies in the same subfolder so no path adjustments are needed.

---

## Datasets

All three datasets are synthetic — generated by the code in Section 1 of each document — and contain no real patient information.

### `clinical_trial_data.csv` — main dataset (200 rows)

| Column | Type | Description |
|---|---|---|
| `patient_id` | ID | PT-001 to PT-200 |
| `arm` | Categorical | Control / Treatment (~50/50) |
| `age` | Continuous | Normal, mean 58, SD 12 |
| `sex` | Categorical | Female (52%) / Male (48%) |
| `site` | Categorical | Site_1–Site_4 (Site_3 has a built-in lower outcome for the ANOVA example) |
| `smoker` | Categorical | Never (50%) / Former (30%) / Current (20%) |
| `biomarker` | Continuous | Right-skewed, gamma(shape=2, scale=15) |
| `baseline_score` | Continuous | Normal, mean 50, SD 10 |
| `followup_score` | Continuous | Baseline minus treatment effect (Treatment drops ~8 pts, Control ~1 pt) |
| `responder` / `response_label` | Binary / Categorical | Response rate: Treatment 55%, Control 30% |
| `time_months` / `event` | Continuous / Binary | Simulated time-to-event; 65% event rate |

### `longitudinal_data.csv` — repeated-measures dataset (800 rows)

Same 200 patients, measured at weeks 0, 4, 8, and 12. Used for the line chart section. Columns: `patient_id`, `arm`, `week`, `score`.

### `pca_data.csv` — multi-biomarker dataset (200 rows)

Same 200 patients with 6 synthetic correlated biomarkers (`marker_1`–`marker_6`) plus `patient_id`, `arm`, `site`. Used for the PCA sections.

---

## Workshop Sections

Each document walks through the following sections in order:

| # | Section | Key outputs |
|---|---|---|
| 1 | Generate synthetic clinical data | `clinical_trial_data.csv`, `longitudinal_data.csv`, `pca_data.csv` |
| 2 | Choosing the right visualization | Decision table + 8 annotated example charts |
| 3 | Plot parameters quick reference | Three-preset scatter plot (exploratory / presentation / publication) |
| 4 | Table 1: summary statistics + group tests | Formatted baseline-characteristics table with p-values |
| 5 | Scatter plot (grammar of graphics) | Faceted scatter plot with regression lines, colored by arm |
| 6 | Line chart — longitudinal / repeated measures | Mean ± SE over time by arm |
| 7 | Density plots | Single density, multi-group overlay, ridgeline plot |
| 8 | Kaplan-Meier survival curve | KM curve with confidence bands, risk table, log-rank p-value |
| 9 | Forest plot | Effect sizes (HR + 95% CI) across subgroups |
| 10 | ROC curve and AUC | ROC curve with annotated AUC |
| 11 | Boxplot variants with statistical annotation | Boxplot+jitter, mean±SD bar chart, ANOVA+Tukey pairwise stars |
| 12 | Stacked bar plot | Proportional stacked bar with percentage labels |
| 13 | PCA: score plot, biplot, scree plot | PC1 vs PC2 scatter, biplot with loading arrows, scree plot |
| 14 | Multi-panel publication figure | Combined panel figure (patchwork / gridspec) |
| 15 | Exporting for publication | PDF and TIFF exports at 300 DPI |
| 16 | Practice exercise | Nine prompt options + publication-readiness checklist |

---

## Output Files

| File | Source | Format |
|---|---|---|
| `workshop_positron.html` | `workshop_positron.qmd` | Rendered HTML (self-contained, open in any browser) |
| `BCBB_Intro_Workshop_Material.pptx` | — | Slide deck used during the live workshop session |
| `R_version/workshop_R.html` | `R_version/workshop_R.Rmd` | Rendered HTML |
| `workshop_positron_files/figure-html/*.png` | Auto-generated during render | PNG, 300 DPI, one file per code chunk |
| `images/*.svg` | Generated by Section 2 R chunk | SVG thumbnails illustrating chart-type decisions |
| `Practice Exercise/R_version/Practice_Solutions_R.html` | `Practice_Solutions_R.Rmd` | Rendered HTML with all 9 worked solutions (R) |

---

## Package Requirements

### R (all three formats share the same list)

```r
install.packages(c(
  "tidyverse", "survival", "survminer", "patchwork",
  "ggpubr", "viridis", "forestplot", "gtsummary", "gt",
  "table1", "ggridges", "pROC", "svglite"
))
```

### Python

```bash
pip install pandas numpy matplotlib seaborn lifelines statannotations \
            scipy tableone scikit-learn statsmodels joypy
```

> **Positron setup note:** R and Python run as separate kernel processes in Positron. Install Python packages from Positron's Python console (or a terminal using the exact interpreter that console uses — confirm with `python -c "import sys; print(sys.executable)"`). Installing via `reticulate::repl_python()` from the R console installs into a different Python than the one Quarto's `{python}` chunks use, and packages installed there will not be importable in the document.

---

## Color Palettes

Both palettes used throughout the materials are chosen for accessibility:

- **Viridis** — for continuous/ordered data. Perceptually uniform, monotonically increasing luminance, designed to remain legible in grayscale and under common forms of color vision deficiency. Built into matplotlib and ggplot2.
- **Okabe-Ito** — for categorical data (arms, subgroups, sites). An 8-color qualitative palette that stays distinguishable across the most common forms of color blindness (Okabe & Ito, 2008; popularized by Bang Wong, *Nature Methods*, 2011, doi:10.1038/nmeth.1618).
