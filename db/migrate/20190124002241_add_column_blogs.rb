class AddColumnBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :image1, :text
    add_column :blogs, :image2, :text
    add_column :blogs, :image3, :text
  end
end
