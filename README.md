# Analisis Asosiasi & Dampak Tarif Resiprokal AS, Kurs, dan Blokade Selat Hormuz terhadap Ekspor Agrikultur Indonesia (Level HS-6)

[![Language: R](https://img.shields.io/badge/Language-R_%E2%89%A5_4.3-blue.svg)](https://www.r-project.org/)
[![Course: STA2511](https://img.shields.io/badge/Course-Analisis_Statistika_(STA2511)-green.svg)](https://ipb.ac.id)
[![Institution: IPB University](https://img.shields.io/badge/Institution-IPB_University-darkblue.svg)](https://ipb.ac.id)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Repositori ini memuat rancangan penelitian, basis data runtun waktu bulanan (Januari 2022 – September 2026, $N = 57$), skrip pemodelan ekonometrika di **R**, pengujian asumsi klasik Gauss-Markov, serta materi visualisasi infografis ukuran A3. Penelitian ini mengkaji respons volume impor Amerika Serikat dari Indonesia pada tingkat pos tarif HS-6 digit untuk tiga komoditas agrikultur utama: **Sawit Olahan** (`1511.90`), **Karet Alam** (`4001.22`), dan **Kopi Mentah** (`0901.11`).

---

## 📌 Ringkasan Eksekutif & Latar Belakang

Perubahan tata kelola perdagangan bilateral Indonesia–Amerika Serikat sepanjang 2022–2026 diwarnai sejumlah pergeseran struktural:
1. **Fase Tarif Resiprokal:** Ancaman tarif resiprokal AS hingga 32% (April 2025).
2. **Kesepakatan ART:** Penandatanganan *Agreement on Reciprocal Trade* (Februari 2026) yang membebaskan tarif bea masuk menjadi 0% bagi komoditas pertanian unggulan RI.
3. **Syok Geopolitik Selat Hormuz:** Disrupsi jalur pelayaran maritim dan lonjakan harga energi dunia akibat penutupan Selat Hormuz (Maret 2026).

Penelitian ini memadukan pendekatan **Analisis Korelasi & Validasi Lag**, **Uji Beda Komparatif Antar-Rezim (ANOVA / Kruskal-Wallis)**, dan **Regresi Linear Berganda (OLS)** secara terpisah untuk ketiga pos tarif HS-6, dilengkapi mitigasi multikolinearitas melalui *mean-centering* dan pengujian 6 asumsi formal Gauss-Markov.

---

## 📂 Struktur Repositori (5 Folder Baku)

Sesuai rancangan metodologi, repositori ini diorganisasi ke dalam 5 folder kerja terstruktur:

```text
anstat-ekspor-agrikultur-hs6/
├── 1-References/           # Materi kuliah teori & responsi Analisis Statistika (STA2511) IPB
├── 2-Data/                 # Basis data mentah (raw), data terolah (processed), dan data provenance
├── 3-Analysis/             # Skrip pemodelan inferensial, ANOVA, OLS, dan diagnostik Gauss-Markov di R
├── 4-Reports/              # Laporan penelitian lengkap (PDF Quarto/Typst) & Infografis A3 (PNG)
├── 5-Panduan/              # Dokumen panduan metodologi, PRD, dan spesifikasi model end-to-end
├── .gitignore              # Konfigurasi pengabaian berkas sementara R/RStudio/Quarto
└── README.md               # Dokumentasi utama proyek riset
```

---

## 🔬 Spesifikasi Model Ekonometrika

Persamaan OLS terpisah untuk masing-masing komoditas HS-6 ($i \in \{1511.90, 4001.22, 0901.11\}$):

$$\ln(Y_t) = \beta_0 + \beta_1 \ln(1 + \tau_t) + \beta_2 \ln(\text{Kurs}_{t-k}) + \beta_3 \ln(\text{Oil}_{t-k})^c + \beta_4 D_{\text{Hormuz},t} + \beta_5 \big[D_{\text{Hormuz},t} \times \ln(\text{Oil}_{t-k})^c\big] + \varepsilon_t$$

### Definisi Variabel
* **$Y_t$**: Volume impor umum AS dari Indonesia (satuan: *Metric Tons*, sumber: USDA FAS GATS).
* **$\tau_t$**: Tarif efektif aktual rasio $\text{Calculated Duty} / \text{Customs Value}$ (sumber: USITC DataWeb).
* **$\text{Kurs}_{t-k}$**: Nilai tukar IDR/USD rata-rata bulanan (sumber: JISDOR Bank Indonesia / FRED) dengan *shipping lag* ($k \in \{1, 2\}$ bulan).
* **$\ln(\text{Oil}_{t-k})^c$**: Harga minyak mentah Brent yang telah di-*mean-centered* ($\ln(\text{Oil}) - \overline{\ln(\text{Oil})}$).
* **$D_{\text{Hormuz},t}$**: Variabel dummy krisis penutupan Selat Hormuz (1 = Mar–Sep 2026, 0 = lainnya).
* **$[D_{\text{Hormuz},t} \times \ln(\text{Oil}_{t-k})^c]$**: Suku interaksi untuk mengukur sensitivitas tambahan harga minyak saat disrupsi jalur maritim.

---

## 🛠️ Persyaratan Lingkungan (*Prerequisites*)

Analisis dijalankan menggunakan bahasa pemrograman **R** (versi $\ge 4.3.0$). Pustaka (*packages*) yang digunakan:

```r
# Pustaka Inti Pemodelan & Diagnostik
install.packages(c(
  "tidyverse",   # Manipulasi data dan visualisasi (ggplot2, dplyr, tidyr)
  "car",         # Uji VIF dan diagnostik regresi lanjutan
  "lmtest",      # Uji Breusch-Pagan, Breusch-Godfrey LM, dan Durbin-Watson
  "sandwich",    # White & Newey-West HAC Robust Standard Errors
  "tseries",     # Uji Jarque-Bera dan stasioneritas ADF
  "agricolae",   # Uji lanjut Tukey HSD dan ANOVA
  "dunn.test",   # Uji lanjut Kruskal-Wallis (Dunn's test dengan koreksi Bonferroni)
  "scales",      # Formatting sumbu plot
  "patchwork"    # Komposisi infografis multi-panel A3
))
```

---

## 📊 Tahapan Eksekusi Analisis

1. **Persiapan Data:** Jalankan `3-Analysis/01_data_acquisition_and_cleaning.R` untuk menyusun matriks bulanan 57 observasi.
2. **Eksplorasi & Validasi Lag:** Jalankan `3-Analysis/02_eda_and_cross_correlation.R` untuk validasi jeda waktu pengiriman laut.
3. **Uji Beda Rezim:** Jalankan `3-Analysis/03_comparative_regime_testing.R` untuk pengujian One-Way ANOVA / Kruskal-Wallis antar-rezim.
4. **Estimasi Model OLS:** Jalankan `3-Analysis/04_ols_regression_modeling.R` untuk ketiga pos tarif HS-6.
5. **Diagnostik Gauss-Markov:** Jalankan `3-Analysis/05_gauss_markov_diagnostics.R` guna memastikan estimasi bersifat *BLUE*.
6. **Kompilasi Laporan & Visual:** Render berkas Quarto di `4-Reports/` untuk menghasilkan PDF laporan dan infografis resolusi A3.

---

## 👥 Tim Peneliti & Kolaborator

* **Emanuel Marthen Embuai** ([@Exmaa](https://github.com/Exmaa)) — Departemen Statistika, FMIPA IPB University.
* Kolaborator Riset & Dewan Pengkaji.

---

## 📄 Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).
