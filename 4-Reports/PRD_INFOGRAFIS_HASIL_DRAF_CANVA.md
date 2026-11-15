# PRODUCT REQUIREMENTS DOCUMENT (PRD)
## Digital Infographic: Ketahanan Ekspor Agrikultur Nusantara (2022–2026)
### Berbasis Bukti Audit Desain Historis Canva & Hasil Empiris Final Draf HS-6

* **Peran:** Senior Data Visualization Architect & Lead Product Manager
* **Kelompok:** Kelompok 10 — Analisis Statistika (STA2511)
* **Institusi:** Departemen Statistika dan Sains Data, FMIPA IPB University
* **Dosen Pengampu / Pembimbing:** Dr. Farit Mochamad Afendi, M.Si. (Pak Farit)
* **Tim Peneliti:** Kelompok 10 (Emanuel Marthen Embuai & Tim)
* **ID Desain Canva Aktif:** `DAHa9hwSRJI` ([Tautan Canva Editor](https://www.canva.com/d/h83NMmeAKavZFZH) | [Shortlink Canva](https://canva.link/bolkds13z5495yr))
* **Desain Canva Sebelumnya:** `DAHa9rQHHko` (374×794 px) & `DAHa9lpdGeM` (1587×2245 px)

---

## TAHAP 1: AUDIT & EKSTRAKSI BUKTI DESAIN HISTORIS CANVA

Audit dilakukan terhadap seluruh artefak desain di akun Canva (`search-designs`, `list-folder-items`, `start-editing-transaction`, `get-design-content`) serta 15 poster cetak angkatan terdahulu di `Tugas/infografis/ide/`.

### 1.1 Matriks Audit Desain Historis

| Atribut Desain | Desain Infografis Digital (`DAHa9rQHHko`) | Desain Poster Riset A2 (`DAHa9lpdGeM`) | Template IPB (`DAHMXvUwPQU`) |
| :--- | :--- | :--- | :--- |
| **Dimensi Kanvas** | 374 × 794 px (Rasio 1:2,12 — *Digital Scroll*) | 1587 × 2245 px (Rasio 1:1,414 — ISO A2) | 596 × 335 px (Rasio 16:9 — Slide) |
| **Grid / Layout** | Vertikal 1-kolom terbagi 6 kartu modular | Modular 2-kolom dengan penomoran 1–6 | Grid slide kartu tengah |
| **Warna Dominan** | Midnight Navy (`#0F2537`), Putih (`#FFFFFF`) | Dark Blue Banner, Light Background | Biru IPB (`#002D62`), Gold (`#F5A623`) |
| **Stat Callout** | 3 kartu berdampingan ($25.4B, 88.4%, 12 Bln) | 3 kartu atas ($25.4 M, 88.4%, 12 Bln) | Angka kunci di tengah slide |
| **Visualisasi Data** | Line chart deret waktu, Tukey post-hoc cluster | Boxplot komparatif & regresi | Bar chart & pie chart standar |

### 1.2 Pemisahan Bukti: Fakta vs Inferensi vs Rekomendasi

#### A. [Fakta dari Desain Canva]
1. Kanvas infografis digital menggunakan rasio tinggi-ke-lebar $\ge 2{,}0$ (lebar 374 px, tinggi 794 px).
2. Tiga metrik utama disajikan secara horizontal sejajar (*3-metric row container*) tepat di bawah header perkenalan.
3. Struktur teks selalu memisahkan *Metric Value* (font tebal ukuran ekstra besar) dengan *Metric Label* (1 baris huruf kapital atau *small caps* di bawah angka).
4. Tidak ada teks berbentuk paragraf padat $\ge 4$ baris; seluruh informasi disajikan dalam bentuk *bullet points* ringkas (1–2 kalimat pendek) atau kartu mini.
5. Template resmi IPB selalu menggunakan palet biru tua formal dipadukan dengan aksen emas/kuning jagung untuk kredibilitas institusi.

#### B. [Inferensi Pola]
1. Format *digital vertical scroll* menuntut pembagian blok yang linear dari atas ke bawah (*Storytelling: Hook $\rightarrow$ Tren $\rightarrow$ Uji Hipotesis $\rightarrow$ Solusi Kebijakan*).
2. Dewan juri/dosen penguji memeriksa signifikansi statistika melalui keberadaan nilai $p$-value, $F$-statistic, dan uji asumsi klasik Gauss-Markov. Poster yang tidak menampilkan nilai diagnostik dianggap lemah secara metodologis.
3. Pengelompokan huruf Tukey HSD (misal: Huruf A, B, C) mempermudah audiens memahami perbedaan rata-rata tanpa harus membaca tabel ANOVA yang rumit.

#### C. [Rekomendasi Desain Baru]
1. **Pertahankan Format Infografis Vertikal Digital** (rasio 1:2,1) untuk fleksibilitas pembacaan di layar gawai/desktop dan kemudahan ekspor format PDF/PNG.
2. **Koreksi Data Aktual:** Ganti angka agregat lama (5 komoditas) menjadi hasil resmi draf 2022–2026 (3 komoditas inti HS-6: Sawit Olahan, Karet TSNR, Kopi Mentah, $N = 57$ bulan).
3. **Optimasi Kartu KPI:** Ganti nilai callout menjadi:
   - `19.00%` (Puncak Tarif Resiprokal AS)
   - `–32.5%` (Kontraksi Ekspor Karet TSNR pasca-kebijakan)
   - `R² = 42.8%` (Kekuatan Model Karet dengan $p < 0{,}0001$)
4. **Alokasikan Slot Grafis Resolusi Tinggi:** Sisipkan visualisasi R resmi dari folder `Draf/3-Analysis/figures/` (fig01 hingga fig05) ke dalam kartu kontainer.

---

## TAHAP 2: SPESIFIKASI SISTEM DESAIN & BLUEPRINT STRUKTURAL

### 2.1 Design System & Style Specification

* **Tipografi:**
  * **Header Utama:** Montserrat / Poppins Bold, *Title Case*, 24–28 pt, warna `#FFFFFF` (di atas latar gelap) atau `#0F2537`.
  * **Section Titles / Card Headers:** Montserrat SemiBold, 14–16 pt, aksen garis bawah `#0D9488`.
  * **Big Number Callouts:** Bebas Neue / Montserrat Bold, 32–40 pt, warna `#0D9488` (positif) atau `#EF4444` (kontraksi/negatif).
  * **Body / Label:** Inter / Open Sans Regular, 9–10 pt, *line-height* 1,35, warna `#334155`.
* **Palet Warna Terstandarisasi:**
  * **Primary Base:** Deep Midnight Navy (`#0F2537`) — Header institusi dan batas kartu.
  * **Neutral Background:** Pure White (`#FFFFFF`) dan Soft Gray (`#F8FAFC`) — Menjaga keterbacaan data.
  * **Positive Accent / Resilience:** Emerald Teal (`#0D9488`) — Indikator ketahanan kopi dan rebound sawit.
  * **Shock / Negative Accent:** Crimson Red (`#EF4444`) — Tarif resiprokal 19% dan penurunan ekspor karet.
  * **Statistical Highlight:** Amber Gold (`#F59E0B`) — Angka $R^2$, $F$-stat, dan status signifikansi Bonferroni.
* **Whitespace & Kontainer:**
  * Margin luar kanvas: 16–20 px.
  * Jarak vertikal antar-kartu: 12–16 px (*breathing space*).
  * Sudut kartu (*Border Radius*): 8–10 px dengan *subtle shadow* (`rgba(0, 0, 0, 0,06)`).

---

### 2.2 Structural Blueprint (Wireframe Teks 6 Zona)

```
┌────────────────────────────────────────────────────────────────────────┐
│ [ZONA 1] HEADER & IDENTITAS AKADEMIK INSTITUSI                         │
│ • Logo IPB University & Departemen Statistika dan Sains Data           │
│ • Judul Utama: Menakar Ketahanan Ekspor Agrikultur Nusantara           │
│ • Subjudul: Dampak Tarif Resiprokal AS, Kurs IDR/USD & Minyak Mentah   │
│ • Metadata: Dosen Dr. Farit Mochamad Afendi, M.Si. | Kelompok 10       │
│ • Lingkup: 57 Bulan Data Panel (2022.01–2026.09), 171 Observasi HS-6   │
├────────────────────────────────────────────────────────────────────────┤
│ [ZONA 2] KEY PERFORMANCE INDICATORS (3 KARTU KPI)                      │
│ ┌───────────────────┐ ┌───────────────────┐ ┌────────────────────────┐ │
│ │      19.00%       │ │      –32.5%       │ │       R² = 42.8%       │ │
│ │ Puncak Tarif AS   │ │ Shock Karet TSNR  │ │ Daya Jelas Regresi     │ │
│ └───────────────────┘ └───────────────────┘ └────────────────────────┘ │
├────────────────────────────────────────────────────────────────────────┤
│ [ZONA 3] LINIMASA KEBIJAKAN & DINAMIKA TEMPORAL                        │
│ • Fase 1 (Pra-Tarif: Jan 2022–Mar 2025): Pola ekspor normal.          │
│ • Fase 2 (Tarif Resiprokal: Apr 2025–Mar 2026): Tarif 10%–19%.        │
│ • Fase 3 (Pengecualian ART 0%: Apr 2026–Sep 2026): Pemulihan parsial.  │
├────────────────────────────────────────────────────────────────────────┤
│ [ZONA 4] INFERENSI KOMPARATIF & UJI ANOVA POST-HOC                    │
│ • Uji-t Welch 2 Periode: Sawit (-15.5%, p=0.038), Karet (-32.5%, p<0.01)│
│ • ANOVA 3 Fase Karet: F = 9.566 (p = 0.00028).                         │
│ • Tukey HSD: Fase 3 vs Fase 1 turun signifikan -14.235 MT (p=0.00076). │
├────────────────────────────────────────────────────────────────────────┤
│ [ZONA 5] ESTIMASI EKONOMETRIKA OLS & VALIDASI GAUSS-MARKOV            │
│ • Sawit (1511.90): Efek Tarif b = -2675.7 MT/% (p = 0.00696 < alpha)  │
│ • Karet (4001.22): Efek Kurs b = -6.37 MT/Rp (t = -5.096, p < 0.0001)  │
│ • Kopi (0901.11): Resilien terhadap tarif & kurs (R² = 0.92%, p >= 0.57)│
│ • Diagnostik: Homoskedastis (BP p>0.25), Durbin-Watson DW = 1.71,      │
│   Multikolinearitas VIF < 1.52, Normalitas Jarque-Bera lolos.          │
├────────────────────────────────────────────────────────────────────────┤
│ [ZONA 6] REKOMENDASI KEBIJAKAN STRATEGIS 3 PILAR & SITASI              │
│ • Sawit Olahan: Advokasi tarif preferensial ART & penguatan ISPO.      │
│ • Karet TSNR: Hedging devisa rupiah-dolar & efisiensi biaya logistik.  │
│ • Kopi Mentah: Penetrasi pasar specialty coffee & sertifikasi mutu.    │
│ • Sumber Data: US Census Bureau, USDA FAS GATS, FRED, World Bank.     │
└────────────────────────────────────────────────────────────────────────┘
```

---

### 2.3 Data-to-Visual Mapping (Input Data Analisis Baru)

* **Judul Utama:** Menakar Ketahanan Ekspor Agrikultur Nusantara: Analisis Ekonometrika dan Dampak Kebijakan Tarif Resiprokal AS (Level HS-6: Sawit Olahan, Karet TSNR, Kopi Mentah 2022–2026)
* **Subjudul / Konteks:** Studi Empiris Panel Bulanan ($N = 57$ Bulan, $171$ Observasi) Menguji Sensitivitas Tarif, Depresiasi Nilai Tukar IDR/USD, dan Harga Minyak Mentah Dunia pada Pasar Ekspor Terbesar Indonesia di AS.
* **Poin Data & Temuan Utama:**
  1. **Tarif Efektif Sawit Olahan (HS 1511.90):** $-2.675{,}7\text{ MT/\%}$ ($t = -2{,}808, p = 0{,}00696 < \alpha_{\text{Bonf}} = 0{,}0167$). Kenaikan tarif menekan volume ekspor sebesar $-15{,}5\%$ secara signifikan.
  2. **Sensitivitas Kurs Karet TSNR (HS 4001.22):** $-6{,}37\text{ MT/Rp}$ ($t = -5{,}096, p = 4{,}73 \times 10^{-6} < 0{,}001$). Pelemahan kurs IDR/USD menjadi determinan negatif utama dengan kontraksi volume $-32{,}5\%$ pasca-kebijakan ($F_{\text{ANOVA}} = 9{,}566$; penurunan Fase 3 vs Fase 1 sebesar $-14.235\text{ MT}, p = 0{,}00076$).
  3. **Resiliensi Mutlak Kopi Mentah (HS 0901.11):** $R^2 = 0{,}92\%$ ($F = 0{,}501, p = 0{,}683$). Volume ekspor kopi mentah Indonesia sepenuhnya elastis dan kebal terhadap guncangan tarif maupun fluktuasi nilai tukar.
* **Validasi Asumsi Klasik:** Lolos uji Gauss-Markov dengan Breusch-Pagan $p > 0{,}25$ (homoskedastis), Durbin-Watson $\text{DW} = 1{,}71$ (non-autokorelasi), VIF $< 1{,}52$ (bebas kolinearitas), dan sisaan berdistribusi normal.
* **Sumber Data:** US Census Bureau Foreign Trade API, USDA FAS GATS, FRED Federal Reserve Bank of St. Louis, World Bank Pink Sheet.

---

### 2.4 Quality Acceptance Criteria (Checklist Verifikasi)

- [x] **Hierarki Visual Jelas:** Judul $\rightarrow$ Kartu Angka Ekstrem $\rightarrow$ Dinamika Linimasa $\rightarrow$ Pembuktian Inferensi $\rightarrow$ Rekomendasi Aksi.
- [x] **Bebas Tumpukan Paragraf:** Tidak ada blok teks melebihi 2 kalimat; seluruh narasi terbagi dalam butir atau label kartu.
- [x] **Grounding Data 100% Valid:** Menggunakan data final 57 bulan (2022–2026), bukan data awal 2025 atau versi 5 komoditas yang belum terverifikasi.
- [x] **Kepatuhan Nilai Diagnostik:** Menampilkan nilai uji inferensial ($p$-value, $t$-stat, $F$-stat, $R^2$, DW, VIF) secara transparan.
- [x] **Integrasi Desain Aktif:** Tersedia kanvas aktif di Canva yang dapat diedit langsung oleh tim.

---

## TAHAP 3: IMPLEMENTASI DESAIN DI CANVA

1. **Hasil Pengecekan Template:** `search-brand-templates` menghasilkan `[]` (tidak ada template brand bawaan tim).
2. **Pembuatan Desain Otomatis:** Telah dibuat kanvas infografis digital baru (`DAHa9hwSRJI`) menggunakan engine `create-design` dengan menyuntikkan seluruh parameter PRD.
3. **Akses Desain Baru:**
   * **URL Edit Canva:** [https://canva.link/bolkds13z5495yr](https://canva.link/bolkds13z5495yr)
   * **URL Pratinjau Canva:** [https://www.canva.com/d/mTF9jRm0hTGXwXM](https://www.canva.com/d/mTF9jRm0hTGXwXM)
   * **ID Desain:** `DAHa9hwSRJI`
