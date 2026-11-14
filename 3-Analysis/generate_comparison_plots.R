suppressPackageStartupMessages({
  library(ggplot2)
  library(patchwork)
  library(scales)
})

df <- read.csv("D:/IPB/KULIAH/S1/ANSTAT/anstat-ekspor-agrikultur-hs6/2-Data/master_panel_transformed.csv")
df$date <- as.Date(df$date)

# Buat folder plot
plot_dir1 <- "D:/IPB/KULIAH/S1/ANSTAT/anstat-ekspor-agrikultur-hs6/4-Reports/plots"
plot_dir2 <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v3"
dir.create(plot_dir1, showWarnings = FALSE, recursive = TRUE)

# 1. Plot Perbandingan Distribusi 5 Komoditas Sebelum & Sesudah Transformasi
# Level vs ln vs Z-score vs Min-Max
p1 <- ggplot(df, aes(x = commodity_short, y = qty_mt, fill = commodity_short)) +
  geom_boxplot(alpha = 0.8, outlier.size = 1.2) +
  theme_minimal() +
  labs(title = "A. Skala Asli / Level (Metrik Ton)", subtitle = "Skala sangat timpang: Sawit > 100rb MT vs Kakao ~ 3rb MT", x = "", y = "Qty (MT)") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 20, hjust = 1, size = 8))

p2 <- ggplot(df, aes(x = commodity_short, y = ln_qty_mt, fill = commodity_short)) +
  geom_boxplot(alpha = 0.8, outlier.size = 1.2) +
  theme_minimal() +
  labs(title = "B. Transformasi Logaritma Natural (ln)", subtitle = "Varian stabil, distribusi simetris, menekan kemiringan ekstrem", x = "", y = "ln(Qty)") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 20, hjust = 1, size = 8))

p3 <- ggplot(df, aes(x = commodity_short, y = z_qty_mt, fill = commodity_short)) +
  geom_boxplot(alpha = 0.8, outlier.size = 1.2) +
  theme_minimal() +
  labs(title = "C. Standarisasi Skor-Z (Mean=0, SD=1)", subtitle = "Skala variabilitas baku, memungkinkan pembandingan relatif", x = "", y = "Skor Z") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 20, hjust = 1, size = 8))

p4 <- ggplot(df, aes(x = commodity_short, y = norm_qty_mt, fill = commodity_short)) +
  geom_boxplot(alpha = 0.8, outlier.size = 1.2) +
  theme_minimal() +
  labs(title = "D. Normalisasi Min-Max [0, 1]", subtitle = "Seluruh komoditas dibatasi pada interval tertutup [0, 1]", x = "", y = "Min-Max Index") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 20, hjust = 1, size = 8))

combined_plot <- (p1 | p2) / (p3 | p4) +
  plot_annotation(
    title = "Komparasi Distribusi Ekspor Agrikultur HS-6 Lintas Empat Skala Pengukuran",
    subtitle = "Studi Perbandingan: Skala Level Asli, Logaritma Natural (ln), Standarisasi (Z-score), dan Normalisasi (Min-Max)",
    theme = theme(plot.title = element_text(face = "bold", size = 14))
  )

out_file1 <- file.path(plot_dir1, "komparasi_distribusi_4_skala.png")
out_file2 <- file.path(plot_dir2, "komparasi_distribusi_4_skala.png")

ggsave(out_file1, combined_plot, width = 11, height = 8.5, dpi = 300)
ggsave(out_file2, combined_plot, width = 11, height = 8.5, dpi = 300)

cat("Grafik komparasi berhasil disimpan ke:\n", out_file1, "\ndan\n", out_file2, "\n")
