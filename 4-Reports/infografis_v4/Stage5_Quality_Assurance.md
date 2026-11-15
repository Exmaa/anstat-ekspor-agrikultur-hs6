# STAGE 5: QUALITY ASSURANCE REPORT

**Paket Deliverables Final (`infografis_v4`):**
- PowerPoint Presentation (15 Slide 16:9): `Presentasi_Riset_Ekspor_HS6.pptx` & `Presentasi_Riset_Ekspor_HS6.pdf`
- Research Infographic (1 Halaman Poster Vertikal 7 Bagian): `Infografis_Riset_Ekspor_HS6.pdf` & `Infografis_Riset_Ekspor_HS6.png` (`2480 × 7570 px`)
- Skrip Produksi Reproducible: `01_generate_charts_v4.R`, `02_build_pptx_v4.R`, `03_build_infographic_v4.html`

---

## 1. AUDIT KESESUAIAN ANGKA & METODE (25 / 25 LOLOS)

Seluruh temuan inti dari Master Prompt Bagian 3 telah diverifikasi hadir secara identik pada skrip grafik (`01_generate_charts_v4.R`), skrip presentasi (`02_build_pptx_v4.R`), dan dokumen infografis (`03_build_infographic_v4.html`), setelah eksekusi final:

| Komoditas (HS-6) | Uji-t Welch (39 vs 18 bln) | Uji 3 Fase & Pasca-ANOVA | Korelasi Pearson | Regresi Linear OLS | Status |
|---|---|---|---|---|---|
| **Karet Alam TSNR** (`HS 4001.22`) | −32,5%; −11.245,3 MT/bln; *p* = 0,0000207 [Lolos Bonferroni] | Konsisten signifikan (ANOVA, Welch ANOVA, KW); F1 = 34.600 → F2 = 25.700 → F3 = 20.300 MT/bln; F3 vs F1 = −14.235,4 MT/bln; Tukey *p* = 0,000756; Wilcoxon Bonf *p* = 0,0029 | Kurs IDR/USD: *r* = −0,629 (*p* = 1,61 × 10⁻⁷) | Kurs IDR/USD: *b* = −6,37 MT/Rp1 (≈ −637,2 MT/Rp100); *p* = 4,73 × 10⁻⁶ [Lolos Bonf]; Adj. *R*² = 0,3960 | **LOLOS** |
| **Sawit Olahan** (`HS 1511.90`) | −15,5%; *p* = 0,0359 [Nominal 5%, tak lolos Bonf] | Tidak lolos Bonferroni | Tarif Efektif: *r* = −0,338 (*p* = 0,0102) | Tarif Efektif: *b* = −2.675,73 MT/+1 poin %; *p* = 0,0070 [Nominal 5%, tidak melewati koreksi Bonferroni 1%] | **LOLOS** |
| **Minyak Kelapa** (`HS 1513.19`) | −25,7%; *p* = 0,1640 [TS] | Tidak lolos Bonferroni | Kurs IDR/USD: *r* = −0,339 (*p* = 0,0099) | Kurs IDR/USD: *b* = −1,71 MT/Rp1; *p* = 0,0179 [Tak sig pasca-Bonf] | **LOLOS** |
| **Kopi Mentah** (`HS 0901.11`) | +21,8%; *p* = 0,0814 [TS] | Tidak signifikan | Tidak menonjol | Tidak ditemukan prediktor signifikan | **LOLOS** |
| **Mentega Kakao** (`HS 1804.00`) | +0,3%; *p* = 0,9812 [TS] | Tidak signifikan | Tidak menonjol | Tidak ditemukan prediktor signifikan | **LOLOS** |
| **Harga Minyak Brent** | — | — | Tidak menonjol | Tidak signifikan di kelima model | **LOLOS** |

**Pemeriksaan Integritas Tambahan:**
- Cakupan data terkonfirmasi **285 observasi** (57 bulan × 5 pos tarif HS-6, Jan 2022 – Sep 2026); bebas dari residu draf lama 171 observasi.
- Seluruh label utama menggunakan **Bahasa Indonesia penuh** dengan istilah teknis resmi dalam tanda kurung (*impor AS dari Indonesia (US General Imports)*, *tarif efektif aktual (effective tariff)*).
- Identitas akademik seragam: **Kelompok 10 — Analisis Statistika (STA2511)**, **Departemen Statistika dan Sains Data, FMIPA IPB University**, **Dosen Pengampu: Dr. Farit Mochamad Afendi, M.Si.** (tanpa daftar anggota).

---

## 2. AUDIT KEJUJURAN ILMIAH & AKSESIBILITAS

- **Non-Kausalitas:** Kedua produk menyertakan penegasan eksplisit bahwa uji beda, korelasi, dan regresi bersifat asosiatif observasional, bukan pembuktian hubungan sebab-akibat langsung.
- **Disiplin Hasil Tidak Signifikan:** Dinyatakan jelas bahwa ketiadaan bukti signifikan (Kopi Mentah, Mentega Kakao, Minyak Kelapa) ≠ bukti komoditas tidak terdampak.
- **Presisi Indikator:** Membedakan volume kedatangan di pelabuhan AS (*US General Imports*, MT/bln) dari ekspor global total Indonesia, serta membedakan *tarif efektif aktual* (`Calculated Duty / Customs Value`) dari tarif resmi pengumuman.
- **Aksesibilitas Buta Warna:** Grafik memakai palet aman buta warna (Cobalt `#005AB5`, Amber `#D97706`, Teal `#0E7490`, Abu-abu Netral `#64748B`) disertai pembeda non-warna: batang solid vs arsir diagonal vs garis putus-putus, penanda simbol `[✓]` / `[*]` / `[TS]`, serta variasi bentuk titik (`●`, `◆`, `■`).

---

## 3. AUDIT INSPEKSI VISUAL AKHIR

- **Grafik `G1`–`G6` (300 DPI):** Seluruh 6 grafik PNG diperiksa visual; bebas tabrakan teks, label sumbu terbaca jelas, dan batas nominal *p* = 0,05 pada `G6` dilengkapi pelindung label latar putih bersih.
- **PowerPoint 15 Slide (`Slide1.PNG`–`Slide15.PNG`, 1920×1080):** Seluruh 15 slide hasil ekspor COM PowerPoint diperiksa visual satu per satu. Perbaikan layout diterapkan dengan menghilangkan bug indentasi baris terbungkus OpenXML (`pad_l = 0`) dan menggunakan kartu editorial beraksen (`add_card`) serta pemecahan baris poin yang rapi. Tidak ada teks terpotong maupun elemen tumpang tindih.
- **Infografis 1 Halaman (`Infografis_Riset_Ekspor_HS6.png`, 2480×7570 px & `.pdf`, 1 halaman):** Diperiksa visual secara utuh; proporsi 7 bagian vertikal terjaga, seluruh kartu sejajar rata kiri-kanan, dan halaman PDF terkonfirmasi tepat 1 halaman penuh (`1240 × 3785 px`).
