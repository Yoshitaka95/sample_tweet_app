class PostsController < ApplicationController
  
  def home
  end
  
  
  def index
    @posts = Post.all.order(id: "DESC")
    @posts = Post.page(params[:page]).per(7).order('created_at DESC')
    
  end
  
  
  def new
  end
  
  
  def create
    @post = Post.new(content: params[:content])
    
    if  @post.save
      flash[:success]="投稿しました"
      redirect_to("/index")
      
    else
      flash[:danger]="投稿内容が記入されていません"
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
      flash[:success]="編集しました"
      redirect_to("/index")
    else
      flash[:danger]="編集内容が記入されていません"
      render :action => "edit_form"
    end
    
  end
  
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success]="削除しました"
    redirect_to ("/index")
    
  end
  
end
