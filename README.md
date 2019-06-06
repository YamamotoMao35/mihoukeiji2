# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_many :messages
- has_many :boards

## boardsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|

### Association
- has_many :messages
- has_many :boards_categories
- has_many :categories, through: :boards_categories
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :boards_categories
- has_many :boards, through: :boards_categories

## boards_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|board_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :board
- belongs_to :category

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|string|null: false|
|image|text||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :board
- belongs_to :user
