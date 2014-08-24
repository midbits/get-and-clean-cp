---
title: "Code Book"
subtitle: "Getting and Cleaning Data Course Project"
author: "Fredrik Johansson"
date: "17 augusti 2014"
output: html_document
---

This document describes the data and the operations made on it. 

Two data sets are read in from the raw data files: the training data and the testing data. As they contain the same types of measurements but for different subjects they are combined in the data set called *combineddataset*. This data set is reduced so that it only contains means and standard deviations for each experiment by searching for column names containing 

#Combineddataset
combineddataset consists of the following data:
subject - The person wearing the accelerometer, labeled 1 to 30.
activity - The activity the person was doing by the time of measurement. Either "laying", "sitting", "standing", "walking", "walkingdownstairs" or "walkingupstairs".
measurements (85 columns) - Time, frequency and angular data of means and standard deviations from the accelerometers in the experiment. Full descriptsion of the measurements can be found in the file features_info.txt among the raw data. 

The names of the measurements have been modified from the original data files so that the prefixes "f" and "t" has been expanded to "freq" and "time" to denot with domain they belong to. All spaces have been removed and the letters converted to lowercaps. 

#Tidy
The tidy dataset contains the means of the measurements for each  subject and activity calculated with R's mean function. Example: combineddataset contains 50 observations of subject 1 doing the activity "standing". The tidy dataset contains the mean of these 50 observations for each measurement.  