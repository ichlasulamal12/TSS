# install.packages(c("olsrr", "car", "lmtest", "ggfortify"))
# Contoh 1
# Load package
library(olsrr)
library(car)
library(lmtest)
library(ggfortify)

# Data yang digunakan

X <- c(1.70, 1.00, 1.70, 2.80, 2.20, 0.80, 3.60, 1.10, 2.00, 2.60, 
       2.30, 0.90, 1.20, 3.40, 1.70, 2.50, 1.40, 3.30, 2.20, 1.50)
Y <- c(33, 24, 27, 47, 35, 17, 57, 20, 38, 45, 
       44, 19, 25, 55, 30, 43, 27, 53, 38, 28)

# Ringkasan data
summary(X)
summary(Y)

# Membuat histogram
hist(X)
hist(Y)

# Fit model
model_fit <- lm(Y~X) 
summary(model_fit)

# Diagnostik model
autoplot(model_fit)

# Uji linearitas
crPlots(model_fit)
# Uji normalitas residual
autoplot(model_fit, 2)
ols_test_normality(model_fit)

# Uji homoskedastisitas residual
autoplot(model_fit, 3)
## menggunakan Breusch-Pagan Test
bptest(model_fit)

# Uji autokorelasi residual 
# menggunakan Durbin-Watson Test
# Fungsi set.seed memastikan kita bisa mendapatkan 
# nilai p yang sama setiap saat
set.seed(123)
durbinWatsonTest(model_fit)

plot(Y, X, col = "blue", main = "House Price Regression",
     abline(lm(X~Y)), cex = 1.3, pch = 16,
     xlab = "Ukuran Rumah (Ribuan Kaki Persegi)", 
     ylab = "Harga Rumah (Ribuan USD)")

# Prediksi
ukuranRumah <- data.frame(X = 4)
result <-  predict(model_fit, ukuranRumah)
print(result)

# Contoh 2
# install.packages("tidyverse")
# Mengatur direktori kerja
setwd("D:/Dokumen/Undip/SC-SCSI/TSS Maba/2020/")

library(tidyverse)
library(olsrr)
library(car)
library(lmtest)
library(ggfortify)

# Load data yang digunakan
income_data <- read_csv("income.data.csv")
income_data = income_data[,2:3]

summary(income_data)

# Visualisasi variabel yang dipakai
income_data %>%
  gather() %>%
  ggplot() +
  geom_histogram(mapping = aes(x=value,fill=key), color="black") +
  facet_wrap(~ key, scales = "free") +
  theme_minimal() +
  theme(text = element_text(size=14))

# Korelasi
cor(income_data[c("happiness","income")])

# Fit model menggunakan regresi
income_mod <- lm(data=income_data, happiness~income)
summary(income_mod)

# Diagnostik model
autoplot(income_mod)

# Uji linearitas
autoplot(income_mod, 1)
crPlots(income_mod)

# Uji normalitas residual
autoplot(income_mod, 2)
ols_test_normality(income_mod)

# Uji homoskedastisitas residual
autoplot(income_mod, 3)
## menggunakan Breusch-Pagan Test
bptest(income_mod)

# Uji autokorelasi residual 
# menggunakan Durbin-Watson Test
# Fungsi set.seed memastikan kita bisa mendapatkan 
# nilai p yang sama setiap saat
set.seed(123)
durbinWatsonTest(income_mod)

# Plot data 
income.graph<-
  ggplot(income_data, aes(x=income, y=happiness)) + 
  geom_point() +
  geom_smooth(method="lm", col="black") +
  annotate(geom="text", x=2.8, y=7, 
           label="Happiness = 0.2 + 0.71*Income") +
  ggtitle("Reported happiness as a function of income") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Income (x$10,000)",
       y = "Happiness score (0 to 10)")

income.graph

# Prediksi
pendapatan <- data.frame(income = 5)
result <-  predict(income_mod, pendapatan)
print(result)
