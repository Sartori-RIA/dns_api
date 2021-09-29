# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DnsRecord, type: :model do
  describe "Validations" do
    it { is_expected.to presence_of(:ip) }
    it { is_expected.to validate_uniqueness_of(:ip) }
  end
  describe "Associations" do
    it { is_expected.to have_many(:hostnames).dependent(:destroy) }
  end
end
