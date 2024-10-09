class SandboxController < ApplicationController
  def index
  end

  def turbo_frame_demo
  end

  def turbo_frame_with_input_demo
    if params[:input_text].present?
      # Process the input_text param
      @processed_text = "You entered: #{params[:input_text]}"
    else
      @processed_text = "Please enter some text."
    end

    # This will render back to the turbo frame
    respond_to do |format|
      format.html # For the initial load
      format.turbo_stream # For turbo frame requests
    end
  end

  def turbo_stream_demo
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("turboStreamDemoContent", partial: "turbo_stream_demo")
      end
    end
  end

  def turbo_stream_websocket_demo
    # Initialize counter and broadcast its initial state
    session[:counter] = 0
    broadcast_counter

    # Keep broadcasting updates every second
    Thread.new do
      loop do
        sleep 1
        session[:counter] += 1
        broadcast_counter
      end
    end

    respond_to do |format|
      format.html { redirect_to sandbox_path }
    end
  end

  private

  def broadcast_counter
    Turbo::StreamsChannel.broadcast_update_to(
      "sandbox_stream",
      target: "counterContent",
      partial: "sandbox/turbo_stream_websocket",
      locals: { counter: session[:counter] }
    )
  end
end
