require "sinatra"
require "sinatra/cross_origin"
require "mysql2"
require "json"

class Main < Sinatra::Application
  configure do
    set :bind, "0.0.0.0"
    set :port, "8080"
    enable :cross_origin
    disable :static
  end

  helpers do
    def db_client
      client = Mysql2::Client.new(host: "db",
                                  username: "todoapp",
                                  password: "password",
                                  database: "tododb",
                                  port: "3306",
                                  encoding: "utf8")
    end
    
    def db_query(q)
      client = db_client
      client.query(q).to_a.to_json
    end
  end

  get '/api/?' do
    content_type :json
    res = {
      Hello: "sinatra!!!"
    }.to_json
  end
  
  # todo全取得
  get '/api/todo/?' do
    content_type :json
    res = db_query("SELECT * FROM `todos`")
  end
  
  # todo取得(id指定)
  get '/api/todo/:id/?' do
    content_type :json
    id = params['id']
    res = db_query("SELECT * FROM `todos` WHERE `id` = #{id}")
  end
  
  # todo作成
  post '/api/todo/?' do
    title = params['title']
    content = params['content']
    db_query("INSERT INTO `todos` (`title`, `content`) VALUES ('#{title}', '#{content}')")
    redirect to('/todo')
  end

  # todo更新
  put '/api/todo/:id/?' do
    id = params['id']
    title = params['title']
    content = params['content']
    db_query("UPDATE `todos` SET `title` = '#{title}', `content` = '#{content}' WHERE `id` = #{id}")
    redirect to('/todo')
  end

  # todo削除
  delete '/api/todo/:id/?' do
    id = params['id']
    db_query("DELETE FROM `todos` WHERE `id` = #{id}")
    redirect to('/todo')
  end

  not_found do
    "not found"
    # redirect to('/')
  end

  run! if app_file == $0
end
