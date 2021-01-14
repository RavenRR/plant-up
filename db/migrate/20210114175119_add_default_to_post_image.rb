class AddDefaultToPostImage < ActiveRecord::Migration
  def change
    change_column_default  :posts, :image, 'https://imgur.com/g5h1guS'
  end
end
