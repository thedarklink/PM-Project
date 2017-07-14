require 'test_helper'

class BacklogitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backlogitem = backlogitems(:one)
  end

  test "should get index" do
    get backlogitems_url
    assert_response :success
  end

  test "should get new" do
    get new_backlogitem_url
    assert_response :success
  end

  test "should create backlogitem" do
    assert_difference('Backlogitem.count') do
      post backlogitems_url, params: { backlogitem: { assignedto: @backlogitem.assignedto, author: @backlogitem.author, author: @backlogitem.author, creationdate: @backlogitem.creationdate, creationdate: @backlogitem.creationdate, description: @backlogitem.description, effort: @backlogitem.effort, priorty: @backlogitem.priorty, state: @backlogitem.state, title: @backlogitem.title } }
    end

    assert_redirected_to backlogitem_url(Backlogitem.last)
  end

  test "should show backlogitem" do
    get backlogitem_url(@backlogitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_backlogitem_url(@backlogitem)
    assert_response :success
  end

  test "should update backlogitem" do
    patch backlogitem_url(@backlogitem), params: { backlogitem: { assignedto: @backlogitem.assignedto, author: @backlogitem.author, author: @backlogitem.author, creationdate: @backlogitem.creationdate, creationdate: @backlogitem.creationdate, description: @backlogitem.description, effort: @backlogitem.effort, priorty: @backlogitem.priorty, state: @backlogitem.state, title: @backlogitem.title } }
    assert_redirected_to backlogitem_url(@backlogitem)
  end

  test "should destroy backlogitem" do
    assert_difference('Backlogitem.count', -1) do
      delete backlogitem_url(@backlogitem)
    end

    assert_redirected_to backlogitems_url
  end
end
