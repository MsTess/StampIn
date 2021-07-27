class BookmarkEmbassiesController < ApplicationController

    def create
        @bookmark_embassy = BookmarkEmbassy.new(bookmark_embassy_params)
        @bookmark_embassy.user = current_user
        BookmarkEmbassy.all.each do |be|
            if (be.embassy_id == @bookmark_embassy.embassy_id)
                redirect_to embassy_path(@bookmark_embassy.embassy)
                return
            end
        end
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