df <- read.csv("D:/IPB/KULIAH/S1/ANSTAT/anstat-ekspor-agrikultur-hs6/2-Data/master_panel_transformed.csv", stringsAsFactors = FALSE)

# 1. Parameter statistik skala per komoditas
stat_per_kom <- do.call(rbind, lapply(split(df, df$commodity_short), function(sub) {
  data.frame(
    Komoditas = sub$commodity_short[1],
    Qty_Min = min(sub$qty_mt),
    Qty_Max = max(sub$qty_mt),
    Qty_Mean = mean(sub$qty_mt),
    Qty_SD = sd(sub$qty_mt),
    Tarif_Min = min(sub$tau_pct),
    Tarif_Max = max(sub$tau_pct),
    Tarif_Mean = mean(sub$tau_pct),
    Tarif_SD = sd(sub$tau_pct)
  )
}))
rownames(stat_per_kom) <- NULL
cat("=== PARAMETER TRANSFORMASI PER KOMODITAS ===\n")
print(stat_per_kom)

# 2. Sampel data 3 periode kunci
idx <- which(df$period %in% c("2022-01", "2025-08", "2026-06"))
c_sub <- df[idx, ]
c_sub <- c_sub[order(c_sub$hs6, c_sub$period), ]

out_qty <- data.frame(
  Komoditas = c_sub$commodity_short,
  Periode = c_sub$period,
  Qty_Asli_MT = round(c_sub$qty_mt, 1),
  Qty_ln = round(c_sub$ln_qty_mt, 3),
  Qty_SkorZ = round(c_sub$z_qty_mt, 3),
  Qty_MinMax = round(c_sub$norm_qty_mt, 3)
)

out_macro <- data.frame(
  Komoditas = c_sub$commodity_short,
  Periode = c_sub$period,
  Tarif_Asli_pct = round(c_sub$tau_pct, 2),
  Tarif_ln = round(c_sub$ln_tau, 4),
  Tarif_SkorZ = round(c_sub$z_tau, 3),
  Kurs_Asli_IDR = round(c_sub$kurs_idr_usd, 0),
  Kurs_ln = round(c_sub$ln_kurs, 3),
  Kurs_SkorZ = round(c_sub$z_kurs, 3),
  Brent_Asli_USD = round(c_sub$brent_usd_bbl, 1),
  Brent_ln = round(c_sub$ln_brent, 3),
  Brent_SkorZ = round(c_sub$z_brent, 3)
)

cat("\n=== PERUBAHAN DATA VOLUME (QTY) ===\n")
print(out_qty, row.names = FALSE)

cat("\n=== PERUBAHAN DATA VARIABEL MAKRO (TARIF, KURS, BRENT) ===\n")
print(out_macro, row.names = FALSE)
