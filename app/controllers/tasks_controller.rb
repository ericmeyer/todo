class TasksController < ApplicationController

  def index
    render :json => Task.all.to_json(:only => [:id, :description, :complete])
  end

  def create
    task = Task.create(:description => params["description"])
    render :json => task.to_json(:only => [:id, :description, :complete])
  end

  def update
    task = Task.find(params["id"])
    logger.info "****************" + params["due_date"].class.name
    task.update_attributes("description" => params["description"], "complete" => params["complete"], :due_date => params["due_date"].strftime("%F"))

    render :json => task.to_json(:only => [:id, :description, :complete])
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render :nothing => true
  end
end
