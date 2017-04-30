Description
-----------

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

- First, all the similar data is merged using the `rbind()` function. By similar, we address those files having the same number of columns and referring to the same entities.
- Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from `features.txt.`
- As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
- On the whole dataset, those columns with vague column names are corrected.
- Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called `averages_data.txt`, and uploaded to this repository.

Datasets and Variables
----------------------

 - `current.dir` to keep the track of current directory
 - `activityLables` & `features` to read the activity labels and features from txt files in data.frame format
 - `text_X, test_Y, train_X, train_Y, train_subject_X, train_subject_X` to read the test and train data
 - `allData` to bind all the data frames
 - `meltedDown` to melt the dataframe depending on the variable
 - `mean.data ` to decast data in proper format before writing in tidy format

