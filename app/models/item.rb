class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :charge
    belongs_to :prefecture
    belongs_to :term

    has_one_attached :image
end
