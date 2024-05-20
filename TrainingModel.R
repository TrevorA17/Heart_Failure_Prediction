# Load required libraries
library(caret)

# Load the dataset
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

# Data Splitting
set.seed(123)  # For reproducibility
train_index <- createDataPartition(heart_failure_data$DEATH_EVENT, p = 0.7, list = FALSE)
train_data <- heart_failure_data[train_index, ]
test_data <- heart_failure_data[-train_index, ]

# Bootstrapping
boot_data <- createDataPartition(1:nrow(heart_failure_data), p = 0.8, list = FALSE)
bootstrapped_samples <- heart_failure_data[boot_data, ]

# Cross-validation
# Basic cross-validation
cv_model <- train(DEATH_EVENT ~ ., data = heart_failure_data, method = "glm", trControl = trainControl(method = "cv"))
print("Basic Cross-validation:")
print(cv_model)

# Repeated cross-validation
repeated_cv_model <- train(DEATH_EVENT ~ ., data = heart_failure_data, method = "glm", trControl = trainControl(method = "repeatedcv", number = 5, repeats = 3))
print("Repeated Cross-validation:")
print(repeated_cv_model)

# Leave-one-out cross-validation (LOOCV)
loocv_model <- train(DEATH_EVENT ~ ., data = heart_failure_data, method = "glm", trControl = trainControl(method = "LOOCV"))
print("LOOCV:")
print(loocv_model)
