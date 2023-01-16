# Lunch and Learn

This repo is a Back End application which makes use of 4 external APIs and exposes 5 endpoints for a FE application to utilize.

## Table of Contents
- [Learning Goals](#learning-goals)
- [Application Setup](#application-setup)
- [API Keys](#api-keys)
- [Endpoints](#endpoints)


## Learning Goals

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Application Setup
<ol>
  <li> Install Ruby 2.7.4 and Rails 5.2.8. </li>
  <li> Fork and clone this repo. </li>
  <li> Within the root directory run <code>bundle install</code>. </li>
  <li> Run <code>rails db:{create,migrate}</code>. </li>
  <li> Run <code>bundle exec figaro install</code> and store API keys (more on that below) in the application.yml file created using Environment variables to protect your API keys. </li>
  <li> Run <code>rails s</code>. </li>
</ol>

Endpoints will now be accessible at <code>http://localhost:3000</code>.

## API Keys

This app makes use of 4 external APIs; API keys can be acquired for free by signing up at the below links:

[Recipe Search API](https://developer.edamam.com/edamam-recipe-api)<br>
[REST Countries API](https://restcountries.com/#api-endpoints-v3-all)<br>
[YouTube Data API](https://developers.google.com/youtube/v3/getting-started)<br>
[Flickr API](https://www.flickr.com/services/api/)<br>

## Endpoints

<details>
  <summary> Get Recipes For A Particular Country </summary><br>
  - GET "/api/v1/recipes?country=Canada"<br>
  - Sample response body:<br>

```
{
    "data": [
        {
            "id": "null",
            "type": "recipe",
            "attributes": {
                "title": "Tamarind Beer",
                "url": "https://food52.com/recipes/13186-tamarind-beer",
                "country": "Canada",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img..."
            }
        },...
    ]
}
```
</details>

<details>
  <summary> Get Learning Resources for a Particular Country </summary><br>
  - GET "/api/v1/learning_resources?country=Canada"<br>
  - Sample response body:<br>

  ```
{
    "data": {
        "id": "null",
        "type": "learning_resource",
        "attributes": {
            "country": "Canada",
            "video": {
                "title": "A Super Quick History of Canada",
                "youtube_video_id": "e_okM7Mig6s"
            },
            "images": [
                {
                    "alt_tag": "WOOD THRUSH",
                    "url": "https://live.staticflickr.com/65535/52631822059_b661659d64_b.jpg"
                },...
            ]
        }
    }
}
```
</details>

<details>
  <summary> User Registration </summary><br>
  - POST "/api/v1/users"<br>
  - Sample request body:<br>

```
{
  "name": "Athena Dao",
  "email": "athenadao@bestgirlever.com"
}
```
<br>
  - Sample response body:<br>

```
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "Athena Dao",
            "email": "athenadao@bestgirlever.com",
            "api_key": "IqHVnRrBJRB-rEvJqDrbjw"
        }
    }
}
```
</details>

<details>
  <summary> Add Favorites </summary><br>
  - POST "/api/v1/favorites"<br>
  - Sample request body:<br>

```
{
    "api_key": "IqHVnRrBJRB-rEvJqDrbjw",
    "country": "poland",
    "recipe_link": "https://www.polishrecipes.com",
    "recipe_title": "Pierogis"
}
```
<br>
  - Sample response body:<br>

```
{
    "success": "Favorite added successfully"
}
```
</details>

<details>
  <summary> Get a User's Favorites </summary><br>
  - GET "/api/v1/favorites?api_key=IqHVnRrBJRB-rEvJqDrbjw"<br>
<br>
  - Sample response body:<br>

```
{
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "recipe_link": "https://www.tastingtable.com",
                "country": "thailand",
                "created_at": "2023-01-16T20:36:31.347Z"
            }
        },...
    ]
}
```
</details>