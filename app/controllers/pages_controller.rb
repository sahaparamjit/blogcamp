class PagesController < ApplicationController
    def home 
        @post = Post.includes(:user).where(status: "Published")
        #@post = Post.where(status: "Published")
    end
    def about 
    end
end