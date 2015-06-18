# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
# Sinatra Main controller
class MainApp < Sinatra::Base
  # Sinatra Auto Reload

  configure :development do
    register Sinatra::Reloader
  end
  get '/' do
    if File.exist?('data')
      File.read('data')
    else
      ''
    end
  end
  post '/' do
    File.open('data','a') do |file|
      file.puts request.body.gets
    end
  end
  put '/' do
    File.write('data', request.body.gets + "\n")
  end
  delete '/' do
    File.write('data', '')
  end
end


