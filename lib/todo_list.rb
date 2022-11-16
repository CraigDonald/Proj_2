class TodoList
  def initialize
      @todolist = []
  end
  def add(todo)
      @todolist << todo
      # todo is an instance of Todo
    # Returns nothing
  end
  def all
    return @todolist.reject(&:complete?)
    # Marks all todos as complete
  end
  def complete
    return @todolist.select(&:complete?)
  end
end
  # def incomplete
  #   return @todo_list
  #   # Returns all non-done todos
  # end
  # def complete
  #   return @mark_done
  #    # Returns all complete todos
  # end




