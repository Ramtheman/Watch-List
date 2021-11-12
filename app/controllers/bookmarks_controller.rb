class BookmarksController < ApplicationController
  def new
    # we need an @list in our "simple_form_for"
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # we need a list id to associate bookmark with the proper list
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.valid?
     @bookmark.save
     redirect_to list_path(@list)
    else
      render :new
    end
  end

  # we need a delete controller and to be able to pick a bookmark from the main page
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to request.referrer
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
