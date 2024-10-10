library(ggplot2)

tdata <- read.table("InletData_T.csv", header = TRUE, sep = ",")
ggp <- ggplot(tdata, aes(x=Year, y=Temperature)) +
  geom_bar(aes(fill = Temperature>0), stat = "identity") +
  scale_fill_manual(values = c("blue", "red")) +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  theme(legend.position = "none") +
  labs(title = "BC Fjords Temperature Composite Anomaly", x="Year", y="Temperature Anomaly [°C]")
ggp
ggsave("BC-Fjords_T.png", width = 6, height = 3, units = "in", scale = 1, dpi = 1200)
# fit a linear model to the anomaly data
model_t <- lm(tdata$Temperature ~ tdata$Year)
model_t
# estimate the 95% confidence interval
confidence_95_t <- confint(model_t, level = 0.95)
