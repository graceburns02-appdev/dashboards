Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/forex", { :controller => "currencies", :action => "first_currency" })
  get("/forex/:code", { :controller => "currencies", :action => "second_currency" })
  get("/forex/:code/:code_two", { :controller => "currencies", :action => "convert_currency" })
end
