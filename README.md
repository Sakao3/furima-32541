# テーブル設計

 ## users テーブル

 | Column                | Type   | Options                   |
 |-----------------------|--------|---------------------------|
 | nickname              | string | null: false               |
 | email                 | string | null: false, unique: true |
 | encrypted_password    | string | null: false               |
 | last_name             | string | null: false               |
 | first_name            | string | null: false               |
 | last_name_kana        | string | null: false               |
 | first_name_kana       | string | null: false               |
 | birthday              | date   | null: false               |

 ### Association

 - has_many :items
 - has_many :orders
 - has_many :comments


  ## items テーブル

 | Column        | Type       | Options                        |
 |---------------|------------|--------------------------------|
 | name          | string     | null: false                    |
 | introduction  | text       | null: false                    |
 | price         | integer    | null: false                    |
 | category_id   | integer    | null: false                    |
 | status_id     | integer    | null: false                    |
 | charge_id     | integer    | null: false                    | 
 | prefecture_id | integer    | null: false                    |
 | term_id       | integer    | null: false                    |
 | user          | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :user
 - has_one :orders
 - has_many :comments
 

  ## orders テーブル

 | Column           | Type       | Options                        |
 |------------------|------------|--------------------------------|
 | item             | references | null: false, foreign_key: true |
 | user             | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :item
 - belongs_to :user
 - has_one :address
 
  ## addresses テーブル

 | Column           | Type       | Options                        |
 |------------------|------------|--------------------------------|
 | postal_code      | string     | null: false                    |
 | prefecture_id    | integer    | null: false                    |
 | city             | string     | null: false                    |
 | block            | string     | null: false                    |
 | building         | string     |                                |
 | telephone_number | string     | null: false                    |
 | order            | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :order


  ## comments テーブル

 | Column           | Type       | Options                        |
 |------------------|------------|--------------------------------|
 | comment          |string      | null: false, foreign_key: true |
 | item             | references | null: false, foreign_key: true |
 | user             | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :item
 - belongs_to :user
 
 