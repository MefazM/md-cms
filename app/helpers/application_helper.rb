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
    results << "local buildings = {}\n\n"

    buildings_grouped.each do |package, buildings|
      results << "buildings['#{package}'] = {}\n"
      buildings.each do |level, building|
        info = building[:building_info]
        results << "buildings['#{package}'][#{level}] = { name = '#{info.name}', description = '#{info.description}', level = #{info.level} }\n"
        if building[:units_info]
          results << "buildings['#{package}'][#{level}].units = {}\n"
          building[:units_info].each_with_index do |unit, index|
            results << "buildings['#{package}'][#{level}].units[#{index+1}] = #{unit.export}\n"
          end
        end
      end
      results << "\n"
    end

    results << "local function get_building_info( package, level )\n\treturn buildings[package][level]\nend\nreturn get_building_info\n\n"

    results.join()
  end
end
