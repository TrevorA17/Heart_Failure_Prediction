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

# Measures of Central Tendency
print("\nMeasures of Central Tendency:")
# Mean
means <- colMeans(heart_failure_data[, sapply(heart_failure_data, is.numeric)], na.rm = TRUE)
print("Mean:")
print(means)
# Median
medians <- apply(heart_failure_data[, sapply(heart_failure_data, is.numeric)], 2, median, na.rm = TRUE)
print("Median:")
print(medians)
# Mode (for factor variables)
modes <- sapply(heart_failure_data[, sapply(heart_failure_data, is.factor)], function(x) names(which.max(table(x))))
print("Mode:")
print(modes)

# Measures of Distribution
print("\nMeasures of Distribution:")
# Standard Deviation
sds <- apply(heart_failure_data[, sapply(heart_failure_data, is.numeric)], 2, sd, na.rm = TRUE)
print("Standard Deviation:")
print(sds)
# Range
ranges <- apply(heart_failure_data[, sapply(heart_failure_data, is.numeric)], 2, function(x) diff(range(x, na.rm = TRUE)))
print("Range:")
print(ranges)
# Interquartile Range (IQR)
iqrs <- apply(heart_failure_data[, sapply(heart_failure_data, is.numeric)], 2, IQR, na.rm = TRUE)
print("Interquartile Range (IQR):")
print(iqrs)
