# Codebook
This R script fetches and summarises data from an accelerometer and gyroscope dataset. It averages the mean and standard deviation for each subject and activity and provides the data in a new dataset.
## Source Data
The data was obtained using a wrist mounted smartphone with accelerometer and gyroscope. 30 Individuals performed a number of activities: Walking, Walking upstairs, Walking downstairs, Sitting, Standing and Laying. 3-axial linear acceleration and 3-axial angular velocity was measured.
The data and its description can be accessed here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
The resulting Dataset contains the following variables

##### SubjectID
Integer, A unique identifier of the subject
##### Activity
Factor, A descriptive label for each activity. Can be
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
##### Gyroscope and Accereometer measurements
Numeric, mean and standard deviation for each feature
For information on the accelerometer and gyroscope measurements please refer to the README.txt as well as features_info.txt inside the downloaded dataset as well as its online documentation.

## Transformations
When running the R script the following transformations of the data are performed
- The test and training datasets are merged
- Only the mean and standard deviation of each feature are collected
- The activities are referred to with descriptive names
- The means and standard deviation are averaged for each individual and activity
- The resulting new dataset is returned as summaryData.txt








