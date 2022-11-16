class Todo
  def initialize(task)
      @task = task
      @complete = false
      # task is a string
    # ...
  end
  def task
      return @task
    # Returns the task as a string
  end
  def mark_complete
    @complete = true
      # @mark_done << @task
    # Marks the todo as done
    # Returns nothing
  end
  def complete?
    return @complete
  end
end