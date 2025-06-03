# README
This repository contains scripts for the Coursera Getting and Cleaning Data course project of the John Hopkins University.

## Files
##### README.md
Information about the repository and its contained files

##### run_analysis.R
A R script to fetch, merge and summarise gyroscope and accelerometer data from a study

##### CodeBook.md
A description of the data, variables and the performed actions of run_analysis.R

##### summaryData.txt
The resulting dataset

## Instructions
This script requires both ```dplyr``` and ```data.table``` packages.

To run the script simply source run_analysis.R, it will automatically download an exctract the data if not available and produce a tidy dataset exported as summaryData.txt

    source("run_analysis.R")
