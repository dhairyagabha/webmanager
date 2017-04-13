module Webmanager
  class Asset < ApplicationRecord
    belongs_to :blog_asset
    belongs_to :article
  end
end
