require 'faye/websocket'


class WebsocketLogic
  KEEPALIVE_TIME = 15

  def initialize(app)
    @main_server = app
    @players = []
    @messages_per_frame = 0
    @time_counter = Time.now.to_f
    @time_per_frame = 1.0
  end

  def call(env)
    if Faye::WebSocket.websocket?(env)
      websocket = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })

      websocket.on :open do |event|
        p [:open, websocket.object_id]
        @players << websocket
      end

      websocket.on :message do |event|
        p [:message, event.data]
        # TODO: refactor so that it only sends out client info 30 times a second
        @messages_per_frame += 1
        if(Time.now.to_f - @time_counter >= @time_per_frame)
          puts @messages_per_frame
          @messages_per_frame = 0
          @time_counter = Time.now.to_f
        end
        @players.each {|client| Thread.new { client.send(event.data) } }
      end

      websocket.on :close do |event|
        p [:close, websocket.object_id, event.code, event.reason]
        @players.delete(websocket)
        websocket = nil
      end

      websocket.rack_response
    else
      @main_server.call(env)
    end
  end

end

