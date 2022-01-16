class TodosController < ApplicationController

skip_before_action :login_required


  def index
      @todo = Todo.new
      @todos = Todo.where(params[:id])
      todos = @todos
      #@mytodos = current_user.todos.order(date: "ASC")
  end


  def create
      @todo = Todo.new(todo_params)
     if @todo.save
      redirect_to todos_path
     else
      @todos = Todo.where(params[:id])
      todos = @todos
     #@mytodos = current_user.todos.order(date: "ASC")
      render :index
     end
  end

   private

    def todo_params
      params.require(:todo).permit(:date, :contents, :memo)
    end

end
