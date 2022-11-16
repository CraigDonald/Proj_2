require "todo_list"
require "todo"
RSpec.describe "To Do List Integration" do
    it "adds tasks and lists them out" do
      todolist = TodoList.new
      todo1 = Todo.new("wash dishes")
      todo2 = Todo.new("walk the dog")
      todolist.add(todo1)
      todolist.add(todo2)
      expect(todolist.all).to eq [todo1, todo2]
    end
    it "shows completed task in completed task list" do
      todolist = TodoList.new
      todo1 = Todo.new("wash dishes")
      todo2 = Todo.new("walk the dog")
      todolist.add(todo1)
      todolist.add(todo2)
      todo2.mark_complete
      expect(todolist.complete).to eq [todo2]
    end
  end