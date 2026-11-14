suppressPackageStartupMessages({
  library(car)
  library(lmtest)
})

# Baca master panel di 2-Data
d2 <- readRDS("D:/IPB/KULIAH/S1/ANSTAT/Tugas/infografis_v3/2-Data/master_panel_2022_202609.rds")

# Komparasi: Full 2022-2026 (57 bulan) vs Sub 2025-2026 (21 bulan)
cat("========================================================================\n")
cat("KOMPARASI EMPIRIS: RENTANG PENUH (2022-2026) vs SUB-PERIODE (2025-2026)\n")
cat("========================================================================\n\n")

komoditas_list <- unique(d2$commodity_short)

for (kom in komoditas_list) {
  df_full <- subset(d2, commodity_short == kom)
  df_sub  <- subset(d2, commodity_short == kom & date >= as.Date("2025-01-01"))
  
  # Model Full 2022-2026 (57 bulan)
  m_full <- lm(qty_mt ~ tau_pct + kurs_idr_usd + brent_usd_bbl, data = df_full)
  sm_full <- summary(m_full)
  f_full <- sm_full$fstatistic
  pf_full <- pf(f_full[1], f_full[2], f_full[3], lower.tail = FALSE)
  
  # Model Sub 2025-2026 (21 bulan)
  m_sub <- lm(qty_mt ~ tau_pct + kurs_idr_usd + brent_usd_bbl, data = df_sub)
  sm_sub <- summary(m_sub)
  f_sub <- sm_sub$fstatistic
  pf_sub <- pf(f_sub[1], f_sub[2], f_sub[3], lower.tail = FALSE)
  
  cat(">>> KOMODITAS:", kom, "\n")
  cat(sprintf("%-20s | %-12s | %-12s | %-12s | %-12s | %-10s\n", 
              "Periode Analisis", "N (Bulan)", "R2 (Adj R2)", "b_Tarif (p)", "b_Kurs (p)", "F-test (p)"))
  cat(paste(rep("-", 85), collapse=""), "\n")
  
  # Baris Full 2022-2026
  cat(sprintf("%-20s | %-12d | %5.3f (%5.3f) | %7.1f (%5.3f) | %7.2f (%5.3f) | %5.2f (%5.3f)\n",
              "Full (2022-2026)", nrow(df_full), 
              sm_full$r.squared, sm_full$adj.r.squared,
              coef(sm_full)["tau_pct", "Estimate"], coef(sm_full)["tau_pct", "Pr(>|t|)"],
              coef(sm_full)["kurs_idr_usd", "Estimate"], coef(sm_full)["kurs_idr_usd", "Pr(>|t|)"],
              f_full[1], pf_full))
  
  # Baris Sub 2025-2026
  cat(sprintf("%-20s | %-12d | %5.3f (%5.3f) | %7.1f (%5.3f) | %7.2f (%5.3f) | %5.2f (%5.3f)\n",
              "Sub (2025-2026)", nrow(df_sub), 
              sm_sub$r.squared, sm_sub$adj.r.squared,
              coef(sm_sub)["tau_pct", "Estimate"], coef(sm_sub)["tau_pct", "Pr(>|t|)"],
              coef(sm_sub)["kurs_idr_usd", "Estimate"], coef(sm_sub)["kurs_idr_usd", "Pr(>|t|)"],
              f_sub[1], pf_sub))
  
  # Diagnostik sisaan
  sw_full <- shapiro.test(resid(m_full))
  sw_sub  <- shapiro.test(resid(m_sub))
  bp_full <- bptest(m_full)
  bp_sub  <- bptest(m_sub)
  dw_full <- dwtest(m_full)
  dw_sub  <- dwtest(m_sub)
  
  cat(sprintf("Diagnostik Full: Shapiro p = %5.3f | BP p = %5.3f | DW = %5.3f (p=%5.3f)\n",
              sw_full$p.value, bp_full$p.value, dw_full$statistic, dw_full$p.value))
  cat(sprintf("Diagnostik Sub : Shapiro p = %5.3f | BP p = %5.3f | DW = %5.3f (p=%5.3f)\n",
              sw_sub$p.value, bp_sub$p.value, dw_sub$statistic, dw_sub$p.value))
  cat("\n")
}
