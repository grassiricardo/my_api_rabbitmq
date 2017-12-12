class PostsController < ApplicationController

  def publish
    msg = 'teste01'
    render json: { success: true, messagem: msg }, status: 200 if BannyService.new('grassi', msg).publish
  end
end
