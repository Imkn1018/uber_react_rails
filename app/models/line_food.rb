class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  # optional: trueで関連付け先が存在しなくても良くなる
  belongs_to :order, optional: true

  validates :count, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }
  scope :other_restaurant, -> (picked_restaurant_id) { where.not(restaurant_id: picked_restaurant_id) }

  # インスタンスメソッド
  def total_amount
    food.price * count
  end
end