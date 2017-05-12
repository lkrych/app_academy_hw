json.extract! @poke, :id, :name, :attack, :defense, :moves, :poke_type, :items

json.image_url asset_path(@poke.image_url)
