# Folder 3-Analysis

Direktori ini memuat seluruh skrip analisis, pemodelan statistika, dan pengujian asumsi menggunakan bahasa pemrograman **R** dengan mengutamakan pustaka (*packages*) baku dari CRAN.

## Skrip Analisis yang Direncanakan

1. **`01_data_acquisition_and_cleaning.R`**:
   - Skrip penarikan dan pembersihan data dari USDA FAS GATS, USITC, dan FRED.
   - Pengecekan data hilang (*missing values*) dan konsistensi deret waktu 57 bulan.

2. **`02_eda_and_cross_correlation.R`**:
   - Analisis statistika deskriptif komoditas HS-6.
   - Analisis korelasi Pearson & Spearman.
   - *Cross-Correlation Function* (CCF) pada lag 0, 1, 2, dan 3 bulan untuk memvalidasi *shipping lag* laut.

3. **`03_comparative_regime_testing.R`**:
   - Pembagian data ke 3 rezim: Pra-Tarif (2022-2025), Transisi Tarif & ART (2025-2026), dan Krisis Selat Hormuz (2026).
   - Pengujian asumsi normalitas (Shapiro-Wilk) dan kehomogenan ragam (Bartlett / Levene).
   - Pengujian beda nyata: *One-Way ANOVA* / *Welch's ANOVA* / *Kruskal-Wallis*.
   - Uji lanjut perbandingan ganda: *Tukey HSD*, Bonferroni, atau *Dunn's Test*.

4. **`04_ols_regression_modeling.R`**:
   - Estimasi 3 model regresi OLS independen untuk sawit olahan (`1511.90`), karet alam (`4001.22`), dan kopi mentah (`0901.11`).
   - Suku interaksi dengan *mean-centered* minyak mentah: $[D_{\text{Hormuz}} \times \ln(\text{Oil})^c]$.

5. **`05_gauss_markov_diagnostics.R`**:
   - Evaluasi 6 asumsi OLS:
     - Linearitas (*Residual vs Fitted*)
     - Normalitas sisaan (*Jarque-Bera*, *Shapiro-Wilk*)
     - Non-multikolinearitas (*Variance Inflation Factor* / VIF)
     - Homoskedastisitas (*Breusch-Pagan*, *White*)
     - Non-autokorelasi (*Durbin-Watson*, *Breusch-Godfrey LM*)
     - Deteksi outlier & leverage (*Hat-values*, *Studentized Residuals*)

6. **`06_generate_figures.R`**:
   - Pembuatan grafik visualisasi tren, diagnostik, dan infografis publikasi.
