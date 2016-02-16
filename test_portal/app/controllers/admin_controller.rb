class AdminController < ApplicationController
  def index

  end

  def show_profiles
    @users = User.all
  end

 end
