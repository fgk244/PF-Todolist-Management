class TodosController < ApplicationController

#skip_before_action :login_required

  def index
      @todo = Todo.new
      @todos = Todo.where(params[:id])
      todos = @todos
      @mytodos = current_user.todos.order(date: "ASC")
  end

  def create
      @todo = current_user.todos.new(todo_params)
       #binding.pry
     if @todo.save
      redirect_to todos_path
     else
      @todos = Todo.where(params[:id])
      todos = @todos
      @mytodos = current_user.todos.order(date: "ASC")
      render :index
     end
  end

  def edit
   @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to request.referer
  end



   private

    def todo_params
      params.require(:todo).permit(:date, :contents, :memo)
    end

end
