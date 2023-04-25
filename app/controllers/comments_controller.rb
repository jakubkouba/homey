# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    @comment = Comment.new(text:, project:)

    respond_to do |format|
      flash[:comment_errors] = @comment.errors unless @comment.save
      format.html { redirect_to project_url(project) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :project_id)
  end

  def project_id
    comment_params[:project_id]
  end

  def text
    comment_params[:text]
  end

  def project
    @project ||= Project.find(project_id)
  end
end
