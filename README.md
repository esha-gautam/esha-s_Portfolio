
# Student Exam Performance

This project aims to understand how the Student Exam Performance is influenced by different factors such as Gender, Ethnicity, Parent Education, Test Preparation and their Lunch Type

## Process
- Data Collection
- Data Cleaning
- Data Transformation
- Data Analysis

#### Data Source -  https://www.kaggle.com


## Data Information

- Gender - Male | Female
- Ethnicity - Race of Students (Group A, B, C, D, E)
- Parent Education - Parent's Final Education (Bachelor's degree, Some college, Master's degree, Associate's degree, High school)
- Lunch Type - Standard | Reduced
- Test Preparation course - Completed | not Completed
- Maths Score
- Reading Score
- Writing Score

## Import Liberaries and Load Data set 
```
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('student exam score.csv')
print(df.head())
```

## Exploring Data
```
df.describe()




