class AddDefaultImageToPosts < ActiveRecord::Migration
  def change
    
    change_column_default  :posts, :image, 'https://i.pinimg.com/originals/55/5d/d3/555dd36cc3fb4f7f6d1efe417ed9aa43.png'

  end
end
