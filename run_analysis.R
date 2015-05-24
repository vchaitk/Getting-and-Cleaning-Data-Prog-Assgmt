activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activityID", "activity label"))
feature_labels <- read.table("./UCI HAR Dataset/features.txt", col.names = c("feature index", "feature label"))


train_subject_id <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject ID"))
train_feature_vector <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = feature_labels$feature.label)
train_activity_id <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("activityID"))
train_activity_labels <- merge(train_activity_id, activity_labels)
train_feature_mean_std <- (train_feature_vector[,grep("mean()|std", feature_labels$feature.label)])
train_data <- cbind(train_subject_id, train_activity_labels$activity.label, train_feature_mean_std)
colnames(train_data) <- c("Subject ID", "Activity Label", grep("mean|std", feature_labels$feature.label, value=TRUE))

test_subject_id <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject ID"))
test_feature_vector <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = feature_labels$feature.label)
test_activity_id <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("activityID"))
test_activity_labels <- merge(test_activity_id, activity_labels)
test_feature_mean_std <- (test_feature_vector[,grep("mean()|std", feature_labels$feature.label)])
test_data <- cbind(test_subject_id, test_activity_labels$activity.label, test_feature_mean_std)
colnames(test_data) <- c("Subject ID", "Activity Label", grep("mean|std", feature_labels$feature.label, value=TRUE))

total_data <- rbind(train_data, test_data)

total_data