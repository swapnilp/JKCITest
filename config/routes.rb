Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :student_exams
                                  
  resources :exams, only: [] do
    resources :register, only: [:new, :create]
  end
  
  resources :question, only: [:show]
  patch 'update_answer/:id', :to => 'question#update_answer', as: 'update_answer'
  get 'finish_exam', :to => 'question#finish_exam', as: 'finish_exam'
  root to: 'home#index'
end
