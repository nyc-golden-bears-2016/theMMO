require 'faye/websocket'


class WebsocketLogic
  KEEPALIVE_TIME = 15

  def initialize(app)
    @app = app
    @clients = []
  end

  def call(env)
    if Faye::WebSocket.websocket?(env)
      websocket = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })

      websocket.on :open do |event|
        p [:open, websocket.object_id]
        @clients << websocket
      end

      websocket.on :message do |event|
        p [:message, event.data]
        @clients.each {|client| client.send(event.data) }
      end

      websocket.on :close do |event|
        p [:close, websocket.object_id, event.code, event.reason]
        @clients.delete(websocket)
        websocket = nil
      end

      websocket.rack_response
    else
      @app.call(env)
    end
  end

end

