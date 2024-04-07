# OhThatsA [![Build Status](https://drone.broodjeaap.net/api/badges/broodjeaap/OhThatsA/status.svg)](https://drone.broodjeaap.net/broodjeaap/OhThatsA)

An app to help you learn how to calculate day of the week from any date.

## App
<img src="media/img/main.png" alt="main" width="200"/>
<img src="media/img/year_instruction.png" alt="year_instruction" width="200"/>
<img src="media/img/month_practice.png" alt="month_practice" width="200"/>  

Mostly made to try out Dart/Flutter.

## Method

The day of the week can be calculated by:  
`(day value + month value + year value + century value + leap year value) % 7`

Every one of these value comes from a set of constants or is calculable from the date.  
This app helps you practice memorizing and calculating these values.