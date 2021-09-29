require 'rails_helper'

RSpec.describe Hostname, type: :model do
  describe "Validations" do
    it { is_expected.to presence_of(:hostname) }
    it { is_expected.to validate_uniqueness_of(:hostname) }
  end
  describe "Associations" do
    it { is_expected.to belong_to(:dns_model) }
  end
end
