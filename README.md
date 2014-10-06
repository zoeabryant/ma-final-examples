Team Mist - Makers Academy Final Project code exploration
=================

This is sample code to help with our final project at Makers Academy.

Our final project is **Mist**: an app that informs users as to whom they almost bumped in to on the previous day. The final code is located [here](https://github.com/HanWax/so_close)

**None of this code is test driven**. The code in this repo is purely exploratory.

###Objectives
To explore potential solutions for logical problems we faced in the process of making Mist.

###Specifically
This repo is where we worked out how to compute the main engine behind mist. In order to find out who our users almost bumped into we had to:

* Know where they were at what time
* Structure the data in a meaningful way
* Compare those timelines
* Determine if they were in close proximity to each other at any point, considering both time and location.

###Technology

*JSON
*Ruby

###Solutions
**In order to know where our users were at what time**, we decided to use [Moves API/App](https://www.moves-app.com/) to track their movements. We explored how to do it ourselves [here](https://github.com/zoeabryant/ma-geolocation-js-only) but found it to be impractical. This repo uses the JSON output of a moves API request.

Moves records the users longitude, latitude and timestamp at intervals throughout the day.

**In order to structure the data in a meaningful way**, we first had to convert the JSON into a ruby array. In the final version, the api returned ruby, not json, so this logic was not used.

```
/get_steps.rb
/get_places.rb
```

These files iterate over the JSON and return a ruby array. The Moves API data stores user data in two ways - if the user is moving (steps), and if they are in one place for a length of time (places). We had to write two data extraction methods for both location types.

After we had two ruby arrays for a user's steps and places, we had to format the data in a way that made it easy to compare. We decided to create a timeline.

A timeline contains timeslots for each 5mins within 24hours. Within these timeslots, we record where the user was. If they were moving during this 5 minute period, we record their movement. If they were in a place, we record this over multiple timeslots. This means we can request where a user was within a given timeslot. There are many files exploring this structure. Checkout the [final version](https://github.com/HanWax/so_close/blob/master/spec/data_handling/timeline_spec.rb).

**In order to compare those timelines and determine if they nearly 'bumped'** we had to iterate over two timelines and compare the locations.

We went through every timeslot in one user's timeline, and found the relevant timeslot for the second user. We compared the location data within each timeslot.

In order to compare whether two longitude and latitude sets are in proximity to each other, we used the [Haversine formula](http://en.wikipedia.org/wiki/Haversine_formula) and set two limits: how close they had to be to nearly bump into each other, and how close they had to be to actually bump into each other.

The finished comparison code is [here](https://github.com/HanWax/so_close/blob/master/lib/data_handling/compare_timelines.rb)

###Conclusion
This code is horrible and messy, but it was an essential playground in order to figure out how to write the main engine of the app.
