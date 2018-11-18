# 指定された言語の解答済みファイル名一覧を返す
#
# @param [Array] dir 言語名(複数指定可能)
#
# @return [Array] 解答済みファイル名一覧
def get_file_names(*dir_name)
  file_paths = Dir.glob("#{ROOT_DIR}/{#{dir_name.join(',')}}/**/*.*")
  file_paths.map { |file_path| File.basename file_path, '.*' }.uniq.sort
end

# codingames ディレクトリ
ROOT_DIR = File.expand_path '../', __dir__

# Onboarding に解答済みの言語一覧
# ※ 初めに Onboarding を解答する想定
LANGUAGES = Dir.glob('**/onboarding.*', base: ROOT_DIR).map { |path| path.sub /\/.*/, '' }.sort

# 解答済みのファイル名一覧
FILE_NAMES = get_file_names LANGUAGES

# 一部言語でのみ解答しているファイル名を各言語ごとに出力
LANGUAGES.each do |language|
  # 該当言語で解答済みのファイル名一覧
  implemented_file_names = get_file_names language

  # 該当言語で未解答のファイル名一覧
  unimplemented_file_names = FILE_NAMES - implemented_file_names

  # 該当言語で未解答のファイルが存在する場合
  # 言語名とともにファイル名一覧を出力
  if unimplemented_file_names.any?
    puts "***** #{language} *****"
    puts unimplemented_file_names
    puts # 視認性のための空行出力
  end
end

