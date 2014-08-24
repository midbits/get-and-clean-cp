---
title: "README"
subtitle: "Getting and Cleaning Data Course Project"
author: "Fredrik Johansson"
date: "24 augusti 2014"
output: html_document
---


This repository contains the files for the *Getting and Cleaning Data Course Project*. It contains of
* README.md - This readme file
* run_analysis.R - R script file
* CodeBook.md - Code book containing information about the variables and data

The run_analysis.R script will read in the accelerometer data from the experiment and place it in a data table called combineddata. The means for each activity and subject is then calculated and stored in a data table called tidy. Simply source the script in R to run it. The script depends on the plyr package. 

Observe that the raw data must be placed in the directory "UCI HAR Dataset" for the script to run. The data can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
