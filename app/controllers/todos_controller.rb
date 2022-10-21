class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end 

  def new 
    @todo = Todo.new
  end

  def create
    # redirect_to todos_path
    
    @todo = Todo.new(set_todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  private
  def set_todo_params
    params.require(:todo).permit(:title)
  end

end