Heart Failure Prediction
================
Trevor Okinda
2024

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
  - [Source:](#source)
  - [Reference:](#reference)
- [Exploratory Data Analysis](#exploratory-data-analysis)
  - [Load dataset](#load-dataset)

# Student Details

|                       |                          |
|-----------------------|--------------------------|
| **Student ID Number** | 134780                   |
| **Student Name**      | Trevor Okinda            |
| **BBIT 4.2 Group**    | C                        |
| **Project Name**      | Heart Failure Prediction |

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

### Source:

The dataset that was used can be downloaded here: *\<<a
href="https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data\"
class="uri">https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data\</a>\>*

### Reference:

*\<Larxel. (2019). Heart Failure Prediction Dataset. Retrieved from
Kaggle <a
href="https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data\"
class="uri">https://www.kaggle.com/datasets/andrewmvd/heart-failure-clinical-data\</a>\>  
Refer to the APA 7th edition manual for rules on how to cite datasets:
<https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references>*

# Exploratory Data Analysis

## Load dataset

``` r
# Load dataset
heart_failure_data <- read.csv("heart_failure.csv", colClasses = c(
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
```

    ## 'data.frame':    299 obs. of  13 variables:
    ##  $ age                     : num  75 55 65 50 65 90 75 60 65 80 ...
    ##  $ anaemia                 : Factor w/ 2 levels "0","1": 1 1 1 2 2 2 2 2 1 2 ...
    ##  $ creatinine_phosphokinase: num  582 7861 146 111 160 ...
    ##  $ diabetes                : Factor w/ 2 levels "0","1": 1 1 1 1 2 1 1 2 1 1 ...
    ##  $ ejection_fraction       : num  20 38 20 20 20 40 15 60 65 35 ...
    ##  $ high_blood_pressure     : Factor w/ 2 levels "0","1": 2 1 1 1 1 2 1 1 1 2 ...
    ##  $ platelets               : num  265000 263358 162000 210000 327000 ...
    ##  $ serum_creatinine        : num  1.9 1.1 1.3 1.9 2.7 2.1 1.2 1.1 1.5 9.4 ...
    ##  $ serum_sodium            : num  130 136 129 137 116 132 137 131 138 133 ...
    ##  $ sex                     : Factor w/ 2 levels "0","1": 2 2 2 2 1 2 2 2 1 2 ...
    ##  $ smoking                 : Factor w/ 2 levels "0","1": 1 1 2 1 1 2 1 2 1 2 ...
    ##  $ time                    : num  4 6 7 7 8 8 10 10 10 10 ...
    ##  $ DEATH_EVENT             : Factor w/ 2 levels "0","1": 2 2 2 2 2 2 2 2 2 2 ...

``` r
# View the first few rows of the dataset
head(heart_failure_data)
```

    ##   age anaemia creatinine_phosphokinase diabetes ejection_fraction
    ## 1  75       0                      582        0                20
    ## 2  55       0                     7861        0                38
    ## 3  65       0                      146        0                20
    ## 4  50       1                      111        0                20
    ## 5  65       1                      160        1                20
    ## 6  90       1                       47        0                40
    ##   high_blood_pressure platelets serum_creatinine serum_sodium sex smoking time
    ## 1                   1    265000              1.9          130   1       0    4
    ## 2                   0    263358              1.1          136   1       0    6
    ## 3                   0    162000              1.3          129   1       1    7
    ## 4                   0    210000              1.9          137   1       0    7
    ## 5                   0    327000              2.7          116   0       0    8
    ## 6                   1    204000              2.1          132   1       1    8
    ##   DEATH_EVENT
    ## 1           1
    ## 2           1
    ## 3           1
    ## 4           1
    ## 5           1
    ## 6           1

``` r
# View the dataset in a separate viewer window
View(heart_failure_data)
```
