module Webmanager
  class DynamicRouter
    def self.load
      Rails.application.routes.draw do
        Article.all.each do |article|
          puts "Routing #{article.permalink}"
          get "articles/#{article.permalink}", :to => "webmanager/articles#show", defaults: { id: article.id }, format:'json'
        end
      end

    end

    def self.reload
      Rails.application.routes_reloader.reload!
    end
  end
end