class PostsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response

  def show
    post = Post.find(params[:id])
    
    render json: post, status: :ok
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post, status: :ok
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def render_unprocessable_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

end
