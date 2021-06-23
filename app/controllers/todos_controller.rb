# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n\n")
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render "todo"
    # render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    valid_input = todo_text.present? && due_date.present?
    user = valid_input ? Todo.create(todo_text: todo_text,
                                     due_date: due_date,
                                     completed: false) : nil
    redirect_to todos_path
  end

  def update
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = true
    todo.save
    render plain: "Updated todo completed status #{todo.completed}"
  end
end
