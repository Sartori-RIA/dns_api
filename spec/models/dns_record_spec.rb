# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DnsRecord, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:ip) }
  end
  describe "Associations" do
    it { is_expected.to have_many(:hostnames).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:hostnames) }
  end
end
