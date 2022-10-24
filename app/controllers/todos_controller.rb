class TodosController < ApplicationController
  before_action :authenticate

  def index
    # @todos = Todo.where(email: current_email)
    @todos = current_user.todos
  end 

  def new 
    @todo = Todo.new
  end

  def create
    # redirect_to todos_path
    Todo.create(set_todo_params.merge(email: current_user.signed_in?)) 
    current_user.todos.create(set_todo_params)
    # @todo = Todo.new(set_todo_params)
    # if @todo.save
      redirect_to todos_path
    # else
    #   render :new
    # end
  end

  private
  def set_todo_params
    params.require(:todo).permit(:title)
  end

end