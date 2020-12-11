class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ , message: "は全て全角での入力をお願いします" } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶ]+\z/ , message: "はカタカナでの入力をお願いします" } do
      validates :last_name_kana
      validates :first_name_kana
    end
    
   end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i , message: "は英語と数字を混同させてください" }

end