ActiveAdmin.register_page "Coins Earning" do
  content do
    settings = {}
    GameSettings.all.each do |gs|
      settings[gs[:key].to_sym] = {
        :id => gs[:id],
        :value => gs[:value]
      }
    end

    [:coins_generation_per_level, :storage_capacity_per_level].each do |field|
      settings[field][:value] = JSON.parse(settings[field][:value])
    end

    render :partial => 'form', :locals => {:settings => settings}
  end

  page_action :update, :method => :post do
    [:storage_building_uid, :coin_generator_uid].each do |type|
      option = GameSettings.find_by_key(type)
      option.value = params[type]
      option.save!
    end

    [:coins_generation_per_level, :storage_capacity_per_level].each do |type|
      option = GameSettings.find_by_key(type)
      option.value = params[type].to_json
      option.save!
    end

    redirect_to :back, :notice => "Saved!"
  end

end
