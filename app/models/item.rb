class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :category
    belongs_to :status
    belongs_to :charge
    belongs_to :prefecture
    belongs_to :term

    has_one_attached :image

    belongs_to :user
    has_one :order


    validates :image, presence: { message: "を添付してください" }

    with_options presence: true do
      validates :name
      validates :introduction
    
      with_options numericality: { other_than: 1, message: "を選択してください"} do
        validates :category_id
        validates :status_id
        validates :charge_id
        validates :prefecture_id
        validates :term_id
      end
    end

    validates :price, presence: true
    validates :price, numericality: { with: /\A[0-9]+\z/ ,message: "は半角での記入をお願いします"}
    validates :price, numericality: {
                                      greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9999999,
                                      message: "の設定範囲を超えております"
                                      }

end