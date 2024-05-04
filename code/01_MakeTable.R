here::i_am("app_data.xlsx")

library(readxl)
data <- read_excel("app_data.xlsx") #read data

config <- yaml::yaml.load_file("config.yml") #load score threshold

# Sensitivity for Alvarado Score
alvarado_sensitivity <- sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Alvarado_Score) & data$Alvarado_Score >= config$score_threshold) /
  sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Alvarado_Score))

# Sensitivity for Pediatric Appendicitis Score
pediatric_sensitivity <- sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Paedriatic_Appendicitis_Score) & data$Paedriatic_Appendicitis_Score >= config$score_threshold) /
  sum(!is.na(data$Diagnosis) & data$Diagnosis == 'appendicitis' & !is.na(data$Paedriatic_Appendicitis_Score))

# Create a summary dataframe
summary_df <- data.frame(
  Measure = c("Alvarado Score", "Pediatric Appendicitis Score"),
  Sensitivity = c(alvarado_sensitivity*100, pediatric_sensitivity*100)
)

saveRDS(summary_df,
        file=here::here("output","summary_df.rds"))
