# user
1. user_id
2. name
3. mail
4. password
5. confirmation_password

# tweet
1. body
2. image
3. user-id
4. group-id

# group-users
1. user_id
2. group_id

# chat-groups
1. name

|column|type|
|:--|--:|
|body|text|
|image|string|
|group_id|integer|
|user_id|integer|
|name|string|
|mail|string|
|password|string|
|confirmation_password|string|

# アソシエーション
1. users has_many : tweets
2. tweets belongs_to :users
3. chat_group has_many : tweets
4. tweets belongs_to : chat_group
5. users has_many : chat_group
6. chat_group belongs_to :users

# 制約
1. t.string :mail, null: false
2.  add_column :users, :email, :string
    add_index :users, :email, unique: true