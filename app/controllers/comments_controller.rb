class CommentsController < ApplicationController
    def create
    @comment = Comment.create(create_params)
redirect_to controller: 'topics', action: 'index'
end

def new
  @comment=Comment.new
end
  private
     def create_params

      params.require(:comment).permit(:name, :text,:topic_id)
  end
end
