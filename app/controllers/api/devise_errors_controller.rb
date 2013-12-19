class Api::DeviseErrorsController < ActionController::Base

  def create
    device_error = DeviceError.new
    error_fields = [:error_message, :stack_trace, :memory, :model, :name, :architecture_info, :app_version_string, :max_texture_size, :platform_name]
    error_fields.each do |field|
      device_error.send("#{field}=", params[field])
    end

    device_error.save!

    render :text => 'OK!'
  end

end