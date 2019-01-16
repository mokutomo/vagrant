class BlogsController < ApplicationController
  def show
  	@blog = Blog.find(params[:id])
  end

  def index
  end

  def new
  	@blog = Blog.new
  	@blogs = Blog.all
  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def create
         @blog = Blog.new(blog_params)
        if @blog.save
         flash[:notice] = "Book was successfully created."
        redirect_to blog_path(@blog.id)
    	else
    		render :new
    	end
  end

  def update
  	blog = Blog.find(params[:id])
        if blog.update(blog_params)
          flash[:notice] = "Book was successfully updated."
        redirect_to blog_path(blog.id)
        else
        render :new
      end
  end

  def destroy
  	blog = Blog.find(params[:id])
        if blog.destroy
          flash[:notice] = "Book was successfully destroyed."
        redirect_to new_blog_path
        else
        render :new
      end
  end

  private
    def blog_params
        params.require(:blog).permit(:title, :body)
    end
end
