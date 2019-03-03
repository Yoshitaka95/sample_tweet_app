class PostsController < ApplicationController
  
  def home
  end
  
  
  def index
    @posts = Post.all.order(id: "DESC")
    
  end
  
  
  def new
  end
  
  
  def create
    @post = Post.new(content: params[:content])
    
    if  @post.save
      redirect_to("/index")
    else
      render :action => "new"
    end
    
  end
  
  
  def edit_form
    @post = Post.find_by(id: params[:id])
  end
  
  
  def edit
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    
    if @post.save
      redirect_to("/index")
    else
      render("/edit_form")
    end
    
  end
  
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    
  end
  
end
