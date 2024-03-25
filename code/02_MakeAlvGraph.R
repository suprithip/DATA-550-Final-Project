here::i_am("README.md")

library(readxl)
data <- read_excel("app_data.xlsx")

confirmed_appendicitis <- data[!is.na(data$Alvarado_Score) & !is.na(data$Paedriatic_Appendicitis_Score) & 
                                 data$Diagnosis == 'appendicitis', ]

library(ggplot2)

graph_alv<-ggplot(confirmed_appendicitis, aes(x = Severity, fill = Severity)) +
  geom_bar() +
  facet_wrap(~ Alvarado_Score, scales = "free", ncol = 2) +
  labs(title = "Figure 1: Severity within Confirmed Appendicitis Cases by Alvarado Score",
       x = "Severity",
       y = "Number of Cases") +
  scale_fill_manual(values = c(uncomplicated = "darkgreen", complicated = "darkred"))

saveRDS(graph_alv,
        file=here::here("output","graph_alv.rds"))