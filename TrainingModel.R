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

# Load required libraries
library(caret)
library(randomForest)
library(glmnet)

# Set seed for reproducibility
set.seed(123)

# Define training control
train_control <- trainControl(method = "cv", number = 5)

# Train Random Forest model
rf_model <- train(DEATH_EVENT ~ ., data = heart_failure_data, method = "rf", trControl = train_control)
print("Random Forest Model:")
print(rf_model)

# Train glmnet model
glmnet_model <- train(DEATH_EVENT ~ ., data = heart_failure_data, method = "glmnet", trControl = train_control)
print("GLMNET Model:")
print(glmnet_model)

# Train Generalized Linear Model (GLM)
glm_model <- train(DEATH_EVENT ~ ., data = heart_failure_data, method = "glm", trControl = train_control)
print("GLM Model:")
print(glm_model)
