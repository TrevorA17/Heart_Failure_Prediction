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

# Measures of Relationship
print("\nMeasures of Relationship:")
# Correlation Matrix for numeric variables
correlation_matrix <- cor(heart_failure_data[, sapply(heart_failure_data, is.numeric)], use = "complete.obs")
print("Correlation Matrix:")
print(correlation_matrix)

# Perform ANOVA for numeric variables across different factors
anova_results <- lapply(heart_failure_data[, sapply(heart_failure_data, is.numeric)], function(var) {
  anova_result <- lapply(heart_failure_data[, sapply(heart_failure_data, is.factor)], function(factor_var) {
    anova_result <- anova(lm(var ~ factor_var, data = heart_failure_data))
    return(anova_result)
  })
  return(anova_result)
})

# Print ANOVA results
print("ANOVA Results:")
print(anova_results)

# Load required libraries
library(ggplot2)

# Univariate Plots
# Histogram of age
ggplot(heart_failure_data, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency")

# Bar plot of anaemia
ggplot(heart_failure_data, aes(x = anaemia)) +
  geom_bar(fill = "lightgreen") +
  labs(title = "Frequency of Anaemia", x = "Anaemia", y = "Frequency") +
  scale_x_discrete(labels = c("No", "Yes"))

# Multivariate Plot
# Scatter plot of age vs. serum_creatinine colored by DEATH_EVENT
ggplot(heart_failure_data, aes(x = age, y = serum_creatinine, color = DEATH_EVENT)) +
  geom_point() +
  labs(title = "Age vs. Serum Creatinine by Death Event", x = "Age", y = "Serum Creatinine", color = "Death Event") +
  scale_color_manual(values = c("blue", "red")) +
  theme(legend.title = element_blank())

# Box plot of ejection_fraction by diabetes
ggplot(heart_failure_data, aes(x = diabetes, y = ejection_fraction, fill = diabetes)) +
  geom_boxplot() +
  labs(title = "Ejection Fraction by Diabetes Status", x = "Diabetes", y = "Ejection Fraction", fill = "Diabetes")

# Pairwise scatter plot of numeric variables
pairs(~ age + creatinine_phosphokinase + ejection_fraction + platelets + serum_creatinine + serum_sodium, data = heart_failure_data)

