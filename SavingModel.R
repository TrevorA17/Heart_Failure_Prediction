# Load required libraries
library(caret)
library(randomForest)

# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Saving the Random Forest model for the heart failure dataset
saveRDS(rf_model, file = "./models/heart_failure_rf_model.rds")

# Load the saved Random Forest model
loaded_heart_failure_rf_model <- readRDS("./models/heart_failure_rf_model.rds")

# Sample new data (replace with actual new data)
new_heart_failure_data <- data.frame(
  age = c(55, 65, 75),  
  anaemia = factor(c(0, 1, 0)),  
  creatinine_phosphokinase = c(7861, 146, 582),  
  diabetes = factor(c(0, 0, 0)),  
  ejection_fraction = c(38, 20, 20),  
  high_blood_pressure = factor(c(0, 0, 1)),  
  platelets = c(263358.03, 162000, 265000),  
  serum_creatinine = c(1.1, 1.3, 1.9),  
  serum_sodium = c(136, 129, 130),  
  sex = factor(c(1, 1, 1)),  
  smoking = factor(c(0, 1, 0)),  
  time = c(6, 7, 4),  
  DEATH_EVENT = factor(c(1, 1, 1))
)

# Use the loaded model to make predictions for new data
predictions <- predict(loaded_heart_failure_rf_model, new_heart_failure_data)

# Print predictions
print(predictions)
