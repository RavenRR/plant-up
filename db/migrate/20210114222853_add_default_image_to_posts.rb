class AddDefaultImageToPosts < ActiveRecord::Migration
  def change
    
    change_column_default  :posts, :image, 'https://cdn.pixabay.com/photo/2016/01/30/14/12/flowers-1169667__340.png'

  end
end
