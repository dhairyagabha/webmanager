class RenameColumnAssetIdInWebmanagerAssets < ActiveRecord::Migration[5.0]
  def change
    rename_column :webmanager_assets, :asset_id, :blog_asset_id
  end
end
