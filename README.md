## This project is the Getting and Cleaning Data project on Coursera.

Steps to generate tidy data:
1. Get the source zip file from Coursera and unzip the source into your RStudio working directory, eg: F:\Coursera\Working Directory, then all the data files will be in the folder: F:\Coursera\Working Directory\UCI HAR Dataset.

2. Copy your script run_analysis.R to the folder that contains source data. For me, the folder is F:\Coursera\Working Directory\UCI HAR Dataset.

3. In RStudio, run the following command:
   setwd("F:/Coursera/Working Directory/UCI HAR Dataset")
   source("run_analysis.R")

4. Wait for a minute and the tidy data files(1st_tidy_data.txt and 2nd_tidy_data.txt) will be generated in the work directory.
