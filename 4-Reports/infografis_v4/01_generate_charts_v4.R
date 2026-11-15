# ==============================================================================
# STAGE 4: PROGRAMMED CHART GENERATION & REFINEMENT (G1 - G6)
# Karakter: Modern Scientific Editorial + Colorblind-Safe + Full Bahasa Indonesia
# ==============================================================================

suppressPackageStartupMessages({
  library(ggplot2)
  library(scales)
  library(ragg)
})

out_dir <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v4/assets_v4"
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

rds_path <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v3/master_panel_2022_202609.rds"
df <- readRDS(rds_path)
df <- df[order(df$hs6, df$date), ]

# Palet Warna Final (Stage 3 - Okabe-Ito / Editorial Safe)
COL_BG       <- "#FFFFFF"
COL_CANVAS   <- "#FAFAF8"
COL_NAVY     <- "#0F172A"
COL_SLATE    <- "#334155"
COL_MUTED    <- "#64748B"
COL_GRID     <- "#E2E8F0"
COL_COBALT   <- "#005AB5"  # Fokus Utama: Karet Alam / Sig Bonf
COL_AMBER    <- "#D97706"  # Sinyal Sekunder: Sawit / Sig Nominal 5%
COL_TEAL     <- "#0E7490"  # Pembanding Kelapa
COL_GRAY_BAR <- "#CBD5E1"  # Tidak signifikan

theme_editorial <- function(base_size = 11) {
  theme_minimal(base_family = "Segoe UI", base_size = base_size) +
    theme(
      plot.background     = element_rect(fill = COL_BG, color = NA),
      panel.background    = element_rect(fill = COL_BG, color = NA),
      panel.grid.minor    = element_blank(),
      panel.grid.major    = element_line(color = COL_GRID, linewidth = 0.35),
      plot.title.position   = "plot",
      plot.caption.position = "plot",
      plot.title          = element_text(face = "bold", size = base_size + 2.5, color = COL_NAVY, margin = margin(b = 4)),
      plot.subtitle       = element_text(size = base_size - 0.8, color = COL_SLATE, margin = margin(b = 10)),
      plot.caption        = element_text(size = base_size - 2.5, color = COL_MUTED, hjust = 0, lineheight = 1.25, margin = margin(t = 10)),
      axis.title          = element_text(face = "bold", size = base_size - 1, color = COL_SLATE),
      axis.text           = element_text(size = base_size - 1.5, color = COL_SLATE),
      legend.position     = "top",
      legend.title        = element_blank(),
      plot.margin         = margin(14, 22, 12, 14)
    )
}

fmt_id <- function(x, d = 1) {
  formatC(round(x, d), format = "f", digits = d, big.mark = ".", decimal.mark = ",")
}

# ==============================================================================
# G1: LINIMASA KEBIJAKAN PROPORSIONAL (3 FASE = 39 / 10 / 8 BULAN)
# Refined: Multi-line label agar longgar di segmen Fase 2 (10 bln) & Fase 3 (8 bln)
# ==============================================================================
timeline_df <- data.frame(
  fase = c(
    "Fase 1: Pra-Tarif\n(Jan 2022 – Mar 2025)",
    "Fase 2:\nTarif Resiprokal\n(Apr 25–Jan 26)",
    "Fase 3:\nPasca-ART\n(Feb–Sep 26)"
  ),
  xmin  = c(0, 39, 49),
  xmax  = c(39, 49, 57),
  xmid  = c(19.5, 44, 53),
  bulan = c("39 bulan", "10 bulan", "8 bulan"),
  fill  = c("#F1F5F9", "#FEF3C7", "#DBEAFE"),
  col   = c(COL_NAVY, "#B45309", COL_COBALT),
  fsize = c(3.7, 3.05, 3.05)
)

g1 <- ggplot(timeline_df) +
  geom_rect(aes(xmin = xmin + 0.15, xmax = xmax - 0.15, ymin = 0.52, ymax = 1.08, fill = fill),
            color = timeline_df$col, linewidth = 0.9) +
  scale_fill_identity() +
  geom_text(aes(x = xmid, y = 0.87, label = fase), color = COL_NAVY, fontface = "bold",
            size = timeline_df$fsize, family = "Segoe UI", lineheight = 1.12) +
  geom_text(aes(x = xmid, y = 0.60, label = bulan), color = timeline_df$col, fontface = "bold",
            size = 3.25, family = "Segoe UI") +
  geom_segment(x = 39, xend = 39, y = 0.28, yend = 1.20, linetype = "dashed", color = COL_AMBER, linewidth = 0.8) +
  geom_segment(x = 49, xend = 49, y = 0.28, yend = 1.20, linetype = "dashed", color = COL_COBALT, linewidth = 0.8) +
  annotate("text", x = 39, y = 1.28, label = "Apr 2025\nMulai Tarif Resiprokal", color = "#B45309", fontface = "bold", size = 3.1, family = "Segoe UI", lineheight = 1.1) +
  annotate("text", x = 49, y = 1.28, label = "Feb 2026\nBerlaku ART", color = COL_COBALT, fontface = "bold", size = 3.1, family = "Segoe UI", lineheight = 1.1) +
  geom_segment(x = 0.2, xend = 38.8, y = 0.30, yend = 0.30, color = COL_SLATE, linewidth = 1.0) +
  geom_segment(x = 39.2, xend = 56.8, y = 0.30, yend = 0.30, color = COL_COBALT, linewidth = 1.0) +
  annotate("text", x = 19.5, y = 0.16, label = "Kelompok Sebelum Kebijakan (Uji-t Welch: n = 39 bulan)", color = COL_SLATE, fontface = "bold", size = 3.25, family = "Segoe UI") +
  annotate("text", x = 48.0, y = 0.16, label = "Kelompok Sesudah Kebijakan (n = 18 bulan)", color = COL_COBALT, fontface = "bold", size = 3.25, family = "Segoe UI") +
  scale_x_continuous(limits = c(-1, 58), breaks = c(0, 12, 24, 39, 49, 57), labels = c("Jan 22", "Jan 23", "Jan 24", "Apr 25", "Feb 26", "Sep 26")) +
  scale_y_continuous(limits = c(0.05, 1.42)) +
  labs(
    title = "Proporsi Waktu Tiga Fase Kebijakan dan Pengelompokan Uji Dua Periode",
    subtitle = "Total pengamatan 57 bulan (Januari 2022 – September 2026) per komoditas; panjang segmen proporsional terhadap durasi bulan",
    caption = "Sumber: Kerangka Pengujian Data Panel 5 Komoditas HS-6 (2022–2026)."
  ) +
  theme_editorial(base_size = 11) +
  theme(
    axis.text.y       = element_blank(),
    axis.title        = element_blank(),
    panel.grid.major  = element_blank(),
    axis.line.x       = element_line(color = COL_MUTED, linewidth = 0.5),
    axis.ticks.x      = element_line(color = COL_MUTED, linewidth = 0.5)
  )

agg_png(file.path(out_dir, "G1_timeline_kebijakan.png"), width = 10.8, height = 4.0, units = "in", res = 300)
print(g1)
dev.off()

# ==============================================================================
# G2: SMALL MULTIPLES DERET WAKTU VOLUME & TARIF EFEKTIF (5 KOMODITAS)
# ==============================================================================
df_ts <- df
nama_map <- c(
  "400122" = "Karet Alam TSNR (HS 4001.22) — [Tarif efektif aktual ≤ 0,08%]",
  "151190" = "Sawit Olahan (HS 1511.90) — [Tarif efektif puncak: 19,00%]",
  "151319" = "Minyak Kelapa (HS 1513.19) — [Tarif efektif puncak: 18,93%]",
  "180400" = "Mentega Kakao (HS 1804.00) — [Tarif efektif puncak: 19,00%]",
  "090111" = "Kopi Mentah (HS 0901.11) — [Tarif efektif puncak: 18,85%]"
)
df_ts$panel_label <- factor(nama_map[df_ts$hs6], levels = nama_map)

col_kom <- c(
  "Karet Alam TSNR (HS 4001.22) — [Tarif efektif aktual ≤ 0,08%]" = COL_COBALT,
  "Sawit Olahan (HS 1511.90) — [Tarif efektif puncak: 19,00%]"    = COL_AMBER,
  "Minyak Kelapa (HS 1513.19) — [Tarif efektif puncak: 18,93%]"  = COL_TEAL,
  "Mentega Kakao (HS 1804.00) — [Tarif efektif puncak: 19,00%]"  = COL_MUTED,
  "Kopi Mentah (HS 0901.11) — [Tarif efektif puncak: 18,85%]"    = COL_MUTED
)

g2 <- ggplot(df_ts, aes(x = date, y = qty_mt / 1000, color = panel_label)) +
  annotate("rect", xmin = as.Date("2025-04-01"), xmax = as.Date("2026-02-01"), ymin = -Inf, ymax = Inf,
           fill = "#FEF3C7", alpha = 0.45) +
  geom_vline(xintercept = as.Date("2025-04-01"), linetype = "dashed", color = COL_AMBER, linewidth = 0.55) +
  geom_vline(xintercept = as.Date("2026-02-01"), linetype = "dashed", color = COL_COBALT, linewidth = 0.55) +
  geom_line(linewidth = 0.95) +
  geom_point(size = 1.2, alpha = 0.75) +
  facet_wrap(~ panel_label, scales = "free_y", ncol = 2) +
  scale_color_manual(values = col_kom) +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_y_continuous(labels = function(x) fmt_id(x, 1)) +
  labs(
    title = "Lintasan Bulanan Volume Impor AS dari Indonesia per Komoditas (2022–2026)",
    subtitle = "Satuan: Ribu Metrik Ton (rb MT/bulan); skala sumbu Y menyesuaikan tiap komoditas. Area berbayang = Fase Tarif Resiprokal (Apr 2025–Jan 2026)",
    x = "Tahun Pengamatan",
    y = "Volume Impor AS (Ribu MT / bulan)",
    caption = "Sumber: US General Imports (USDA FAS / US Census Bureau) & Tarif Efektif Aktual (USITC DataWeb), Jan 2022 – Sep 2026 (285 observasi)."
  ) +
  theme_editorial(base_size = 10) +
  theme(
    legend.position  = "none",
    strip.text       = element_text(face = "bold", size = 9.3, color = COL_NAVY, hjust = 0),
    strip.background = element_rect(fill = "#F8FAFC", color = NA),
    panel.spacing    = unit(1.1, "lines")
  )

agg_png(file.path(out_dir, "G2_timeseries_5komoditas.png"), width = 10.6, height = 6.2, units = "in", res = 300)
print(g2)
dev.off()

# ==============================================================================
# G3: DIVERGING HORIZONTAL BAR CHART — PERBANDINGAN PRA vs PASCA (WELCH'S T-TEST)
# Refined: Caption 2 baris aman, hatching penuh dalam batas bar, title align kiri
# ==============================================================================
tt_df <- data.frame(
  kom = c(
    "Karet Alam TSNR\n(HS 4001.22)",
    "Minyak Kelapa\n(HS 1513.19)",
    "Sawit Olahan\n(HS 1511.90)",
    "Mentega Kakao\n(HS 1804.00)",
    "Kopi Mentah\n(HS 0901.11)"
  ),
  pct   = c(-32.5, -25.7, -15.5, 0.3, 21.8),
  sym   = c("−32,5%  (p = 0,0000207)  [✓ Sig. Bonf]",
            "−25,7%  (p = 0,1640)  [TS]",
            "−15,5%  (p = 0,0359)  [* Sig. 5%]",
            "+0,3%  (p = 0,9812)  [TS]",
            "+21,8%  (p = 0,0814)  [TS]"),
  y_num = c(5, 4, 3, 2, 1)
)
tt_df$kom <- factor(tt_df$kom, levels = rev(tt_df$kom))

# Hatching clipped tepat di dalam bar Sawit [-15.5, 0] x [2.68, 3.32]
hx <- seq(-15.5, 0.5, by = 1.0)
hatch_df <- data.frame(
  x0 = hx - 0.5,
  x1 = hx + 0.5,
  y0 = 3 - 0.32,
  y1 = 3 + 0.32
)
# Clip x ke [-15.5, 0] dan sesuaikan y proporsional
clip_line <- function(x0, x1, y0, y1, xmin, xmax) {
  res <- list()
  for (i in seq_along(x0)) {
    xa <- x0[i]; xb <- x1[i]; ya <- y0[i]; yb <- y1[i]
    if (xb <= xmin || xa >= xmax) next
    if (xa < xmin) { ya <- ya + (xmin - xa) / (xb - xa) * (yb - ya); xa <- xmin }
    if (xb > xmax) { yb <- yb - (xb - xmax) / (xb - xa) * (yb - ya); xb <- xmax }
    res[[length(res) + 1]] <- data.frame(x = xa, xend = xb, y = ya, yend = yb)
  }
  do.call(rbind, res)
}
hatch_clipped <- clip_line(hatch_df$x0, hatch_df$x1, hatch_df$y0, hatch_df$y1, -15.5, 0)

g3 <- ggplot(tt_df) +
  geom_vline(xintercept = 0, color = COL_NAVY, linewidth = 0.85) +
  geom_rect(data = subset(tt_df, y_num == 5),
            aes(xmin = pct, xmax = 0, ymin = y_num - 0.32, ymax = y_num + 0.32),
            fill = COL_COBALT, color = COL_COBALT, linewidth = 0.8) +
  geom_rect(data = subset(tt_df, y_num == 4),
            aes(xmin = pct, xmax = 0, ymin = y_num - 0.32, ymax = y_num + 0.32),
            fill = "#F8FAFC", color = COL_MUTED, linetype = "dashed", linewidth = 0.85) +
  geom_rect(data = subset(tt_df, y_num == 3),
            aes(xmin = pct, xmax = 0, ymin = y_num - 0.32, ymax = y_num + 0.32),
            fill = "#FEF3C7", color = COL_AMBER, linewidth = 0.95) +
  geom_segment(data = hatch_clipped, aes(x = x, xend = xend, y = y, yend = yend),
               color = COL_AMBER, linewidth = 0.75) +
  geom_rect(data = subset(tt_df, y_num %in% c(1, 2)),
            aes(xmin = 0, xmax = pmax(pct, 0.8), ymin = y_num - 0.32, ymax = y_num + 0.32),
            fill = "#F8FAFC", color = COL_MUTED, linetype = "dashed", linewidth = 0.85) +
  geom_text(data = subset(tt_df, pct < 0),
            aes(x = pct - 1.3, y = y_num, label = sym),
            hjust = 1,
            color = c(COL_COBALT, COL_MUTED, "#B45309"),
            fontface = c("bold", "plain", "bold"),
            size = 3.5, family = "Segoe UI") +
  geom_text(data = subset(tt_df, pct >= 0),
            aes(x = pmax(pct, 0.8) + 1.3, y = y_num, label = sym),
            hjust = 0, color = COL_MUTED, size = 3.5, family = "Segoe UI") +
  scale_y_continuous(breaks = tt_df$y_num, labels = tt_df$kom) +
  scale_x_continuous(limits = c(-68, 48), breaks = seq(-40, 30, by = 10), labels = function(x) paste0(x, "%")) +
  labs(
    title = "Perubahan Rata-Rata Volume Impor AS dari Indonesia Sebelum vs Sesudah Kebijakan",
    subtitle = "Uji-t Welch (Pra-Tarif 39 bulan vs Sesudah Kebijakan 18 bulan) — pembedaan visual melalui warna, pola batang, & simbol",
    x = "Perubahan Rata-Rata Volume (%)",
    y = NULL,
    caption = "Penanda: Solid [✓ Sig. Bonf] = Signifikan pasca-Bonferroni; Arsir diagonal [* Sig. 5%] = Signifikan nominal 5% (tak pasca-Bonferroni);\nGaris putus-putus [TS] = Tidak Signifikan. Sumber: US General Imports (USDA FAS / US Census Bureau, Jan 2022–Sep 2026)."
  ) +
  theme_editorial(base_size = 11) +
  theme(
    panel.grid.major.y = element_blank(),
    axis.text.y        = element_text(face = "bold", size = 10, color = COL_NAVY)
  )

agg_png(file.path(out_dir, "G3_ttest_pra_pasca.png"), width = 10.2, height = 5.0, units = "in", res = 300)
print(g3)
dev.off()

# ==============================================================================
# G4: SPOTLIGHT 3 FASE KARET ALAM TSNR (ANGKA BULAT: 34.600 -> 25.700 -> 20.300)
# Refined: Subtitle rapih tak terpotong, angka label naik jelas di atas garis tren
# ==============================================================================
karet_3f <- data.frame(
  fase  = c(
    "Fase 1: Pra-Tarif\n(Jan 2022 – Mar 2025)\n[n = 39 bulan]",
    "Fase 2: Tarif Resiprokal\n(Apr 2025 – Jan 2026)\n[n = 10 bulan]",
    "Fase 3: Pasca-ART\n(Feb – Sep 2026)\n[n = 8 bulan]"
  ),
  mean_mt  = c(34600, 25700, 20300),
  label_mt = c("34.600 MT/bln", "25.700 MT/bln", "20.300 MT/bln"),
  fill_col = c("#93C5FD", "#3B82F6", COL_COBALT),
  x_num    = 1:3
)

g4 <- ggplot(karet_3f, aes(x = x_num, y = mean_mt)) +
  geom_col(aes(fill = fill_col), width = 0.50, color = COL_COBALT, linewidth = 0.85) +
  scale_fill_identity() +
  geom_line(color = COL_NAVY, linewidth = 1.15) +
  geom_point(color = COL_NAVY, size = 3.6) +
  geom_label(aes(y = mean_mt + 2500, label = label_mt), fontface = "bold", size = 3.9,
             color = COL_NAVY, fill = "white", label.size = 0, family = "Segoe UI") +
  geom_segment(x = 1, xend = 1, y = 40000, yend = 43500, color = COL_COBALT, linewidth = 0.9) +
  geom_segment(x = 1, xend = 3, y = 43500, yend = 43500, color = COL_COBALT, linewidth = 0.9) +
  geom_segment(x = 3, xend = 3, y = 25800, yend = 43500, color = COL_COBALT, linewidth = 0.9,
               arrow = arrow(length = unit(0.18, "cm"), type = "closed")) +
  annotate("label", x = 2, y = 43500,
           label = "Penurunan Pasca-ANOVA (F3 vs F1):\n−14.235,4 MT/bulan\n(Tukey p = 0,000756 | Wilcoxon Bonf p = 0,0029)",
           fill = "#EFF6FF", color = COL_COBALT, fontface = "bold", size = 3.3, family = "Segoe UI",
           label.padding = unit(0.42, "lines")) +
  scale_x_continuous(breaks = 1:3, labels = karet_3f$fase) +
  scale_y_continuous(limits = c(0, 51500), breaks = seq(0, 50000, by = 10000), labels = function(x) fmt_id(x, 0)) +
  labs(
    title = "Karet Alam TSNR (HS 4001.22): Penurunan Volume Berkelanjutan Lintas Tiga Fase",
    subtitle = "Satu-satunya komoditas yang konsisten signifikan pada ANOVA, Welch ANOVA,\ndan Kruskal-Wallis setelah koreksi Bonferroni",
    x = NULL,
    y = "Rata-Rata Volume Impor AS (MT / bulan)",
    caption = "Catatan: Angka rata-rata tiap fase dibulatkan ke ratusan terdekat; selisih pasca-ANOVA berasal dari estimasi tepat.\nSumber: US General Imports (USDA FAS / US Census Bureau, 2022–2026)."
  ) +
  theme_editorial(base_size = 11) +
  theme(
    panel.grid.major.x = element_blank(),
    axis.text.x        = element_text(face = "bold", size = 9.6, color = COL_NAVY)
  )

agg_png(file.path(out_dir, "G4_karet_3fase_spotlight.png"), width = 8.8, height = 5.2, units = "in", res = 300)
print(g4)
dev.off()

# ==============================================================================
# G5: LOLLIPOP CHART KORELASI PEARSON MENONJOL
# Refined: plot.title.position = "plot" & wrap caption agar 100% utuh
# ==============================================================================
kor_df <- data.frame(
  pasangan = factor(c(
    "Karet Alam TSNR ↔ Kurs IDR/USD",
    "Minyak Kelapa ↔ Kurs IDR/USD",
    "Sawit Olahan ↔ Tarif Efektif Aktual"
  ), levels = rev(c(
    "Karet Alam TSNR ↔ Kurs IDR/USD",
    "Minyak Kelapa ↔ Kurs IDR/USD",
    "Sawit Olahan ↔ Tarif Efektif Aktual"
  ))),
  r_val   = c(-0.629, -0.339, -0.338),
  lbl     = c("r = −0,629  (p = 1,61 × 10⁻⁷)", "r = −0,339  (p = 0,0099)", "r = −0,338  (p = 0,0102)"),
  col     = c(COL_COBALT, COL_TEAL, COL_AMBER),
  shp     = c(16, 18, 15),
  y_num   = c(3, 2, 1)
)

g5 <- ggplot(kor_df, aes(y = y_num)) +
  geom_vline(xintercept = 0, color = COL_NAVY, linewidth = 0.8) +
  geom_segment(aes(x = 0, xend = r_val, y = y_num, yend = y_num, color = col), linewidth = 1.6) +
  geom_point(aes(x = r_val, color = col, shape = factor(shp)), size = 5.5) +
  scale_color_identity() +
  scale_shape_manual(values = c("16" = 16, "18" = 18, "15" = 15)) +
  geom_text(aes(x = r_val - 0.035, label = lbl, color = col), hjust = 1, fontface = "bold", size = 3.7, family = "Segoe UI") +
  scale_y_continuous(breaks = kor_df$y_num, labels = kor_df$pasangan, limits = c(0.4, 3.6)) +
  scale_x_continuous(limits = c(-1.12, 0.10), breaks = seq(-1.0, 0, by = 0.2), labels = function(x) fmt_id(x, 1)) +
  labs(
    title = "Tiga Korelasi Bivariat Pearson Terkuat (Volume Impor AS vs Faktor Penjelas)",
    subtitle = "Menampilkan korelasi linear yang menonjol; bersifat asosiatif bivariat tanpa kontrol peubah makro lain",
    x = "Koefisien Korelasi Pearson (r)",
    y = NULL,
    caption = "Simbol: ● Kurs IDR/USD pada Karet Alam; ◆ Kurs IDR/USD pada Minyak Kelapa; ■ Tarif Efektif pada Sawit Olahan.\nSumber: Pengujian Korelasi Pearson Data Panel (57 bulan per komoditas)."
  ) +
  theme_editorial(base_size = 11) +
  theme(
    legend.position    = "none",
    panel.grid.major.y = element_blank(),
    axis.text.y        = element_text(face = "bold", size = 10, color = COL_NAVY)
  )

agg_png(file.path(out_dir, "G5_korelasi_pearson.png"), width = 9.5, height = 4.2, units = "in", res = 300)
print(g5)
dev.off()

# ==============================================================================
# G6: PERBANDINGAN KOEFISIEN & SIGNIFIKANSI REGRESI OLS
# Refined: Label putih di belakang teks agar garis putus-putus tak menabrak teks,
# batas atas cukup tinggi, dan title align kiri penuh
# ==============================================================================
reg_df <- data.frame(
  label = c(
    "Karet Alam TSNR ← Kurs IDR/USD\nb = −6,37 MT/Rp1  (≈ −637,2 MT per Rp100/USD)\n[Adjusted R² = 0,3960]",
    "Sawit Olahan ← Tarif Efektif Aktual\nb = −2.675,73 MT per +1 poin % tarif",
    "Minyak Kelapa ← Kurs IDR/USD\nb = −1,71 MT/Rp1",
    "Kopi Mentah, Mentega Kakao, & Minyak Brent\nTidak ditemukan prediktor signifikan"
  ),
  pval   = c(4.73e-6, 0.0070, 0.0179, 0.1805),
  neglog = c(-log10(4.73e-6), -log10(0.0070), -log10(0.0179), -log10(0.1805)),
  txt    = c(
    "p = 4,73 × 10⁻⁶  •  Sig. Pasca-Bonferroni [✓]",
    "p = 0,0070  •  Sig. Nominal 5%, Tak Lolos Bonf 1% [*]",
    "p = 0,0179  •  Tidak Sig. Pasca-Bonf [TS]",
    "p ≥ 0,18  •  Tidak Signifikan [TS]"
  ),
  tcol   = c(COL_COBALT, "#B45309", COL_TEAL, COL_MUTED),
  tface  = c("bold", "bold", "plain", "plain"),
  y_num  = c(4, 3, 2, 1)
)
reg_df$label <- factor(reg_df$label, levels = rev(reg_df$label))

hx2 <- seq(0.08, reg_df$neglog[2] - 0.08, by = 0.22)
hatch_reg_raw <- clip_line(hx2 - 0.12, hx2 + 0.12, rep(3 - 0.30, length(hx2)), rep(3 + 0.30, length(hx2)), 0, reg_df$neglog[2])

g6 <- ggplot(reg_df) +
  geom_vline(xintercept = -log10(0.05), linetype = "dotted", color = COL_MUTED, linewidth = 0.85) +
  annotate("label", x = -log10(0.05), y = 4.78, label = "Batas Nominal 5% (p = 0,05)",
           hjust = 0.5, fill = "white", label.size = 0, color = COL_SLATE, fontface = "bold", size = 3.1, family = "Segoe UI") +
  geom_rect(data = subset(reg_df, y_num == 4),
            aes(xmin = 0, xmax = neglog, ymin = y_num - 0.30, ymax = y_num + 0.30),
            fill = COL_COBALT, color = COL_COBALT, linewidth = 0.8) +
  geom_rect(data = subset(reg_df, y_num == 3),
            aes(xmin = 0, xmax = neglog, ymin = y_num - 0.30, ymax = y_num + 0.30),
            fill = "#FEF3C7", color = COL_AMBER, linewidth = 0.9) +
  geom_segment(data = hatch_reg_raw, aes(x = x, xend = xend, y = y, yend = yend), color = COL_AMBER, linewidth = 0.7) +
  geom_rect(data = subset(reg_df, y_num == 2),
            aes(xmin = 0, xmax = neglog, ymin = y_num - 0.30, ymax = y_num + 0.30),
            fill = "#E0F2FE", color = COL_TEAL, linetype = "dashed", linewidth = 0.85) +
  geom_rect(data = subset(reg_df, y_num == 1),
            aes(xmin = 0, xmax = neglog, ymin = y_num - 0.30, ymax = y_num + 0.30),
            fill = "#F8FAFC", color = COL_MUTED, linetype = "dashed", linewidth = 0.85) +
  geom_label(data = reg_df,
             aes(x = neglog + 0.14, y = y_num, label = txt),
             hjust = 0, fill = "white", label.size = 0, label.padding = unit(0.18, "lines"),
             color = reg_df$tcol, fontface = reg_df$tface, size = 3.35, family = "Segoe UI") +
  scale_y_continuous(breaks = reg_df$y_num, labels = reg_df$label, limits = c(0.4, 5.05)) +
  scale_x_continuous(limits = c(0, 9.6), breaks = c(0, 1.301, 3.0, 5.325),
                     labels = c("p = 1", "p = 0,05", "p = 0,001", "p = 4,7×10⁻⁶")) +
  labs(
    title = "Kekuatan Bukti Statistik & Koefisien Prediktor dalam Model Regresi Linear",
    subtitle = "Membandingkan kekuatan signifikansi (−log₁₀ p-value) lintas prediktor berbeda satuan (MT/% vs MT/Rp) beserta status Bonferroni",
    x = "Kekuatan Signifikansi Statistik (Skala p-value)",
    y = NULL,
    caption = "Model: Volume Impor AS ~ Tarif Efektif + Kurs IDR/USD + Harga Brent. Hubungan statistik bersifat asosiatif, bukan pembuktian sebab-akibat.\nSumber: Estimasi Regresi OLS Data Panel 5 Komoditas (57 bulan per komoditas)."
  ) +
  theme_editorial(base_size = 10.5) +
  theme(
    panel.grid.major.y = element_blank(),
    axis.text.y        = element_text(face = "bold", size = 9.3, color = COL_NAVY)
  )

agg_png(file.path(out_dir, "G6_regresi_prediktor.png"), width = 10.6, height = 5.0, units = "in", res = 300)
print(g6)
dev.off()

cat("Refinement 6 grafik (G1-G6) selesai!\n")
