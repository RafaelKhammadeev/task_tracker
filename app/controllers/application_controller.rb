class ApplicationController < ActionController::Base
  include Authentication
  include SessionsHelper
  include Authorization
end
