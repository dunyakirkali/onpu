# Users
module Users
  # ApplicationController
  class ApplicationController < ApplicationController
    after_action :verify_authorized
  end
end
