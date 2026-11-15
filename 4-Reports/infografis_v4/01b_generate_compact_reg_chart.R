# Grafik Regresi Kompak (rasio 6.2 x 5.2 in) khusus kolom 1/3 Band 5 Infografis
suppressPackageStartupMessages({
  library(ggplot2)
  library(ragg)
})

out_file <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v4/assets_v4/G6_regresi_compact.png"

C_NAVY   <- "#0F172A"
C_SLATE  <- "#334155"
C_MUTED  <- "#64748B"
C_BORDER <- "#CBD5E1"
C_COBALT <- "#005AB5"
C_AMBER  <- "#D97706"
C_AMB_DK <- "#B45309"
C_TEAL   <- "#0E7490"

df <- data.frame(
  label = c(
    "Karet Alam TSNR\nPrediktor: Kurs IDR/USD (X2)\nb = \u22126,37 MT/Rp1 | Adj. R\u00B2 = 0,3960",
    "Sawit Olahan\nPrediktor: Tarif Efektif (X1)\nb = \u22122.675,73 MT/+1 poin %",
    "Minyak Kelapa\nPrediktor: Kurs IDR/USD (X2)\nb = \u22121,71 MT/Rp1",
    "Kopi, Kakao & Minyak Brent (X3)\nTidak Ada Prediktor Signifikan"
  ),
  y_pos  = c(4, 3, 2, 1),
  neglog = c(-log10(4.73e-6), -log10(0.0070), -log10(0.0179), -log10(0.1805)),
  p_txt  = c(
    "p = 4,73 \u00D7 10\u207B\u2076\n[\u2713] Lolos Bonferroni",
    "p = 0,0070\n[*] Nom. 5% (Tak Bonf 1%)",
    "p = 0,0179\n[TS] Tak Lolos Bonf",
    "p \u2265 0,1805\n[TS] Tidak Signifikan"
  ),
  fill_c = c(C_COBALT, "#FFFBEB", "#ECFEFF", "#F8FAFC"),
  edge_c = c(C_COBALT, C_AMBER, C_TEAL, C_MUTED),
  lty_c  = c("solid", "solid", "dashed", "dashed"),
  txt_c  = c(C_COBALT, C_AMB_DK, C_TEAL, C_MUTED),
  stringsAsFactors = FALSE
)

# Arsir diagonal Sawit Olahan (y_pos = 3)
sawit_top <- df$neglog[df$y_pos == 3]
xs_seq <- seq(0.08, max(0.2, sawit_top - 0.14), by = 0.24)
hatch_df <- data.frame(
  x = xs_seq,
  xend = pmin(xs_seq + 0.14, sawit_top - 0.04),
  y = 3 - 0.30,
  yend = 3 + 0.30
)

p <- ggplot(df) +
  geom_vline(xintercept = c(0, -log10(0.05), -log10(0.001), -log10(4.73e-6)),
             color = "#E2E8F0", linewidth = 0.4) +
  geom_vline(xintercept = -log10(0.05), linetype = "dotted", color = C_NAVY, linewidth = 0.8) +
  annotate("label", x = -log10(0.05) + 0.08, y = 4.62, label = "Batas Nominal 5% (p = 0,05)",
           hjust = 0, size = 3.0, fontface = "bold", color = C_NAVY, fill = "#FFFFFF",
           linewidth = 0.35, label.padding = unit(0.22, "lines")) +
  geom_rect(aes(xmin = 0, xmax = neglog, ymin = y_pos - 0.32, ymax = y_pos + 0.32,
                fill = fill_c, color = edge_c, linetype = lty_c),
            linewidth = 0.95, show.legend = FALSE) +
  geom_segment(data = hatch_df, aes(x = x, xend = xend, y = y, yend = yend),
               color = C_AMBER, linewidth = 0.75) +
  geom_label(aes(x = neglog + 0.14, y = y_pos, label = p_txt, color = txt_c),
             hjust = 0, size = 3.15, fontface = "bold", fill = "#FFFFFF",
             linewidth = 0, label.padding = unit(0.18, "lines"), lineheight = 1.08,
             show.legend = FALSE) +
  scale_fill_identity() +
  scale_color_identity() +
  scale_linetype_identity() +
  scale_y_continuous(
    breaks = df$y_pos,
    labels = df$label,
    limits = c(0.45, 4.88),
    expand = c(0, 0)
  ) +
  scale_x_continuous(
    breaks = c(0, -log10(0.05), 3, 5.325),
    labels = c("p=1", "p=0,05", "p=0,001", "p=4,7\u00D710\u207B\u2076"),
    limits = c(0, 7.95),
    expand = c(0.01, 0)
  ) +
  labs(
    title = "Signifikansi Prediktor OLS (\u2212log10 p-value)",
    subtitle = "Model: Volume Impor AS ~ Tarif (X1) + Kurs (X2) + Brent (X3)",
    x = "Kekuatan Bukti Statistik (Skala p-value)"
  ) +
  theme_minimal(base_family = "sans", base_size = 10.5) +
  theme(
    plot.background = element_rect(fill = "#FFFFFF", color = NA),
    panel.background = element_rect(fill = "#FFFFFF", color = NA),
    panel.grid = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_text(size = 8.6, face = "bold", color = C_NAVY, lineheight = 1.12),
    axis.text.x = element_text(size = 8.5, color = C_SLATE),
    axis.title.x = element_text(size = 9, face = "bold", color = C_SLATE, margin = margin(t = 6)),
    plot.title = element_text(size = 11.5, face = "bold", color = C_NAVY),
    plot.subtitle = element_text(size = 8.8, color = C_MUTED, margin = margin(b = 6)),
    plot.margin = margin(10, 10, 8, 8)
  )

ggsave(out_file, p, device = ragg::agg_png, width = 6.8, height = 5.4, units = "in", dpi = 300)
cat("Saved compact regression chart:", out_file, "\n")
