# テーブル設計

 ## users テーブル

 | Column                | Type   | Options     |
 |-----------------------|--------|-------------|
 | nickname              | string | null: false |
 | email                 | string | null: false |
 | password              | string | null: false |
 | password_confirmation | string | null: false |
 |                       |        |             |
 | last_name             | string | null: false |
 | first_name            | string | null: false |
 | last_name_kana        | string | null: false |
 | first_name_kana       | string | null: false |
 | birthday              | date   | null: false |

 ### Association

 - has_many :items
 - has_many :purchases


  ## items テーブル

 | Column       | Type       | Options                        |
 |--------------|------------|--------------------------------|
 | image        | blob       | null: false                    |
 | name         | string     | null: false                    |
 | introduction | text       | null: false                    |
 | price        | integer    | null: false                    |
 | category     | string     | null: false                    |
 | status       | string     | null: false                    |
 |              |            |                                |
 | charge       | string     | null: false                    | 
 | area         | string     | null: false                    |
 | term         | string     | null: false                    |
 |              |            |                                |
 | user         | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :user
 - has_one :purchase
 

  ## purchases テーブル

 | Column           | Type       | Options                        |
 |------------------|------------|--------------------------------|
 | card_number      | integer    | null: false                    |
 | exp_month        | integer    | null: false                    |
 | exp_year         | integer    | null: false                    |
 | security_code    | integer    | null: false                    |
 |                  |            |                                |
 | postal_code      | integer    | null: false                    |
 | prefecture       | string     | null: false                    |
 | city             | string     | null: false                    |
 | block            | string     | null: false                    |
 | building         | string     |                                |
 |                  |            |                                |
 | telephone_number | integer    | null: false                    |
 |                  |            |                                |
 | item             | references | null: false, foreign_key: true |
 | user             | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :item
 - belongs_to :user

 
