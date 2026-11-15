# STAGE 2 — LAYOUT ARCHITECTURE
**Proyek:** PowerPoint Presentation (15 Slide) & Research Infographic (7 Bagian)  
**Narasi Utama:** *"Satu Perubahan Kebijakan, Lima Respons Perdagangan yang Berbeda."*  
**Direktori Kerja:** `D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v4/`  
**Status:** Draft Iterasi Stage 2 *(Komposisi tata letak, kebutuhan grafik, tabel, diagram, dan anotasi — tanpa mengunci palet warna/dekorasi final)*

---

## 1. Catatan Kolaborasi & Pembaruan Stage 1 → Stage 2

* **Bagian yang Telah Disesuaikan (Stage 1 Tervalidasi):**  
  1. Identitas peneliti menggunakan bentuk ringkas (Kelompok 10 — Analisis Statistika STA2511, IPB University, Dosen Pengampu: Dr. Farit Mochamad Afendi, M.Si.).
  2. Bahasa Indonesia penuh digunakan pada seluruh judul, label grafik, nama komoditas (*Sawit Olahan, Karet Alam TSNR, Kopi Mentah, Minyak Kelapa, Mentega Kakao*), dan nama fase (*Pra-Tarif, Tarif Resiprokal, Pasca-ART*).
  3. Cakupan konten berfokus murni pada hasil penelitian utama (Section 3 Master Prompt).
  4. Rata-rata tiga fase Karet Alam menggunakan angka bulat (*34.600 → 25.700 → 20.300 MT/bulan*).
* **Fokus Kerja Stage 2 Saat Ini:** Merancang arsitektur ruang (*spatial layout*), hierarki pembacaan, kebutuhan spesifik grafik/tabel/diagram, serta sistem anotasi non-warna (*accessibility-first*) untuk seluruh 15 slide PowerPoint dan 7 bagian Infografis, sambil menjaga warna dalam peran fungsional sementara sebelum Stage 3.

---

## 2. Sistem Grid & Peran Visual Sementara (Pra-Stage 3)

Sebelum palet warna final ditetapkan di Stage 3, seluruh desain tata letak mengacu pada **Peran Visual Fungsional**:
* **Zona Latar & Kontainer (*Canvas & Neutral*):** Latar terang bersih dengan ruang kosong luas (*generous whitespace* minimal 25–30% area bebas per halaman).
* **Aksen Fokus Utama (*Primary Focus Role*):** Khusus menyorot temuan terkuat yang lolos koreksi Bonferroni (**Karet Alam TSNR** dan nilai tukar **IDR/USD** pada model karet).
* **Aksen Pembanding Sekunder (*Secondary Signal Role*):** Menandai temuan signifikan pada taraf nominal 5% namun belum lolos ambang Bonferroni (**Sawit Olahan** dan **tarif efektif**; serta sinyal awal **Minyak Kelapa**).
* **Netral Redup (*Muted / Non-Significant Role*):** Menandai hasil yang tidak signifikan secara statistik (**Kopi Mentah, Mentega Kakao, Minyak Brent**), dipadukan dengan pembeda **non-warna** (garis putus-putus, batang terbuka/*hollow bar*, atau label `TS` / simbol bintang).

---

## 3. Arsitektur Tata Letak — PowerPoint Presentation (15 Slide, Rasio 16:9)

### Struktur Kanvas Baku Tiap Slide (kecuali Slide 1)
```
+-------------------------------------------------------------------------+
| [HEADER ZONE: 15% Tinggi]                                               |
| Label Bagian Kecil (kiri atas)                                          |
| Action Title — Kesimpulan Pesan Utama Slide (2 baris maksimal)          |
+-------------------------------------------------------------------------+
| [MAIN CONTENT CANVAS: 75% Tinggi]                                       |
|                                                                         |
|   Area Visual Utama (Grafik / Diagram / Tabel Terstruktur: 60-70%)      |
|   + Panel Interpretasi / Anotasi Ringkas (30-40%, tanpa paragraf panjang)|
|                                                                         |
+-------------------------------------------------------------------------+
| [FOOTER ZONE: 10% Tinggi] Sumber data / Catatan metodologis + No. Slide |
+-------------------------------------------------------------------------+
```

### Rincian Komposisi & Kebutuhan Grafik Tiap Slide

| Slide | Judul & Pesan | Pola Komposisi Tata Letak (*Grid*) | Elemen Visual / Grafik / Diagram yang Dibutuhkan | Anotasi & Label Wajib (Anti-Ambiguitas) |
|:---:|:---|:---|:---|:---|
| **1** | **Satu Perubahan Kebijakan, Lima Respons Perdagangan yang Berbeda** | **Asimetris Bersih (70/30):** Blok tipografi judul besar di sisi kiri; strip vertikal 5 identitas HS-6 di sisi kanan. | Diagram minimalis 5 node HS-6 (`1511.90`, `4001.22`, `0901.11`, `1513.19`, `1804.00`) mengarah ke satu label judul. | Subjudul resmi penelitian; Kelompok 10 (STA2511), Dept. Statistika & Sains Data FMIPA IPB; Dosen: Dr. Farit Mochamad Afendi, M.Si. |
| **2** | **Kebijakan Tarif Resiprokal AS Berlangsung Bersamaan dengan Gejolak Kurs dan Harga Minyak** | **Alur Konseptual 2-Kolom (Kiri-Kanan):** Kiri = Konteks Perubahan Kebijakan Tarif; Kanan = Diagram Interaksi Faktor Makro. | **Diagram Blok Alur Konseptual:** 3 kotak faktor penjelas *(Tarif Efektif Aktual, Kurs IDR/USD, Harga Minyak Brent)* → panah menuju blok *(Volume Impor AS dari Indonesia — 5 Komoditas HS-6)*. | Pembedaan jelas: perubahan tarif April 2025 terjadi bersamaan dengan dinamika kurs & minyak dunia; fokus pada *impor AS dari Indonesia*. |
| **3** | **Penelitian Menguji Keseragaman Perubahan Volume serta Keterkaitannya dengan Tarif dan Makroekonomi** | **Dua Blok Simetris Atas-Bawah atau Kiri-Kanan (50/50):** Memasangkan setiap Pertanyaan Penelitian dengan Tujuan & Pendekatan Ujinya. | **Diagram Peta Pertanyaan → Metode:**<br>Q1 *(Keseragaman perubahan 5 komoditas)* ↔ *Uji-t Welch & Uji 3 Fase*;<br>Q2 *(Keterkaitan tarif, kurs, minyak)* ↔ *Korelasi Pearson & Regresi Linear*. | Label jelas menunjukkan bahwa tiap pertanyaan dijawab oleh metode statistik yang berlainan. |
| **4** | **Lima Pos Tarif HS-6 Mewakili Komoditas Agrikultur Strategis dengan 285 Observasi Bulanan** | **Header Strip Angka + Matriks 5 Kartu Horizontal:** Strip ringkas angka cakupan di atas, 5 kolom kartu seragam di bawah. | **Tabel / Kartu Profil 5 Komoditas** + 3 indikator angka cakupan (*57 bulan*, *5 pos HS-6*, *285 observasi total*). | Tiap kartu memuat tepat 3 info: Nama Bahasa Indonesia, Kode HS-6, dan peran komoditas/cakupan Jan 2022–Sep 2026 (bulanan). |
| **5** | **Analisis Menggunakan Impor Umum AS, Tarif Efektif Aktual, dan Koreksi Bonferroni** | **Diagram Alur Horizontal 3-Tahap + Kotak Definisi Kritis (Bawah):** Alur metode di bagian atas (65%), definisi operasional di bawah (35%). | **Diagram Alur Kerangka Analisis:**<br>Input *(US General Imports & Tarif Efektif)* → Pengujian 4 Metode *(Uji-t Welch, ANOVA/KW, Pearson r, Regresi OLS)* → Filter Inferensi *(Koreksi Bonferroni)*. | **Anotasi Wajib:** (1) Tarif efektif = bea masuk aktual / nilai impor *(bukan tarif resmi)*; (2) Volume = impor AS dari Indonesia *(US General Imports, MT)*. |
| **6** | **Periode Pengamatan Terbagi ke dalam Tiga Fase Kebijakan Sepanjang 2022–2026** | **Kanvas Penuh Horizontal (Linimasa Proporsional):** Satu pita garis waktu proporsional terhadap panjang bulan di tengah, keterangan 2 kelompok uji-t di bawah. | **Grafik/Diagram Linimasa Proporsional:**<br>Segmen 1 (**39 bln**: Jan 22–Mar 25) \| Segmen 2 (**10 bln**: Apr 25–Jan 26) \| Segmen 3 (**8 bln**: Feb–Sep 26). | Kurung pengelompokan di bawah linimasa menunjukkan pemetaan ke **Uji-t 2 Periode**: Pra-Tarif (39 bln) vs Sesudah Kebijakan (18 bln). |
| **7** | **Pergerakan Volume Impor AS dan Tarif Efektif Bervariasi Tajam Antar-Kelima Komoditas** | **Grid *Small Multiples* (75%) + Strip Poin Kunci Kanan (25%):** Menampilkan 5 komoditas secara sejajar tanpa menyatukan skala yang menipu. | **Grafik 1 — *Small Multiples* Deret Waktu (5 Panel × 2 Indikator atau Dual-Panel Terpisah):** Tren bulanan volume impor (MT) dan tarif efektif (%) per komoditas Jan 2022–Sep 2026. | Garis batas vertikal teranotasi di **Apr 2025** dan **Feb 2026**; label sumbu Y jelas (MT/bulan vs %); anotasi tarif Karet Alam hampir 0%. |
| **8** | **Penurunan Volume Terbesar Terjadi pada Karet Alam TSNR (−32,5%), Tidak Semua Komoditas Signifikan** | **Split 65/35:** Kiri = Grafik utama *Diverging Horizontal Bar*; Kanan = Tabel ringkas *p-value* & catatan Bonferroni. | **Grafik 2 — *Diverging Horizontal Bar Chart* (% Perubahan Pra vs Pasca):** Urut dari kontraksi terdalam ke positif: Karet Alam (−32,5%), Minyak Kelapa (−25,7%), Sawit Olahan (−15,5%), Mentega Kakao (+0,3%), Kopi Mentah (+21,8%). | **Pembedaan Non-Warna:** Batang Karet Alam solid gelap + ikon `**` *(Sig. Pasca-Bonferroni)*; Batang Sawit berpola arsir/berbatas tegas + `*` *(Sig. nominal 5%, tak lolos Bonf)*; Batang lain terbuka/abu-abu + `TS` *(Tidak Signifikan)*. Label langsung % dan *p-value* di ujung batang. |
| **9** | **Hanya Karet Alam TSNR yang Konsisten Signifikan Lintas Tiga Fase Setelah Koreksi Bonferroni** | **Matriks Evaluasi Fokus Tengah (70%) + Callout Temuan Kanan (30%):** Tabel matriks visual kompak 5 baris × 4 kolom uji. | **Tabel Matriks Visual 3-Uji + Status Bonferroni:** Baris = 5 komoditas; Kolom = *One-Way ANOVA*, *Welch ANOVA*, *Kruskal-Wallis*, *Keputusan Pasca-Bonferroni*. | Simbol tegas `[✓ Lolos]` khusus pada baris **Karet Alam TSNR** dan `[✕ Tidak Konsisten / Gagal]` pada keempat komoditas lainnya, menghindari ketergantungan warna. |
| **10** | **Impor Karet Alam TSNR Turun Berkelanjutan Hingga Fase Pasca-ART (−14.235,4 MT/bulan)** | **Spotlight 65/35:** Kiri = Grafik bertahap 3 fase Karet Alam; Kanan = 2 Kotak Metrik Utama (*−11.245,3 MT/bln* & *−14.235,4 MT/bln*). | **Grafik 3 — Grafik Batang/Titik 3 Fase Karet Alam TSNR:** Rata-rata **34.600** (Fase 1) → **25.700** (Fase 2) → **20.300 MT/bulan** (Fase 3), lengkap dengan garis penghubung selisih Fase 3 vs Fase 1. | Anotasi langsung angka bulat di puncak batang + bracket pembanding F3 vs F1 (*−14.235,4 MT/bln; Tukey p = 0,000756; Wilcoxon Bonf p = 0,0029*) + label sumbu *Volume Impor AS (MT/bulan)*. |
| **11** | **Korelasi Pearson Menyoroti Asosiasi Kuat Nilai Tukar pada Karet dan Tarif pada Sawit** | **Split 60/40:** Kiri = *Horizontal Lollipop Chart* korelasi terkuat; Kanan = Poin interpretasi batas korelasi bivariat. | **Grafik 4 — *Lollipop Chart* Korelasi Pearson (*r*):** Menampilkan ketiga korelasi menonjol: Karet vs Kurs (*r = −0,629; p = 1,61 × 10⁻⁷*), Kelapa vs Kurs (*r = −0,339; p = 0,0099*), Sawit vs Tarif (*r = −0,338; p = 0,0102*). | Garis referensi vertikal `r = 0`; label langsung nilai `r` dan `p-value` di kanan titik; catatan tegas bahwa korelasi bersifat bivariat (belum mengontrol variabel lain). |
| **12** | **Regresi Memisahkan Hubungan Tarif pada Sawit Olahan dan Nilai Tukar pada Karet Alam** | **Matriks Perbandingan Model 2-Lajur (65%) + Kotak Hasil Nol (35%):** Memisahkan hasil prediktor signifikan vs yang tidak signifikan. | **Tabel & Grafik Koefisien Regresi Teranotasi (Grafik 5):** Memvisualisasikan koefisien *b* dan *p-value*:<br>1) **Karet ← Kurs:** *b* = −6,37 MT/Rp1 (≈ −637,2 MT/Rp100), *p* = 4,73 × 10⁻⁶ *(Sig. Bonf; Adj. R² = 0,3960)*;<br>2) **Sawit ← Tarif:** *b* = −2.675,73 MT/%, *p* = 0,0070 *(Sig. 5%, tak lolos Bonf 1%)*;<br>3) **Kelapa ← Kurs:** *b* = −1,71 MT/Rp1, *p* = 0,0179 *(Tak lolos Bonf)*. | Kotak khusus di kanan/bawah untuk **Kopi Mentah, Mentega Kakao, & Harga Minyak Brent** dengan label tegas *"Tidak Ditemukan Prediktor Signifikan"*. Pembeda simbolis wajib untuk taraf nominal 5% vs pasca-Bonferroni. |
| **13** | **Tarif Efektif Berhubungan dengan Sawit, Sedangkan Karet Lebih Erat Berkaitan dengan Kurs** | **Tabel Sintesis Komparatif Kanvas Penuh (5 Baris × 4 Bukti):** Menggabungkan seluruh bukti agar audiens melihat gambaran utuh sekaligus. | **Tabel Sintesis Lintas Komoditas & Metode:** Baris = 5 komoditas; Kolom = *Uji Beda 2 Periode*, *Uji 3 Fase*, *Korelasi Menonjol*, *Prediktor Regresi Utama*, *Ringkasan Pola*. | Penandaan hierarki bukti dengan tanda centang/kategori kekuatan bukti statistik tanpa narasi bertele-tele. |
| **14** | **Satu Perubahan Kebijakan Diikuti Lima Pola Perdagangan yang Berbeda** | **Layout 3-Pilar Simetris Horizontal (33/33/33):** Tiga blok kesimpulan utama berjejer rapi dari kiri ke kanan dengan garis pembatas tipis. | **Kartu Kesimpulan 3 Kolom:**<br>1. *Heterogenitas Antar-Komoditas*;<br>2. *Karet Alam sebagai Bukti Terkuat (Kurs Dominan)*;<br>3. *Tarif Bukan Penjelas Tunggal (Sawit Tarif 5%, Lainnya Tak Signifikan)*. | Satu kalimat penekanan utama per blok beserta angka penguncinya. |
| **15** | **Asosiasi Statistik Tidak Membuktikan Hubungan Sebab-Akibat Tunggal** | **Split 55/45:** Kiri = 3 Poin Batasan Metodologis Utama; Kanan = Panel Sumber Data & Atribusi Peneliti. | **Daftar Batasan Terstruktur & Blok Sitasi Resmi:**<br>• Sifat observasional (*non-kausal*);<br>• Tidak signifikan $\ne$ pasti tidak terdampak;<br>• Cakupan 5 HS-6 & periode 57 bln. | Sumber lengkap: *US Census Bureau / USDA FAS (US General Imports)*, *USITC DataWeb (Tarif Efektif)*, *BI / FRED (Kurs IDR/USD)*, *World Bank (Brent)*. |

---

## 4. Arsitektur Tata Letak — Research Infographic (Format Vertikal, 7 Bagian)

Infografis didesain sebagai dokumen **satu halaman vertikal (*single-page editorial vertical layout*)** dengan grid 12 kolom, alur baca lurus dari atas ke bawah (*top-to-bottom visual funnel*), dan pemisahan jelas antar-zona melalui ruang kosong yang lega.

```
+=======================================================================+
| [BAGIAN 1: HEADLINE UTAMA & IDENTITAS] (Tinggi ~10%)                  |
| Satu Perubahan Kebijakan, Lima Respons Perdagangan yang Berbeda       |
| Subjudul: Analisis 5 Komoditas Agrikultur Indonesia di Pasar AS       |
+-----------------------------------------------------------------------+
| [BAGIAN 2: CUPLIKAN PENELITIAN / RESEARCH SNAPSHOT] (Tinggi ~13%)     |
| +-------------------+ +--------------------+ +----------------------+ |
| | 57 Bln | 285 Obs  | | 5 Pos HS-6         | | Linimasa 3 Fase:     | |
| | Impor AS (MT)     | | Tarif Efektif Aktual| | F1(39)|F2(10)|F3(8) | |
| +-------------------+ +--------------------+ +----------------------+ |
+-----------------------------------------------------------------------+
| [BAGIAN 3: PERBANDINGAN UTAMA PRA vs PASCA] (Tinggi ~20%)             |
| Judul: Perubahan Volume Sebelum vs Sesudah Kebijakan Tidak Seragam    |
| [Grafik Diverging Horizontal Bar Chart 5 Komoditas (-32,5% s.d +21,8%)]|
| + Anotasi Non-Warna: [** Sig. Bonf | * Sig. 5% | TS Tidak Sig.]       |
+-----------------------------------------------------------------------+
| [BAGIAN 4: TEMUAN UTAMA — KARET ALAM TSNR] (Tinggi ~21%)              |
| Judul: Karet Alam TSNR Turun Konsisten Lintas Tiga Fase Kebijakan     |
| +-----------------------------------+ +-----------------------------+ |
| | Grafik Batang Bertangga 3 Fase    | | Callout Utama:              | |
| | 34.600 -> 25.700 -> 20.300 MT/bln | | -11.245,3 MT/bln (2 Periode)| |
| | (+ Bracket Tukey p = 0,000756)    | | -14.235,4 MT/bln (F3 vs F1) | |
| +-----------------------------------+ +-----------------------------+ |
+-----------------------------------------------------------------------+
| [BAGIAN 5: TEMUAN PENDUKUNG — KORELASI & REGRESI] (Tinggi ~20%)       |
| Judul: Tarif Bukan Satu-Satunya Variabel Penjelas Volume Perdagangan  |
| +---------------------------------+ +-------------------------------+ |
| | Kiri: Penggerak Kurs IDR/USD    | | Kanan: Penggerak Tarif Efektif| |
| | • Karet: b = -6,37 MT/Rp1       | | • Sawit: b = -2.675,73 MT/%   | |
| |   (p=4,73x10^-6, Adj R2=0,3960) | |   (p=0,0070, Sig 5% / non-Bonf| |
| | • Kelapa: b = -1,71 (tak Bonf)  | | • Kopi, Kakao & Brent: TS     | |
| +---------------------------------+ +-------------------------------+ |
+-----------------------------------------------------------------------+
| [BAGIAN 6: WAWASAN PENUTUP / FINAL INSIGHT] (Tinggi ~8%)              |
| Kesimpulan Tajam: Satu Kebijakan, Lima Respons Berbeda — Evaluasi     |
| Perdagangan Agrikultur Wajib Memisahkan Efek Tarif dan Kurs Makro.    |
+-----------------------------------------------------------------------+
| [BAGIAN 7: SUMBER DATA & CATATAN METODOLOGIS] (Tinggi ~8%)            |
| Sumber: US Census / USDA FAS, USITC, BI/FRED, World Bank | Catatan:   |
| Non-kausal, Impor AS, Tarif Efektif Aktual, Bonferroni, Kel. 10 IPB.  |
+=======================================================================+
```

---

## 5. Inventaris Grafik & Kebutuhan Produksi Aset Data (Untuk Stage 3–4)

Untuk menjamin konsistensi mutlak antar-produk, seluruh grafik berikut akan digenerate secara terprogram dari dataset resmi `master_panel_2022_202609.rds` di R (`ggplot2`) setelah sistem warna & tipografi disetujui pada **Stage 3**:

| Kode Aset | Judul Grafik / Diagram | Digunakan Pada | Elemen Visual & Anotasi Wajib |
|:---:|:---|:---|:---|
| **`G1`** | Pita Linimasa 3 Fase Kebijakan (39 / 10 / 8 bulan) | Slide 6 & Infografis Bag. 2 | Panjang segmen proporsional durasi bulan; pembatas *Apr 2025* & *Feb 2026*; braket periode Uji-*t* (39 vs 18 bln). |
| **`G2`** | *Small Multiples* Deret Waktu Volume & Tarif Efektif | Slide 7 | 5 panel horizontal/grid volume impor AS (MT/bln) + panel tarif efektif (%), sumbu X Jan 2022–Sep 2026, garis vertikal batas fase. |
| **`G3`** | *Diverging Bar Chart* Perubahan Volume Uji-*t* Welch | Slide 8 & Infografis Bag. 3 | 5 batang berurutan (`-32,5%` s.d. `+21,8%`), label langsung % & *p-value*, pembeda pola batang solid/arsir/terbuka untuk status Bonferroni. |
| **`G4`** | Progresi 3 Fase Karet Alam TSNR (`34.600 → 25.700 → 20.300`) | Slide 10 & Infografis Bag. 4 | 3 batang bertangga + titik rata-rata, angka bulat langsung di atas batang, garis & teks kontras F3 vs F1 (*−14.235,4 MT/bln; Tukey p=0,000756*). |
| **`G5`** | *Lollipop Chart* Korelasi Pearson Menyolok | Slide 11 | 3 garis & titik nilai `r` (`-0,629`, `-0,339`, `-0,338`), garis acuan `r = 0`, label nilai `r` & `p-value` langsung di samping titik. |
| **`G6`** | Visualisasi Pembandingan Pengaruh Prediktor Regresi OLS | Slide 12 & Infografis Bag. 5 | Komparasi visual koefisien *b*, *p-value*, dan status signifikansi (Kurs pada Karet vs Tarif pada Sawit vs Kelapa/Kopi/Kakao/Brent). |

---

## 6. Evaluasi & Langkah Lanjut Menuju Stage 3

Sesuai aturan iterasi (Section 9):
1. Tata letak dan inventaris grafik pada **Stage 2** ini belum mengunci warna maupun gaya dekoratif final.
2. Sebelum melangkah ke **Stage 3 — Visual System** (penentuan palet warna ramah buta warna / *colorblind-friendly*, hierarki font sans-serif modern, sistem spacing, dan gaya grafik), mohon konfirmasi apakah:
   * Struktur komposisi 15 slide PowerPoint dan 7 bagian Infografis ini sudah sesuai dan proporsional?
   * Daftar 6 aset grafik utama (`G1` s.d. `G6`) sudah memadai untuk mendukung narasi tanpa membuat slide/infografis terlalu padat?
