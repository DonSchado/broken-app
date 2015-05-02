class WelcomeController < ApplicationController
  skip_before_filter :require_login, only: :home

  def index
    @posst = Post.includes(:user)
  rescue
    # this should not happen...
    nil
  end
end
