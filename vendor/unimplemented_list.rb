# 指定された言語の解答済みファイル一覧を返す
#
# @param [Array] dir 言語名(複数指定可能)
#
# @return [Array] 解答済みファイル一覧
def get_file_names(*dir_name)
  file_paths = Dir.glob("#{ROOT_DIR}/{#{dir_name.join(',')}}/**/*.*")
  file_paths.map { |file_path| file_path.match("#{ROOT_DIR}/[^/]+/([^.]+)")[1] }.uniq.sort
end

# codingames ディレクトリ
ROOT_DIR = File.expand_path '../', __dir__

# Onboarding に解答済みの言語一覧
# ※ 初めに Onboarding を解答する想定
LANGUAGES = Dir.glob('**/onboarding.*', base: ROOT_DIR).map { |path| path.sub /\/.*/, '' }.sort

# 解答済みのファイル一覧
FILE_NAMES = get_file_names LANGUAGES

# 出力用配列
output_list = []

# 一部言語でのみ解答しているファイルを各言語ごとに出力
LANGUAGES.each do |language|
  # 該当言語で解答済みのファイル一覧
  implemented_file_names = get_file_names language

  # 該当言語で未解答のファイル一覧
  unimplemented_file_names = FILE_NAMES - implemented_file_names

  # 該当言語で未解答のファイルが存在する場合
  # 言語名とともに出力用配列に追加
  if unimplemented_file_names.any?
    output_list << [
      "***** #{language} *****",
      unimplemented_file_names
    ].join("\n")
  end
end

# 出力
# 視認しやすくするため各言語間に空行を挟む
puts output_list.join("\n\n")

