# Folder 2-Data

Direktori ini digunakan untuk menyimpan seluruh berkas data mentah (*raw data*), data hasil pembersihan (*cleaned data*), serta kamus data (*codebook* / *data provenance*).

## Struktur Data yang Disiapkan

1. **`raw/`**: Data mentah yang ditarik langsung dari sumber resmi:
   - **USDA FAS GATS**: Impor Umum (*General Imports*) AS dari Indonesia level HS-6 (Kuantitas dalam *Metric Tons*, Frekuensi Bulanan 2022-01 s.d. 2026-09):
     - `1511.90`: Sawit Olahan (*Refined Palm Oil*)
     - `4001.22`: Karet Alam (*TSNR SIR-20*)
     - `0901.11`: Kopi Mentah (*Coffee, not roasted, not decaffeinated*)
   - **USITC DataWeb**: Tarif efektif aktual $\tau_t$ ($\text{Calculated Duty} / \text{Customs Value}$).
   - **FRED / Bank Indonesia**: Nilai tukar IDR/USD bulanan (`CCUSMA02IDM618N` / JISDOR).
   - **FRED / World Bank**: Harga minyak mentah dunia Brent bulanan (`POILBREUSDM`).

2. **`processed/`**: Matriks data deret waktu bulanan ($N = 57$ bulan) yang telah disinkronkan, mencakup:
   - Variabel dependen terlogaritma $\ln(Y_t)$
   - Transformasi tarif $\ln(1 + \tau_t)$
   - Variabel kurs dengan shipping lag $\ln(\text{Kurs}_{t-k})$
   - Variabel harga minyak terpusat $\ln(\text{Oil}_{t-k})^c$
   - Dummy blokade Hormuz $D_{\text{Hormuz},t}$ dan suku interaksi $[D_{\text{Hormuz}} \times \ln(\text{Oil})^c]$
