class BookmarkVisaResultsController < ApplicationController

    def create
        @bookmark_visa_result = BookmarkVisaResult.new(bookmark_visa_result_params)
        @bookmark_visa_result.user = current_user
        BookmarkVisaResult.all.each do |bvr|
            if (bvr.visa_result.origin_country_id == @bookmark_visa_result.visa_result.origin_country_id) && (bvr.visa_result.destination_country_id == @bookmark_visa_result.visa_result.destination_country_id)
                redirect_to visa_result_path(@bookmark_visa_result.visa_result)
                return
            end
        end
        if @bookmark_visa_result.save!
            redirect_to visa_result_path(@bookmark_visa_result.visa_result)
        end
    end

    def destroy
        @bookmark_visa_result = BookmarkVisaResult.find(params[:id])
        @bookmark_visa_result.destroy
        redirect_to user_bookmarks_path
    end

    private

    def bookmark_visa_result_params
        params.require(:bookmark_visa_result).permit(:visa_result_id)
    end
end
