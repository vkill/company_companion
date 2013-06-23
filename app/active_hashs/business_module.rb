# coding: utf-8
class BusinessModule < ActiveHash::Base

  self.data = [
    {id: 1, name_en: "post", name_zh_CN: "新闻"},
    {id: 2, name_en: "product", name_zh_CN: "产品"}
  ]

  include ActiveHash::Associations
  has_many :businesses


  def name
    send "name_#{::I18n.locale.to_s.sub('-', '_')}"
  end

end
