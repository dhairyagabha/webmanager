require_dependency "webmanager/application_controller"

module Webmanager
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = current_user.articles.new

    end

    def create
      @article = current_user.articles.new(article_params)
      @article.permalink = @article.title.downcase.gsub(' ','-')
      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created!' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: article.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      article = Article.find(params[:id])
      article.permalink = params["article"]["title"].downcase.gsub(' ','-')
      respond_to do |format|
        if article.update(article_params)
          format.html { redirect_to article, notice: 'Article was successfully updated!' }
          format.json { render :show, status: :created, location: article }
        else
          format.html { render :edit }
          format.json { render json: article.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    private
    def article_params
      params.require(:article).permit(:id, :title, :description, :body, :permalink, :author_id, :tag_list)
    end
  end
end
