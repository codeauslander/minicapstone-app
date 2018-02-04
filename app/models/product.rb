class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :orders, through: :carted_products
  has_many :categories, through: :category_products
  has_many :carted_products

  # def categories
  #   category_products.map{|category_product| category_products.category}
    
  # end

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in:10..500}

  TAX = 0.09
  DISCOUNT = 1000000

  def is_discounted
    (price < DISCOUNT)
  end
  def tax
    (price * TAX)
  end
  def total
    (tax + price)
  end
  def friendly_price
    format("$%.2f",price)
  end
  # def as_json
  #   {
  #     id:id,
  #     name:name,
  #     price:friendly_price,
  #     image_url:image_url,
  #     description:description,
  #     discount:is_discounted,
  #     tax:tax,
  #     total:total,
  #     in_stock:in_stock
  #   }
  # end
end
