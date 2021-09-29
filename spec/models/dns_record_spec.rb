# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DnsRecord, type: :model do
  it { is_expected.to presence_of(:ip) }
  it { is_expected.to validate_uniqueness_of(:ip) }
end
