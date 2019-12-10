class TttagsController < ApplicationController
  def show
    @tttag = Tttag.find_by(name: params[:id])
    @projects = @tttag.projects
  end
end
