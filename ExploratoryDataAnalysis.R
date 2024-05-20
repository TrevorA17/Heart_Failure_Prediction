# Load dataset
heart_failure_data <- read.csv("data/heart_failure.csv", colClasses = c(
  age = "numeric",
  anaemia = "numeric",
  creatinine_phosphokinase = "numeric",
  diabetes = "numeric",
  ejection_fraction = "numeric",
  high_blood_pressure = "numeric",
  platelets = "numeric",
  serum_creatinine = "numeric",
  serum_sodium = "numeric",
  sex = "numeric",
  smoking = "numeric",
  time = "numeric",
  DEATH_EVENT = "numeric"
))

# Display the structure of the dataset
str(heart_failure_data)

# View the first few rows of the dataset
head(heart_failure_data)

# View the dataset in a separate viewer window
View(heart_failure_data)
