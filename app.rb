require("bundler")
require 'sinatra'
Bundler.require
configure do
  enable :sessions
  set :session_secret, "secret"
end

#set the default orientation, so stuff like: <link rel="stylesheet" href="/public/app.css"> works
set :public_folder, File.dirname(__FILE__)

#connection to google sheets
def worksheet
    @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
    @spreadsheet ||= @session.spreadsheet_by_title("Mentormonth")
    @worksheet ||= @spreadsheet.worksheets.first
end

get "/" do
    erb :index
end

get '/form1' do
  erb :form1
end

post "/output1" do
    session[:name] = params["name"]
    session[:email] = params["email"]
    erb :form2
end

post "/output2" do
    session[:check] = params["check"]
    session[:assesement_month] = params["assesement_month"]
    erb :form3
end

post "/output_final" do
    new_row = [session[:name], session[:email], session[:check], session[:assesement_month], params["phone_number"], params["age"], params["degree"]]
    worksheet.insert_rows(worksheet.num_rows+1, [new_row])
    worksheet.save
    erb :thanks
end
