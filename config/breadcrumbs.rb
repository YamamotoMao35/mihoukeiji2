crumb :root do
  link "みほう掲示板", root_path
end

crumb :create_board do
  link "新規スレッド作成"
end

crumb :login do
  link "ログイン画面"
end

crumb :registration do
  link "新規登録画面"
end

crumb :board do
  link "#{board.title}"
end

crumb :search do |search_word|
  link "#{search_word}"
end
