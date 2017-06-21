class AddImageUrlTouser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image_url, :string, default: "http://res.cloudinary.com/huqpyowyr/image/upload/v1497973091/149071_vv2put.png"
  end
end
