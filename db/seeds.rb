# coding: utf-8
require Rails.root.join("lib/load_dev_gems")

if Rails.env.development? or Rails.env.test?
  # gem database_cleaner
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

