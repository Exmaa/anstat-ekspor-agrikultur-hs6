# PRODUCT REQUIREMENT DOCUMENT (PRD)
## Desain & Standardisasi Infografis Riset ANSTAT IPB Berbasis Hasil Final Draf (2022–2026) dan Rekayasa Balik 15 Poster Angkatan Terdahulu

* **Mata Kuliah:** Analisis Statistika (STA1511 / STA2511) — Departemen Statistika & Sains Data FMIPA IPB University
* **Dosen Pengampu:** Prof. Dr. Ir. Khairil Anwar Notodiputro, M.Sc. & Tim Dosen
* **Basis Data:** US Census Bureau Trade API / USDA FAS GATS (Januari 2022 – September 2026, $N = 57$ Bulan)
* **Status Riset:** Final Draf (`D:\IPB\KULIAH\S1\ANSTAT\Tugas\infografis_v3\Draf`)
* **Kode Dokumen:** `PRD-ANSTAT-INFOGRAFIS-FINAL-DRAF-2026`
* **Target Output:** Poster Infografis Kanvas A2/A3 Cetak & Kanvas Digital Interaktif Canva

---

## 1. Executive Summary & Tujuan Dokumen

Dokumen ini merumuskan **cetak biru (*blueprint*) desain infografis akademik** yang menggabungkan:
1. **Rekayasa Balik (*Reverse-Engineering*) Gaya & Pola 15 Infografis Angkatan Terdahulu** (arsip `Tugas/infografis/ide/` Kelompok 1 s.d. Kelompok 15).
2. **Hasil Inferensial Empiris Final Tim Kita di Folder `Draf`** yang menganalisis 3 komoditas inti HS-6: **Sawit Olahan (`1511.90`)**, **Karet Alam TSNR (`4001.22`)**, dan **Kopi Mentah (`0901.11`)** kurun waktu 57 bulan (2022–2026).
3. **Protokol Integrasi ke Canva** via koneksi resmi akun Canva yang telah aktif dan terotentikasi.

---

## 2. Dekonstruksi Pola & Gaya Infografis Angkatan Lalu

Berdasarkan audit terhadap 15 poster infografis angkatan lalu dan poster acuan kelas, ditemukan pola terstandarisasi yang dinilai paling disukai oleh tim dosen penilai:

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                  ANATOMI STANDAR INFOGRAFIS ANSTAT IPB (A2/A3)               │
├──────────────────────────────────────────────────────────────────────────────┤
│ [BLOK 1] HEADER & IDENTITAS AKADEMIK (Tinggi ~8-10%)                         │
│   • Logo IPB & Departemen Statistika                                         │
│   • Judul Jurnalistik Bernas + Subjudul Metodologis                          │
│   • Metadata Dosen (Prof. Khairil Anwar Notodiputro) & Anggota Kelompok      │
├──────────────────────────────────────────────────────────────────────────────┤
│ [BLOK 2] PROBLEM STATEMENT & 3 KARTU KPI STATISTIKA (Tinggi ~12-14%)         │
│   • Narasi Ringkas: Guncangan Tarif Resiprokal 19% & Gejolak Kurs IDR/USD    │
│   • 3 Kartu Stat-Callout (Angka Ekstrem font >= 48 pt)                       │
├──────────────────────────────────────────────────────────────────────────────┤
│ [BLOK 3] EKSPLORASI TREN TEMPORAL 57 BULAN (Tinggi ~20-22%)                  │
│   • Grafik Deret Waktu Volume Ekspor & Dinamika Tarif Pabean Aktual          │
│   • Penanda Garis Linimasa Kebijakan (Apr 2025: Tarif; Feb 2026: ART)        │
├──────────────────────────────────────────────────────────────────────────────┤
│ [BLOK 4] KOMPARASI 2 PERIODE & ANOVA 3 FASE KEBIJAKAN (Tinggi ~20-22%)       │
│   • Hasil Uji-t Welch (Pra vs Pasca Tarif)                                   │
│   • Boxplot 3 Fase (F1 Pra-Tarif, F2 Tarif Resiprokal, F3 ART)               │
│   • Klaster Uji Lanjut Tukey HSD Karet Alam (-14.235 MT di Fase 3)           │
├──────────────────────────────────────────────────────────────────────────────┤
│ [BLOK 5] PEMODELAN REGRESI OLS & ASUMSI GAUSS-MARKOV (Tinggi ~22-25%)        │
│   • Persamaan OLS Sezaman Sawit, Karet, dan Kopi                             │
│   • Matriks Uji Diagnostik 5 Asumsi (VIF, Shapiro-Wilk, BP, DW, RESET)       │
│   • Highlight Signifikansi Lolos Bonferroni (alpha = 0,0167)                 │
├──────────────────────────────────────────────────────────────────────────────┤
│ [BLOK 6] SINTESIS STRATEGIS, REKOMENDASI & FOOTER (Tinggi ~10-12%)           │
│   • 3 Poin Aksi Kebijakan Berbasis Nilai Elastisitas Koefisien Nyata         │
│   • Sitasi Sumber Pabean Resmi (US Census API, FRED, World Bank) + QR Code   │
└──────────────────────────────────────────────────────────────────────────────┘
```

### 2.1 Ciri Khas Desain Sukses Angkatan Lalu
* **Layout Kartu Terisolasi (*Card-Based Container*):** Setiap blok analisis dibungkus dalam kontainer putih/abu-abu terang dengan bayangan lembut (*soft drop shadow*) dan sudut melengkung (*rounded corners* 8–12 px), mempermudah dewan juri memindai alur logika.
* **Palet Warna Institusional (*Academic Prestige*):**
  * Warna Dasar: *Midnight Navy* (`#0F2537`) atau *Forest Slate* (`#1E293B`).
  * Warna Aksen Hijau Agrikultur: *Emerald Green* (`#0D9488` / `#10B981`) untuk status lolos uji.
  * Warna Aksen Emas/Oranye: *Amber Gold* (`#F59E0B` / `#D97706`) untuk kartu KPI dan penanda penolakan $H_0$.
* **Koreksi Kesalahan Fatal Tahun Lalu (*Anti-Patterns*):**
  * *Tidak menempel screenshot mentah konsol R*. Semua tabel dirancang ulang dengan vektor tipografi bersih.
  * *Tidak menggunakan dinding teks panjang*. Semua temuan disajikan dalam poin bernomor atau kartu statistik.
  * *Tidak memberikan kesimpulan umum mengambang*. Rekomendasi diikat langsung dengan nilai koefisien regresi.

---

## 3. Spesifikasi Konten Infografis Berdasarkan Hasil Final Draf

### Blok 1: Header & Identitas
* **Judul Utama:** *"Menakar Ketahanan Ekspor Agrikultur Nusantara: Analisis Dampak Tarif Resiprokal AS, Volatilitas Kurs, dan Harga Minyak Dunia (Level HS-6)"*
* **Subjudul:** *"Pendekatan Komparatif 57 Bulan (2022–2026): Uji Beda Rezim, Regresi OLS, dan Diagnostik Gauss-Markov pada Sawit, Karet, dan Kopi"*
* **Identitas:** Departemen Statistika FMIPA IPB University | Dosen: Prof. Dr. Ir. Khairil Anwar Notodiputro, M.Sc. | Peneliti: Emanuel Marthen Embuai & Tim.

### Blok 2: Problem Hook & 3 Kartu Stat-Callout (Hasil Riil Draf)
1. **$19{,}00\%$ — Puncak Beban Tarif:** Tarif bea masuk efektif riil yang memukul sawit dan kopi pada Fase 2 sebelum dipulihkan menjadi $0\%$ oleh kesepakatan ART.
2. **$-32{,}5\%$ — Kontraksi Ekspor Karet:** Anjloknya volume ekspor karet alam TSNR dari $34.556\text{ MT}$ menjadi $23.311\text{ MT/bulan}$ akibat tekanan kurs Rupiah.
3. **$R^2 = 42{,}8\%$ — Daya Jelas Model Karet:** Model OLS berhasil menjelaskan hampir separuh variasi ekspor karet ($F = 13{,}24, p < 0{,}0001$).

### Blok 3: Eksplorasi Deret Waktu & Peta Rezim (2022–2026)
* Visualisasi grafik deret waktu bulanan ($N = 57$):
  * Periode 1 (Pra-Tarif): Jan 2022 – Mar 2025 ($n_1 = 39$ bulan) $\rightarrow$ Baseline normal.
  * Periode 2 (Tarif Resiprokal): Apr 2025 – Jan 2026 ($n_2 = 10$ bulan) $\rightarrow$ Puncak tarif $\approx 19\%$.
  * Periode 3 (Fase ART): Feb 2026 – Sep 2026 ($n_3 = 8$ bulan) $\rightarrow$ Pembebasan menuju $0\%$.

### Blok 4: Komparasi 2 Periode & ANOVA 3 Fase (Hasil Riil Draf)
* **Uji-t Welch Dua Periode (Pra vs Pasca):**
  * Karet Alam: $t = 4{,}748$, **$p = 2{,}07 \times 10^{-5}$** (**Lolos Bonferroni $\alpha = 0{,}0167$**).
  * Sawit Olahan: $t = 2{,}172$, **$p = 0{,}0359$** (Turun $-15{,}5\%$).
  * Kopi Mentah: $t = -1{,}789$, $p = 0{,}0814$ (Stabil / Tidak signifikan).
* **Omnibus ANOVA 3 Fase & Uji Lanjut Tukey HSD:**
  * Karet TSNR lolos sangat signifikan ($F = 9{,}566, p = 0{,}00028 < 0{,}0167$).
  * Hasil Uji Lanjut Tukey HSD: Fase 2 vs Fase 1 turun **$-8.853\text{ MT}$** ($p = 0{,}027$); Fase 3 vs Fase 1 anjlok makin dalam **$-14.235\text{ MT}$** ($p = 0{,}00076$).

### Blok 5: Regresi Linear Berganda OLS & 5 Asumsi Gauss-Markov (Hasil Riil Draf)
* **Model 1: Sawit Olahan (`1511.90`)**
  $$\widehat{Y}_t = 41.497 - \mathbf{2.675{,}7}\,\text{Tarif}_t + 6{,}02\,\text{Kurs}_t - 110{,}1\,\text{Brent}_t$$
  * Koefisien Tarif: **$t = -2{,}808, p = 0{,}00696$** (**Lolos Bonferroni $\alpha = 0{,}0167$**). Kenaikan 1% tarif menekan ekspor sebesar $2.675{,}7\text{ MT/bulan}$.
* **Model 2: Karet Alam TSNR (`4001.22`)**
  $$\widehat{Y}_t = 123.733 - 137.527\,\text{Tarif}_t - \mathbf{6{,}37}\,\text{Kurs}_t + 104{,}7\,\text{Brent}_t$$
  * Koefisien Kurs: **$t = -5{,}096, p = 4{,}73 \times 10^{-6}$** (**Lolos Bonferroni $\alpha = 0{,}0167$**). Setiap pelemahan Rp100/USD berkaitan dengan penurunan ekspor sebesar $637\text{ MT/bulan}$.
* **Model 3: Kopi Mentah (`0901.11`)**
  * Seluruh koefisien tidak signifikan ($p \ge 0{,}57, R^2 = 0{,}92\%$), membuktikan ketahanan absolut biji kopi mentah Indonesia.
* **Mini-Badge 5 Asumsi Gauss-Markov:**
  * Multikolinearitas: $\text{VIF} < 1{,}52$ (Bebas Multiko).
  * Homoskedastisitas: Breusch-Pagan $p > 0{,}25$ di seluruh model (Ragam Homogen).
  * Non-autokorelasi: Karet $DW = 1{,}714$ ($p = 0{,}091$, Bebas Autokorelasi).
  * Linearitas: Ramsey RESET $p > 0{,}11$ di seluruh model (Spesifikasi Linier Tepat).

### Blok 6: Rekomendasi Kebijakan Berbasis Statistik
1. **Proteksi Akses Pasar Sawit:** Sawit sangat rentan terhadap tarif ($b = -2.675{,}7\text{ MT}$), sehingga pemeliharaan status pengecualian tarif 0% dalam pakta ART bersifat mutlak.
2. **Mitigasi Tekanan Kurs Karet Alam:** Karet tidak terdampak tarif tetapi sangat tertekan oleh volatilitas makro/kurs ($b = -6{,}37, p < 0{,}00001$), mendesak adanya skema penyangga harga dan efisiensi logistik.
3. **Ketahanan Kopi Mandiri:** Kopi mentah terbukti kebal terhadap tarif dan kurs, ideal sebagai komoditas jangkar devisa.

---

## 4. Arsitektur Integrasi Canva

### Status Konektivitas Canva
* **Penyedia Integrasi:** Antigravity Canva MCP Plugin.
* **Akun Terhubung:** **Emanuel Embuai** (`oUZepay7lzdF8i87qKEZXc`).
* **Desain Eksisting yang Siap Dipakai:**
  * Nama Desain: **`Academic export resilience infographic`**
  * Design ID: `DAHa9rQHHko`
  * Tautan Edit Canva: [https://www.canva.com/d/YsVS9agt-OEMetb](https://www.canva.com/d/YsVS9agt-OEMetb)

### Alur Eksekusi Desain Canva
1. **Pembuatan / Sinkronisasi Kanvas:**
   * Menggunakan kanvas poster A2/A3 portrait yang sudah ada di akun Canva Anda.
2. **Pengunggahan Aset Grafik R:**
   * Seluruh plot vektor beresolusi tinggi (300 DPI) dari `infografis_v3/Draf/3-Analysis/figures/` diunggah ke repositori aset Canva via `upload-asset-from-url`.
3. **Penyusunan Konten (Typography & Layout):**
   * Mengaplikasikan sistem 6 blok di atas ke dalam kanvas Canva secara visual.
4. **Ekspor & Finalisasi:**
   * Desain diekspor dalam format **PDF Print (CMYK 300 DPI)** untuk pengumpulan akademik dan **PNG Resolusi Tinggi** untuk tayangan slide presentasi.
