# Fungsi dan Operator Dasar
setwd("C:/Users/akuaa/Downloads")
print("hello world")

1+2
2-3
3*5
4/2
5^2

x = 5+5
x
y <- 43*x-1
y
5+3*y -> z
z
7-4 = a

# Dasar-Dasar Pemrograman
# 1. Variabel
a = 3
typeof(a)
b = "data"
typeof(b)
c = TRUE
typeof(c)

# 2. Tipe Data
# Vector
vec_number <- c(1,2,-3.5,6,-7,10)
vec_number
vec_char = c("training", "software", "statistika")
vec_char
vec_bool = c(TRUE, FALSE, TRUE, FALSE)
vec_bool

# Factor
nilai_v = c("A", "A", "C", "B", "A", "E", "B", "B", "A",
            "B", "A", "A", "C", "D", "C","D", "A" ,"C")

nilai_f = factor(nilai_v)
nilai_f
summary(nilai_f)

# Matrix
x = matrix(data = 1:20, nrow = 4, ncol = 5)
x
y = matrix(data = 1:20, nrow = 4, ncol = 5, byrow = TRUE)
y

data = c(1, 3, 5, 7)
nama_baris = c("R1", "R2")
nama_kolom = c("C1", "C2")
z = matrix(data, nrow=2, ncol=2, byrow=TRUE, 
           dimnames=list(nama_baris,nama_kolom))
z

# Array
number_arr = array(1:27, dim=c(3,3,3))
number_arr

# Data Frame
a = c(11,21,30,43)
b = c("green", "yellow", "white", "red")
c = c(TRUE,FALSE,TRUE,FALSE)
data_frame = data.frame(a,b,c)
names(data_frame) = c("ID","Color","Passed")
data_frame

# List
colors = c("green", "yellow", "red")
int_numbers = c(1,21,3,43)
list_data <- list(colors, int_numbers, TRUE, 51.23, 119.1)
print(list_data)
