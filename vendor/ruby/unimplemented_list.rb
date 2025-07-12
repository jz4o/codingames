# get implemented file list for specific languages
#
# @param [Array] dir language names
#
# @return [Array] implemented file list
def get_file_names(*dir_name)
  file_paths = Dir.glob("#{ROOT_DIR}/{#{dir_name.join(',')}}/**/*.*")
  file_paths.map { |file_path| file_path.match("#{ROOT_DIR}/[^/]+/([^.]+)")[1] }.uniq.sort
end

# codingames directory
ROOT_DIR = File.expand_path '../../', __dir__

# implemented languages to Onboarding
# NOTE: assume to implement on Onboarding first
LANGUAGES = Dir.glob('**/onboarding.*', base: ROOT_DIR).map { |path| path.sub(%r{/.*}, '') }.sort

# implemented file list
FILE_NAMES = get_file_names LANGUAGES

# for output
output_list = []

# languages for output target
TARGET_LANGUAGES = ARGV.any? ? ARGV.sort : LANGUAGES

# add unimplemented file names for each specific languages into ouput array
TARGET_LANGUAGES.each do |language|
  # implemented file names by specific language
  implemented_file_names = get_file_names language

  # unimplemented file names by specific language
  unimplemented_file_names = FILE_NAMES - implemented_file_names

  # goto next loop if unimplemented files is empty for specific language
  next unless unimplemented_file_names.any?

  # add unimplemented files and language name to output array
  output_list << [
    "***** #{language} *****",
    unimplemented_file_names
  ].join("\n")
end

# output
# insert space row for visibility implove
puts output_list.join("\n\n")
