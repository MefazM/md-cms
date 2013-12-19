module ApplicationHelper
  def export_buildings buildings
    buildings_grouped = {}

    units_grouped = {}

    buildings.each do |building|
      uid = building.uid

      buildings_grouped[uid] = {} if buildings_grouped[uid].nil?
      buildings_grouped[uid][building.level] = {}
      buildings_grouped[uid][building.level][:building_info] = building

      units = Unit.depended_on(uid, building.level)
      buildings_grouped[uid][building.level][:units_info] = units unless units.empty?

      unless units.empty?
        units_grouped[uid] = [] if units_grouped[uid].nil?
        units.map { |u| units_grouped[uid] << {:uid => u.uid, :level => u.depends_on_building_level}}
      end

      updateable = building.updateable_to
      buildings_grouped[uid][building.level][:updateable_to] = updateable if updateable
    end

    results = []

    results << "--\r-- Game data. Exported @#{DateTime.now}\r--\r"
    results << "-- UNITS\r\r"
    results << "local units = {}\r"
    units_grouped.each do |uid, units|
      results << "units['#{uid}'] = {}\r"
      units.each_with_index do |unit, index|
        results << "units['#{uid}'][#{index + 1}] = { uid = '#{unit[:uid]}', level = #{unit[:level]} }\r"
      end
    end
    results << "local units_data = {}\r"
    Unit.all.each do |unit|
      results << "units_data['#{unit.uid}'] = {}\r"
      results << "units_data['#{unit.uid}'] = #{unit.export}\r"
    end

    results << "-- BUILDINGS\r\r"
    results << "local buildings = {}\r\r"

    buildings_grouped.each do |uid, buildings|
      results << "buildings['#{uid}'] = {}\r"
      buildings.each do |level, building|
        info = building[:building_info]
        actions = ['info = true']
        results << "buildings['#{uid}'][#{level}] = { name = '#{info.name}', description = '#{info.description}', level = #{info.level} }\r"

        if building[:units_info]
          actions << 'units = true'
          # results << "buildings['#{uid}'][#{level}].units = {}\r"
          # building[:units_info].each_with_index do |unit, index|
          #   results << "buildings['#{uid}'][#{level}].units[#{index+1}] = #{unit.export}\r"
          # end
        end

        updateable_to = building[:updateable_to]
        results << "buildings['#{uid}'][#{level}].updateable = #{updateable_to.nil? ? false : true}\r"
        actions << 'build = true' unless updateable_to.nil?
        # unless updateable_to.nil?
        #   actions << '\'build\''
        #   results << "buildings['#{uid}'][#{level}].updateable_to = '#{updateable_to.uid}'\r"
        # end

        results << "buildings['#{uid}'][#{level}].actions = {#{actions.join(', ')}}\r"
      end
      results << "\r"
    end
    results << "-- /BUILDINGS\r"
    results << "local self = {}\r"

    results << "-- SPAWNINGS\r\r"
    results << "
    local spawnings = {\r
      { x = 750, y = 640, uid = 'buildings.mage_barrack', default_desc = 'Here should be an armory', actions = {info = true, build = true}},
      { x = 860, y = 600, uid = 'buildings.barrack', default_desc = 'Here should be barrack', actions = {info = true, build = true}},
      { x = 840, y = 770, uid = 'buildings.bow_barrack', default_desc = 'Here should someshing else', actions = {info = true, build = true}}
    }
    \r"
    results << "function self:getSpawnings()\r
      return spawnings\r
    end\r
    "
    results << "-- /SPAWNINGS\r"

    results << "-- DEFAULT ACTIONS\r\r"
    results << "local default_actions = {}\r
    default_actions['buildings.mage_barrack'] = {info = true, build = true}
    default_actions['buildings.barrack'] = {info = true, build = true}
    default_actions['buildings.bow_barrack'] = {info = true, build = true}\r"
    results << "function self:getDefaultAction( uid )\r
      return default_actions[uid]
    end
    "
    results << "-- /DEFAULT ACTIONS\r"

    results << "-- DEFAULT DESCRIPTIONS\r\r"
    results << "local default_descriptions = {}\r
    default_descriptions['buildings.mage_barrack'] = 'Here should be an armory'
    default_descriptions['buildings.barrack'] = 'Here should be barrack'
    default_descriptions['buildings.bow_barrack'] = 'Here should someshing else'\r"

    results << "function self:getDescription( uid, level )\r
      if level == 0 then
        return default_descriptions[uid]
      else
        return buildings[uid][level].description
      end
    end
    "
    results << "-- /DEFAULT DESCRIPTIONS\r"
    results << "function self:getUnits()\r\treturn units\rend\r"
    results << "function self:getUnitInfo( uid )\r\treturn units_data[uid]\rend\r"
    results << "function self:getBuildingInfo( uid, level )\r\treturn buildings[uid][level]\rend\rfunction self:getBuildingActions( uid, level )\r\treturn buildings[uid][level].actions\rend\rreturn self\r"
    results.join('')
  end
end
