# Kit Produksi Infografis Digital (Kelompok 10 — STA2511)

**Mata Kuliah:** Analisis Statistika (STA2511)  
**Judul Studi:** Mengarungi Badai Tarif Paman Sam: Menakar Ketahanan Ekspor Agrikultur Nusantara (Level HS-6: 2022–2026)  
**Tim Peneliti:** Kelompok 10 — Emanuel Marthen Embuai & Tim  
**Dosen Pengampu / Pembimbing:** Dr. Farit Mochamad Afendi, M.Si. (Pak Farit)  
**Institusi:** Departemen Statistika dan Sains Data, FMIPA IPB University  
**Tautan Desain Canva:** [canva.link/x5sju4kg3ajy4kp](https://canva.link/x5sju4kg3ajy4kp) (ID: `DAHa9_KM1Sg`)  
**Repositori GitHub:** [github.com/Exmaa/anstat-ekspor-agrikultur-hs6](https://github.com/Exmaa/anstat-ekspor-agrikultur-hs6)

---

## Daftar Dokumen Resmi Kit Produksi

Folder ini berisi 4 dokumen PDF panduan komprehensif berstandar jurnalistik data (*Editorial Data Storytelling*) untuk memproduksi dan memvalidasi infografis ilmiah:

| No | Nama Berkas PDF | Format Sumber | Cakupan & Fungsi Dokumen |
|:---:|:---|:---:|:---|
| **01** | [`01_Naskah_dan_Storyline_Infografis.pdf`](./01_Naskah_dan_Storyline_Infografis.pdf) | `.qmd` | **Naskah & Storyline Infografis:** Memuat narasi dramatik 6 babak (*The Narrative Arc*), teks *copywriting* per kartu, *hook*, plot twist karet, hingga resolusi kebijakan. |
| **02** | [`02_Kompendium_Tabel_dan_Metrik_Statistika.pdf`](./02_Kompendium_Tabel_dan_Metrik_Statistika.pdf) | `.qmd` | **Kompendium Tabel & Metrik Statistika:** Buku angka acuan resmi seluruh hasil uji ekonometrika (Deskriptif agregat, Welch's t-test, ANOVA 3 fase, Tukey HSD, Regresi OLS, dan matriks 5 uji Gauss-Markov). |
| **03** | [`03_Blueprint_Desain_dan_Wireframe_Canva.pdf`](./03_Blueprint_Desain_dan_Wireframe_Canva.pdf) | `.qmd` | **Blueprint Desain & Wireframe Canva:** Panduan visual lengkap (dimensi kanvas digital scroll & cetak A2, palet warna Hex, tipografi hierarkis, wireframe 6 zona, katalog ID aset media Canva, dan checklist kendali mutu visual). |
| **04** | [`04_Executive_Summary_dan_Policy_Brief.pdf`](./04_Executive_Summary_dan_Policy_Brief.pdf) | `.qmd` | **Executive Summary & Policy Brief:** Laporan eksekutif ringkas untuk Dosen Pengampu (Pak Farit) dan pembuat kebijakan, memuat sintesis ekonometrika dan matriks strategi kebijakan 3 pilar. |

---

## Basis Data & Parameter Riset

- **Unit Observasi:** Data panel bulanan seimbang (*balanced panel*) 57 bulan (Januari 2022 s.d. September 2026), total $N = 171$ observasi.
- **Komoditas Inti HS-6:**
  - `1511.90`: Sawit Olahan (*Refined Palm Oil*)
  - `4001.22`: Karet Alam Remah TSNR (*SIR-20*)
  - `0901.11`: Kopi Biji Mentah (*Raw Coffee Beans*)
- **Ambang Signifikansi Konservatif Bonferroni:** $\alpha_{\text{Bonf}} = \frac{0{,}05}{3} = 0{,}0167$.
- **Uji Asumsi Klasik:** 100% Lolos Penuh (VIF = 1,517; Breusch-Pagan $p > 0{,}25$; Durbin-Watson = 1,71; Ramsey RESET $p > 0{,}20$).
