# frozen_string_literal: true

FactoryBot.define do
  factory :hostname do
    hostname { Faker::Internet.domain_name }
    dns_record
  end
end