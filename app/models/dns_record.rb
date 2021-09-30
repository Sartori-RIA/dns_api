# frozen_string_literal: true

class DnsRecord < ApplicationRecord
  validates :ip, presence: true, uniqueness: true

  has_many :hostnames, dependent: :destroy
  accepts_nested_attributes_for :hostnames, allow_destroy: true
end
