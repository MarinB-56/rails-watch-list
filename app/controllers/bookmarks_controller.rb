class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @movie = Movie.find(params[:bookmark][:movie_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    endkitt.lewagon.com
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # raise
    @bookmark = Bookmark.find_by(movie_id: params[:id])
    @bookmark.destroy

    @list = List.find(params[:list])
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
