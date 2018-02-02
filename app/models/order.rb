class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :carted_products
  
  TAX = 0.09
  def tax
    (total * TAX)
  end
  def total
    (quantity * product.price)
  end
  def subtotal
    (total + tax)
  end

  def calculate_subtotal
    self.subtotal = product.price * quantity
  end
  def calculate_tax
    self.tax = subtotal * TAX
  end
  def calculate_total
    self.total = tax  + subtotal
  end
  def calculate_totals
    calculate_subtotal
    calculate_tax
    calculate_total
  end
end
