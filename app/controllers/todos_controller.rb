class TodosController < ApplicationController
  def index
    @todo = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
    flash[:notice] = 'Your todo was created'
    redirect_to todo_path
  else
    flash[:notice] = 'Oops something went wrong!'
    render 'new'
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      flash[:notice] = 'Your todo was updated'
      redirect_to todo_path
    else
      flash[:notice] = 'Oops something went wrong!'
      render 'edit'
    end
  end

  private

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    redirect_to todos_path
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
