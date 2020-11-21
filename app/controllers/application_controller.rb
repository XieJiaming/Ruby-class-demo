class ApplicationController < ActionController::Base
    rescue_from(ActiveRecord::RecordNotFound, {with: :record_not_found})

    private
    def record_not_found
        # redirect_to root_path, notice: "GO"
        render file: 'public/404.html', 
               layout: false, 
               status: :not_found
        # render file: 'public/404.html', 
        #        layout: false, 
        #        status: :404

    end 
end
