module Webmanager
  class BlogAsset < ApplicationRecord
    has_many :assets, dependent: :destroy
    has_many :articles, through: :assets
    has_attached_file :asset, styles: Webmanager.image_styles
    validates_attachment_content_type :asset,
                                      :content_type => %w(image/jpeg image/jpg image/png image/gif application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document),
                                      :message => 'only (png/gif/jpeg) images'

    before_post_process :skip_for_files
    before_save :extract_dimensions
    serialize :dimensions

    def skip_for_files
      ! %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document).include?(asset_content_type)
    end
    def image?
      asset_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
    end

    private
    def extract_dimensions
      return unless image?
      tempfile = asset.queued_for_write[:original]
      unless tempfile.nil?
        geometry = Paperclip::Geometry.from_file(tempfile)
        self.dimensions = [geometry.width.to_i, geometry.height.to_i]
      end
    end
  end
end
