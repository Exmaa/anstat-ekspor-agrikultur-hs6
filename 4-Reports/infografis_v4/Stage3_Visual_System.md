# STAGE 3 — VISUAL SYSTEM
**Proyek:** PowerPoint Presentation & Research Infographic  
**Karakter Desain:** *Modern Scientific Editorial + Professional Data Storytelling*  
**Direktori Kerja:** `D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v4/`  
**Status:** Terkunci untuk Produksi Stage 4

---

## 1. Sistem Palet Warna Final (*Colorblind-Safe Editorial Palette*)

Palet dirancang mengikuti standar aksesibilitas visual (*Deuteranopia, Protanopia, dan Tritanopia safe* — menghindari pasangan merah–hijau) serta memberikan fungsi informasi yang konsisten antar-PowerPoint, Grafik R, dan Infografis:

| Kategori & Peran | Nama Warna | Kode Hex | Fungsi Informasi |
| :--- | :--- | :---: | :--- |
| **Kanvas & Latar** | *Paper Off-White* | `#FAFAF8` | Latar belakang utama infografis dan kanvas slide (hangat, minim silau). |
| **Permukaan Kartu** | *Crisp Pure White* | `#FFFFFF` | Latar panel grafik dan kartu konten utama. |
| **Kartu Sekunder** | *Cool Slate Tint* | `#F1F5F9` | Latar blok definisi, catatan batas, atau kartu hasil tidak signifikan. |
| **Garis Batas / Grid** | *Hairline Slate* | `#CBD5E1` | Garis pemisah struktural tipis (`0.75 pt – 1 pt`) dan grid sumbu grafik halus. |
| **Teks Utama & Judul** | *Deep Ink Navy* | `#0F172A` | *Action title*, angka utama (*key metrics*), nama komoditas utama. |
| **Teks Tubuh** | *Slate Charcoal* | `#334155` | Poin interpretasi singkat dan label kategori. |
| **Teks Sekunder** | *Muted Caption* | `#64748B` | Label sumbu grafik, sumber data, catatan kaki, dan nomor slide. |
| **Fokus Utama (Bonferroni)** | *Deep Cobalt Blue* | `#005AB5` | Menyorot **Karet Alam TSNR (`4001.22`)**, **Kurs IDR/USD**, dan temuan lolos koreksi Bonferroni. *(Tint latar: `#EFF6FF`, Border: `#BFDBFE`)*. |
| **Sinyal Sekunder (Taraf 5%)** | *Burnt Amber* | `#D97706` | Menyorot **Sawit Olahan (`1511.90`)**, **Tarif Efektif Aktual**, dan temuan signifikan nominal 5% *(tak lolos Bonferroni 1%)*. *(Tint latar: `#FFFBEB`, Border: `#FDE68A`)*. |
| **Aksen Pembanding Ketiga** | *Deep Teal-Slate* | `#0E7490` | Menyorot sinyal awal **Minyak Kelapa (`1513.19`)** saat dipisahkan dari Sawit & Karet tanpa bentrok buta warna. |
| **Netral / Tidak Signifikan** | *Muted Cool Gray* | `#94A3B8` | Menandai **Kopi Mentah**, **Mentega Kakao**, **Harga Brent**, dan hasil yang tidak signifikan secara statistik. |

---

## 2. Sistem Pembedaan Non-Warna (*Accessibility Encoding*)

Warna **tidak pernah** digunakan sebagai satu-satunya pembeda kategori statistik:
1. **Signifikan Pasca-Bonferroni (Karet Alam / Kurs):** Batang *solid* penuh + tanda bintang ganda **`**`** / simbol `[✓ Lolos Bonf]`.
2. **Signifikan Nominal 5%, Tidak Lolos Bonferroni (Sawit Olahan / Tarif):** Batang *berarsir diagonal* (atau garis batas tebal + titik penanda berlian) + tanda bintang tunggal **`*`** / label `Sig. 5% (Non-Bonf)`.
3. **Tidak Signifikan (Kopi, Kelapa di uji-*t*, Kakao, Brent):** Batang terbuka (*hollow*) atau warna abu-abu pucat dengan garis tepi putus-putus + label eksplisit **`TS`**.

---

## 3. Sistem Tipografi Konsisten (`Segoe UI`)

Satu keluarga font sans-serif modern yang terpasang utuh di Windows, PowerPoint, Chrome, dan R `ragg`:

| Hierarki Teks | Font & Bobot | Ukuran PowerPoint (16:9) | Ukuran Infografis (Cetak/Digital) | Warna |
| :--- | :--- | :---: | :---: | :--- |
| **Judul Utama Cover / Banner** | *Segoe UI Bold* | `30–34 pt` | `40–44 pt` | `#0F172A` |
| **Action Title Slide / Judul Bagian** | *Segoe UI Bold* | `20–22 pt` | `20–24 pt` | `#0F172A` |
| **Label Bagian (*Eyebrow Tag*)** | *Segoe UI Semibold (Caps)* | `10 pt` | `10–11 pt` | `#005AB5` |
| **Subjudul / Deskripsi Ringkas** | *Segoe UI Regular* | `12–13 pt` | `13–14 pt` | `#334155` |
| **Angka Sorotan (*Hero Metrics*)** | *Segoe UI Bold* | `28–36 pt` | `32–42 pt` | `#005AB5` / `#D97706` / `#0F172A` |
| **Teks Interpretasi / Poin** | *Segoe UI Regular / Semibold* | `11–13 pt` | `11–12 pt` | `#334155` |
| **Label Grafik & Nilai Langsung** | *Segoe UI Semibold* | `9.5–11 pt` | `9.5–11 pt` | `#0F172A` / `#334155` |
| **Catatan Kaki & Sumber Data** | *Segoe UI Regular* | `8.5–9 pt` | `9–9.5 pt` | `#64748B` |

---

## 4. Aturan Jarak, Grid, & Gaya Grafik
* **Margin & Whitespace:** Margin luar slide minimal `0.65 inci` (kiri-kanan) dan `0.45 inci` (atas-bawah); margin infografis minimal `48 px`; minimal `25%` luas halaman dibiarkan kosong (*whitespace*) demi keterbacaan editorial.
* **Gaya Grafik (`ggplot2` Theme):**
  * Hilangkan kotak batas penuh (`panel.border = element_blank()`); pertahankan hanya garis dasar sumbu X atau Y tipis (`#94A3B8`).
  * Grid mayor minimal, sangat samar (`#E2E8F0`, `0.4 pt`), tanpa grid minor.
  * Nilai data ditempel langsung (*direct labeling*) pada batang/titik untuk menghilangkan keharusan membaca legenda berulang.
  * Setiap grafik wajib memuat: **Judul informatif**, **Subjudul keterangan indikator & satuan**, serta **Catatan sumber data** di sudut kiri bawah grafik.
