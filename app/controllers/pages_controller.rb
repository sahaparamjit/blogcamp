class PagesController < ApplicationController
    def home 
        @post = Post.includes(:user).where(status: "Published")
        #@post = Post.where(status: "Published")
    end
    def about 
    end
    def search 
         @search_r = Post.all
        if params[:search]
            @search_r = Post.search(params[:search]).where(status: "Published").order("created_at DESC")
        else
            @search_r = Post.all.order("created_at DESC")
        end
    end
end