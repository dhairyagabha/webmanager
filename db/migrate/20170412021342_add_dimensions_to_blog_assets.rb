class AddDimensionsToBlogAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :webmanager_blog_assets, :dimensions, :string
  end
end
