# Load dataset
heart_failure_data <- read.csv("data/heart_failure.csv", colClasses = c(
  age = "numeric",
  anaemia = "factor",
  creatinine_phosphokinase = "numeric",
  diabetes = "factor",
  ejection_fraction = "numeric",
  high_blood_pressure = "factor",
  platelets = "numeric",
  serum_creatinine = "numeric",
  serum_sodium = "numeric",
  sex = "factor",
  smoking = "factor",
  time = "numeric",
  DEATH_EVENT = "factor"
))

# Display the structure of the dataset
str(heart_failure_data)

# View the first few rows of the dataset
head(heart_failure_data)

# View the dataset in a separate viewer window
View(heart_failure_data)

# Measures of Frequency
# Count of unique values in each factor variable
frequency <- sapply(heart_failure_data[, sapply(heart_failure_data, is.factor)], table)
print("Measures of Frequency:")
print(frequency)
