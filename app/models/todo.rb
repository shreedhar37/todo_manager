class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  belongs_to :user

  def due_today?
    due_date == Date.today
  end

  def self.completed
    all.where(completed: true)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end
  def self.overdue
    #Notice that self.overdue is a class method because of the self. prefix.
    #Those methods are not available in individual objects of the class, but on the entire class itself.
    where("due_date < ? and (not completed)", Date.today).order(:due_date)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.show_list
    puts "\nMy Todo-List\n\nOverdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\nDue Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\nDue Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
  end

  def self.mark_as_complete(id)
    to_mark = Todo.find(id)  # To fetch the id of the given task from database.
    to_mark.completed = true
    to_mark.save # To commit the changes in the database.
    to_mark
  end
end
