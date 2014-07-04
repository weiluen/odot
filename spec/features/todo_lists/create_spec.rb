require 'spec_helper'

describe "Creating todo lists"  do
  it "redirects to the todo list index page on success" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "This is what I'm going to do today."
    click_button "Create Todo list"

    expect(page).to have_content("My todo list")


end
  
  it "displays an error when the todo list has no title" do

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "This is what I'm going to do today."
    click_button "Create Todo list"

    expect(TodoList.count).to.eq(0)

end

  it "displays an error when the todo list is less than three characters long" do
     visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what I'm going to do today."
    click_button "Create Todo list"

    expect(TodoList.count).to.eq(0)
end