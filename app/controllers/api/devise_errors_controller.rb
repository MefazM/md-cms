class Api::DeviseErrorsController < ActionController::Base

  # before_action :find_player

  def create
    device_error = DeviceError.new

    [:player_id,
     :error_message,
     :stack_trace,
     :memory,
     :model,
     :name,
     :architecture_info,
     :app_version_string,
     :max_texture_size,
     :platform_name].each do |field|
      device_error.send("#{field}=", params[field])
    end

    device_error.save!

    render :text => 'OK!'
  end

  private


  def find_player
    begin
      @player = Player.find(params[:player_id])
    rescue Exception => e
      logger.fatal("Can't create device error. User not found." )
      render :text => "Can't create device error. User not found."
    end

  end

end