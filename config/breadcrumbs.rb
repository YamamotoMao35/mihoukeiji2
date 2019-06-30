crumb :root do
  link "みほう掲示板", root_path
end

crumb :create_board do
  link "新規スレッド作成"
end

crumb :login do
  link "ログイン"
end

crumb :registration do
  link "新規会員登録"
end

crumb :term do
  link "利用規約"
end

crumb :privacy_policy do
  link "プライバシーポリシー"
end

crumb :assistance do
  link "ヘルプ"
end

crumb :user do
  link 'マイページ', user_path(current_user.id)
end

crumb :user_edit do
  link 'ユーザー編集'
  parent :user
end

crumb :withdrawal do
  link '退会'
  parent :user
end

crumb :board do |board|
  link "#{board.title}"
end

crumb :search do |search_title|
  link "#{search_title}"
end
