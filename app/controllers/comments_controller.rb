class CommentsController < ApplicationController
  before_filter :get_parent

  def create
    @comment = @parent.comments.create(comment_params)
    respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.js
    end
  
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end

    def get_parent
      @parent = Article.find(params[:article_id]) if params[:article_id]
      @parent = Comment.find(params[:comment_id]) if params[:comment_id]
      @article = @parent.is_a?(Article) ? @parent : @parent.article

      redirect_to root_path unless defined?(@parent)
    end
end
