require "sinatra"
require "mysql2"
require "json"

set :bind, "0.0.0.0"
set :port, "8080"

get '/' do
  content_type :json
  # res = get_json
  res = {
    hello: "world!"
  }.to_json
end

def db_client
  client = Mysql2::Client.new(host: "db",
                              username: "todoapp",
                              password: "password",
                              database: "todo_db",
                              port: "3306",
                              encoding: "utf8")
end

def get_json
  client = db_client
  # client.query("SELECT * FROM todo").to_a.to_json
end