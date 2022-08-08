# How I have grown as a data person
Before this course, I had some minor experience with data analytics and working with data, I would describe it as very basic analysis and tasks.  Manipulating data in excel, making graphs, tables, etc.  Throughout this course, I have learned that I merely scratched the surface of what it means to work with data.  I learned there is a lot more to data analytics than just running numbers through a calculation or making a nice graph, it involves cleaning, manipulating, analyzing and presenting results in a way that is readable and understandable to a wider audience.  

The biggest ideas or practices I learned in this semester would be cleaning data and manipulation.  The process of clearing invalid entries, organzing the data into a way that makes sense like moving some observations into values or combining variables like dates.  I highlight these two things because cleaning data was something that I thought I knew how to do but just did very basic things like delete null entries or invalid entries, but it goes further than that like does this attribute fit more like an entry or row of data? Does this column need to be split into two different columns and how to do we do that cleanly and effectively? I always thought as someone who worked with data as someone who did complex analysis on a already nice and clean data set, but often times, these professionals have to clean it themselves and ‘wrangle’ it into a format that meets the need of their analysis or criteria.  

In my project I learned how important it is to clean data because when joined multiple tables together, it created a significant amount of null entries because the variables didn't overlap and thus the new data set needed to account for obserations not common in the other tables.  This can be seen when I loaded all of the excel files in and then combined them into the data frame ['full_synthetic'](https://github.com/scholln/Portfolio/blob/6c7062f0ba87633ddce25cd30269ef1bfc5f449b/RMD_MonteCarlo.Rmd#L65) I then cleaned it up by dropping null entries when running the random normal distribution to create a clean table for 'linear_frame'.  I also found that some variables did overlap when adding them together, this was solved by adding suffix's to the tables to make the variables unique and avoid errors.

Manipulation was an idea that I thought I knew how to do well because of my experience in Microsoft Excel, but that was very much 'spoon fed' manipulation in the way that you can do it with a lot of copy and paste and hiding columns.  This project was my first real introduction about having to specify what columns I want, what calculations I need to run on what column for a new observation and utilizing group by, or filter functions to organize into a common traits.  This was the most rewarding skill to learn as I struggled at first, but eventually found my stride within my own dataset since it was observations and variables I immersed myself in and became comfortable with. This can be found when checking for [ICD-10 accuracy](https://github.com/scholln/Portfolio/blob/6c7062f0ba87633ddce25cd30269ef1bfc5f449b/RMD_MonteCarlo.Rmd#L77), I mutated on a column to add '1' if the admitting and diagnosis fields match and 0 if they didn't.  This was updating a table that I created earlier and helped me see that the admitting and diagnosis' did not match.

# Lightning Round
- I would describe the most difficult part of the class as the pivoting section from week 4.  That part was the most complicated for me because the idea or practice of transferring variables or keys was a hard thing to process because it required some foresight into how it would look once the operation was done, and trial and error.
- The easiest part of the class was user created functions from my experience.  I saw this because I was also learning user created functions in my python course at the same time and had a double dose of this idea.  The idea itself is straighforward, you ask for certain variables and then process give a result from those variables at the end.  Almost like running it through a machine.  You have a variable, you know what the machine does, you want the change the machine will bring to apply to your variable, and so you run it through the machine and get the desired change or result.
- The part of class that interested me the most was bootstrapping and simulation.  I always had a love for statistics and probability, it was a welcomed surprise when I saw this as a lesson we would focus on.  This should a strong functionality of R that other data driven softwares either lack or can't meet the level that R offers.
- I would say a piece of advice that I would offer someone just starting this course would be to think of ways you can apply the current lesson in your job, your project or find examples on why this lesson is important to learn.  The next thing I would encourage to do, is do the primers before class.  I say this because it does make a difference typing code vs reading code.  This will help you learn and practice the lesson.  

# Grade Reflection
**Put simply enough, I believe I have earned an A for this class.**
I will reference the STA 418/518 course objectives to provide fulfilling evidence that I have met each objective and have met the requirements for an 'A' in this class.  
## Import, manage, and clean data
I have demonstrated this objective as seen in my R markdown file where I uploaded all the excel files from my company into R and then proceeded to combine them into one fully functioning table, this can be seen in 'full_synthetic'
![image](https://user-images.githubusercontent.com/105168113/183525647-85d698ab-ccdf-476f-86ef-5f123c8399f8.png)

I went beyond and created specialized tables to fulfill requirements for getting the linear model, and display views based on state for the number of claims, this can be seen in the 'Location' and 'Location_Amount" tables
![image](https://user-images.githubusercontent.com/105168113/183525910-a5eb47b8-b206-4853-b9af-526d5b5d68a2.png)

Both of these tasks involved isolating information from the larger combined data set and modifying it into a format suitable for this task.  I have created new tables based on normal distribution of existing information and combined these results to run my linear model upon, and this can be seen in 'Linear_frame'
![image](https://user-images.githubusercontent.com/105168113/183525735-8c468c43-7124-45bf-b147-2e9ff85300a4.png)

## Create graphical displays and numerical summaries of data for exploratory analysis and presentations
I have demonstrated this objective by creating numerical summaries for the numerical factors in the linear model by finding the mean and standard deviation of these factors in an individual tibble under the tag "Let's do some calculations" and then running the simulation for random numbers and combining the results into one table of information in 'Linear_frame'
![image](https://user-images.githubusercontent.com/105168113/183525735-8c468c43-7124-45bf-b147-2e9ff85300a4.png)

This shows that I am able to create a regression model into a summary for exploratory analysis and for descriptive analysis.  I provided a summary for the original model before running it on the nested data, this is seen in 'summary(model_for_ded)"
![image](https://user-images.githubusercontent.com/105168113/183526091-3a4ed0af-fd91-437f-a409-3064d8947ec1.png)

To give information on the model to show p-value, estimate and standard error.  I also provided information on the estimate, p value, and term for the individual state in the summary of "Nested_amount_allowed2"
![image](https://user-images.githubusercontent.com/105168113/183526159-ec3fa460-4d25-4462-88fa-ee5c353021bf.png)

A graphical display was provided to see the distribution of claims across the states that would be used for presentation to provide comparison for the nested data, in the section labeled "Seeing patient location".
```
Location %>%
  group_by(state_nm) %>%
  ggplot(aes(county_nm, fill = state_nm)) +
  geom_bar()
```
![image](https://user-images.githubusercontent.com/105168113/183526405-73700c92-19b7-4821-bb90-aa45159efac1.png)

 
## Write R programs for simulations from probability models and randomization-based experiments
I have demonstrated this objective by generating new data through a running a simulation on the probability model.  This occurred when generating the multi-linear model for predicting deductible cost.  I gathered the mean, and standard deviation for the factors and generated new data but running a random normal distribution model for the dataset.  This can be seen in the data frame "Linear Frame"
```
Allwd_amnt_column <- rnorm(1000, mean = allwd_amnt_tibble$mean, sd = allwd_amnt_tibble$sd)
Sbmtd_amnt_column <- rnorm(1000, mean = sbmtd_amnt_tibble$mean, sd = allwd_amnt_tibble$sd)
Copay_coin_amnt_column <- rnorm(1000, mean = copay_coin_amnt_tibble$mean, sd = copay_coin_amnt_tibble$sd)
Coin_amnt_column <- rnorm(1000, mean = coin_amnt_tibble$mean, sd = coin_amnt_tibble$sd)
Ded_amnt_column <- rnorm(1000, mean = ded_amnt_tibble$mean, sd = ded_amnt_tibble$sd)
Linear_frame <- tibble(Allwd_amnt_column, Sbmtd_amnt_column, Copay_coin_amnt_column, Coin_amnt_column, Ded_amnt_column
```
As this is where I stored all the new data.  I utilized randomization-based experiments here as it was a random normal distribution.  I also did this on the original data Diag_amount_allowed, I utilized mapping to create normal distributions for all ICD-10 diagnosis'
```
map2(Diag_amount_allowed$mean, Diag_amount_allowed$sd, ~rnorm(100, .x, .y))
```
I did this function on the entire data source but found that this data would be insufficient because there were so many blank entries of the diagnosis' and could not come up with concrete data for it as many entries were lacking in accurate, present data.  This is when I changed gears and decided to make an application to better predict deductible amounts. I used ideas from bootstrapping to create random distribution or a sample of the original data that was comparable and accurate with minimum standard error as seen in 'Nested_amount_allowed2'.
![image](https://user-images.githubusercontent.com/105168113/183526159-ec3fa460-4d25-4462-88fa-ee5c353021bf.png)

## Use source documentation and other resources to troubleshoot and extend R programs
I have demonstrated this objective by consulting not only with Dr. Dykes but also with online resources to troubleshoot errors in R that have come up in my project.  I ran into several issues nesting my data, I consulted with online forums, R help documents and examined example code to correct and improve my code to the task at hand.  I was able to fix the error of names needing to be unique when unnesting the data and found that the function just needs specification to make each column name unique.  I have also generated new functions in R such as a general linear model to get payment information and return the expected deductible.  This is able to provide new deductible data that could be used to replace the current model or add to a new dataset.  I have explored multiple packages for their functionality such as tidyverse, shiny, and excel.  I used the shiny package to assist in developing the app file, and the excel package to read in the excel spreadsheets from the file directory of my machine.
```
library(tidyverse)

library(readxl)

library(shiny)

library(broom)

library('rsconnect')
```
## Write clear, efficient, and well-documented R programs
I have demonstrated this objective by adding clear and to the point comments on my code to provide background and meaning for why I chose to run certain functions and create variables when and where.  This can be seen in the multitude of comments I have placed in the file as a note to readers and a future version of myself when we go back and review the [file](https://github.com/scholln/Portfolio/blob/6c7062f0ba87633ddce25cd30269ef1bfc5f449b/RMD_MonteCarlo.Rmd#L135).  I have shown in the comments the workflow or process of my project and my thinking during the creation of this R [project](https://github.com/scholln/Portfolio/blob/6c7062f0ba87633ddce25cd30269ef1bfc5f449b/RMD_MonteCarlo.Rmd#L175).  I have sectioned off certain functions and workflows to make it readable and able to be reproduced for future readers and myself, this can be seen all throughout the RMD file with appropriate and clever titles of the sections.  When creating the app.r file, you can see that I am referencing the nested table to utilize filtering to the appropriate state and accessing the values in 'estimate' to run the user inputted values to return the desired deductible amount.   




