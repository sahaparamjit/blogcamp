class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new, :edit]
    before_action :only_current_user, only: [:create, :new, :edit]
    
    def index
        @user = User.find(params[:user_id])
        if user_signed_in?
            if @user.id == current_user.id
                @post = @user.post
            else
                @post = @user.post.where(status: "Published")
            end
        else
            @post = @user.post.where(status: "Published")
        end
        if !@post.present? 
            flash[:notice] = "No Posts Available. Create a New Post"
            redirect_to new_user_post_url
        end
        #@posts = Post.includes(:users).where('user_id = ?', params[:user_id]).references(:users);
    end
    #def show
     ##   @post = Post.find(params[:user_id],  :conditions => { :status => 'Published' })
   # end
    def create
        @user = User.find(params[:user_id])
        @post = @user.post.build( post_params )
        if @post.save
            flash[:notice] = "Post Created Successfully!"
            redirect_to user_posts_url(user_id: current_user.id)
        else
            render action :new
        end
    end
    def new 
        @post = Post.new
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            flash[:notice] = "Profile Updated Successfully."
            redirect_to user_post_url(user_id: current_user.id, id: params[:id])
        else
            redirect_to action :edit
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.delete
            flash[:notice] = "Post Successfully Deleted."
            redirect_to user_posts_url(params[:user_id])
        else
            render :show
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def show
        @post = Post.find(params[:id])
        if @post.status != "Published"
            if user_signed_in?
                if current_user.id == params[:user_id].to_i
                    @postall = Post.where("user_id = ? AND id != ?",params[:user_id],params[:id])
                else
                    redirect_to root_url
                end
            else
                redirect_to root_url
            end
        else
            @postall = Post.where("user_id = ? AND id != ?",params[:user_id],params[:id])
        end
    end
    
     private 
        def post_params
            params.require(:post).permit(:title, :content, :tags, :status)
        end
        def only_current_user
            @user_id = User.find(params[:user_id]).id
            unless @user_id == current_user.id
            redirect_to root_path 
            end
        end
end