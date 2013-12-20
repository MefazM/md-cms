ActiveAdmin.register_page 'Crash log' do
  menu false
  content do

    player_id = params[:player_id]

    errors = DeviceError.where(:player_id => player_id).ordered
    player = Player.find(player_id)

    render :partial => 'errors_table', :locals => {:errors => errors, :player => player}
  end
end