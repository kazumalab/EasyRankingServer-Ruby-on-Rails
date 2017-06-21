json.extract! game, :id, :name, :description, :activate_digest, :activated, :activated_at, :created_at, :updated_at
json.url game_url(game, format: :json)
