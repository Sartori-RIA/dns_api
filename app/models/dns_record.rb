# frozen_string_literal: true

class DnsRecord < ApplicationRecord
  validates :ip, presence: true, uniqueness: true
end
