class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :charge
    belongs_to :prefecture
    belongs_to :term

    has_one_attached :image

    belongs_to :user

    with_options presence: true do
      validates :name
      validates :introduction
      validates :price
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :charge_id
      validates :prefecture_id
      validates :term_id
    end
    
end



    # イメージのバリデーション失敗
    # validates :image, presence: true, if: :was_attached?
    # def was_attached?
    #   self.image.attached?
    # end

