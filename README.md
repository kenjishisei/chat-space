# user
- name
 - e_mail
 -password

# tweet
 - body
  - image
  - user_id
 - group_id

# group_user
- user_id
 - group_id

# chat_group
 - name

#user

|name|string|null: false, add_index|
|e_mail|string |null: false, unique: true|
|password|string|null: false|

#tweet

|column|type|key|
|:--|--:|:--:|
|body|text|null: false|
|image|string||
|group_id|integer|null: false,foreigin_key: true|
|user_id|integer|null: false,foreigin_key: true|

#group_user

|column|type|key|
|:--|--:|:--:|
|user_id|integer|null: false,foreigin_key: true|
|group_id|integer|null: false,foreigin_key: true|

#chat_group
|name|string|null: false, add_index|



#user
 has_many :group_users  
 has_many :groups, through: :group_users  
 has_many :messages  
 
#tweets
 belongs_to :user  
 belongs_to :group
 
 #group_user
 belongs_to :user  
 belongs_to :group

 #chat_group
 has_many :group_users  
 has_many :users, through: :group_users  
 has_many :messages