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
    # res = db_query("SELECT * FROM todos")
    res = db_query("SELECT todos.id, todos.title, todos.content, todos.category_id, categories.title AS category_title FROM todos inner join categories on todos.category_id = categories.id ORDER BY todos.id")
  end
  
  # todo取得(id指定)
  get '/api/todo/:id/?' do
    content_type :json
    id = params['id']
    # res = db_query("SELECT * FROM todos WHERE id = #{id}")
    # idで絞込んだtodos_subテーブルとcategoriesテーブルを内部結合
    res = db_query("SELECT todos_sub.id, todos_sub.title, todos_sub.content, todos_sub.category_id, categories.title AS category_title FROM (SELECT * FROM todos WHERE todos.id = #{id}) AS todos_sub inner join categories on todos_sub.category_id = categories.id ORDER BY todos_sub.id")
  end
  
  # todo作成
  post '/api/todo/?' do
    title = params['title']
    content = params['content']
    category_id = params['category_id']
    db_query("INSERT INTO todos (title, content, category_id) VALUES ('#{title}', '#{content}', #{category_id})")
  end

  # todo更新
  put '/api/todo/:id/?' do
    id = params['id']
    title = params['title']
    content = params['content']
    category_id = params['category_id']
    db_query("UPDATE todos SET title = '#{title}', content = '#{content}', category_id = #{category_id} WHERE id = #{id}")
  end

  # todo削除
  delete '/api/todo/:id/?' do
    id = params['id']
    db_query("DELETE FROM todos WHERE id = #{id}")
  end

  # category全取得
  get '/api/category/?' do
    content_type :json
    res = db_query("SELECT * FROM categories")
  end

  # category_idで絞り込み
  get '/api/category/:id/?' do
    content_type :json
    id = params['id']
    # res = db_query("SELECT * FROM todos WHERE category_id = #{id}")
    # idで絞込んだtodos_subテーブルとcategoriesテーブルを内部結合
    res = db_query("SELECT todos_sub.id, todos_sub.title, todos_sub.content, todos_sub.category_id, categories.title AS category_title FROM (SELECT * FROM todos WHERE todos.category_id = #{id}) AS todos_sub inner join categories on todos_sub.category_id = categories.id ORDER BY todos_sub.id")
  end

  not_found do
    "not found"
  end

  run! if app_file == $0
end
