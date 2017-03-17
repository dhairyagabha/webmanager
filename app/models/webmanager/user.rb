module Webmanager
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable

    has_many :notes, :class_name => 'Webmanager::Note', :foreign_key => 'author_id'
    has_many :articles, :foreign_key => 'author_id'



    def name
      first_name + ' ' + last_name
    end

  end
end
