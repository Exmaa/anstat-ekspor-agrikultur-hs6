# ==============================================================================
# STAGE 4: POWERPOINT PRESENTATION BUILDER (15 SLIDES, 16:9 WIDESCREEN)
# Karakter: Modern Scientific Editorial + Colorblind-Safe + Full Bahasa Indonesia
# ==============================================================================

suppressPackageStartupMessages({
  library(officer)
})

tpl_path <- "C:/Users/eman/.gemini/antigravity/brain/8677522f-8d48-42a9-9661-acea38d18076/scratch/blank_16x9.pptx"
assets   <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v4/assets_v4"
out_pptx <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v4/Presentasi_Riset_Ekspor_HS6.pptx"

# Palet Warna Final Stage 3
C_CANVAS  <- "#FAFAF8"
C_WHITE   <- "#FFFFFF"
C_TINT    <- "#F1F5F9"
C_BORDER  <- "#CBD5E1"
C_NAVY    <- "#0F172A"
C_SLATE   <- "#334155"
C_MUTED   <- "#64748B"
C_COBALT  <- "#005AB5"
C_COB_BG  <- "#EFF6FF"
C_COB_BD  <- "#93C5FD"
C_AMBER   <- "#D97706"
C_AMB_TXT <- "#B45309"
C_AMB_BG  <- "#FFFBEB"
C_AMB_BD  <- "#FCD34D"
C_TEAL    <- "#0E7490"
C_TEA_BG  <- "#ECFEFF"
C_TEA_BD  <- "#67E8F9"

FONT <- "Segoe UI"

# Helper gaya teks & paragraf (pad_l/pad_r = 0 agar bebas bug indent wrapping OpenXML)
txt <- function(label, size = 11, bold = FALSE, italic = FALSE, color = C_SLATE) {
  ftext(label, prop = fp_text(font.family = FONT, font.size = size, bold = bold, italic = italic, color = color))
}

par_std <- function(align = "left", line_sp = 1.22, pad_t = 3, pad_b = 3) {
  fp_par(text.align = align, line_spacing = line_sp,
         padding.top = pad_t, padding.bottom = pad_b, padding.left = 0, padding.right = 0)
}

add_box <- function(doc, blocks, l, t, w, h, bg = "transparent", bd_col = "transparent", bd_w = 0.75, geom = "rect") {
  ln_obj <- if (bd_col == "transparent") sp_line(color = "transparent", lwd = 0) else sp_line(color = bd_col, lwd = bd_w)
  bg_val <- if (bg == "transparent") NULL else bg
  ph_with(doc, value = blocks,
          location = ph_location(left = l, top = t, width = w, height = h, bg = bg_val, ln = ln_obj, geom = geom))
}

add_rect <- function(doc, l, t, w, h, bg = C_WHITE, bd_col = C_BORDER, bd_w = 0.75, geom = "rect") {
  add_box(doc, block_list(fpar(txt("", size = 6))), l, t, w, h, bg = bg, bd_col = bd_col, bd_w = bd_w, geom = geom)
}

# Kartu editorial tajam dengan margin internal terkontrol & garis aksen opsional
add_card <- function(doc, blocks, l, t, w, h, bg = C_WHITE, bd_col = C_BORDER, bd_w = 0.85,
                     accent_col = NULL, accent_side = "top", accent_w = 0.055,
                     pad_x = 0.16, pad_y = 0.12) {
  doc <- add_rect(doc, l, t, w, h, bg = bg, bd_col = bd_col, bd_w = bd_w, geom = "rect")
  tx <- l + pad_x
  ty <- t + pad_y
  tw <- max(0.2, w - 2 * pad_x)
  th <- max(0.2, h - 2 * pad_y)
  if (!is.null(accent_col)) {
    if (accent_side == "top") {
      doc <- add_rect(doc, l, t, w, accent_w, bg = accent_col, bd_col = "transparent")
      ty <- t + accent_w + max(0.08, pad_y - 0.02)
      th <- max(0.2, h - (ty - t) - pad_y + 0.02)
    } else if (accent_side == "left") {
      doc <- add_rect(doc, l, t, accent_w, h, bg = accent_col, bd_col = "transparent")
      tx <- l + accent_w + pad_x
      tw <- max(0.2, w - accent_w - 2 * pad_x)
    }
  }
  add_box(doc, blocks, tx, ty, tw, th, bg = "transparent", bd_col = "transparent", geom = "rect")
}

init_slide <- function(doc, eyebrow, title, slide_no, source_txt = "Sumber: US General Imports (USDA FAS / US Census Bureau), USITC DataWeb, BI/FRED, World Bank (2022–2026).") {
  doc <- add_slide(doc, layout = "Blank", master = "Office Theme")
  doc <- add_rect(doc, 0, 0, 13.3333, 7.5, bg = C_CANVAS, bd_col = "transparent")
  doc <- add_rect(doc, 0, 0, 13.3333, 0.055, bg = C_COBALT, bd_col = "transparent")
  doc <- add_box(doc, block_list(fpar(txt(eyebrow, size = 9.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_t = 0, pad_b = 0))),
                 0.65, 0.22, 11.8, 0.24)
  doc <- add_box(doc, block_list(fpar(txt(title, size = 19, bold = TRUE, color = C_NAVY), fp_p = par_std(line_sp = 1.12, pad_t = 0, pad_b = 0))),
                 0.65, 0.48, 12.03, 0.72)
  doc <- add_rect(doc, 0.65, 1.24, 12.03, 0.015, bg = C_BORDER, bd_col = "transparent")
  doc <- add_rect(doc, 0.65, 7.02, 12.03, 0.015, bg = C_BORDER, bd_col = "transparent")
  doc <- add_box(doc, block_list(fpar(txt(source_txt, size = 8.5, color = C_MUTED), fp_p = par_std(pad_t = 0, pad_b = 0))),
                 0.65, 7.08, 9.5, 0.28)
  doc <- add_box(doc, block_list(fpar(txt(sprintf("Kelompok 10 — STA2511 IPB   |   %d / 15", slide_no), size = 8.5, bold = TRUE, color = C_MUTED),
                                      fp_p = par_std(align = "right", pad_t = 0, pad_b = 0))),
                 10.2, 7.08, 2.48, 0.28)
  return(doc)
}

prs <- read_pptx(tpl_path)

# ==============================================================================
# SLIDE 1: IDENTITAS & JUDUL UTAMA (70/30 COVER EDITORIAL)
# ==============================================================================
prs <- add_slide(prs, layout = "Blank", master = "Office Theme")
prs <- add_rect(prs, 0, 0, 13.3333, 7.5, bg = C_CANVAS, bd_col = "transparent")
prs <- add_rect(prs, 0, 0, 13.3333, 0.08, bg = C_COBALT, bd_col = "transparent")

# Kiri: Hero Title Block
prs <- add_box(prs, block_list(
  fpar(txt("PENELITIAN ANALISIS STATISTIKA (STA2511)  •  IPB UNIVERSITY", size = 10.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 8)),
  fpar(txt("Satu Perubahan Kebijakan,\nLima Respons Perdagangan\nyang Berbeda", size = 34, bold = TRUE, color = C_NAVY), fp_p = par_std(line_sp = 1.12, pad_b = 14)),
  fpar(txt("Analisis Tarif Resiprokal AS, Kurs IDR/USD, dan Harga Minyak Dunia terhadap Volume Impor Agrikultur AS dari Indonesia (Level HS-6, Januari 2022 – September 2026)",
           size = 13.5, color = C_SLATE), fp_p = par_std(line_sp = 1.3, pad_b = 12))
), 0.70, 0.88, 7.75, 4.15)

# Kartu Identitas Bawah Kiri
prs <- add_card(prs, block_list(
  fpar(txt("TIM PENELITI & AKADEMIK", size = 9, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 3)),
  fpar(txt("Kelompok 10 — Analisis Statistika (STA2511)", size = 12, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Departemen Statistika dan Sains Data, FMIPA IPB University", size = 11, color = C_SLATE), fp_p = par_std(pad_b = 4)),
  fpar(txt("Dosen Pengampu: ", size = 10.5, color = C_SLATE), txt("Dr. Farit Mochamad Afendi, M.Si.", size = 10.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 0))
), 0.70, 5.20, 7.60, 1.55, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_COBALT, accent_side = "left", pad_x = 0.20, pad_y = 0.14)

# Kanan: Stack 5 Komoditas HS-6
koms_s1 <- list(
  list("Karet Alam TSNR", "HS 4001.22", "Temuan Terkuat (Lolos Bonferroni)", C_COB_BG, C_COB_BD, C_COBALT),
  list("Sawit Olahan", "HS 1511.90", "Sinyal Tarif Taraf Nominal 5%", C_AMB_BG, C_AMB_BD, C_AMBER),
  list("Minyak Kelapa", "HS 1513.19", "Korelasi Kurs Awal (Tak Lolos Bonf)", C_TEA_BG, C_TEA_BD, C_TEAL),
  list("Kopi Mentah", "HS 0901.11", "Tidak Signifikan dalam Model", C_WHITE, C_BORDER, C_MUTED),
  list("Mentega Kakao", "HS 1804.00", "Tidak Signifikan dalam Model", C_WHITE, C_BORDER, C_MUTED)
)
y_k <- 0.92
for (km in koms_s1) {
  prs <- add_card(prs, block_list(
    fpar(txt(km[[1]], size = 11.5, bold = TRUE, color = C_NAVY), txt(paste0("   (", km[[2]], ")"), size = 10, bold = TRUE, color = km[[6]]), fp_p = par_std(pad_t = 0, pad_b = 2)),
    fpar(txt(km[[3]], size = 9.5, color = C_SLATE), fp_p = par_std(pad_t = 0, pad_b = 0))
  ), 8.85, y_k, 3.80, 0.88, bg = km[[4]], bd_col = km[[5]], bd_w = 0.85, accent_col = km[[6]], accent_side = "left", pad_x = 0.16, pad_y = 0.13)
  y_k <- y_k + 0.99
}
prs <- add_card(prs, block_list(
  fpar(txt("57 Bulan  •  5 Pos Tarif HS-6  •  285 Observasi", size = 10.5, bold = TRUE, color = C_WHITE), fp_p = par_std(align = "center", pad_t = 2, pad_b = 0))
), 8.85, 5.95, 3.80, 0.56, bg = C_NAVY, bd_col = C_NAVY, pad_x = 0.12, pad_y = 0.12)

# Hapus slide template awal
prs <- remove_slide(prs, index = 1)

# ==============================================================================
# SLIDE 2: KONTEKS & MASALAH
# ==============================================================================
prs <- init_slide(prs, "1. KONTEKS & MASALAH PENELITIAN",
                  "Kebijakan Tarif Resiprokal AS Berlangsung Bersamaan dengan Gejolak Kurs dan Harga Minyak", 2)

prs <- add_card(prs, block_list(
  fpar(txt("MENGAPA ANALISIS MULTIVARIAT DIBUTUHKAN?", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 10)),
  fpar(txt("1. Perubahan Kebijakan Tarif AS (April 2025)", size = 12, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Penerapan tarif resiprokal mengubah kondisi akses masuk komoditas mitra dagang ke pasar Amerika Serikat.", size = 11, color = C_SLATE), fp_p = par_std(pad_b = 12)),
  fpar(txt("2. Dinamika Makroekonomi Sezaman", size = 12, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Fluktuasi nilai tukar IDR/USD dan harga minyak mentah Brent berjalan bersamaan, memengaruhi biaya pengapalan dan daya saing harga.", size = 11, color = C_SLATE), fp_p = par_std(pad_b = 12)),
  fpar(txt("3. Risiko Kesalahan Generalisasi", size = 12, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Perubahan volume perdagangan tiap komoditas belum tentu seragam dan tidak dapat langsung dianggap sebagai dampak tarif semata.", size = 11, color = C_SLATE), fp_p = par_std(pad_b = 0))
), 0.65, 1.50, 5.45, 5.15, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_COBALT, accent_side = "top", pad_x = 0.24, pad_y = 0.18)

prs <- add_box(prs, block_list(fpar(txt("KERANGKA INTERAKSI FAKTOR PENJELAS TERHADAP IMPOR AS", size = 9.5, bold = TRUE, color = C_MUTED), fp_p = par_std(align = "center", pad_t = 2))),
               6.40, 1.50, 6.28, 0.35)

prs <- add_card(prs, block_list(
  fpar(txt("Tarif Efektif Aktual (%)", size = 12, bold = TRUE, color = C_AMB_TXT), fp_p = par_std(pad_b = 2)),
  fpar(txt("Rasio bea masuk aktual terhadap nilai impor pabean AS", size = 10, color = C_SLATE))
), 6.45, 2.00, 3.05, 1.15, bg = C_AMB_BG, bd_col = C_AMB_BD, accent_col = C_AMBER, accent_side = "left", pad_x = 0.15, pad_y = 0.14)

prs <- add_card(prs, block_list(
  fpar(txt("Kurs Nilai Tukar (IDR/USD)", size = 12, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 2)),
  fpar(txt("Tekanan depresiasi / fluktuasi rupiah bulanan", size = 10, color = C_SLATE))
), 6.45, 3.45, 3.05, 1.15, bg = C_COB_BG, bd_col = C_COB_BD, accent_col = C_COBALT, accent_side = "left", pad_x = 0.15, pad_y = 0.14)

prs <- add_card(prs, block_list(
  fpar(txt("Harga Minyak Brent (USD/bbl)", size = 12, bold = TRUE, color = C_SLATE), fp_p = par_std(pad_b = 2)),
  fpar(txt("Indikator biaya energi & logistik pelayaran global", size = 10, color = C_SLATE))
), 6.45, 4.90, 3.05, 1.15, bg = C_TINT, bd_col = C_BORDER, accent_col = C_MUTED, accent_side = "left", pad_x = 0.15, pad_y = 0.14)

prs <- add_box(prs, block_list(fpar(txt("→", size = 24, bold = TRUE, color = C_AMBER), fp_p = par_std(align = "center"))), 9.52, 2.35, 0.55, 0.50)
prs <- add_box(prs, block_list(fpar(txt("→", size = 24, bold = TRUE, color = C_COBALT), fp_p = par_std(align = "center"))), 9.52, 3.80, 0.55, 0.50)
prs <- add_box(prs, block_list(fpar(txt("→", size = 24, bold = TRUE, color = C_MUTED), fp_p = par_std(align = "center"))), 9.52, 5.25, 0.55, 0.50)

prs <- add_card(prs, block_list(
  fpar(txt("VARIABEL RESPONS", size = 9, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 4)),
  fpar(txt("Volume Impor AS\ndari Indonesia\n(US General Imports)", size = 13.5, bold = TRUE, color = C_NAVY), fp_p = par_std(line_sp = 1.18, pad_b = 10)),
  fpar(txt("Satuan: Metrik Ton (MT/bln)", size = 10, bold = TRUE, color = C_SLATE), fp_p = par_std(pad_b = 8)),
  fpar(txt("• Sawit Olahan (1511.90)\n• Karet Alam TSNR (4001.22)\n• Kopi Mentah (0901.11)\n• Minyak Kelapa (1513.19)\n• Mentega Kakao (1804.00)",
           size = 10, color = C_SLATE), fp_p = par_std(line_sp = 1.28))
), 10.10, 2.00, 2.58, 4.05, bg = C_WHITE, bd_col = C_NAVY, bd_w = 1.2, accent_col = C_NAVY, accent_side = "top", pad_x = 0.18, pad_y = 0.15)

# ==============================================================================
# SLIDE 3: PERTANYAAN & TUJUAN PENELITIAN
# ==============================================================================
prs <- init_slide(prs, "2. PERTANYAAN & TUJUAN PENELITIAN",
                  "Penelitian Menguji Keseragaman Perubahan Volume serta Keterkaitannya dengan Tarif dan Makroekonomi", 3)

prs <- add_card(prs, block_list(
  fpar(txt("PERTANYAAN PENELITIAN 1", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 8)),
  fpar(txt("Apakah kelima komoditas menunjukkan perubahan volume impor AS yang sama setelah penerapan kebijakan tarif AS?", size = 16.5, bold = TRUE, color = C_NAVY), fp_p = par_std(line_sp = 1.25, pad_b = 16)),
  fpar(txt("TUJUAN & PENDEKATAN PENGUJIAN", size = 9.5, bold = TRUE, color = C_MUTED), fp_p = par_std(pad_b = 6)),
  fpar(txt("• Membandingkan rata-rata volume sebelum kebijakan (39 bln) vs sesudah kebijakan (18 bln) melalui Uji-t Welch.", size = 11.2, color = C_SLATE), fp_p = par_std(pad_b = 8)),
  fpar(txt("• Menguji konsistensi perubahan lintas tiga fase (Pra-Tarif, Tarif Resiprokal, Pasca-ART) dengan ANOVA, Welch ANOVA, Kruskal-Wallis, serta uji lanjut pasca-ANOVA.", size = 11.2, color = C_SLATE))
), 0.65, 1.55, 5.80, 5.05, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_COBALT, accent_side = "top", accent_w = 0.07, pad_x = 0.26, pad_y = 0.20)

prs <- add_card(prs, block_list(
  fpar(txt("PERTANYAAN PENELITIAN 2", size = 10, bold = TRUE, color = C_AMB_TXT), fp_p = par_std(pad_b = 8)),
  fpar(txt("Sejauh mana tarif efektif aktual, nilai tukar IDR/USD, dan harga minyak dunia berkaitan dengan perubahan volume tersebut?", size = 16.5, bold = TRUE, color = C_NAVY), fp_p = par_std(line_sp = 1.25, pad_b = 16)),
  fpar(txt("TUJUAN & PENDEKATAN PENGUJIAN", size = 9.5, bold = TRUE, color = C_MUTED), fp_p = par_std(pad_b = 6)),
  fpar(txt("• Mengevaluasi korelasi linear bivariat antara volume impor tiap komoditas dan masing-masing prediktor (Korelasi Pearson).", size = 11.2, color = C_SLATE), fp_p = par_std(pad_b = 8)),
  fpar(txt("• Mengukur asosiasi parsial secara simultan dalam model regresi linear berganda dengan pengendalian kesalahan multikomparasi (Koreksi Bonferroni).", size = 11.2, color = C_SLATE))
), 6.88, 1.55, 5.80, 5.05, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_AMBER, accent_side = "top", accent_w = 0.07, pad_x = 0.26, pad_y = 0.20)

# ==============================================================================
# SLIDE 4: CAKUPAN & KOMODITAS
# ==============================================================================
prs <- init_slide(prs, "3. CAKUPAN DATA & KOMODITAS",
                  "Lima Pos Tarif HS-6 Mewakili Komoditas Agrikultur Strategis dengan 285 Observasi Bulanan", 4)

stats_s4 <- list(
  list("Januari 2022 – September 2026", "Rentang Waktu Pengamatan (57 Bulan)"),
  list("Bulanan (Monthly Panel)", "Frekuensi Pengamatan Berimbang"),
  list("285 Observasi Total", "57 Bulan × 5 Pos Tarif HS-6")
)
x_s4 <- 0.65
for (st in stats_s4) {
  prs <- add_card(prs, block_list(
    fpar(txt(st[[1]], size = 14, bold = TRUE, color = C_COBALT), fp_p = par_std(align = "center", pad_t = 2, pad_b = 2)),
    fpar(txt(st[[2]], size = 10, color = C_SLATE), fp_p = par_std(align = "center", pad_t = 0, pad_b = 0))
  ), x_s4, 1.50, 3.84, 0.92, bg = C_WHITE, bd_col = C_BORDER, pad_x = 0.14, pad_y = 0.14)
  x_s4 <- x_s4 + 4.09
}

cards_s4 <- list(
  list("Karet Alam TSNR", "HS 4001.22", "Bahan baku utama industri ban & manufaktur otomotif.", "Tarif Efektif Aktual:\n≤ 0,08%", C_COB_BG, C_COBALT, C_COB_BD),
  list("Sawit Olahan", "HS 1511.90", "Minyak sawit olahan untuk pangan & oleokimia industri.", "Tarif Efektif Puncak:\n19,00%", C_AMB_BG, C_AMBER, C_AMB_BD),
  list("Minyak Kelapa", "HS 1513.19", "Minyak kelapa olahan untuk pangan & kosmetik khusus.", "Tarif Efektif Puncak:\n18,93%", C_TEA_BG, C_TEAL, C_TEA_BD),
  list("Kopi Mentah", "HS 0901.11", "Biji kopi mentah belum disangrai (non-decaf).", "Tarif Efektif Puncak:\n18,85%", C_WHITE, C_MUTED, C_BORDER),
  list("Mentega Kakao", "HS 1804.00", "Lemak & minyak kakao untuk bahan baku cokelat.", "Tarif Efektif Puncak:\n19,00%", C_WHITE, C_MUTED, C_BORDER)
)
x_c4 <- 0.65
for (cd in cards_s4) {
  prs <- add_card(prs, block_list(
    fpar(txt(cd[[2]], size = 11, bold = TRUE, color = cd[[6]]), fp_p = par_std(pad_t = 2, pad_b = 4)),
    fpar(txt(cd[[1]], size = 14, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 8)),
    fpar(txt(cd[[3]], size = 10.5, color = C_SLATE), fp_p = par_std(line_sp = 1.25, pad_b = 14)),
    fpar(txt(cd[[4]], size = 10, bold = TRUE, color = C_NAVY), fp_p = par_std(line_sp = 1.22, pad_t = 4))
  ), x_c4, 2.70, 2.24, 3.92, bg = cd[[5]], bd_col = cd[[7]], accent_col = cd[[6]], accent_side = "top", accent_w = 0.06, pad_x = 0.16, pad_y = 0.14)
  x_c4 <- x_c4 + 2.445
}

# ==============================================================================
# SLIDE 5: DATA & KERANGKA ANALISIS
# ==============================================================================
prs <- init_slide(prs, "4. DATA & KERANGKA METODOLOGI",
                  "Analisis Menggunakan Impor Umum AS, Tarif Efektif Aktual, dan Koreksi Bonferroni", 5)

prs <- add_card(prs, block_list(
  fpar(txt("TAHAP 1: DATA PANEL (N = 285)", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 6)),
  fpar(txt("• Respons: Volume Impor AS (MT/bln)\n• Prediktor 1: Tarif Efektif Aktual (%)\n• Prediktor 2: Kurs IDR/USD (Rp/USD)\n• Prediktor 3: Harga Minyak Brent (USD/bbl)", size = 10.5, color = C_SLATE), fp_p = par_std(line_sp = 1.32))
), 0.65, 1.50, 3.65, 2.50, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_NAVY, accent_side = "top", pad_x = 0.18, pad_y = 0.14)

prs <- add_box(prs, block_list(fpar(txt("→", size = 24, bold = TRUE, color = C_COBALT), fp_p = par_std(align = "center"))), 4.35, 2.45, 0.45, 0.50)

prs <- add_card(prs, block_list(
  fpar(txt("TAHAP 2: EMPAT METODE UJI", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 6)),
  fpar(txt("1. Uji-t Welch (Sebelum vs Sesudah)\n2. ANOVA, Welch ANOVA & Kruskal-Wallis + Pasca-ANOVA (3 Fase)\n3. Korelasi Pearson (Hubungan Bivariat)\n4. Regresi Linear OLS (Asosiasi Multivariat)", size = 10.5, color = C_SLATE), fp_p = par_std(line_sp = 1.28))
), 4.85, 1.50, 4.15, 2.50, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_COBALT, accent_side = "top", pad_x = 0.18, pad_y = 0.14)

prs <- add_box(prs, block_list(fpar(txt("→", size = 24, bold = TRUE, color = C_COBALT), fp_p = par_std(align = "center"))), 9.05, 2.45, 0.45, 0.50)

prs <- add_card(prs, block_list(
  fpar(txt("TAHAP 3: KENDALI SIGNIFIKANSI", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 6)),
  fpar(txt("• Pengujian serempak lintas 5 komoditas menaikkan risiko positif palsu (Kesalahan Tipe I).\n• Koreksi Bonferroni diterapkan untuk menyaring bukti terkuat vs temuan taraf nominal 5%.", size = 10.5, color = C_SLATE), fp_p = par_std(line_sp = 1.28))
), 9.55, 1.50, 3.13, 2.50, bg = C_COB_BG, bd_col = C_COB_BD, accent_col = C_COBALT, accent_side = "top", pad_x = 0.16, pad_y = 0.14)

prs <- add_card(prs, block_list(
  fpar(txt("PRESISI INDIKATOR 1: IMPOR AS DARI INDONESIA", size = 10.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 6)),
  fpar(txt("Variabel volume menggunakan data US General Imports (impor umum AS yang masuk dari Indonesia dalam Metrik Ton). Istilah 'impor AS dari Indonesia' dipakai secara konsisten agar presisi dan tidak tertukar dengan ekspor total global Indonesia.", size = 10.5, color = C_SLATE), fp_p = par_std(line_sp = 1.3))
), 0.65, 4.30, 5.85, 2.35, bg = C_TINT, bd_col = C_BORDER, accent_col = C_NAVY, accent_side = "left", pad_x = 0.20, pad_y = 0.16)

prs <- add_card(prs, block_list(
  fpar(txt("PRESISI INDIKATOR 2: TARIF EFEKTIF AKTUAL", size = 10.5, bold = TRUE, color = C_AMB_TXT), fp_p = par_std(pad_b = 6)),
  fpar(txt("Variabel tarif dihitung dari rasio bea masuk aktual terhadap nilai impor kepabeanan (Calculated Duty / Customs Value) di data USITC, BUKAN tarif resmi yang diumumkan secara politis. Pendekatan ini mencerminkan beban riil di pelabuhan.", size = 10.5, color = C_SLATE), fp_p = par_std(line_sp = 1.3))
), 6.83, 4.30, 5.85, 2.35, bg = C_AMB_BG, bd_col = C_AMB_BD, accent_col = C_AMBER, accent_side = "left", pad_x = 0.20, pad_y = 0.16)

# ==============================================================================
# SLIDE 6: LINIMASA KEBIJAKAN
# ==============================================================================
prs <- init_slide(prs, "5. LINIMASA KEBIJAKAN",
                  "Periode Pengamatan Terbagi ke dalam Tiga Fase Kebijakan Sepanjang 2022–2026", 6)

prs <- ph_with(prs, external_img(file.path(assets, "G1_timeline_kebijakan.png"), width = 12.03, height = 4.45),
               location = ph_location(left = 0.65, top = 1.38, width = 12.03, height = 4.45))

f_cards <- list(
  list("Fase 1: Pra-Tarif (39 bln)", "Januari 2022 – Maret 2025: Periode acuan dasar sebelum penerapan tarif resiprokal.", C_TINT, C_BORDER, C_NAVY),
  list("Fase 2: Tarif Resiprokal (10 bln)", "April 2025 – Januari 2026: Penerapan tarif resiprokal AS pada mitra dagang.", C_AMB_BG, C_AMB_BD, C_AMBER),
  list("Fase 3: Pasca-ART (8 bln)", "Februari – September 2026: Periode pasca kesepakatan Agreement on Reciprocal Trade.", C_COB_BG, C_COB_BD, C_COBALT)
)
x_f <- 0.65
for (fc in f_cards) {
  prs <- add_card(prs, block_list(
    fpar(txt(fc[[1]], size = 10.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_t = 0, pad_b = 2)),
    fpar(txt(fc[[2]], size = 9.5, color = C_SLATE), fp_p = par_std(line_sp = 1.2, pad_t = 0))
  ), x_f, 5.95, 3.84, 0.95, bg = fc[[3]], bd_col = fc[[4]], accent_col = fc[[5]], accent_side = "left", pad_x = 0.15, pad_y = 0.12)
  x_f <- x_f + 4.09
}

# ==============================================================================
# SLIDE 7: POLA VOLUME PERDAGANGAN KESELURUHAN
# ==============================================================================
prs <- init_slide(prs, "6. POLA VOLUME PERDAGANGAN (2022–2026)",
                  "Pergerakan Volume Impor AS dan Tarif Efektif Bervariasi Tajam Antar-Kelima Komoditas", 7)

prs <- ph_with(prs, external_img(file.path(assets, "G2_timeseries_5komoditas.png"), width = 8.95, height = 5.30),
               location = ph_location(left = 0.65, top = 1.45, width = 8.95, height = 5.30))

prs <- add_card(prs, block_list(
  fpar(txt("CATATAN POLA VISUAL", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 8)),
  fpar(txt("• Skala Volume Beragam:", size = 11, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Sawit Olahan melampaui 100 rb MT/bln, sementara Kopi & Kakao berada di kisaran ribuan MT/bln.", size = 10, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("• Beban Tarif Berbeda:", size = 11, bold = TRUE, color = C_AMB_TXT), fp_p = par_std(pad_b = 2)),
  fpar(txt("Sawit, Kelapa, Kakao & Kopi mencatat lonjakan tarif efektif hingga ~19%, namun tarif efektif Karet Alam TSNR hanya ≤ 0,08%.", size = 10, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("• Penurunan Konsisten Karet:", size = 11, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 2)),
  fpar(txt("Meski bebas lonjakan tarif efektif, lintasan volume Karet Alam tampak menurun tajam dan berkelanjutan hingga 2026.", size = 10, color = C_SLATE))
), 9.75, 1.45, 2.93, 5.30, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_COBALT, accent_side = "top", pad_x = 0.16, pad_y = 0.16)

# ==============================================================================
# SLIDE 8: PERBANDINGAN SEBELUM vs SESUDAH (UJI-T WELCH)
# ==============================================================================
prs <- init_slide(prs, "7. KOMPARASI DUA PERIODE (UJI-T WELCH)",
                  "Penurunan Volume Terbesar Terjadi pada Karet Alam TSNR (−32,5%), Tidak Semua Komoditas Signifikan", 8)

prs <- ph_with(prs, external_img(file.path(assets, "G3_ttest_pra_pasca.png"), width = 8.40, height = 4.20),
               location = ph_location(left = 0.65, top = 1.50, width = 8.40, height = 4.20))

prs <- add_card(prs, block_list(
  fpar(txt("RINGKASAN UJI-T WELCH (39 vs 18 BLN)", size = 9.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 8)),
  fpar(txt("1. Karet Alam TSNR: −32,5%", size = 11.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 1)),
  fpar(txt("Turun −11.245,3 MT/bln (p = 0,0000207). Signifikan setelah koreksi Bonferroni.", size = 10, color = C_SLATE), fp_p = par_std(pad_b = 8)),
  fpar(txt("2. Sawit Olahan: −15,5%", size = 11.5, bold = TRUE, color = C_AMB_TXT), fp_p = par_std(pad_b = 1)),
  fpar(txt("p = 0,0359. Signifikan pada taraf nominal 5%, tetapi tidak lolos koreksi Bonferroni.", size = 10, color = C_SLATE), fp_p = par_std(pad_b = 8)),
  fpar(txt("3. Kelapa, Kakao & Kopi: Tidak Sig.", size = 11.5, bold = TRUE, color = C_MUTED), fp_p = par_std(pad_b = 2)),
  fpar(txt("• Kelapa: −25,7% (p = 0,1640)\n• Kakao: +0,3% (p = 0,9812)\n• Kopi: +21,8% (p = 0,0814)", size = 10, color = C_SLATE), fp_p = par_std(line_sp = 1.25, pad_b = 10)),
  fpar(txt("Batas Uji Beda: Mengukur perbedaan rata-rata periode, belum mengisolasi peran kurs vs tarif.", size = 9.5, italic = TRUE, color = C_NAVY))
), 9.20, 1.50, 3.48, 5.20, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_NAVY, accent_side = "top", pad_x = 0.18, pad_y = 0.15)

prs <- add_card(prs, block_list(
  fpar(txt("Catatan Aksesibilitas Grafik: Batang solid cobalt + [✓] = Lolos Bonferroni; Arsir diagonal amber + [*] = Taraf nominal 5%; Garis putus-putus + [TS] = Tidak signifikan.",
           size = 9.5, color = C_SLATE), fp_p = par_std(line_sp = 1.25, pad_t = 0))
), 0.65, 5.88, 8.40, 0.82, bg = C_TINT, bd_col = C_BORDER, pad_x = 0.18, pad_y = 0.14)

# ==============================================================================
# SLIDE 9: ANALISIS TIGA FASE (MATRIKS EVALUASI)
# ==============================================================================
prs <- init_slide(prs, "8. ANALISIS LINTAS TIGA FASE KEBIJAKAN",
                  "Hanya Karet Alam TSNR yang Konsisten Signifikan Lintas Tiga Fase Setelah Koreksi Bonferroni", 9)

hdr_cols <- list(
  list("Komoditas (HS-6)", 0.65, 2.30),
  list("One-Way\nANOVA", 2.95, 1.45),
  list("Welch\nANOVA", 4.40, 1.45),
  list("Kruskal-Wallis", 5.85, 1.45),
  list("Status Lintas 3 Fase\n(Bonferroni)", 7.30, 2.00)
)
for (hc in hdr_cols) {
  prs <- add_box(prs, block_list(fpar(txt(hc[[1]], size = 10, bold = TRUE, color = C_WHITE), fp_p = par_std(align = "center", line_sp = 1.12, pad_t = 2))),
                 hc[[2]], 1.55, hc[[3]], 0.58, bg = C_NAVY, bd_col = C_NAVY)
}

rows_s9 <- list(
  list("Karet Alam TSNR\n(HS 4001.22)", "Signifikan\n(p < 0,001)", "Signifikan\n(p < 0,001)", "Signifikan\n(p < 0,001)", "[✓] KONSISTEN LOLOS\nWajib Uji Lanjut", C_COB_BG, C_COBALT, TRUE),
  list("Sawit Olahan\n(HS 1511.90)", "Tidak Lolos\nBonferroni", "Tidak Lolos\nBonferroni", "Tidak Lolos\nBonferroni", "[✕] Tidak Lolos Bonf", C_WHITE, C_SLATE, FALSE),
  list("Minyak Kelapa\n(HS 1513.19)", "Tidak Sig.", "Tidak Sig.", "Tidak Sig.", "[✕] Tidak Lolos Bonf", C_TINT, C_MUTED, FALSE),
  list("Mentega Kakao\n(HS 1804.00)", "Tidak Sig.", "Tidak Sig.", "Tidak Sig.", "[✕] Tidak Lolos Bonf", C_WHITE, C_MUTED, FALSE),
  list("Kopi Mentah\n(HS 0901.11)", "Tidak Sig.", "Tidak Sig.", "Tidak Sig.", "[✕] Tidak Lolos Bonf", C_TINT, C_MUTED, FALSE)
)

y_r <- 2.13
for (rw in rows_s9) {
  bg_r <- rw[[6]]; col_r <- rw[[7]]; b_r <- rw[[8]]
  widths_r <- c(2.30, 1.45, 1.45, 1.45, 2.00)
  xs_r     <- c(0.65, 2.95, 4.40, 5.85, 7.30)
  for (j in 1:5) {
    prs <- add_rect(prs, xs_r[j], y_r, widths_r[j], 0.88, bg = bg_r, bd_col = C_BORDER, bd_w = 0.75)
    al <- if (j == 1) "left" else "center"
    padx <- if (j == 1) 0.14 else 0.06
    prs <- add_box(prs, block_list(fpar(txt(rw[[j]], size = 10, bold = (b_r || j==1), color = if (b_r) col_r else C_NAVY),
                                        fp_p = par_std(align = al, line_sp = 1.18, pad_t = 2))),
                   xs_r[j] + padx, y_r + 0.12, widths_r[j] - 2*padx, 0.70)
  }
  y_r <- y_r + 0.88
}

prs <- add_card(prs, block_list(
  fpar(txt("IMPLIKASI PENGUJIAN 3 FASE", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 8)),
  fpar(txt("1. Triangulasi Metode", size = 11.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Tiga pendekatan uji berbeda (parametrik, ragam tak homogen, & non-parametrik) digunakan sekaligus.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("2. Sinyal Terisolasi", size = 11.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 2)),
  fpar(txt("Hanya Karet Alam TSNR yang lolos koreksi Bonferroni secara konsisten di seluruh pengujian lintas 3 fase.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("3. Fokus Uji Lanjut", size = 11.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Sesuai prosedur inferensi, uji lanjut (Tukey HSD & Wilcoxon) difokuskan pada Karet Alam TSNR untuk memetakan fase penurunan terdalam.", size = 10.5, color = C_SLATE))
), 9.55, 1.55, 3.13, 4.98, bg = C_WHITE, bd_col = C_COB_BD, accent_col = C_COBALT, accent_side = "top", pad_x = 0.18, pad_y = 0.16)

# ==============================================================================
# SLIDE 10: TEMUAN UTAMA — KARET ALAM TSNR
# ==============================================================================
prs <- init_slide(prs, "9. TEMUAN UTAMA: KARET ALAM TSNR (HS 4001.22)",
                  "Impor Karet Alam TSNR AS Turun Berkelanjutan Hingga Fase Pasca-ART (−14.235,4 MT/bulan)", 10)

prs <- ph_with(prs, external_img(file.path(assets, "G4_karet_3fase_spotlight.png"), width = 8.40, height = 4.96),
               location = ph_location(left = 0.65, top = 1.48, width = 8.40, height = 4.96))

prs <- add_card(prs, block_list(
  fpar(txt("PENURUNAN 2 PERIODE (UJI-T)", size = 9, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 2)),
  fpar(txt("−11.245,3 MT/bln", size = 23, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Kontraksi −32,5% (p = 0,0000207). Penurunan rata-rata terbesar di antara lima komoditas.", size = 10, color = C_SLATE))
), 9.25, 1.48, 3.43, 1.60, bg = C_COB_BG, bd_col = C_COB_BD, accent_col = C_COBALT, accent_side = "left", pad_x = 0.16, pad_y = 0.14)

prs <- add_card(prs, block_list(
  fpar(txt("PASCA-ANOVA (FASE 3 vs FASE 1)", size = 9, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 2)),
  fpar(txt("−14.235,4 MT/bln", size = 23, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Tukey p = 0,000756  |  Wilcoxon Koreksi Bonferroni p = 0,0029.", size = 10, color = C_SLATE))
), 9.25, 3.25, 3.43, 1.60, bg = C_WHITE, bd_col = C_COB_BD, accent_col = C_COBALT, accent_side = "left", pad_x = 0.16, pad_y = 0.14)

prs <- add_card(prs, block_list(
  fpar(txt("OBSERVASI KUNCI", size = 9.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 3)),
  fpar(txt("Volume terus turun dari 34.600 (F1) → 25.700 (F2) → 20.300 MT/bln (F3), bahkan setelah Fase Pasca-ART dimulai Feb 2026.", size = 10, color = C_SLATE))
), 9.25, 5.02, 3.43, 1.42, bg = C_TINT, bd_col = C_BORDER, pad_x = 0.16, pad_y = 0.14)

# ==============================================================================
# SLIDE 11: TEMUAN KORELASI PEARSON
# ==============================================================================
prs <- init_slide(prs, "10. TEMUAN KORELASI BIVARIAT",
                  "Korelasi Pearson Menyoroti Asosiasi Kuat Nilai Tukar pada Karet dan Tarif pada Sawit", 11)

prs <- ph_with(prs, external_img(file.path(assets, "G5_korelasi_pearson.png"), width = 8.55, height = 3.80),
               location = ph_location(left = 0.65, top = 1.55, width = 8.55, height = 3.80))

prs <- add_card(prs, block_list(
  fpar(txt("INTERPRETASI KORELASI BIVARIAT", size = 9.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 8)),
  fpar(txt("• Karet Alam TSNR ↔ Kurs IDR/USD", size = 11.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 1)),
  fpar(txt("r = −0,629 (p = 1,61 × 10⁻⁷). Korelasi terkuat dalam studi ini.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("• Minyak Kelapa ↔ Kurs IDR/USD", size = 11.5, bold = TRUE, color = C_TEAL), fp_p = par_std(pad_b = 1)),
  fpar(txt("r = −0,339 (p = 0,0099). Arah negatif sejajar dengan Karet Alam.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("• Sawit Olahan ↔ Tarif Efektif", size = 11.5, bold = TRUE, color = C_AMB_TXT), fp_p = par_std(pad_b = 1)),
  fpar(txt("r = −0,338 (p = 0,0102). Menunjukkan keterkaitan langsung dengan beban bea masuk.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 12)),
  fpar(txt("Batas Korelasi: Hanya mengukur arah asosiasi dua variabel secara terpisah.", size = 9.5, italic = TRUE, color = C_MUTED))
), 9.35, 1.55, 3.33, 4.95, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_NAVY, accent_side = "top", pad_x = 0.18, pad_y = 0.16)

prs <- add_card(prs, block_list(
  fpar(txt("Catatan: Keeratan hubungan bivariat tertinggi terpusat pada nilai tukar rupiah dan tarif efektif, sedangkan harga minyak mentah Brent tidak menonjol.", size = 10, color = C_SLATE), fp_p = par_std(line_sp = 1.25))
), 0.65, 5.55, 8.55, 0.95, bg = C_TINT, bd_col = C_BORDER, pad_x = 0.18, pad_y = 0.16)

# ==============================================================================
# SLIDE 12: TEMUAN REGRESI LINEAR
# ==============================================================================
prs <- init_slide(prs, "11. TEMUAN REGRESI LINEAR MULTIVARIAT",
                  "Regresi Memisahkan Hubungan Tarif pada Sawit Olahan dan Nilai Tukar pada Karet Alam", 12)

prs <- ph_with(prs, external_img(file.path(assets, "G6_regresi_prediktor.png"), width = 8.70, height = 4.10),
               location = ph_location(left = 0.65, top = 1.48, width = 8.70, height = 4.10))

prs <- add_card(prs, block_list(
  fpar(txt("ESTIMASI KOEFISIEN UTAMA", size = 9.5, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 6)),
  fpar(txt("Karet Alam TSNR (Kurs IDR/USD):", size = 11, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 1)),
  fpar(txt("b = −6,37 MT per Rp1/USD (≈ −637,2 MT per Rp100/USD); p = 4,73 × 10⁻⁶; Adjusted R² = 0,3960. Lolos Bonferroni.", size = 9.6, color = C_SLATE), fp_p = par_std(line_sp = 1.18, pad_b = 8)),
  fpar(txt("Sawit Olahan (Tarif Efektif):", size = 11, bold = TRUE, color = C_AMB_TXT), fp_p = par_std(pad_b = 1)),
  fpar(txt("b = −2.675,73 MT per +1 poin % tarif; p = 0,0070. Sig. taraf nominal 5%, tidak lolos Bonferroni 1%.", size = 9.6, color = C_SLATE), fp_p = par_std(line_sp = 1.18, pad_b = 8)),
  fpar(txt("Minyak Kelapa (Kurs IDR/USD):", size = 11, bold = TRUE, color = C_TEAL), fp_p = par_std(pad_b = 1)),
  fpar(txt("b = −1,71 MT per Rp1/USD; p = 0,0179. Tidak signifikan pasca-Bonferroni.", size = 9.6, color = C_SLATE), fp_p = par_std(line_sp = 1.18))
), 9.50, 1.48, 3.18, 3.85, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_COBALT, accent_side = "top", pad_x = 0.16, pad_y = 0.14)

prs <- add_card(prs, block_list(
  fpar(txt("HASIL TIDAK SIGNIFIKAN DALAM MODEL:", size = 9.2, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 3)),
  fpar(txt("• Kopi Mentah & Mentega Kakao: Tidak ditemukan satu pun prediktor signifikan.\n• Harga Minyak Brent: Tidak signifikan di kelima model komoditas.", size = 9.5, color = C_SLATE), fp_p = par_std(line_sp = 1.2))
), 9.50, 5.45, 3.18, 1.32, bg = C_TINT, bd_col = C_BORDER, pad_x = 0.16, pad_y = 0.12)

prs <- add_card(prs, block_list(
  fpar(txt("Catatan Metodologis: Tarif efektif pada Sawit Olahan memiliki koefisien parsial signifikan pada taraf nominal 5% saat mengontrol kurs & minyak, namun tidak melewati koreksi Bonferroni 1%.", size = 9.5, color = C_SLATE), fp_p = par_std(line_sp = 1.25))
), 0.65, 5.75, 8.70, 0.90, bg = C_AMB_BG, bd_col = C_AMB_BD, accent_col = C_AMBER, accent_side = "left", pad_x = 0.18, pad_y = 0.14)

# ==============================================================================
# SLIDE 13: INTERPRETASI KOMPARATIF LINTAS KOMODITAS
# ==============================================================================
prs <- init_slide(prs, "12. SINTESIS KOMPARATIF ANTAR-KOMODITAS",
                  "Tarif Efektif Berhubungan dengan Sawit, Sedangkan Karet Lebih Erat Berkaitan dengan Kurs", 13)

cols_s13 <- list(
  list("Komoditas (HS-6)", 0.65, 2.25),
  list("Uji-t (Pra vs Pasca)", 2.90, 2.15),
  list("Uji 3 Fase (Bonf)", 5.05, 1.95),
  list("Korelasi Pearson", 7.00, 2.20),
  list("Regresi Linear (OLS)", 9.20, 3.48)
)
for (hc in cols_s13) {
  prs <- add_box(prs, block_list(fpar(txt(hc[[1]], size = 10, bold = TRUE, color = C_WHITE), fp_p = par_std(align = "center", pad_t = 4))),
                 hc[[2]], 1.48, hc[[3]], 0.50, bg = C_NAVY, bd_col = C_NAVY)
}

rows_s13 <- list(
  list("Karet Alam TSNR\n(HS 4001.22)", "−32,5% (−11.245,3 MT)\np = 0,0000207 [Sig. Bonf]", "Sig. Konsisten [✓]\nF3 vs F1: −14.235,4 MT", "Kurs IDR/USD:\nr = −0,629 (p = 1,6×10⁻⁷)", "Kurs: b = −6,37 MT/Rp1 (p = 4,73×10⁻⁶)\nSig. Bonf • Adj. R² = 0,3960", C_COB_BG, C_COBALT, TRUE),
  list("Sawit Olahan\n(HS 1511.90)", "−15,5%\np = 0,0359 [Sig. 5%]", "Tidak Lolos Bonf", "Tarif Efektif:\nr = −0,338 (p = 0,0102)", "Tarif: b = −2.675,73 MT/% (p = 0,0070)\nSig. Nominal 5%, Tak Lolos Bonf 1%", C_AMB_BG, C_AMB_TXT, TRUE),
  list("Minyak Kelapa\n(HS 1513.19)", "−25,7%\np = 0,1640 [TS]", "Tidak Lolos Bonf", "Kurs IDR/USD:\nr = −0,339 (p = 0,0099)", "Kurs: b = −1,71 MT/Rp1 (p = 0,0179)\nTidak Sig. Pasca-Bonferroni", C_WHITE, C_TEAL, FALSE),
  list("Kopi Mentah\n(HS 0901.11)", "+21,8%\np = 0,0814 [TS]", "Tidak Signifikan", "Tidak Menonjol", "Tidak Ada Prediktor Signifikan", C_TINT, C_MUTED, FALSE),
  list("Mentega Kakao\n(HS 1804.00)", "+0,3%\np = 0,9812 [TS]", "Tidak Signifikan", "Tidak Menonjol", "Tidak Ada Prediktor Signifikan", C_WHITE, C_MUTED, FALSE)
)

y_13 <- 1.98
for (rw in rows_s13) {
  w13 <- c(2.25, 2.15, 1.95, 2.20, 3.48)
  x13 <- c(0.65, 2.90, 5.05, 7.00, 9.20)
  for (j in 1:5) {
    prs <- add_rect(prs, x13[j], y_13, w13[j], 0.80, bg = rw[[6]], bd_col = C_BORDER, bd_w = 0.75)
    prs <- add_box(prs, block_list(fpar(txt(rw[[j]], size = 9.5, bold = (rw[[8]] || j==1), color = if (rw[[8]] && j %in% c(1,5)) rw[[7]] else C_NAVY),
                                        fp_p = par_std(align = "left", line_sp = 1.15, pad_t = 2))),
                   x13[j] + 0.10, y_13 + 0.10, w13[j] - 0.20, 0.65)
  }
  y_13 <- y_13 + 0.80
}

prs <- add_card(prs, block_list(
  fpar(txt("Wawasan Lintas Komoditas: ", size = 10.5, bold = TRUE, color = C_NAVY),
       txt("Satu perubahan kebijakan tidak menghasilkan satu pola tunggal. Karet Alam menghadapi tekanan berkelanjutan yang kuat berkaitan dengan kurs IDR/USD meski tarif efektifnya ≤ 0,08%, Sawit menunjukkan sinyal sensitivitas terhadap tarif efektif, sementara ketiga komoditas lainnya belum menunjukkan bukti statistik yang konsisten pasca-koreksi.", size = 10.2, color = C_SLATE), fp_p = par_std(line_sp = 1.25))
), 0.65, 6.10, 12.03, 0.78, bg = C_TINT, bd_col = C_BORDER, pad_x = 0.18, pad_y = 0.12)

# ==============================================================================
# SLIDE 14: KESIMPULAN UTAMA
# ==============================================================================
prs <- init_slide(prs, "13. KESIMPULAN UTAMA",
                  "Satu Perubahan Kebijakan Diikuti Lima Pola Perdagangan yang Berbeda", 14)

concs <- list(
  list("01 / HETEROGENITAS RESPONS", "Tidak Ada Satu Pola untuk Semua Komoditas",
       "Dari lima komoditas HS-6 yang dianalisis selama 57 bulan, perubahan rata-rata sebelum vs sesudah kebijakan berkisar antara −32,5% hingga +21,8% dengan kekuatan bukti statistik yang sangat berbeda.", C_WHITE, C_NAVY, C_BORDER),
  list("02 / TEMUAN TERKUAT: KARET ALAM", "Penurunan Konsisten & Keterkaitan Kuat Nilai Tukar",
       "Karet Alam TSNR (−32,5%; −11.245,3 MT/bln) adalah satu-satunya yang lolos Bonferroni lintas uji 2 periode dan 3 fase (F3 vs F1: −14.235,4 MT/bln), berkaitan erat dengan kurs IDR/USD (b = −6,37 MT/Rp1; Adj. R² = 0,3960).", C_COB_BG, C_COBALT, C_COB_BD),
  list("03 / TARIF BUKAN FAKTOR TUNGGAL", "Hubungan Tarif di Sawit vs Prediktor Lain Tidak Sig.",
       "Sawit Olahan menunjukkan asosiasi negatif signifikan dengan tarif efektif pada taraf nominal 5% (b = −2.675,73 MT/%; p = 0,0070; tak lolos Bonf 1%), sedangkan Brent, Kopi Mentah, & Mentega Kakao tidak menunjukkan prediktor signifikan.", C_AMB_BG, C_AMBER, C_AMB_BD)
)
x_c14 <- 0.65
for (cc in concs) {
  prs <- add_card(prs, block_list(
    fpar(txt(cc[[1]], size = 9.5, bold = TRUE, color = if (cc[[5]] == C_AMBER) C_AMB_TXT else cc[[5]]), fp_p = par_std(pad_t = 4, pad_b = 8)),
    fpar(txt(cc[[2]], size = 15, bold = TRUE, color = C_NAVY), fp_p = par_std(line_sp = 1.15, pad_b = 12)),
    fpar(txt(cc[[3]], size = 11, color = C_SLATE), fp_p = par_std(line_sp = 1.32))
  ), x_c14, 1.65, 3.81, 4.95, bg = cc[[4]], bd_col = cc[[6]], accent_col = cc[[5]], accent_side = "top", accent_w = 0.08, pad_x = 0.22, pad_y = 0.18)
  x_c14 <- x_c14 + 4.11
}

# ==============================================================================
# SLIDE 15: KETERBATASAN & PENUTUP
# ==============================================================================
prs <- init_slide(prs, "14. KETERBATASAN PENELITIAN & PENUTUP",
                  "Asosiasi Statistik Tidak Membuktikan Hubungan Sebab-Akibat Tunggal", 15)

prs <- add_card(prs, block_list(
  fpar(txt("BATASAN INTERPRETASI & METODOLOGI", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 8)),
  fpar(txt("1. Studi Observasional (Non-Kausal)", size = 11.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Hasil uji beda, korelasi, dan regresi menunjukkan perbedaan periode dan asosiasi statistik, bukan pembuktian hubungan sebab-akibat langsung.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("2. Hasil Tidak Signifikan ≠ Pasti Tidak Terdampak", size = 11.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Ketiadaan signifikansi pada Kopi, Kakao, atau Kelapa berarti model ini belum menemukan bukti kuat, bukan bukti ketidakterdampakan mutlak.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("3. Tarif bukan Penyebab Tunggal", size = 11.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Faktor di luar model (kontrak berjangka, pasokan negara pesaing, logistik pelabuhan) turut memengaruhi volume perdagangan aktual.", size = 10.5, color = C_SLATE), fp_p = par_std(pad_b = 10)),
  fpar(txt("4. Cakupan HS-6 & Periode", size = 11.5, bold = TRUE, color = C_NAVY), fp_p = par_std(pad_b = 2)),
  fpar(txt("Generalisasi hanya berlaku untuk 5 pos tarif HS-6 selama Jan 2022 – Sep 2026.", size = 10.5, color = C_SLATE))
), 0.65, 1.50, 6.80, 5.20, bg = C_WHITE, bd_col = C_BORDER, accent_col = C_NAVY, accent_side = "top", pad_x = 0.24, pad_y = 0.16)

prs <- add_card(prs, block_list(
  fpar(txt("SUMBER DATA RESMI", size = 10, bold = TRUE, color = C_COBALT), fp_p = par_std(pad_b = 6)),
  fpar(txt("• Volume Impor AS: US General Imports (USDA FAS GATS / US Census Bureau).", size = 10, color = C_SLATE), fp_p = par_std(pad_b = 5)),
  fpar(txt("• Tarif Efektif Aktual: Bea masuk aktual / nilai impor (USITC DataWeb).", size = 10, color = C_SLATE), fp_p = par_std(pad_b = 5)),
  fpar(txt("• Kurs IDR/USD: Bank Indonesia / FRED.", size = 10, color = C_SLATE), fp_p = par_std(pad_b = 5)),
  fpar(txt("• Harga Minyak Brent: World Bank Commodity Price / FRED.", size = 10, color = C_SLATE))
), 7.75, 1.50, 4.93, 2.65, bg = C_TINT, bd_col = C_BORDER, accent_col = C_COBALT, accent_side = "left", pad_x = 0.20, pad_y = 0.16)

prs <- add_card(prs, block_list(
  fpar(txt("IDENTITAS AKADEMIK", size = 10, bold = TRUE, color = "#93C5FD"), fp_p = par_std(pad_b = 6)),
  fpar(txt("Kelompok 10 — Analisis Statistika (STA2511)", size = 12, bold = TRUE, color = C_WHITE), fp_p = par_std(pad_b = 4)),
  fpar(txt("Departemen Statistika dan Sains Data\nFakultas Matematika dan Ilmu Pengetahuan Alam\nIPB University", size = 10.5, color = "#E2E8F0"), fp_p = par_std(line_sp = 1.25, pad_b = 8)),
  fpar(txt("Dosen Pengampu: Dr. Farit Mochamad Afendi, M.Si.", size = 10.5, bold = TRUE, color = "#93C5FD"))
), 7.75, 4.35, 4.93, 2.35, bg = C_NAVY, bd_col = C_NAVY, pad_x = 0.22, pad_y = 0.18)

print(prs, target = out_pptx)
cat("Presentasi PPTX 15 slide versi bersih berhasil dibuat di:", out_pptx, "\n")
