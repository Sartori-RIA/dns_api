# frozen_string_literal: true

class Hostname < ApplicationRecord
  validates :hostname, presence: true, hostname: true

  belongs_to :dns_record

  scope :exclude_host, ->(excluded) { excluded.present? ? where.not(hostname: excluded) : where('1=1') }
  scope :include_host, ->(only) { only.present? ? where(hostname: only) : where('1=1') }
end
