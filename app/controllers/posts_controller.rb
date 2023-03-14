class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    
    def index
        @post = Post.new
        #show posts on root/index page
        @posts = Post.all.order(created_at: :desc)
    end

    def create
        @post = current_user.posts.build(post_params)
        #below is for turbo. I had to add the format.html line in the .save line to get this to work
        #checking if turbo is bug after solving devise username addition
        respond_to do |format|
            if @post.save
                format.turbo_stream 
                format.html { redirect_to root_path } 
            else
                format.html do
                    flash[:post_errors] = @post.errors.full_messages
                    redirect_to root_path
                end
            end
        end
    end

    def edit

    end

    def update

    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy

        redirect_to root_path
        
    end

    private
        def post_params
            params.require(:post).permit(:body)
        end

       
end


