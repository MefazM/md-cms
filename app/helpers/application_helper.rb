module ApplicationHelper
  def export_buildings buildings
    buildings_grouped = {}

    units_grouped = {}

    buildings.each do |building|
      package = building.package

      buildings_grouped[package] = {} if buildings_grouped[package].nil?
      buildings_grouped[package][building.level] = {}
      buildings_grouped[package][building.level][:building_info] = building

      units = Unit.depended_on(package, building.level)
      buildings_grouped[package][building.level][:units_info] = units unless units.empty?

      unless units.empty?
        units_grouped[package] = [] if units_grouped[package].nil?
        units.map { |u| units_grouped[package] << {:package => u.package, :level => u.depends_on_building_level}}
      end

      updateable = building.updateable_to
      buildings_grouped[package][building.level][:updateable_to] = updateable if updateable
    end

    results = []

    results << "--\r-- Game data. Exported @#{DateTime.now}\r--\r"
    results << "-- UNITS\r\r"
    results << "local units = {}\r"
    units_grouped.each do |package, units|
      results << "units['#{package}'] = {}\r"
      units.each_with_index do |unit, index|
        results << "units['#{package}'][#{index + 1}] = { package = '#{unit[:package]}', level = #{unit[:level]} }\r"
      end
    end
    results << "local units_data = {}\r"
    Unit.all.each do |unit|
      results << "units_data['#{unit.package}'] = {}\r"
      results << "units_data['#{unit.package}'] = #{unit.export}\r"
    end

    results << "-- BUILDINGS\r\r"
    results << "local buildings = {}\r\r"

    buildings_grouped.each do |package, buildings|
      results << "buildings['#{package}'] = {}\r"
      buildings.each do |level, building|
        info = building[:building_info]
        actions = ['info = true']
        results << "buildings['#{package}'][#{level}] = { name = '#{info.name}', description = '#{info.description}', level = #{info.level} }\r"

        if building[:units_info]
          actions << 'units = true'
          # results << "buildings['#{package}'][#{level}].units = {}\r"
          # building[:units_info].each_with_index do |unit, index|
          #   results << "buildings['#{package}'][#{level}].units[#{index+1}] = #{unit.export}\r"
          # end
        end

        updateable_to = building[:updateable_to]
        results << "buildings['#{package}'][#{level}].updateable = #{updateable_to.nil? ? false : true}\r"
        actions << 'build = true' unless updateable_to.nil?
        # unless updateable_to.nil?
        #   actions << '\'build\''
        #   results << "buildings['#{package}'][#{level}].updateable_to = '#{updateable_to.package}'\r"
        # end

        results << "buildings['#{package}'][#{level}].actions = {#{actions.join(', ')}}\r"
      end
      results << "\r"
    end
    results << "-- /BUILDINGS\r"
    results << "local self = {}\r"

    results << "-- SPAWNINGS\r\r"
    results << "
    local spawnings = {\r
      { x = 750, y = 640, package = 'buildings.mage_barrack', default_desc = 'Here should be an armory', actions = {info = true, build = true}},
      { x = 860, y = 600, package = 'buildings.barrack', default_desc = 'Here should be barrack', actions = {info = true, build = true}},
      { x = 840, y = 770, package = 'buildings.bow_barrack', default_desc = 'Here should someshing else', actions = {info = true, build = true}}
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
    results << "function self:getDefaultAction( package )\r
      return default_actions[package]
    end
    "
    results << "-- /DEFAULT ACTIONS\r"

    results << "-- DEFAULT DESCRIPTIONS\r\r"
    results << "local default_descriptions = {}\r
    default_descriptions['buildings.mage_barrack'] = 'Here should be an armory'
    default_descriptions['buildings.barrack'] = 'Here should be barrack'
    default_descriptions['buildings.bow_barrack'] = 'Here should someshing else'\r"

    results << "function self:getDescription( package, level )\r
      if level == 0 then
        return default_descriptions[package]
      else
        return buildings[package][level].description
      end
    end
    "
    results << "-- /DEFAULT DESCRIPTIONS\r"
    results << "function self:getUnits()\r\treturn units\rend\r"
    results << "function self:getUnitInfo( package )\r\treturn units_data[package]\rend\r"
    results << "function self:getBuildingInfo( package, level )\r\treturn buildings[package][level]\rend\rfunction self:getBuildingActions( package, level )\r\treturn buildings[package][level].actions\rend\rreturn self\r"
    results.join('')
  end
end
