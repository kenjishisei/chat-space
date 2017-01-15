# user
- name
 - e_mail
 -password

# message
 - body
  - image
  - user_id
 - group_id

# group_user
- user_id
 - group_id

# chat_group
 - name

# 制約

## user

|column|type|key|
|:--|--:|:--:|
|name|string|null: false, add_index|
|e_mail|string |null: false, unique: true|
|password|string|null: false|

## message

|column|type|key|
|:--|--:|:--:|
|body|text|null: false|
|image|string||
|group_id|integer|null: false,foreigin_key: true|
|user_id|integer|null: false,foreigin_key: true|

## group_user

|column|type|key|
|:--|--:|:--:|
|user_id|integer|null: false,foreigin_key: true|
|group_id|integer|null: false,foreigin_key: true|

## chat_group

|column|type|key|
|:--|--:|:--:|
|name|string|null: false, add_index|

#association

## user
 has_many :group_user
 has_many :groups, through: :group_user
 has_many :messages

## message
 belongs_to :user
 belongs_to :group

 ## group_user
 belongs_to :user
 belongs_to :group

 ## chat_group
 has_many :group_users
 has_many :users, through: :group_user
 has_many :messages