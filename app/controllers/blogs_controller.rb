class BlogsController < ApplicationController

	before_action :set_blog, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index]
	def index
    @blogs = Blog.all
  end

  def show
    rate = Rating.where(rater_id: current_user.id, blog_id: @blog.id)
    @rate_score = rate.present? ? rate.last.score.to_f : 0
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.author= current_user.name
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rating
    blog = Blog.find(params[:id])
    rating = Rating.where(rater_id: current_user.id, blog_id: blog.id).last
    if rating.present?
      rating.update_attributes(score: params[:score])
    else
      rating = Rating.new(rater: current_user, score: params[:score], blog_id: blog.id)
      rating.save
    end
    render text: true
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(
        :title, :description 
      )
    end

end
