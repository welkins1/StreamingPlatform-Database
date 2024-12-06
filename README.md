# StreamingPlatform-Database 🖥️

This is a mock database schema that I, along with @Jerjoham, @kickrockz2912, and @j_saini@uncg.edu, created for a group project assignment for ISM 218—Database Systems.

This repository contains a mock database schema designed for a streaming platform such as Netflix (although Netflix probably has a much larger schema than ours). Drafting and visualizing the relational schema using an ER diagram and relational schema was fun. The database captures aspects of a streaming platform, such as users, TV shows, movies, genres, subscriptions, and progress tracking.

The schema consists of numerous interconnected tables to simulate the functionality of a streaming service database. 

# Database Components Overiew  📝

User Management: Tracks user details and their subscription plans.

Content Organization: Separates TV shows, episodes, and movies, each with speicifc genres.

User Interaction: Tracks progress on watched content, user reviews, and custom queues.

Relationships: Interconnectedness using foreign keys between tables.

# Database Creation 🛠️
The database was designed with MySQL, with MySQLWorkbench being the primary tool for creating and managing the schema. The forward engineering feature of MySQLWorkbench was used to convert the relational schema into SQL queries. 

ERDPlus.com was also used to create the ER diagram and relational schema. 

# Tables Overview 📋
```TV Show```: Stores TV show data.

```Episode:``` Tracks individual episodes, linked to their respective TV shows.

```Movie:``` Manages movie data.

```Genre:``` Categorizes TV shows and movies.

```User:``` Contains user information and preferences.

```Progress:``` Stores user progress for movies and TV episodes.

```Queue:``` Represents a user's content queue.

```Review:``` Stores info about reviews for movies or TV episodes made by users.

```Subscription:``` Stores user subscription details.

# Associative Tables 🔗
```MovieGenre:``` Links movies to genres.

```TVShowGenre:``` Links TV shows to genres.

```UserGenre:``` Links users to preferred genres.

# Setup ⚙️
Import the ```StreamingPlatform.SQL``` file into your MySQL environment.
Run the script to create the ```StreamingPlatform```schema and its associated tables. You Populate the tables with sample data to simulate a working streaming platform.
