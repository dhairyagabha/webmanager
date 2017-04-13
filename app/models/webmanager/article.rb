module Webmanager
  class Article < ApplicationRecord

    validates_presence_of :title, :author_id, :permalink, :body
    belongs_to :user, :foreign_key => 'author_id'
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    has_many :assets, dependent: :destroy
    has_many :blog_assets, through: :assets


    def self.tagged_with(name)
      Tag.find_by_name!(name).articles
    end

    def tag_list
      tags.map { |t| t.name }
    end

    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end

    def asset_list
      blog_assets.map{ |t| t.id}.join(',')
    end

    def asset_list=(ids)
      self.blog_assets= ids.split(",").map do |n|
        BlogAsset.where(id:n).first!
      end
    end

  end
end
