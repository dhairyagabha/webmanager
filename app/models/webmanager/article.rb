module Webmanager
  class Article < ApplicationRecord

    validates_presence_of :title, :author_id, :permalink, :body
    belongs_to :user, :foreign_key => 'author_id'
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings


    def self.tagged_with(name)
      Tag.find_by_name!(name).articles
    end

    def tag_list
      tags.map(&:name).join(", ")
    end

    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end


    def self.load
      Webmanager::Engine.routes.draw do
        Article.all.each do |article|
          puts "Routing #{article.permalink}"
          get "articles/#{article.permalink}", :to => "articles#show", defaults: { id: article.id }
        end
      end
    end

    def self.reload
      Webmanager::Engine.routes_reloader.reload!
    end

  end
end
