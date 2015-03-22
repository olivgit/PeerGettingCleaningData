# ANALYSIS OF WEARABLE COMPUTING DATA


## Getting the dataset

The first step is to check that the data set is available.

If not download it if necessary and unzip it.


## Reading the dataset


For each train and test sets we get a file for the subjects, the measures and the activities.

We also have features.txt which gives us the list of features corresponding to the number found in the activities files.

From those files we read the data into data frames.

## Merging the dataset

We merge the train and test data.  

We add the subject and features columns, also we gives an unique name for all the columns (from the features.txt file).

## Extracting the mean and standard deviation
We take a subset of the dataset, including only the mean and standard deviation columns (86 columns).

## Refactoring the activity names
Based on the information from activity_label.txt we refactor the activities names.

## Getting the tidy data set
We generate a tidy data set with the average of each variable for each activity and each subject
It' a wide tidy data text file that meets the [principles of tidiness][1] :

- Heading for each columns

- Variables in different columns

- No duplicate columns
 
We create a txt file  that can be read into R with read.table(header=TRUE)

To understand the data into this dataset cookbook.md is available.

[1]: https://class.coursera.org/getdata-012/forum/thread?thread_id=234 "principles of tidiness"
