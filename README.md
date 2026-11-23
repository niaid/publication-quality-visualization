# Publication-Quality Visualization with R & Python

Workshop materials for a hands-on code-along session on producing publication-ready figures and statistical tables from clinical data, instructed by Yuyan Yi (December 4, 2026).

---

## Purpose

This workshop teaches participants how to move from raw tabular data to figures that meet the standards expected by biomedical journals — appropriate plot choice, colorblind-safe palettes, correct statistical tests, and export at publication DPI. All examples use a single simulated clinical trial dataset (200 synthetic patients, no real patient data) so every figure can be reproduced without any data-access requirements.

The materials exist in two parallel formats:

| Format | File | Best for |
|---|---|---|
| Quarto (R only) | `workshop_positron.qmd` | R users (Positron, RStudio, VS Code) |
| Jupyter Notebook (Python only) | `Python_version/workshop_Python.ipynb` | Python users (Jupyter, VS Code, Positron) |

Both versions cover the same sections and produce equivalent figures.

---

## Before You Arrive

Complete these steps the night before the workshop so you are ready to code along from the first minute.

### 1. Install the required software

| Software | Tested version | Download |
|---|---|---|
| R | 4.6.1 | https://cran.r-project.org |
| Python | 3.10–3.12 | https://www.python.org/downloads |
| Quarto | latest | https://quarto.org/docs/get-started |
| Positron | latest | https://github.com/posit-dev/positron/releases |

### 2. Choose your path

| Path | File to open | Setup steps below |
|---|---|---|
| R only | `workshop_positron.qmd` | R packages only |
| Python only | `Python_version/workshop_Python.ipynb` | Python packages only |
| Both | both files | R and Python packages |

### 3. Install R packages

In an R console:

```r
source("install_packages.R")
```

### 4. Install Python packages

In a terminal:

```bash
python -m venv .venv && source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r Python_version/requirements.txt
```

### 5. Verify your setup

Run the check scripts to confirm everything loaded correctly:

```r
# R
Rscript check_setup.R
```

```bash
# Python
python Python_version/check_setup.py
```

Each script prints the version of every package and exits with an error if anything is missing.

### Positron setup note

Open `workshop_positron.qmd` in Positron, RStudio, or VS Code (with the Quarto extension) for the R version, or `Python_version/workshop_Python.ipynb` for the Python version. Each file runs in its own kernel — no cross-language setup required.

---

## Repository Layout

```
Publication Quality Visualization_workshop/
├── workshop_positron.qmd          # R Quarto document (Positron edition)
├── workshop_positron.html         # Pre-rendered HTML output of the Quarto document
├── Publication Quality Visualization_workshop.pdf        # Slide deck used during the live workshop
│
├── Python_version/
│   ├── workshop_Python.ipynb      # Python-only Jupyter notebook
│   ├── clinical_trial_data.csv    # Dataset used by the Python version
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

## Workshop Sections

Each document walks through the following sections in order:

| # | Section | Key outputs |
|---|---|---|
| 1 | Generate synthetic clinical data | `clinical_trial_data.csv`, `longitudinal_data.csv`, `pca_data.csv` |
| 2 | Grammar of graphics — scatter plot | Faceted scatter with regression lines, colored by arm |
| 3 | Plot parameters quick reference | Three-preset scatter plot (exploratory / presentation / publication) |
| 4 | Exporting for publication | PDF and TIFF exports at 300 DPI |
| 5 | Choosing the right visualization | Decision table + worked examples for each plot type |
| 5.1 | Table 1: summary statistics + group tests | Formatted baseline-characteristics table with p-values |
| 5.2 | Histogram and density plots | Single density, multi-group overlay, ridgeline plot |
| 5.3 | Boxplot with jittered points | Two-group and multi-group (ANOVA + Tukey pairwise) |
| 5.4 | Bar chart: means with points | Mean ± SD bar chart with significance stars |
| 5.5 | Scatter plot and PCA | PC score plot, biplot with loading arrows, scree plot |
| 5.6 | Line chart — longitudinal / repeated measures | Mean ± SE over time by arm |
| 5.7 | Kaplan-Meier survival curve | KM curve with confidence bands, log-rank p-value |
| 5.8 | Forest plot | Effect sizes (HR + 95% CI) across subgroups |
| 5.9 | ROC curve and AUC | ROC curve with annotated AUC |
| 5.10 | Stacked bar plot | Proportional stacked bar with percentage labels |
| 5.11 | Heatmap | Biomarker correlation heatmap with diverging colormap |
| 6 | Multi-panel publication figure | Combined panel figure (patchwork / gridspec) |
| 7 | Practice exercise | Nine prompt options + publication-readiness checklist |

---

## Practice Exercise & Solutions

The `Practice Exercise/` folder contains worked solutions for the 20-minute hands-on exercise at the end of the workshop. Both R and Python versions cover all 9 exercise options:

| Option | Exercise prompt | Key technique |
|---|---|---|
| 1 | Table 1 comparing baseline characteristics by arm | `gtsummary` / `tableone`, t-test, chi-square |
| 2 | Density plot or ridgeline plot by group | `geom_density` / `kdeplot`, `ggridges` / `joypy` |
| 3 | Kaplan-Meier curve with risk table | `survminer::ggsurvplot` / `lifelines` |
| 4 | Forest plot: HR + 95% CI across 3+ subgroups | Manual `ggplot2` / `matplotlib` errorbar on log scale |
| 5 | ROC curve with AUC for biomarker predicting response | `pROC::ggroc` / `sklearn.metrics.roc_curve` |
| 6 | Line chart of score trajectory over time by arm | `geom_errorbar` / `ax.errorbar`, mean ± SE |
| 7 | Annotated boxplot / mean ± SD bar comparing scores across site | ANOVA + Tukey HSD, significance brackets |
| 8 | Stacked bar chart of smoker status by site | 3-category stacked bar, Okabe-Ito palette |
| 9 | PCA score plot or biplot of the biomarker panel | `prcomp` / `sklearn.PCA`, loading arrows, % variance labels |

Each solution file can be run independently — load the data in the first cell/chunk, then jump to whichever option(s) you worked on.

---

## Datasets

All three datasets are synthetic — generated by the code in Section 1 of each document — and contain no real patient information. Each version folder includes its own copy of all three files so no path adjustments are needed.

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

Same 200 patients measured at weeks 0, 4, 8, and 12. Used for the line chart section. Columns: `patient_id`, `arm`, `week`, `score`.

### `pca_data.csv` — multi-biomarker dataset (200 rows)

Same 200 patients with 6 synthetic correlated biomarkers (`marker_1`–`marker_6`) plus `patient_id`, `arm`, `site`. Used for the PCA sections.

---

## Color Palettes

Both palettes used throughout the materials are chosen for accessibility:

- **Viridis** — for continuous/ordered data. Perceptually uniform, monotonically increasing luminance, designed to remain legible in grayscale and under common forms of color vision deficiency. Built into matplotlib and ggplot2.
- **Okabe-Ito** — for categorical data (arms, subgroups, sites). An 8-color qualitative palette that stays distinguishable across the most common forms of color blindness (Okabe & Ito, 2008; popularized by Bang Wong, *Nature Methods*, 2011, doi:10.1038/nmeth.1618).

---

> Materials were drafted with assistance from Claude (Anthropic) and reviewed and edited by the instructor.
