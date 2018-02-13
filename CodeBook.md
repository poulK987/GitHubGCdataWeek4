The data set consists of test results from the accelerometers on the Samsung Galaxy smartphone.

The feature data sets, X_train and X_test, are combined with the activity data sets, y_train and y_test, to create one large data frame named DATA, using the rbind and cbind commands. 

X data frames have features in columns and subjects in rows. y data frames have activities by subjects in one column. 

In the process, a column named subjectID identifying the subject of each row is added for both training and testing data.

The column names are extracted from the activity label file and the feature list. Via the gsub command, 4 different abbreviations are substituted for more descriptive names, using the feature list as source.

Finally, a new, tidier, data frame named DATA2 is created using the aggregate function, averaging features by activity and subjectID.




