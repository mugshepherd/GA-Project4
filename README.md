# GA-Project4
By Toby Schaeffer and Jared Yamauchi

# Title: Restofy
Date: May 26,2015
What it contains: MapBox API, Yelp API, and Javascript map

# Project Objectives:
- The website should reveal the map of Washington, DC while showing all markers standing on the specific locations on the map. 
- If an user click on any marker on the map, the marker displays the pop-up containing more details about the restaurant. 
- Similar to markers' function, when an user click on the restaurant's link in the sidebar, the screen will automatically zoom to the right restaurant's location and also shows its pop-up with details.
- On each pop the restaurant's name, address, violation score, and reviews.
- 

# User Stories: 
- Users should see a map as the main content of the website while also should see a sidebar displaying all restaurants' names and addresses on the right side of the page. 
- Users may register to create their own account so that they have have their own profiles.
- Users can browse the restaurants through the sidebar list as they can scroll all the way down until the last restaurant on the list. 
- Users can move the view around the map and be able to click on the marker they want to look at. 
- If an user tries to explore outside of the Washington, DC map, the view should automatically center back to the middle of Washington, DC.

![alt tag](http://url/to/img.png)

# Icebox: 
- Users may can post on their comments. 
- Adding star icons for violation and review scores that represent the rate from 1 to 10 stars. 
- Adding the searchbar would be great as users can simply type the names of restaurants then zoom to the right locations. 

# Note:
- To import the seed into the database, go to the command line and type "rake db:create" & "rake db:migrate", and then "rake db:seed". This will seed the database with basic info for restaurants in Washington, DC. It may takes a while to wait until complete importing all information into the database. 