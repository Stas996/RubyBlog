class CommentsController < ApplicationController
  before_filter :get_parent
  before_filter :get_article
  before_filter :get_comment, only: [:edit, :update, :destroy]

  include AjaxHelper

  def index
    redirect_to_ajax("comments/index.js.erb")
  end

  def edit
    redirect_to_ajax("comments/edit.js.erb")
  end

  def create
    @parent.comments.create(comment_params)
    redirect_to_ajax("comments/index.js.erb")
  end

  def update
    @comment.update(comment_params)
    redirect_to_ajax("comments/index.js.erb")
  end
 
  def destroy
    @comment.destroy
    redirect_to_ajax("comments/index.js.erb")
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end

    def get_parent
      @parent = Article.find(params[:article_id]) if params[:article_id]
      @parent = Comment.find(params[:comment_id]) if params[:comment_id]

      redirect_to root_path unless defined?(@parent)
    end

    def get_article
      @article = @parent.is_a?(Article) ? @parent : @parent.article
    end

    def get_comment
      @comment = Comment.find(params[:id])
    end
end
