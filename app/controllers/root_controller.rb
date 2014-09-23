class RootController < ApplicationController
  before_action :must_be_logged_in
  def home
  end
end
