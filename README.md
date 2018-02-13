The run_analysis.R script loads the training and test data from the provided files. It adds the list of subjects, the list of feature names and the labels for activities.   It then adds a subjectID to the feature matrices. It then merges, via rbind, the activity labels and features in one large data set that now also has a subjectID column.

It then provides proper column names for the new DATA dataframe.Subsequently, only columns containing means and standard deviations are selected, along with the activity labels and subject IDs. 

Through substituting text in the feature names with the fuller descriptions available in the data set description files, it provides more descriptive feature names.

It also adds descriptions of the activity labels.

Finally, it creates a second, tidy, data set using the aggregate function, calculating the mean of the features by activity and subjectID.
