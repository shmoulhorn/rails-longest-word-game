# Rails.application.routes.draw do
#   get 'longest_word/game'

#   get 'longest_word/score'

#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
  get 'game', to: 'longest_word#game'
  get 'score', to: 'longest_word#score'
  # root to: 'coaching#home'
end
