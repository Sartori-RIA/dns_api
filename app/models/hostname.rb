# frozen_string_literal: true

class Hostname < ApplicationRecord
  validates :hostname, presence: true, uniqueness: true

  belongs_to :dns_record
end
