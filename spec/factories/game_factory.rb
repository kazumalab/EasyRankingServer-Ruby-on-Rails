FactoryGirl.define do
  factory :game, class: Game do
    sequence(:name) { |n| "Games-#{n}" }
    description {"This application GameRanking" }
  end
end