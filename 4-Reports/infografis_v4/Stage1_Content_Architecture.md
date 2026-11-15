# STAGE 1 — CONTENT ARCHITECTURE (TERVALIDASI)
**Proyek:** PowerPoint Presentation & Research Infographic  
**Judul Riset:** *Analisis Tarif Resiprokal AS, Kurs IDR/USD, dan Harga Minyak Dunia terhadap Impor Agrikultur AS dari Indonesia (Level HS-6)*  
**Narasi Utama (*Central Storyline*):** **"Satu Perubahan Kebijakan, Lima Respons Perdagangan yang Berbeda."**  
**Direktori Kerja:** `D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v4/`  
**Status:** Disetujui & Dikunci (Bahasa Indonesia Penuh, Fokus Murni Temuan Utama, Angka 3 Fase Karet Bulat)

---

## 1. Catatan Pembaruan Stage 1 (Sesuai Konfirmasi Pengguna)

1. **Identitas Peneliti:** Menggunakan identitas ringkas **Kelompok 10 — Analisis Statistika (STA2511), Departemen Statistika dan Sains Data, FMIPA IPB University; Dosen Pengampu: Dr. Farit Mochamad Afendi, M.Si.** Tanpa mencantumkan daftar nama individu anggota kelompok.
2. **Bahasa Indonesia Penuh:** Seluruh nama komoditas dan nama fase kebijakan menggunakan Bahasa Indonesia penuh:
   * **Sawit Olahan** (HS 1511.90)
   * **Karet Alam TSNR** (HS 4001.22)
   * **Kopi Mentah** (HS 0901.11)
   * **Minyak Kelapa** (HS 1513.19)
   * **Mentega Kakao** (HS 1804.00)
   * Fase: **Fase 1 — Pra-Tarif** (Januari 2022–Maret 2025, 39 bulan); **Fase 2 — Tarif Resiprokal** (April 2025–Januari 2026, 10 bulan); **Fase 3 — Pasca-ART** (Februari–September 2026, 8 bulan).
   * Istilah Inggris hanya dipertahankan dalam tanda kurung untuk kejelasan sumber teknis bila diperlukan, seperti *impor AS dari Indonesia (US General Imports)* dan *tarif efektif (effective tariff)*.
3. **Fokus Murni Hasil Utama:** Seluruh materi berfokus murni pada hasil penelitian final di Section 3 (Uji-t 2 periode, Uji 3 fase, Korelasi Pearson, dan Regresi Linear), tanpa menampilkan rincian tabel diagnostik uji asumsi klasik tambahan.
4. **Pembulatan Angka 3 Fase Karet Alam:** Menggunakan angka bulat **34.600 MT/bulan** (Fase 1) → **25.700 MT/bulan** (Fase 2) → **20.300 MT/bulan** (Fase 3), serta mempertahankan angka presisi lainnya sesuai kontrak data (`-11.245,3 MT/bulan`, `-14.235,4 MT/bulan`, `-2.675,73 MT`, `-6,37 MT`, dst.).

---

## 2. Tulang Punggung Narasi & Aturan Integritas Ilmiah

| Babak Narasi | Pesan Kunci (*Core Message*) |
| :--- | :--- |
| **1. Konteks** | Tarif resiprokal AS mengubah lanskap perdagangan sejak April 2025. Penelitian menganalisis volume **impor AS dari Indonesia (*US General Imports*)** pada 5 pos tarif HS-6 selama 57 bulan (Januari 2022–September 2026; 285 observasi). |
| **2. Ketegangan** | Apakah seluruh komoditas merespons dengan pola yang sama? Perubahan rata-rata volume sebelum vs sesudah kebijakan berkisar antara **−32,5% hingga +21,8%**, tetapi tidak semua memiliki bukti statistik yang kuat. |
| **3. Temuan Utama** | **Karet Alam TSNR (HS 4001.22)** merupakan temuan terkuat: mengalami kontraksi −32,5% (*p* = 0,0000207) dan menjadi satu-satunya komoditas yang signifikan secara konsisten lintas tiga fase setelah koreksi Bonferroni. |
| **4. Penjelasan** | **Tarif bukan satu-satunya variabel.** Regresi linear menunjukkan tarif efektif berasosiasi negatif dengan **Sawit Olahan** (taraf nominal 5%), sedangkan **kurs IDR/USD** menjadi prediktor kuat pada **Karet Alam TSNR** (*Adjusted R²* = 0,3960). Harga minyak Brent tidak signifikan. |
| **5. Implikasi** | Respons perdagangan bersifat heterogen antar-komoditas. Hubungan variabel ekonomi pada satu komoditas tidak dapat digeneralisasi ke komoditas lain. |
| **6. Kesimpulan** | Satu perubahan kebijakan beriringan dengan lima respons perdagangan yang berbeda. Karet Alam TSNR menjadi temuan terkuat, tanpa klaim kausalitas tunggal. |

---

## 3. Arsitektur Konten Final — PowerPoint Presentation (15 Slide)

| Slide | Topik | Judul Slide (Format Pesan / *Action Title*) | Konten Inti & Angka Wajib |
|:---:|:---|:---|:---|
| **1** | Identitas | **Satu Perubahan Kebijakan, Lima Respons Perdagangan yang Berbeda** | Subjudul: *Analisis Tarif Resiprokal AS, Kurs IDR/USD, dan Harga Minyak Dunia terhadap Impor Agrikultur AS dari Indonesia (HS-6, 2022–2026)*. Identitas: Kelompok 10 — Analisis Statistika (STA2511), Dept. Statistika & Sains Data FMIPA IPB; Dosen Pengampu: Dr. Farit Mochamad Afendi, M.Si. |
| **2** | Konteks & Masalah | **Kebijakan Tarif Resiprokal AS Berlangsung Bersamaan dengan Gejolak Kurs dan Harga Minyak** | Penerapan tarif resiprokal AS pada April 2025 menguji ketahanan perdagangan komoditas perkebunan Indonesia di pasar AS di tengah fluktuasi kurs IDR/USD dan harga minyak mentah Brent. |
| **3** | Pertanyaan & Tujuan | **Penelitian Menguji Keseragaman Perubahan Volume serta Keterkaitannya dengan Tarif dan Makroekonomi** | Pertanyaan 1: Apakah kelima komoditas menunjukkan perubahan volume impor AS yang sama? Pertanyaan 2: Sejauh mana tarif efektif, kurs IDR/USD, dan harga Brent berasosiasi dengan perubahan volume tersebut? |
| **4** | Cakupan & Komoditas | **Lima Pos Tarif HS-6 Mewakili Komoditas Agrikultur Strategis dengan 285 Observasi Bulanan** | Periode: Jan 2022–Sep 2026 (57 bln/komoditas, total 285 obs). Komoditas: Sawit Olahan (`1511.90`), Karet Alam TSNR (`4001.22`), Kopi Mentah (`0901.11`), Minyak Kelapa (`1513.19`), Mentega Kakao (`1804.00`). |
| **5** | Data & Kerangka Analisis | **Analisis Menggunakan Impor Umum AS, Tarif Efektif Aktual, dan Koreksi Bonferroni** | Volume: impor AS dari Indonesia (*US General Imports*, MT). Tarif: tarif efektif aktual (rasio bea masuk aktual / nilai impor), bukan tarif pengumuman resmi. Prediktor: tarif efektif, kurs IDR/USD, harga Brent. Metode: *Welch's t-test*, ANOVA/Welch/Kruskal-Wallis + pasca-ANOVA, korelasi Pearson, regresi linear + koreksi Bonferroni. |
| **6** | Linimasa Kebijakan | **Periode Pengamatan Terbagi ke dalam Tiga Fase Kebijakan Sepanjang 2022–2026** | **Fase 1 — Pra-Tarif:** Jan 2022–Mar 2025 (39 bln). **Fase 2 — Tarif Resiprokal:** Apr 2025–Jan 2026 (10 bln). **Fase 3 — Pasca-ART:** Feb–Sep 2026 (8 bln). Uji 2 periode membandingkan Pra-Tarif (39 bln) vs Sesudah Kebijakan (18 bln). |
| **7** | Pola Volume Keseluruhan | **Pergerakan Volume Impor AS dan Tarif Efektif Bervariasi Tajam Antar-Kelima Komoditas** | Gambaran lintasan bulanan 57 bulan memperlihatkan perbedaan skala volume dan variasi penerapan tarif efektif antar-pos tarif HS-6 selama 3 fase. |
| **8** | Perbandingan Pra vs Pasca | **Penurunan Volume Terbesar Terjadi pada Karet Alam TSNR (−32,5%), Tidak Semua Komoditas Signifikan** | *Welch's t-test* (39 vs 18 bln): **Karet Alam TSNR −32,5%** (*p* = 0,0000207, Sig. pasca-Bonferroni); **Sawit Olahan −15,5%** (*p* = 0,0359, Sig. nominal 5%, tidak pasca-Bonferroni); **Kopi Mentah +21,8%** (*p* = 0,0814, TS); **Minyak Kelapa −25,7%** (*p* = 0,1640, TS); **Mentega Kakao +0,3%** (*p* = 0,9812, TS). |
| **9** | Analisis Tiga Fase | **Hanya Karet Alam TSNR yang Konsisten Signifikan Lintas Tiga Fase Setelah Koreksi Bonferroni** | Perbandingan 3 fase melalui ANOVA, Welch ANOVA, dan Kruskal-Wallis menunjukkan hanya Karet Alam TSNR yang konsisten lolos setelah koreksi Bonferroni; 4 komoditas lain tidak konsisten/tidak signifikan. |
| **10** | Temuan Utama: Karet | **Impor Karet Alam TSNR Turun Berkelanjutan Hingga Fase Pasca-ART (−14.235,4 MT/bulan)** | Rata-rata turun −11.245,3 MT/bulan (Pra vs Pasca). Rata-rata tiap fase: Fase 1 **34.600** → Fase 2 **25.700** → Fase 3 **20.300 MT/bulan**. Pasca-ANOVA F3 vs F1: turun **14.235,4 MT/bulan** (*Tukey p* = 0,000756; *Wilcoxon Bonferroni p* = 0,0029). |
| **11** | Temuan Korelasi | **Korelasi Pearson Menyoroti Asosiasi Kuat Nilai Tukar pada Karet dan Tarif pada Sawit** | Karet Alam TSNR dengan kurs IDR/USD (*r* = **−0,629**, *p* = 1,61 × 10⁻⁷); Minyak Kelapa dengan kurs IDR/USD (*r* = **−0,339**, *p* = 0,0099); Sawit Olahan dengan tarif efektif (*r* = **−0,338**, *p* = 0,0102). Korelasi bersifat bivariat. |
| **12** | Temuan Regresi | **Regresi Memisahkan Hubungan Tarif pada Sawit Olahan dan Nilai Tukar pada Karet Alam** | **Karet Alam TSNR:** Kurs *b* = **−6,37 MT** per Rp1/USD (≈ −637,2 MT per Rp100/USD), *p* = 4,73 × 10⁻⁶ *(Sig. pasca-Bonferroni, Adjusted R² = 0,3960)*. **Sawit Olahan:** Tarif *b* = **−2.675,73 MT** per +1 poin % tarif, *p* = 0,0070 *(Sig. nominal 5%, tidak lolos Bonferroni 1%)*. **Minyak Kelapa:** Kurs *b* = −1,71 MT per Rp1/USD, *p* = 0,0179 *(Tidak sig. pasca-Bonferroni)*. **Kopi & Kakao:** Tidak ada prediktor signifikan. **Brent:** Tidak signifikan. |
| **13** | Interpretasi Komparatif | **Tarif Efektif Berhubungan dengan Sawit, Sedangkan Karet Lebih Erat Berkaitan dengan Kurs** | Sintesis 5 komoditas: satu kebijakan berinteraksi dengan faktor yang berbeda. Penurunan karet terjadi berkelanjutan dan lebih terkait dengan kurs rupiah, sawit menunjukkan asosiasi dengan tarif, sementara variasi tiga komoditas lain belum dapat dijelaskan secara kuat oleh model. |
| **14** | Kesimpulan Utama | **Satu Perubahan Kebijakan Diikuti Lima Pola Perdagangan yang Berbeda** | Rekap 3 kesimpulan: (1) Respons volume antar-komoditas bersifat heterogen; (2) Karet Alam TSNR menjadi temuan terkuat dengan kontraksi terdalam lintas uji; (3) Kurs IDR/USD dan tarif efektif menunjukkan peran berbeda antar-komoditas. |
| **15** | Keterbatasan & Penutup | **Asosiasi Statistik Tidak Membuktikan Hubungan Sebab-Akibat Tunggal** | Keterbatasan: (1) Studi observasional hanya menunjukkan hubungan dan perbedaan statistik, bukan kausalitas langsung; (2) Hasil tidak signifikan pada Kopi/Kakao/Kelapa tidak berarti komoditas tersebut pasti tidak terdampak; (3) Pengamatan terbatas pada 5 pos HS-6 dan periode Jan 2022–Sep 2026; (4) Sitasi sumber resmi data. |

---

## 4. Arsitektur Konten Final — Research Infographic (7 Bagian)

1. **Judul Utama:** *Satu Perubahan Kebijakan, Lima Respons Perdagangan yang Berbeda* (Subjudul riset & identitas Kelompok 10 IPB / Dosen Pengampu).
2. **Cuplikan Penelitian (*Research Snapshot*):** 57 bulan (Jan 2022–Sep 2026), 285 observasi, 5 pos HS-6 (Sawit Olahan, Karet Alam TSNR, Kopi Mentah, Minyak Kelapa, Mentega Kakao), volume *impor AS dari Indonesia*, *tarif efektif aktual*, linimasa 3 fase (39 / 10 / 8 bulan).
3. **Perbandingan Utama (Pra vs Pasca):** Perubahan rata-rata volume: Karet Alam TSNR **−32,5%** (*p* = 0,0000207, Sig. Bonf), Sawit Olahan **−15,5%** (*p* = 0,0359, Sig. 5%), Minyak Kelapa −25,7% (TS), Mentega Kakao +0,3% (TS), Kopi Mentah +21,8% (TS).
4. **Temuan Utama (Karet Alam TSNR):** Satu-satunya signifikan lintas 3 fase pasca-Bonferroni. Turun −11.245,3 MT/bln secara keseluruhan; progresi fase **34.600 → 25.700 → 20.300 MT/bln**; penurunan Fase 3 vs Fase 1 sebesar **−14.235,4 MT/bln** (*Tukey p* = 0,000756; *Wilcoxon Bonf p* = 0,0029).
5. **Temuan Pendukung (Korelasi & Regresi):** Karet Alam ← Kurs IDR/USD (*b* = −6,37 MT/Rp1, *p* = 4,73 × 10⁻⁶, Adj. *R²* = 0,3960, *r* = −0,629) vs Sawit Olahan ← Tarif Efektif (*b* = −2.675,73 MT/%, *p* = 0,0070, Sig. 5%, *r* = −0,338); catatan Minyak Kelapa (*b* = −1,71, tak lolos Bonf); Kopi, Kakao & Brent tidak signifikan.
6. **Wawasan Penutup (*Final Insight*):** Respons perdagangan komoditas agrikultur bersifat heterogen; tarif bukan variabel penjelas tunggal.
7. **Sumber & Catatan Metodologis:** US Census Bureau / USDA FAS (*US General Imports*), USITC (*effective tariff*), BI/FRED (Kurs), World Bank (Brent); catatan non-kausalitas, pembedaan uji beda vs regresi, serta arti hasil tidak signifikan.
