class BookmarkEmbassiesController < ApplicationController

    def create
        @bookmark_embassy = BookmarkEmbassy.new(bookmark_embassy_params)
        @bookmark_embassy.user = current_user
        @bookmark_embassy.save
        if @bookmark_embassy.save
            redirect_to visa_result_path(@bookmark_embassy.visa_result)
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
        params.require(:bookmark_embassy).permit[:embassy_id]
    end
end
