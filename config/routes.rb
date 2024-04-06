Rails.application.routes.draw do
  get "/generate_qr", to: "qr_codes#generate_qr", as: :generate_qr
  post "/generate_qr", to: "qr_codes#generate_qr"
  get "/download/:data", to: "qr_codes#download", as: :download
end
