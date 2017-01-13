# user
1. name
2. e_mail

# tweet
1. body
2. image
3. user_id
4. group_id

# group_users
1. user_id
2. group_id

# chat_groups
1. name

|column|type|
|:--|--:|
|body|text|
|image|string|
|group_id|integer|
|user_id|integer|
|name|string|


|アソシエーション|
|:--|
|users has_many : tweets|
|tweets belongs_to :users|
|chat_group has_many : tweets|
|tweets belongs_to : chat_group|
|users has_many : chat_group|
|chat_group belongs_to :users|

|制約|
|:--|
|t.string :mail, null: false|
|add_column :users, :e_mail, :string|
|add_index :users, :e_mail, unique: true|