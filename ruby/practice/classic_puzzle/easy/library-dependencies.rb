# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n_imp = gets.to_i
imports = []
n_imp.times do
  import = gets.chomp
  imports << import
end
n_dep = gets.to_i
dependency_rows = []
n_dep.times do
  dependency = gets.chomp
  dependency_rows << dependency
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Dependency
  attr_reader :name, :direct_dependencies, :dependencies

  def initialize(name, dependencies)
    @name = name
    @direct_dependencies = dependencies
    @dependencies = dependencies
    @interdependence = false
  end

  def add_dependencies(dependencies)
    @dependencies.concat dependencies
  end

  def dependent?(name)
    @dependencies.include? name
  end

  def interdependence?
    @interdependence
  end

  def set_interdependence
    @interdependence = true
  end

  def get_require_name(imported_names, dependencies)
    temp_imported_names = imported_names.dup
    dependency_name_stack = @direct_dependencies.dup
    while dependency_name = dependency_name_stack.shift
      return dependency_name unless temp_imported_names.include? dependency_name

      imported_names << dependency_name

      dependency = dependencies.find_by_name dependency_name
      next unless dependency

      return dependency.name if dependency.interdependence?

      dependency_name_stack.unshift(*dependency.direct_dependencies)
    end

    nil
  end
end

ImportResult = Struct.new :result, :error_message

def dry_import(import_names, dependencies)
  imported_names = []
  import_names.each do |import_name|
    dependency = dependencies.find_by_name import_name

    require_names = (dependency&.dependencies || []) - imported_names
    if require_names.any?
      require_name = dependency.get_require_name imported_names, dependencies
      error_message = "Import error: tried to import #{import_name} but #{require_name} is required."

      return ImportResult.new false, error_message
    end

    imported_names << import_name
  end

  ImportResult.new true, nil
end

def reorder_import(import_names, dependencies)
  reorder_import_names = []

  sorted_import_names = import_names.sort
  while sorted_import_names.any?
    importable_name = sorted_import_names.find do |import_name|
      dependency = dependencies.find_by_name import_name
      dependency.nil? || (dependency.dependencies - reorder_import_names).empty?
    end

    return [] unless importable_name

    reorder_import_names << importable_name
    sorted_import_names.delete importable_name
  end

  reorder_import_names
end

dependencies = dependency_rows.map do |dependency|
  from, to = dependency.split ' requires '
  Dependency.new from, to.split(', ')
end
dependencies.each do |dependency|
  caller_dependencies = dependencies.filter { |d| d.dependent? dependency.name }
  caller_dependencies.each do |caller_dependency|
    if dependency.dependent? caller_dependency.name
      caller_dependency.set_interdependence
      dependencies.filter { |d| d.dependent? caller_dependency.name }.each(&:set_interdependence)
    end

    caller_dependency.add_dependencies dependency.dependencies
  end
end
def dependencies.find_by_name(name)
  find { |dependency| dependency.name == name }
end

import_names = imports.map { |import| import.delete_prefix 'import ' }

dry_run_result = dry_import(import_names, dependencies)

results =
  if dry_run_result.result
    ['Compiled successfully!']
  else
    is_inter_dependencies = import_names.any? do |import_name|
      dependencies.find_by_name(import_name)&.interdependence?
    end

    if is_inter_dependencies
      [
        dry_run_result.error_message,
        'Fatal error: interdependencies.'
      ]
    else
      reorder_imports = reorder_import(import_names, dependencies).map { |import_name| "import #{import_name}" }

      [
        dry_run_result.error_message,
        'Suggest to change import order:',
        *reorder_imports
      ]
    end
  end

# puts "answer"
results.each do |result|
  puts result
end
