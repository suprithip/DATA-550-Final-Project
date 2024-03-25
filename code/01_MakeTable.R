here::i_am("README.md")

library(readxl)
data <- read_excel("app_data.xlsx")

# Sensitivity for Alvarado Score
alvarado_sensitivity <- sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Alvarado_Score) & data$Alvarado_Score >= 6) /
  sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Alvarado_Score))

# Sensitivity for Pediatric Appendicitis Score
pediatric_sensitivity <- sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Paedriatic_Appendicitis_Score) & data$Paedriatic_Appendicitis_Score >= 6) /
  sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Paedriatic_Appendicitis_Score))

# Create a summary dataframe
summary_df <- data.frame(
  Measure = c("Alvarado Score", "Pediatric Appendicitis Score"),
  Sensitivity = c(alvarado_sensitivity*100, pediatric_sensitivity*100)
)

saveRDS(summary_df,
        file=here::here("output","summary_df.rds"))
