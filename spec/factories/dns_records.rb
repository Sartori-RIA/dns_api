# frozen_string_literal: true

FactoryBot.define do
  factory :dns_record do
    ip { Faker::Internet.unique.ip_v4_address }
  end
end