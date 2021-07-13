class BookmarkVisaResultsController < ApplicationController
    def bookmark_visa_results
        @bookmark_visa_results = current_user.bookmark_visa_results
    end

    def create
        @bookmark_visa_result = BookmarkVisaResult.new(bookmark_visa_result_params)
        @bookmark_visa_result.user = current_user
        #@bookmark_visa_result.visa_result = @visa_result

        if @bookmark_visa_result.save
            
        else

        end
    end

    def destroy
        @bookmark_visa_result = BookmarkVisaResult.find(params[:id])
        @bookmark_visa_result.destroy
        redirect_to user_bookmarks_path
    end

    private

    def bookmark_visa_result_params
        params.require(:bookmark_visa_result)
    end
end
