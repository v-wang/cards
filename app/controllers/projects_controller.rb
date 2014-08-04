class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: :show
  def index
  	@projects = current_user.projects
  end

  def new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      respond_to do |format|
        format.html { redirect_to project_path(@project), notice: "Project updated" }
        format.json { respond_with_bip(@project) }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { respond_with_bip(@project) } 
      end
    end
  end

  def show
  	@project = Project.find(params[:id])
  	@cards = @project.cards
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: "Project deleted!"}
      format.js {head :no_content}
    end
  end

  private
  def project_params
    params.require(:project).permit(:user_id, :title)
  end
end
