require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { a_card_1: @game.a_card_1, a_card_2: @game.a_card_2, b_card_1: @game.b_card_1, b_card_2: @game.b_card_2, card_1: @game.card_1, card_2: @game.card_2, card_3: @game.card_3, card_4: @game.card_4, card_5: @game.card_5, player_a: @game.player_a, player_b: @game.player_b }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { a_card_1: @game.a_card_1, a_card_2: @game.a_card_2, b_card_1: @game.b_card_1, b_card_2: @game.b_card_2, card_1: @game.card_1, card_2: @game.card_2, card_3: @game.card_3, card_4: @game.card_4, card_5: @game.card_5, player_a: @game.player_a, player_b: @game.player_b }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
