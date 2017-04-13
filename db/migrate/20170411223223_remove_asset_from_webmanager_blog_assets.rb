class RemoveAssetFromWebmanagerBlogAssets < ActiveRecord::Migration[5.0]
  def change
    remove_column :webmanager_blog_assets, :asset
  end
end
