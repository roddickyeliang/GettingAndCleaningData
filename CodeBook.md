Data part:

1. Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Script(run_analysis.R) part:

1. Use rbind to merge the train and test sets.

2. Read file features.txt and extract only the measurements on the mean and standard deviation for each measurement.

3. Read activity_labels.txt and apply descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets are removed.

5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as tidy_data.txt, a 180*68 data frame, the first column contains subject IDs, the second column contains activity names, and then the averages for each of the 66 attributes are in columns 3 to 68.
There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.

