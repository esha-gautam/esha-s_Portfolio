
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
```python
import pandas  as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
```


```python
df = pd.read_csv('student exam score.csv')
print(df.head())
```

       Unnamed: 0  Gender EthnicGroup          ParentEduc     LunchType  \
    0           0  female     group B   bachelor's degree      standard   
    1           1  female     group C        some college      standard   
    2           2  female     group B     master's degree      standard   
    3           3    male     group A  associate's degree  free/reduced   
    4           4    male     group C        some college      standard   
    
        TestPrep  MathScore  ReadingScore  WritingScore  
    0       none         72            72            74  
    1  completed         69            90            88  
    2       none         90            95            93  
    3       none         47            57            44  
    4       none         76            78            75  
    


```python
df.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Unnamed: 0</th>
      <th>MathScore</th>
      <th>ReadingScore</th>
      <th>WritingScore</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>30641.000000</td>
      <td>30641.000000</td>
      <td>30641.000000</td>
      <td>30641.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>499.556607</td>
      <td>66.749355</td>
      <td>69.624980</td>
      <td>68.468327</td>
    </tr>
    <tr>
      <th>std</th>
      <td>288.747894</td>
      <td>15.206049</td>
      <td>14.671572</td>
      <td>15.307814</td>
    </tr>
    <tr>
      <th>min</th>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>10.000000</td>
      <td>5.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>249.000000</td>
      <td>56.000000</td>
      <td>60.000000</td>
      <td>58.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>500.000000</td>
      <td>67.000000</td>
      <td>70.000000</td>
      <td>69.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>750.000000</td>
      <td>78.000000</td>
      <td>80.000000</td>
      <td>79.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>999.000000</td>
      <td>100.000000</td>
      <td>100.000000</td>
      <td>100.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 30641 entries, 0 to 30640
    Data columns (total 9 columns):
     #   Column        Non-Null Count  Dtype 
    ---  ------        --------------  ----- 
     0   Unnamed: 0    30641 non-null  int64 
     1   Gender        30641 non-null  object
     2   EthnicGroup   30641 non-null  object
     3   ParentEduc    30641 non-null  object
     4   LunchType     30641 non-null  object
     5   TestPrep      30641 non-null  object
     6   MathScore     30641 non-null  int64 
     7   ReadingScore  30641 non-null  int64 
     8   WritingScore  30641 non-null  int64 
    dtypes: int64(4), object(5)
    memory usage: 2.1+ MB
    


```python
#to check the sum of null values
df.isnull().sum()
```




    Unnamed: 0      0
    Gender          0
    EthnicGroup     0
    ParentEduc      0
    LunchType       0
    TestPrep        0
    MathScore       0
    ReadingScore    0
    WritingScore    0
    dtype: int64



# Drop unnamed column


```python
df = df.drop('Unnamed: 0', axis = 1)
print(df)
```

           Gender EthnicGroup          ParentEduc     LunchType   TestPrep  \
    0      female     group B   bachelor's degree      standard       none   
    1      female     group C        some college      standard  completed   
    2      female     group B     master's degree      standard       none   
    3        male     group A  associate's degree  free/reduced       none   
    4        male     group C        some college      standard       none   
    ...       ...         ...                 ...           ...        ...   
    30636    male     group C    some high school      standard       none   
    30637    male     group E  associate's degree  free/reduced       none   
    30638    male     group C        some college      standard       none   
    30639    male     group A    some high school  free/reduced  completed   
    30640  female     group D  associate's degree      standard       none   
    
           MathScore  ReadingScore  WritingScore  
    0             72            72            74  
    1             69            90            88  
    2             90            95            93  
    3             47            57            44  
    4             76            78            75  
    ...          ...           ...           ...  
    30636         56            47            51  
    30637         74            75            72  
    30638         36            29            27  
    30639         43            34            39  
    30640         52            68            66  
    
    [30641 rows x 8 columns]
    

# Gender Distribution


```python
plt.figure(figsize= (4,4))
ax = sns.countplot(data = df, x = 'Gender')
ax.bar_label(ax.containers[0])
plt.title('Gender Distribution by count')
plt.show()
```


    
![png](Student_Exam_Score/Student_Exam_Score/output_8_0.png)
    



```python
#from the above chart we have analysed that:
#the number of females in the data is more than the number of males.
```


```python
gb = df.groupby('ParentEduc').agg({"MathScore" : 'mean', "ReadingScore" : 'mean', "WritingScore" : 'mean'})
print(gb)
```

                        MathScore  ReadingScore  WritingScore
    ParentEduc                                               
    associate's degree  68.527787     71.368350     70.374619
    bachelor's degree   70.635000     73.375556     73.423611
    high school         64.670038     67.522467     65.565909
    master's degree     72.168137     75.202044     75.246168
    some college        66.603434     69.528093     68.653661
    some high school    62.926359     65.826816     63.815473
    


```python
plt.figure(figsize= (4,4))
sns.heatmap(gb, annot = True)
plt.title('Impact of ParentEduc on Students Score')
plt.show()
```


    
![png](Student_Exam_Score/output_11_0.png)
    



```python
#from the above chart we have concluded that:
#the education of parents have a good impact on their scores.
```


```python
gb1 = df.groupby('LunchType').agg({"MathScore": 'mean', "ReadingScore": 'mean', "WritingScore": 'mean'})
print(gb1)
```

                  MathScore  ReadingScore  WritingScore
    LunchType                                          
    free/reduced  59.057843     64.438990     62.694393
    standard      70.897865     72.422105     71.582567
    


```python
plt.figure(figsize = (4,4))
sns.heatmap(gb1, annot = True)
plt.title('Impact of LunchType on Students Score')
plt.show()
```


    
![png](C:\Users\Asus\AppData\Local\Temp\7cad2533-123a-4857-8b13-0fc849418e13_Student_Exam_Performance.zip.e13\output_14_0.png)
    



```python
#from the above chart we have concluded that the Standard LunchType imporoves the performance the students.
```


```python
gb2 = df.groupby('TestPrep').agg({"MathScore": 'mean', "ReadingScore": 'mean', "WritingScore": 'mean'})
print(gb2)
```

               MathScore  ReadingScore  WritingScore
    TestPrep                                        
    completed  69.761468     73.966235     74.735269
    none       65.162398     67.337752     65.166534
    


```python
plt.figure(figsize= (4,4))
sns.heatmap(gb2, annot = True)
plt.title('Relationship between TestPrep and Students Scores')
plt.show()
```


    
![png](C:\Users\Asus\AppData\Local\Temp\789d01dd-9962-4c76-9de9-b562a75466d5_Student_Exam_Performance.zip.6d5\output_17_0.png)
    



```python
#from the above chart we have analyzed that students who completed the TestPrep have scored higher as compared to students who have not completed.
```

# Outliers


```python
sns.boxplot(data = df, x = 'MathScore')
plt.show()
```


    
![png](C:\Users\Asus\AppData\Local\Temp\9f1de9d7-e75c-47df-9275-ba3b44da7f98_Student_Exam_Performance.zip.f98\output_20_0.png)
    



```python
sns.boxplot(data = df, x = 'ReadingScore')
plt.show()
```


    
![png](C:\Users\Asus\AppData\Local\Temp\0279fc96-ec2c-43b1-99c3-e03f6a553404_Student_Exam_Performance.zip.404\output_21_0.png)
    



```python
sns.boxplot(data = df, x = 'WritingScore')
plt.show()
```


    
![png](C:\Users\Asus\AppData\Local\Temp\86527fc8-8aca-422b-bce6-d46812663d26_Student_Exam_Performance.zip.d26\output_22_0.png)
    



```python
#from the above charts we have concluded that Maths is a difficult subject as compared to other subjects.
```

# Distributtion of Ethnic Groups


```python
groupA = df.loc[(df['EthnicGroup'] == 'group A')].count()
groupB = df.loc[(df['EthnicGroup'] == 'group B')].count()
groupC = df.loc[(df['EthnicGroup'] == 'group C')].count()
groupD = df.loc[(df['EthnicGroup'] == 'group D')].count()
groupE = df.loc[(df['EthnicGroup'] == 'group E')].count()

print(mlist)
l= ['group A', 'group B', 'group C', 'group D', 'group E']
mlist = [groupA['EthnicGroup'], groupB['EthnicGroup'], groupC['EthnicGroup'], groupD['EthnicGroup'], groupE['EthnicGroup']] 
plt.pie(mlist, labels = l, autopct = '%1.2f%%')
plt.title('Distribution of Ethnic Groups')
plt.show()
```

    [2359, 6192, 9816, 7986, 4288]
    


    
![png](C:\Users\Asus\AppData\Local\Temp\f795b457-13ea-433f-b299-96f352fac261_Student_Exam_Performance.zip.261\output_25_1.png)
    



```python
ax = sns.countplot(df , x = 'EthnicGroup')
ax.bar_label(ax.containers[0])
```




    [Text(0, 0, '6192'),
     Text(0, 0, '9816'),
     Text(0, 0, '2359'),
     Text(0, 0, '7986'),
     Text(0, 0, '4288')]




    
![png](C:\Users\Asus\AppData\Local\Temp\d1bc75ce-63eb-4bd7-ad2d-166f6b10281e_Student_Exam_Performance.zip.81e\output_26_1.png)




