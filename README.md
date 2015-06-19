Getting and Cleaning Data-015 Course Project README.md file

Important note: The starting point for this project, and the associated
run_analysis.R program, is the README.TXT file supplied with the UCI HAR
Dataset.  This README.md should be read in conjunction with that, and is
not intended to repeat information contained within that file.


The run_analysis.R program performs the following steps, and creates the
following intermediate variables:

1) The working directory is set to C:\UCI HAR Dataset

2) The "train" data files are read sequentially.  X_train.txt is read into
"xtrain"; Y_train.txt is read into "ytrain"; and subject_train.txt is read
into "subjecttrain".  Finally, all the features from features.txt are read
into "xtraincols", being the column variable names.

3) Column names for the "train" data files are set; with the string
"activity" being applied to "ytrain"; "subject" assigned to "subjecttrain";
and variable names read over from the second column of "xtraincols" into
"xtrain".

4) A single dataframe -- "jointrain" -- is created by column-binding
together "ytrain", "subjecttrain", and "xtrain".

5) The activity codes within "jointrain" -- 1, 2, 3, 4, 5, and 6 --
indicating the various activities carried out by the subject volunteers are
replaced by their full equivalents, respectively "WALKING",
"WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", and
"LAYING".

6) Steps (2), (3), (4) and (5) above are repeated, but for the "test" data
set.  The relevant variables have "test" in their names, instead of
"train", but are otherwise processed identically.

7) "Jointrain" and "jointest" are combined together, creating a single
named and labelled dataframe for the "train" and "test" data sets.

8) The means and standard deviations of X, Y and Z were selected as being
of interest, and the selection of these explicitly "hardcoded" (OK per
David Hood) to create a variable, "stripped", containing just these six
column variables.  Other columns, containing less explicit inclusions of
the words "mean" and "std" were ignored, eg, the means and standard
deviations of frequencies.

9) A tidy data set ("output") was created by averaging the subject scores
contained within "stripped" for each of the activities' mean and standard
deviations. This reduced the number of rows from 10,299 to 180 -- ie, 6
activities * 30 subjects.  Multiplied across the six variables, this
clearly meets the requirements for a tidy data set.

10) Finally, "output" was written to a text table, output.text.     