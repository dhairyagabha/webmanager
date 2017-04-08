module Webmanager
  class Article < ApplicationRecord

    validates_presence_of :title, :author_id, :permalink, :body
    belongs_to :user, :foreign_key => 'author_id'
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings


    def self.tagged_with(name)
      Tag.find_by_name!(name).articles
    end

    # def tag_ids=(ids)
    #   self.tags = ids.split(",").map do |n|
    #     Tag.where(id: n).first_or_create!
    #   end
    # end
    #
    # def tag_ids
    #   tags.map(&:id).join(", ")
    # end

    def tag_list
      tags.map { |t| t.name }
    end

    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end
  end
end
