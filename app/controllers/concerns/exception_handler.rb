module ExceptionHandler
  extend ActiveSupport::Concern
  class UnAuthorized < StandardError;
  end

  included do
    rescue_from UnAuthorized do
      flash[:error] = 'Sorry, you are not authorized to to perform such actions!'
      redirect_back fallback_location: root_path
    end
  end
end
