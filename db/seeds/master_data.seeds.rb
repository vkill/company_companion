# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

p "> create business..."

FactoryGirl.create :business, name: 'web_site',
                              module_ids: [1, 2]
