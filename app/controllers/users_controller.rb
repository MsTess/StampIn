class UsersController < ApplicationController
    def faq
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
    end

    def bookmarks
        @bookmark_visa_results = current_user.bookmark_visa_results
        @bookmark_embassies = current_user.bookmark_embassies
    end
end
