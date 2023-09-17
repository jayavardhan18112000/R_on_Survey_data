# Data analysis and Imputation on Survey Dataset

## Overview

This repository contains an R project focused on data analysis and visualization using the R programming language. The project is structured into several tasks, each with its specific objectives and analyses. Below is an overview of what each task entails:

### Task 1: Summarize the Data Structure

In this task, we start by summarizing the data structure of the dataset provided in the "Mini_Group_Project_1.xlsx" file. Our analysis includes:

- Identifying and categorizing variable types (e.g., numerical, categorical).
- Identifying missing values in the dataset.
- Providing counts of "Refused" and "NA" values in each column.

### Task 2: Data Imputation

Task 2 focuses on data imputation, where we replace "Refused" and "NA" values with appropriate replacements based on the column type. Our approach is as follows:

- For categorical variables, we replace missing values with the mode of the column.
- For numerical variables, we replace missing values with the median.

This step ensures that the dataset is ready for analysis.

### Task 3: Exploratory Data Analysis

**Part 1:**

In this part, we perform exploratory data analysis on a subset of the dataset based on specific criteria, such as respondents with a "Moderate" political view who are female. Our analysis includes:

- Filtering the data.
- Analyzing the relationship between age groups and preferences for having a closer relationship with China or Germany.
- Visualizing the results using a bar chart.

**Part 2:**

Building upon Part 1, we draw conclusions from the graph generated. It shows that older females prefer having a closer relationship with Germany over China, while in younger females, the ratio is more even.

### Task 4: Visual Analysis

**Part 1:**

This part involves analyzing responses to a series of questions (Q1-Q6) based on gender. Our analysis includes:

- Calculating the percentage of respondents who answer "Yes, as a partner" to these questions, broken down by gender.
- Visualizing the results in a bar chart.

**Part 2:**

We interpret the graph generated in Part 1, which shows that the percentage of males who consider Germany as a partner on key issues is slightly higher than that of females. However, the differences are relatively small, suggesting that gender may not be a significant factor in the responses.
