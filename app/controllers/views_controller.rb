class ViewsController < ApplicationController
  before_action :set_link, only: [:show]

  def show
    redirect_to @link.url, allow_other_host: true
  end
end