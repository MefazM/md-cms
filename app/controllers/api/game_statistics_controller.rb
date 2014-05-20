class Api::GameStatisticsController < ActionController::Base

  def report

    if params[:statistics].blank?
      raise ActionController::RoutingError.new("Send empty statistics!")
    end

    params[:statistics].each {|group_name, data| $gs.add_params(group_name, data)}

    render :nothing => true, :status => 200
  end

  def players_and_battles

    data = []

    # data = [
    #   {:name => :players, :data => $gs[:players]},
    #   {:name => :battles, :data => $gs[:battles]},
    # ]

    data = [
      $gs[:players],
      $gs[:battles]
    ]


    render :json => data

    # players = {
    #   :name =>'players',
    #   :data => []
    # }

    # battles = {
    #   :name => 'battles',
    #   :data => []
    # }

    # 20.times do |i|

    #   players[:data] << [Time.now.to_i + (i*3000), rand(0..10)]

    # end


    # 20.times do |i|

    #   battles[:data] << [Time.now.to_i+ (i*3000), rand(0..10)]

    # end

    # data = []

    # data << players
    # data << battles

    # render :json => data


  end

end