require "sinatra"
require "mysql2"
require "json"

set :bind, "0.0.0.0"
set :port, "8080"

get '/' do
  content_type :json
  res = get_json
end

def db_client
  client = Mysql2::Client.new(host: "db",
                              username: "todoapp",
                              password: "password",
                              database: "tododb",
                              port: "3306",
                              encoding: "utf8")
end

def get_json
  client = db_client
  client.query("SELECT * FROM todos").to_a.to_json
end