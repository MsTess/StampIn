class BookmarkEmbassiesController < ApplicationController

    def create
        p bookmark_embassy_params
        p bookmark_embassy_params
        @bookmark_embassy = BookmarkEmbassy.new(bookmark_embassy_params)
        p @bookmark_embassy
        @bookmark_embassy.user = current_user
        if @bookmark_embassy.save!
            redirect_to embassy_path(@bookmark_embassy.embassy)
        else
        end
    end

    def destroy
        @bookmark_embassy = BookmarkEmbassy.find(params[:id])
        @bookmark_embassy.destroy
        redirect_to user_bookmarks_path
    end

    private

    def bookmark_embassy_params
        params.require(:bookmark_embassy).permit(:embassy_id)
    end
end
