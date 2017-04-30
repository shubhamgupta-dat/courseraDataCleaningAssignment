# courseraDataCleaningAssignment
Repo for Data Cleaning course of Coursera offered by John Hopkins University

The code works with the following flow:

 1. Download the data from the given location : [UCI_HAR_Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip)
 2. The given data is in form of text. So I started with reading them in the csv format.
 3. Build the test data from the test folder with the 'current_activity' and the 'subject' associated to it.
 4. Similarly I build the data for the train set.
 5. Bind the data and associate the data with the subject and the activity.
 6. Melt and group the data and get the result with the variables  in cast.
