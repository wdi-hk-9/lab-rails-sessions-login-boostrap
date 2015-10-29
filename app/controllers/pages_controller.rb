class PagesController < ApplicationController
  before_action :authenticate, only: :logged_in
  before_action :authenticate, only: :user_only

  def everyone
    render text: "Everyone!!!"
  end

  def logged_in
    render text: "Logged in only!!!"
  end

  def user_only
    render text: "User only!!!"
  end
end
