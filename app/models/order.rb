class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :order_items
  has_many :products, through: :order_items

  def total
    products.all.map(&:price).reduce(&:+)
  end
end
