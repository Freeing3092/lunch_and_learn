require 'rails_helper'

RSpec.describe Recipe do
  describe 'initialize' do
    it 'has readable attributes' do
      recipe_data = {
        recipe: {
          url: "https://www.foodnetwork.com/recipes/food-network-kitchen/cinnamon-stars-zimtsterne-germany-recipe-2009033",
          label: "Cinnamon Stars: Zimtsterne (Germany)",
          image: "https://edamam-product-images.s3.amazonaws.com/web-img/ccb/ccb90d56b6f85ce89709af73350e4f8a.jpeg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDQusz7KChaoKJfN020CTnYCq3HZ0Rqm3zptt0szvoApAIhAPTQ%2Bl8VbFRH9XSAsMlLlhGMYRl1kpWaKZzRwK1rpPnyKtUECPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2Igz%2F%2Fq6DPB95AkGN7cUqqQTdrDEbjufkuWWSVdRDSFuZjBhydBjCFWpO75ozJSl3qTNN0gvgSl1iiI9lvcyp0sdk52m%2BEYdtj%2FxaycGg44dPM2ujbct4hD9r1mUxutsO0o5TkkySEuAy5wyT%2FNnTHYLINL2JIM%2FLBchWaJUFy2YPAp52%2BnEetvE89UqgEul%2BHVKAzvoSrbjG9ZajR%2BSq%2FWhci%2B2rUjuh5tnaBCX1mzp5s74hchL2NNhsthjTuzs418ZPOhdGa4fPXoiEztQ8Q2QhGW5Mx8DpXuLgF%2BSoxdhjgQA1NY4LtXdDaxjxKBy%2FYjdy2SYhv64uaQImNAre15mejiBUO154RsP7ECecWnxdKoa7R06dB74nqgbBjDLtEpRyp3llHX9BTLD7TgNOnQjqDyp%2BH8mAFm6tNntg%2FBsGwUnTthZURYgvjoxFmFcpyi%2BHRyexUyjqGWxDl6p67qdb1tE7PagJ3u3PPwGb%2Fsq1m4NiSNmmgNEDJq3gOZaTP1tVu0hrk4Y20bLzMHl7xrpFwG0Sq0tveJZKUhsBERwu6RqrAAyj1PzfMRexHU5cGbw6Up7p48oln69aZMAeDNQWZwUnWeNj4wv8l8YGJEK5To7xhJ6u9ZuMHlifaZOr4uOinO96mznLEh1lXbZ21ZKeXbRQGBbId6lJLkFTQhnSUBxP4ntz4A8o21xwqebHk%2FW1wbC%2Fmm8u9mN6MkpjsEjbB0j%2F6Wx1O3U7mjMJCzF8%2BDDKKukDXq%2BDMKbii54GOqgBrCd5MXGYbLUua4OZ2biB7vy4BCG36Z1yZSWzMHnRkL4DqZ7KO3bQJ5tM%2B4MgZJ9c%2FUIppwfSBUN8d8YeHC3BqFpCNxjvGqevFbQajgr5nFo8Z0vL0JuZMSa3ZTzEdrsoBUaRGHK6EROhkfATZEEK2Ox3yCg7TLTCn%2BEJHct%2Bm1IFHdy6Z%2F71Wvarn9HCUrCNqlKQZRVv0cJPYfvhX5afr6vqU6SgBnGA&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230114T185259Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFLNFDMQ5O%2F20230114%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=5ee95176069ca3d6957658bfdb88d62c691b30be142cb0e18bede13e63e9da23"
        }
      }
      recipe = Recipe.new(recipe_data, 'Germany')

      expect(recipe.title).to eq(recipe_data[:recipe][:label])
      expect(recipe.url).to eq(recipe_data[:recipe][:url])
      expect(recipe.image).to eq(recipe_data[:recipe][:image])
      expect(recipe.country).to eq('Germany')
    end
  end
end