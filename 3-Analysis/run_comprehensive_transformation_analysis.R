# ==============================================================================
# PIPELINE ANALISIS TRANSFORMASI SKALA (LEVEL, LN, Z-SCORE, MIN-MAX)
# Analisis Dampak Tarif, Kurs, dan Minyak terhadap Ekspor Agrikultur HS-6
# ==============================================================================

suppressPackageStartupMessages({
  library(writexl)
  library(car)
  library(lmtest)
})

# 1. BACA DATASET
rds_path <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v3/master_panel_2022_202609.rds"
df <- readRDS(rds_path)
df <- df[order(df$hs6, df$date), ]

# Fungsi Min-Max [0, 1]
min_max_scale <- function(x) {
  rng <- range(x, na.rm = TRUE)
  if (rng[2] == rng[1]) return(rep(0, length(x)))
  (x - rng[1]) / (rng[2] - rng[1])
}

# 2. TRANSFORMASI DATA (PER KOMODITAS DAN KESELURUHAN)
# Dalam ekonometrika komoditas, normalisasi/standarisasi dilakukan per komoditas
# agar relatif terhadap variabilitas masing-masing produk (misal: sawit vs kakao)
df_list <- split(df, df$hs6)

df_trans_list <- lapply(df_list, function(sub) {
  # A. Logaritma Natural (ln)
  # Untuk volume, kurs, brent: ln(x)
  # Untuk tarif: ln(1 + tau_pct/100) dalam skala desimal agar ln(1)=0 saat tarif 0%
  sub$ln_qty_mt       <- log(sub$qty_mt)
  sub$ln_tau          <- log(1 + sub$tau_pct / 100)
  sub$ln_kurs         <- log(sub$kurs_idr_usd)
  sub$ln_brent        <- log(sub$brent_usd_bbl)
  
  # B. Standarisasi (Z-Score: mean=0, sd=1)
  sub$z_qty_mt        <- as.vector(scale(sub$qty_mt))
  sub$z_tau           <- as.vector(scale(sub$tau_pct))
  sub$z_kurs          <- as.vector(scale(sub$kurs_idr_usd))
  sub$z_brent         <- as.vector(scale(sub$brent_usd_bbl))
  
  # C. Normalisasi (Min-Max: [0, 1])
  sub$norm_qty_mt     <- min_max_scale(sub$qty_mt)
  sub$norm_tau        <- min_max_scale(sub$tau_pct)
  sub$norm_kurs       <- min_max_scale(sub$kurs_idr_usd)
  sub$norm_brent      <- min_max_scale(sub$brent_usd_bbl)
  
  return(sub)
})

df_transformed <- do.call(rbind, df_trans_list)
rownames(df_transformed) <- NULL

# Simpan data tertransformasi ke CSV & Excel
dir_infografis <- "D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v3"
dir_repo_data  <- "D:/IPB/KULIAH/S1/ANSTAT/anstat-ekspor-agrikultur-hs6/2-Data"
dir_output_tbl <- "D:/IPB/KULIAH/S1/ANSTAT/anstat-ekspor-agrikultur-hs6/4-Reports"
dir.create(dir_output_tbl, showWarnings = FALSE, recursive = TRUE)

write.csv(df_transformed, file.path(dir_infografis, "master_panel_transformed.csv"), row.names = FALSE)
write_xlsx(df_transformed, file.path(dir_infografis, "master_panel_transformed.xlsx"))
write.csv(df_transformed, file.path(dir_repo_data, "master_panel_transformed.csv"), row.names = FALSE)
write_xlsx(df_transformed, file.path(dir_repo_data, "master_panel_transformed.xlsx"))

cat(">>> File CSV dan Excel Transformasi berhasil disimpan!\n")

# 3. KOMPARASI WORKFLOW LENGKAP PADA 4 SKALA:
# (1) Level (Asli)
# (2) Logaritma Natural (ln)
# (3) Standarisasi (Z-score)
# (4) Normalisasi (Min-Max)

komoditas_vec <- c("151190", "400122", "090111", "151319", "180400")
komoditas_nama <- c(
  "151190" = "Sawit Olahan (1511.90)",
  "400122" = "Karet TSNR (4001.22)",
  "090111" = "Kopi Mentah (0901.11)",
  "151319" = "Minyak Kelapa (1513.19)",
  "180400" = "Kakao Butter (1804.00)"
)

# A. UJI REGRESI OLS & ASUMSI GAUSS-MARKOV
regresi_komparasi <- list()
diagnostik_komparasi <- list()

for (kode in komoditas_vec) {
  sub_data <- subset(df_transformed, hs6 == kode)
  nama <- komoditas_nama[kode]
  
  # Model 1: Skala Level Asli
  m_level <- lm(qty_mt ~ tau_pct + kurs_idr_usd + brent_usd_bbl, data = sub_data)
  # Model 2: Skala Logaritma Natural (Log-Log)
  m_ln    <- lm(ln_qty_mt ~ ln_tau + ln_kurs + ln_brent, data = sub_data)
  # Model 3: Skala Standarisasi (Z-score)
  m_z     <- lm(z_qty_mt ~ z_tau + z_kurs + z_brent, data = sub_data)
  # Model 4: Skala Normalisasi (Min-Max)
  m_norm  <- lm(norm_qty_mt ~ norm_tau + norm_kurs + norm_brent, data = sub_data)
  
  models <- list(Level = m_level, Log = m_ln, Zscore = m_z, MinMax = m_norm)
  
  for (skala in names(models)) {
    m <- models[[skala]]
    sm <- summary(m)
    f_stat <- sm$fstatistic
    p_f <- if (!is.null(f_stat)) pf(f_stat[1], f_stat[2], f_stat[3], lower.tail = FALSE) else NA
    
    coefs <- sm$coefficients
    
    # Simpan hasil regresi
    row_reg <- data.frame(
      Komoditas     = nama,
      Skala         = skala,
      R2            = round(sm$r.squared, 4),
      Adj_R2        = round(sm$adj.r.squared, 4),
      F_Stat        = round(f_stat[1], 3),
      P_F           = format.pval(p_f, digits = 4),
      b_Tarif       = round(coefs[2, 1], 4),
      p_Tarif       = format.pval(coefs[2, 4], digits = 4),
      b_Kurs        = round(coefs[3, 1], 4),
      p_Kurs        = format.pval(coefs[3, 4], digits = 4),
      b_Brent       = round(coefs[4, 1], 4),
      p_Brent       = format.pval(coefs[4, 4], digits = 4)
    )
    regresi_komparasi[[paste(kode, skala, sep="_")]] <- row_reg
    
    # 5 Uji Diagnostik Gauss-Markov
    vif_vals <- vif(m)
    sw_test  <- shapiro.test(resid(m))
    bp_test  <- bptest(m)
    dw_test  <- dwtest(m)
    reset_t  <- resettest(m, power = 2:3)
    
    row_diag <- data.frame(
      Komoditas       = nama,
      Skala           = skala,
      Max_VIF         = round(max(vif_vals), 3),
      Shapiro_W       = round(sw_test$statistic, 4),
      Shapiro_p       = format.pval(sw_test$p.value, digits = 4),
      Normal_Status   = ifelse(sw_test$p.value > 0.05, "Lolos (Normal)", "Tidak Normal"),
      BP_Stat         = round(bp_test$statistic, 3),
      BP_p            = format.pval(bp_test$p.value, digits = 4),
      Homosked_Status = ifelse(bp_test$p.value > 0.05, "Lolos (Homogen)", "Heteroskedastis"),
      DW_Stat         = round(dw_test$statistic, 3),
      DW_p            = format.pval(dw_test$p.value, digits = 4),
      Autokor_Status  = ifelse(dw_test$p.value > 0.05, "Bebas Autokorelasi", "Autokorelasi"),
      RESET_Stat      = round(reset_t$statistic, 3),
      RESET_p         = format.pval(reset_t$p.value, digits = 4),
      Linear_Status   = ifelse(reset_t$p.value > 0.05, "Lolos (Linier)", "Non-Linier/Misspecified")
    )
    diagnostik_komparasi[[paste(kode, skala, sep="_")]] <- row_diag
  }
}

df_regresi_komparasi   <- do.call(rbind, regresi_komparasi)
df_diagnostik_komparasi <- do.call(rbind, diagnostik_komparasi)

write.csv(df_regresi_komparasi, file.path(dir_output_tbl, "tabel_komparasi_regresi_4_skala.csv"), row.names = FALSE)
write.csv(df_diagnostik_komparasi, file.path(dir_output_tbl, "tabel_komparasi_diagnostik_4_skala.csv"), row.names = FALSE)

# B. UJI BEDA 2 PERIODE & 3 FASE KEBIJAKAN PADA KEMPAT SKALA
uji_komparatif_list <- list()

for (kode in komoditas_vec) {
  sub_data <- subset(df_transformed, hs6 == kode)
  nama <- komoditas_nama[kode]
  
  # Evaluasi respon volume pada 4 skala
  skala_vars <- list(
    Level  = sub_data$qty_mt,
    Log    = sub_data$ln_qty_mt,
    Zscore = sub_data$z_qty_mt,
    MinMax = sub_data$norm_qty_mt
  )
  
  for (skala in names(skala_vars)) {
    y_val <- skala_vars[[skala]]
    
    # 1. Uji-t Welch 2 Periode (Pra vs Pasca Tarif)
    t_res <- t.test(y_val ~ sub_data$periode_tarif, var.equal = FALSE)
    w_res <- wilcox.test(y_val ~ sub_data$periode_tarif, exact = FALSE)
    
    # 2. ANOVA & Kruskal-Wallis 3 Fase Kebijakan
    aov_fit <- aov(y_val ~ sub_data$regime)
    aov_p   <- summary(aov_fit)[[1]][["Pr(>F)"]][1]
    welch_p <- oneway.test(y_val ~ sub_data$regime, var.equal = FALSE)$p.value
    kw_p    <- kruskal.test(y_val ~ sub_data$regime)$p.value
    
    uji_komparatif_list[[paste(kode, skala, sep="_")]] <- data.frame(
      Komoditas   = nama,
      Skala       = skala,
      Mean_Pra    = round(t_res$estimate[1], 3),
      Mean_Pasca  = round(t_res$estimate[2], 3),
      Diff        = round(t_res$estimate[1] - t_res$estimate[2], 3),
      Welch_t     = round(t_res$statistic, 3),
      Welch_p     = format.pval(t_res$p.value, digits = 4),
      Wilcox_p    = format.pval(w_res$p.value, digits = 4),
      ANOVA_p     = format.pval(aov_p, digits = 4),
      Welch_AOV_p = format.pval(welch_p, digits = 4),
      KW_p        = format.pval(kw_p, digits = 4)
    )
  }
}

df_uji_komparatif <- do.call(rbind, uji_komparatif_list)
write.csv(df_uji_komparatif, file.path(dir_output_tbl, "tabel_komparasi_uji_komparatif_4_skala.csv"), row.names = FALSE)

cat("\n=== HASIL REGRESI 4 SKALA ===\n")
print(df_regresi_komparasi[, c("Komoditas", "Skala", "R2", "Adj_R2", "P_F", "b_Tarif", "p_Tarif", "b_Kurs", "p_Kurs")])

cat("\n=== HASIL DIAGNOSTIK 4 SKALA (SHAPIRO-WILK & RESET) ===\n")
print(df_diagnostik_komparasi[, c("Komoditas", "Skala", "Shapiro_p", "Normal_Status", "BP_p", "Homosked_Status", "RESET_p", "Linear_Status")])

cat("\nAnalisis 4 Skala Selesai dan Seluruh Tabel Disimpan di 4-Reports!\n")
