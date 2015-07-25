json.array!(@games) do |game|
  json.extract! game, :id, :player_a, :player_b, :a_card_1, :a_card_2, :b_card_1, :b_card_2, :card_1, :card_2, :card_3, :card_4, :card_5
  json.url game_url(game, format: :json)
end
