# STAGE 5: QUALITY ASSURANCE REPORT (REVISI STRUKTUR INFOGRAFIS)

**Paket Deliverables Final (`infografis_v4`):**
- **PowerPoint Presentation (15 Slide 16:9):** `Presentasi_Riset_Ekspor_HS6.pptx` & `Presentasi_Riset_Ekspor_HS6.pdf` *(tetap utuh sesuai persetujuan)*
- **Research Infographic (1 Halaman 6 Zona Sesuai Wireframe + QR + Matriks 5×3):** `Infografis_Riset_Ekspor_HS6.pdf` (1 halaman penuh `1280 × 3255 px`) & `Infografis_Riset_Ekspor_HS6.png` (`2560 × 6510 px`)
- **Skrip Produksi Reproducible:** `01_generate_charts_v4.R`, `01b_generate_compact_reg_chart.R`, `02_build_pptx_v4.R`, `03_build_infographic_v4.html`, serta `assets_v4/qr_repo_anstat.png` & `assets_v4/G6_regresi_compact.png`

---

## 1. RINGKASAN ITERASI DESAIN INFOGRAFIS

1. **Bagian yang Diperbaiki:** Struktur visual `03_build_infographic_v4.html` (seluruh Band 1–6).
2. **Alasan Perbaikan:** Menyesuaikan tata letak infografis dengan sketsa wireframe 6 blok (Judul & Metadata → Sinopsis + QR + Sumber Data → Statistika Deskriptif Time Series → Bar Chart Sebelum/Sesudah & Plot Rata-Rata 3 Fase → Matriks 5 Komoditas × 3 Prediktor `X₁, X₂, X₃` + Faktor Berpengaruh & Uji Lanjutan + Grafik Regresi → Temuan & Kesimpulan).
3. **Perubahan & Disiplin Ilmiah yang Dijaga:**
   - Menambahkan QR Code fungsional menuju repositori GitHub riset (`qr_repo_anstat.png`).
   - Memasukkan plot deret waktu 5 komoditas (`G2_timeseries_5komoditas.png`) pada blok Statistika Deskriptif.
   - Menggunakan **Uji-t Welch (independen: 39 bln vs 18 bln)** alih-alih uji-t berpasangan, serta menjelaskan alasan metodologisnya agar tetap akurat secara statistika.
   - Menyusun tabel lengkap **5 komoditas × 3 prediktor (`X₁` Tarif Efektif, `X₂` Kurs IDR/USD, `X₃` Harga Minyak Brent)** dari keluaran regresi OLS skala Level (`tabel_komparasi_regresi_4_skala.csv`) bersama grafik `G6_regresi_compact.png` yang dirancang khusus agar terbaca jelas pada kolom 1/3 lebar.
4. **Bagian yang Dijaga Tetap Utuh:** Seluruh 15 slide PowerPoint (`Presentasi_Riset_Ekspor_HS6.pptx` / `.pdf`) serta seluruh angka, satuan, periode, status Bonferroni, dan batasan non-kausal penelitian.

---

## 2. AUDIT KESESUAIAN ANGKA, TERMINOLOGI & VISUAL (25 / 25 LOLOS)

- **Pemeriksaan Teks & Angka Otomatis (`02_build_pptx_v4.R` & `03_build_infographic_v4.html`):** **25/25 lulus (0 kegagalan)** mencakup Uji-t Welch (`−32,5%`, `p = 0,0000207`, `−11.245,3 MT/bln`; Sawit `−15,5%`, `p = 0,0359`; Kelapa `−25,7%`, `p = 0,1640`; Kopi `+21,8%`, `p = 0,0814`; Kakao `+0,3%`, `p = 0,9812`), Uji 3 Fase Karet (`34.600 → 25.700 → 20.300 MT/bln`; F3 vs F1 `−14.235,4 MT/bln`; Tukey `p = 0,000756`; Wilcoxon Bonf `p = 0,0029`), Korelasi Pearson (`r = −0,629`, `−0,339`, `−0,338`), Regresi OLS (`b = −6,37 MT/Rp1` / `≈ −637,2 MT per Rp100`, `Adj. R² = 0,3960`; Sawit `b = −2.675,73 MT/%`, `p = 0,0070`; Kelapa `b = −1,71 MT/Rp1`, `p = 0,0179`), serta istilah *US General Imports* dan *tarif efektif aktual*.
- **Inspeksi Visual PNG (`G6_regresi_compact.png` & `Infografis_Riset_Ekspor_HS6.png` `2560 × 6510 px`):** Bebas clipping label, inline bold rapi pada seluruh kartu sumber dan uji lanjutan, palet aman buta warna + penanda non-warna konsisten (`[✓]`, `[*]`, `[TS]`, arsir diagonal, garis putus-putus), dan PDF terkonfirmasi tepat **1 halaman** (`1.210.697 byte`).
