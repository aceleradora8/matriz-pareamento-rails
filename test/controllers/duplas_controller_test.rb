require 'test_helper'

class DuplasControllerTest < ActionController::TestCase
  setup do
    @dupla = duplas(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dupla" do
    assert_difference('Dupla.count') do
      post :create, dupla: { aluno1_id: @dupla.aluno1_id, aluno2_id: @dupla.aluno2_id, num_pareamento: @dupla.num_pareamento }
    end

    assert_redirected_to dupla_path(assigns(:dupla))
  end


  test "should get edit" do
    get :edit, id: @dupla
    assert_response :success
  end

  test "should update dupla" do
    patch :update, id: @dupla, dupla: { aluno1_id: @dupla.aluno1_id, aluno2_id: @dupla.aluno2_id, num_pareamento: @dupla.num_pareamento }
    assert_redirected_to dupla_path(assigns(:dupla))
  end

  test "should destroy dupla" do
    assert_difference('Dupla.count', -1) do
      delete :destroy, id: @dupla
    end

    assert_redirected_to duplas_path
  end
end
