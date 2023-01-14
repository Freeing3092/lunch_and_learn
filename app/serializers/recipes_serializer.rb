class RecipesSerializer
  include JSONAPI::Serializer

  set_type :recipe
  set_id {'null'}
  attributes :title, :url, :country, :image
end
