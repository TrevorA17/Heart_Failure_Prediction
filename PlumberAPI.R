# Load necessary libraries
library(plumber)

# Load the saved Random Forest model for heart failure prediction
loaded_heart_failure_rf_model <- readRDS("./models/heart_failure_rf_model.rds")

#* @apiTitle Heart Failure Prediction Model API
#* @apiDescription Used to predict heart failure.

#* @post /predict_heart_failure
#* @param age Numeric: Age of the patient
#* @param anaemia Factor: Presence of anaemia (0 for No, 1 for Yes)
#* @param creatinine_phosphokinase Numeric: Level of creatinine phosphokinase
#* @param diabetes Factor: Presence of diabetes (0 for No, 1 for Yes)
#* @param ejection_fraction Numeric: Ejection fraction percentage
#* @param high_blood_pressure Factor: Presence of high blood pressure (0 for No, 1 for Yes)
#* @param platelets Numeric: Platelets count
#* @param serum_creatinine Numeric: Level of serum creatinine
#* @param serum_sodium Numeric: Level of serum sodium
#* @param sex Factor: Gender of the patient (0 for Female, 1 for Male)
#* @param smoking Factor: Smoking status (0 for No, 1 for Yes)
#* @param time Numeric: Follow-up period (in days)
#* @param DEATH_EVENT Factor: Death event indicator (0 for Survived, 1 for Deceased)
predict_heart_failure <- function(age, anaemia, creatinine_phosphokinase, diabetes, ejection_fraction,
                                  high_blood_pressure, platelets, serum_creatinine, serum_sodium, sex,
                                  smoking, time, DEATH_EVENT) {
  
  # Prepare new data for prediction
  new_heart_failure_data <- data.frame(
    age = as.numeric(age),
    anaemia = as.factor(anaemia),
    creatinine_phosphokinase = as.numeric(creatinine_phosphokinase),
    diabetes = as.factor(diabetes),
    ejection_fraction = as.numeric(ejection_fraction),
    high_blood_pressure = as.factor(high_blood_pressure),
    platelets = as.numeric(platelets),
    serum_creatinine = as.numeric(serum_creatinine),
    serum_sodium = as.numeric(serum_sodium),
    sex = as.factor(sex),
    smoking = as.factor(smoking),
    time = as.numeric(time),
    DEATH_EVENT = as.factor(DEATH_EVENT)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_heart_failure_rf_model, new_heart_failure_data)
  
  # Return the prediction
  return(as.character(prediction))
}
