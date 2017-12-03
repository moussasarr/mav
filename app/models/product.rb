class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :order_items, dependent: :destroy


  def is_hose?
  	self.category == "Hose Assemblies" || "Hose" ? true : false
  end

  def is_doughnut?
  	self.category == "Doughnuts" ? true : false
  end

  def is_couplings?
  	self.category == "Couplings" ? true : false
  end

  def is_supermax?
  	self.category == "Supermax" ? true : false
  end

end
