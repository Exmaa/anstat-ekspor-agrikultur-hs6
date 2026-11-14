# Rencana Penelitian (End-to-End Research Plan)

**Topik:** Analisis Asosiasi dan Dampak Tarif Resiprokal AS, Fluktuasi Kurs, dan Guncangan Blokade Selat Hormuz terhadap Ekspor Agrikultur Indonesia (Level HS-6) menggunakan Pendekatan Regresi Linear Berganda.

**Desain Studi:** Studi observasional deret waktu bulanan (*monthly time-series*) memadukan Analisis Korelasi, Uji Beda Komparatif Antar-Rezim (*One-Way ANOVA* / *Kruskal-Wallis*), dan Regresi Linear Berganda (*Ordinary Least Squares* / OLS). Pemodelan dilakukan secara **terpisah (3 model independen)** pada pos tarif HS-6 utama yang aktif diperdagangkan setiap bulan.

---

## Tahap 1: Pengambilan & Seleksi Data (*Data Acquisition*)

Data deret waktu bulanan rentang **Januari 2022 – September 2026** ($N = 57$ observasi bulanan).

1. **Variabel Dependen ($Y_t$) — Volume Impor AS dari Indonesia:**
   * **Sumber:** USDA FAS GATS (*Product Import - General Imports*, Partner: Indonesia, Level: HS-6, Satuan: Metric Tons, Frekuensi: Bulanan).
   * **Seleksi Kode HS-6 Utama:**
     * **Model 1 (Sawit Olahan):** `1511.90` (*Refined Palm Oil* dan fraksinya).
     * **Model 2 (Karet Alam):** `4001.22` (*TSNR SIR-20*).
     * **Model 3 (Kopi Mentah):** `0901.11` (*Coffee, not roasted, not decaffeinated*).

2. **Variabel Independen ($X_t$):**
   * **Tarif Efektif AS ($\tau_t$):** Rasio $\text{Calculated Duty} / \text{Customs Value}$ dari USITC DataWeb.
   * **Kurs IDR/USD ($\text{Kurs}_{t-k}$):** Rata-rata kurs bulanan dari Bank Indonesia (JISDOR) / FRED (`CCUSMA02IDM618N`).
   * **Harga Minyak Dunia ($\text{Oil}_{t-k}$):** Rata-rata bulanan minyak mentah Brent (USD/barel) dari World Bank / FRED (`POILBREUSDM`).
   * **Variabel Dummy Krisis Geopolitik ($D_{\text{Hormuz},t}$):** Bernilai `1` mulai Maret 2026 hingga September 2026 (fase penutupan Selat Hormuz dan rute via Tanjung Harapan), dan `0` sebelumnya.

---

## Tahap 2: Preprocessing & Transformasi Variabel

1. **Transformasi Logaritma Natural ($\ln$):**
   * Seluruh variabel kontinu positif ($Y_t$, $\text{Kurs}_{t-k}$, $\text{Oil}_{t-k}$) ditransformasikan ke $\ln$ untuk elastisitas koefisien.
   * Tarif efektif $\tau_t$ ditransformasikan menjadi $\ln(1 + \tau_t)$ agar tetap terdefinisi saat tarif $0\%$.

2. **Pemusatan Nilai Tengah (*Mean-Centering*) Harga Minyak:**
   $$\ln(\text{Oil}_{t-k})^c = \ln(\text{Oil}_{t-k}) - \overline{\ln(\text{Oil})}$$
   Menghilangkan multikolinearitas struktural pada suku interaksi dan memudahkan interpretasi koefisien intersep $D_{\text{Hormuz},t}$.

3. **Penyesuaian Jeda Pengiriman (*Shipping Lag*):**
   * Variabel $\text{Kurs}_{t-k}$ dan $\text{Oil}_{t-k}$ menggunakan lag $k \in \{1, 2\}$ bulan karena pencatatan GATS berbasis kedatangan (*arrival basis*).

---

## Tahap 3: Analisis Eksplorasi, Korelasi, & Uji Komparatif Rezim

1. **Analisis Korelasi & Validasi Lag:** Pearson ($r$), Spearman ($\rho_s$), dan *Cross-Correlation Function* (CCF) pada lag 0, 1, 2, 3 bulan.
2. **Uji Beda 3 Rezim Kebijakan:**
   * Periode 1 (Pra-Tarif Resiprokal): Jan 2022 – Mar 2025 ($n_1 = 39$).
   * Periode 2 (Transisi Tarif & ART): Apr 2025 – Feb 2026 ($n_2 = 11$).
   * Periode 3 (Krisis Selat Hormuz): Mar 2026 – Sep 2026 ($n_3 = 7$).
3. **Uji Beda:**
   * Uji kenormalan (Shapiro-Wilk) dan kehomogenan ragam (Bartlett / Levene).
   * One-Way ANOVA / Welch's ANOVA / Kruskal-Wallis + Uji Lanjut (*Tukey HSD*, Bonferroni, atau *Dunn's Test*).

---

## Tahap 4: Pemodelan Regresi Linear Berganda OLS

Persamaan OLS terpisah untuk masing-masing komoditas:
$$\ln(Y_t) = \beta_0 + \beta_1 \ln(1 + \tau_t) + \beta_2 \ln(\text{Kurs}_{t-k}) + \beta_3 \ln(\text{Oil}_{t-k})^c + \beta_4 D_{\text{Hormuz},t} + \beta_5 \big[D_{\text{Hormuz},t} \times \ln(\text{Oil}_{t-k})^c\big] + \varepsilon_t$$

* $\beta_1$: Elastisitas beban tarif
* $\beta_2$: Elastisitas nilai tukar
* $\beta_3$: Elastisitas harga minyak dunia kondisi normal
* $\beta_4$: Pergeseran rata-rata ekspor akibat blokade Hormuz
* $\beta_5$: Perubahan sensitivitas minyak saat krisis Hormuz

---

## Tahap 5: Pemeriksaan 6 Asumsi Formal Gauss-Markov

1. **Linearitas & $E(\varepsilon_t) = 0$**: Plot *Residual vs Fitted*.
2. **Normalitas Sisaan**: Q-Q Plot, Histogram, Shapiro-Wilk & Jarque-Bera ($p > 0.05$).
3. **Non-Multikolinearitas**: $\text{VIF} < 5.0$.
4. **Homoskedastisitas**: Uji Breusch-Pagan & White ($p > 0.05$).
5. **Non-Autokorelasi**: Uji Durbin-Watson dan Breusch-Godfrey LM ($p > 0.05$).
6. **Deteksi Outlier & Leverage**: *Hat-values* $h_{tt}$ dan *Studentized Residuals* (rentang $[-2, 2]$).

---

## Tahap 6: Uji Hipotesis & Sintesis Komparatif

1. Uji Kelayakan Simultan (Uji $F$, $R^2$, Adjusted $R^2$, dan Standar Galat $S$).
2. Uji Parsial (Uji $t$ dengan derajat bebas $db = n - p$, $\alpha = 5\%$, CI 95%).
3. Sintesis Komparatif Elastisitas: Sawit (`1511.90`) vs Karet (`4001.22`) vs Kopi (`0901.11`).
