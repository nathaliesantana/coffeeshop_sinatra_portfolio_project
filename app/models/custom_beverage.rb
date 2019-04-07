class CustomBeverage < ActiveRecord::Base
  belongs_to :user

  def slug
    title.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    CustomBeverage.all.find {|s| s.slug == slug}
  end
end
