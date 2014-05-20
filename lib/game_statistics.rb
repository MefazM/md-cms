class GameStatistics
  def initialize
    @data = {}
  end

  attr_reader :data

  def add_params(group, value)
    group_name = group.to_sym

    @data[group_name] ||= {:name => group_name, :data => []}

    # binding.pry

    @data[group_name][:data] += value.map{|v| [v[:time].to_i, v[:value].to_i]}
  end

  def [](group)
    @data[group.to_sym] || []
  end


end