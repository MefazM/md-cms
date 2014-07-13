ActiveAdmin.register_page "Game Settings" do

  page_action :update, method: :post do
    current_file = Rails.root + 'config/game_settings/game_settings.json'
    old_file = Rails.root + "config/game_settings/game_settings.#{Time.now.to_i}.json"

    FileUtils.mv current_file, old_file

    json = JSON.parse params[:game_settings][:json]

    File.open(current_file, 'w+') { |file| file.puts JSON.pretty_generate(json) }

    flash[:notice] = "Updated!"
    redirect_to :admin_game_settings
  end

  content do
    versions = Dir["config/game_settings/*"].map{ |f| f.split('/').last }.compact

    @versions_select = versions.map do |version|
      humanized = Time.at( version.match(/(\d+)/)[1].to_i ) rescue 'current'

      [humanized, version]
    end

    @version = 'game_settings.json'
    @version = params[:version] if versions.include? params[:version]

    @game_settings_json = File.read(Rails.root + "config/game_settings/#{@version}")
    render partial: "form", locals: { game_settings_json: @game_settings_json, versions: @versions_select, version: @version }
  end


end