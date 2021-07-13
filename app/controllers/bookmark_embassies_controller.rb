class BookmarkEmbassiesController < ApplicationController
    def bookmark_embassies
        @bookmark_embassies = current_user.bookmark_embassies
    end

    def create
        @bookmark_embassy = BookmarkEmbassy.new(bookmark_embassy_params)
        @bookmark_embassy.user = current_user
        @bookmark_embassy.embassy = Embassy.find(params[:embassy_id])

        if @bookmark_embassy.save
            
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
        params.require(:bookmark_embassy)
    end
end
