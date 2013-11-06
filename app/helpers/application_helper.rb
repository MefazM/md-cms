module ApplicationHelper
  def export_buildings buildings
    buildings_grouped = {}

    buildings.each do |building|
      package = building.package

      buildings_grouped[package] = {} if buildings_grouped[package].nil?
      buildings_grouped[package][building.level] = {}
      buildings_grouped[package][building.level][:building_info] = building

      units = Unit.depended_on(package, building.level)

      buildings_grouped[package][building.level][:units_info] = units unless units.empty?

      updateable = building.updateable_to
      buildings_grouped[package][building.level][:updateable_to] = updateable if updateable
    end

    results = []

    results << "--\n-- Buildings. Exported @ #{DateTime.now}\n--\n"
    results << "-- BUILDINGS\n\n"
    results << "local buildings = {}\n\n"

    buildings_grouped.each do |package, buildings|
      results << "buildings['#{package}'] = {}\n"
      buildings.each do |level, building|
        info = building[:building_info]
        actions = ['info = true']
        results << "buildings['#{package}'][#{level}] = { name = '#{info.name}', description = '#{info.description}', level = #{info.level} }\n"

        if building[:units_info]
          actions << 'units = true'
          results << "buildings['#{package}'][#{level}].units = {}\n"
          building[:units_info].each_with_index do |unit, index|
            results << "buildings['#{package}'][#{level}].units[#{index+1}] = #{unit.export}\n"
          end
        end

        updateable_to = building[:updateable_to]
        results << "buildings['#{package}'][#{level}].updateable = #{updateable_to.nil? ? false : true}\n"
        actions << 'build = true' unless updateable_to.nil?
        # unless updateable_to.nil?
        #   actions << '\'build\''
        #   results << "buildings['#{package}'][#{level}].updateable_to = '#{updateable_to.package}'\n"
        # end

        results << "buildings['#{package}'][#{level}].actions = {#{actions.join(', ')}}\n"
      end
      results << "\n"
    end
    results << "-- /BUILDINGS\n"
    results << "local self = {}\n"

    results << "-- SPAWNINGS\n\n"
    results << "
    local spawnings = {\n
      { x = 512, y = 512, package = 'buildings.armory', default_desc = 'Here should be an armory', actions = {info = true, build = true}},\n
      { x = 412, y = 612, package = 'buildings.barrack', default_desc = 'Here should be barrack', actions = {info = true, build = true}},\n
      { x = 612, y = 550, package = 'buildings.castle', default_desc = 'Here should someshing else', actions = {info = true, build = true}}
    }
    \n"
    results << "function self:getSpawnings()\n
      return spawnings\n
    end\n
    "
    results << "-- /SPAWNINGS\n"

    results << "-- DEFAULT ACTIONS\n\n"
    results << "local default_actions = {}\n
    default_actions['buildings.armory'] = {info = true, build = true}
    default_actions['buildings.barrack'] = {info = true, build = true}
    default_actions['buildings.castle'] = {info = true, build = true}\n"
    results << "function self:getDefaultAction( package )\n
      return default_actions[package]
    end
    "
    results << "-- /DEFAULT ACTIONS\n"

    results << "-- DEFAULT DESCRIPTIONS\n\n"
    results << "local default_descriptions = {}\n
      default_descriptions['buildings.armory'] = 'Here should be an armory'
      default_descriptions['buildings.barrack'] = 'Here should be barrack'
      default_descriptions['buildings.castle'] = 'Here should someshing else'\n"

    results << "function self:getDescription( package, level )\n
      if level == 0 then
        return default_descriptions[package]
      else
        return buildings[package][level].description
      end
    end
    "
    results << "-- /DEFAULT DESCRIPTIONS\n"

    results << "function self:getBuildingInfo( package, level )\n\treturn buildings[package][level]\nend\nfunction self:getBuildingActions( package, level )\n\treturn buildings[package][level].actions\nend\nreturn self\n"

    results.join()
  end
end
