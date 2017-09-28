class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def secret
    render :secret
  end

end
