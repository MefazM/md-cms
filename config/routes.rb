GameCms::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "admin/dashboard#index"

  post 'error_log_submit' => 'api/devise_errors#create'

  get 'api/players_and_battles' => 'api/game_statistics#players_and_battles', :as => 'players_and_battles'
  post 'api/statistics/report' => 'api/game_statistics#report'
end
