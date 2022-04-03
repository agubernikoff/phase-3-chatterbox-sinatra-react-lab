class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all.order(:created_at)
    messages.to_json
  end
  
  post '/messages' do
    newMessage = Message.create(body: params[:body], username: params[:username])
    newMessage.to_json
  end

  patch '/messages/:id' do
    updated = Message.find(params[:id])
    updated[:body] = params[:body]
    updated.to_json
  end

  delete '/messages/:id' do
    deleted= Message.find(params[:id])
    deleted.destroy
    deleted.to_json
  end
  
end
