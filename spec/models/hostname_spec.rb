# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Hostname, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:hostname) }
  end
  describe 'Associations' do
    it { is_expected.to belong_to(:dns_record) }
  end
  describe 'Scopes' do
    context '#exclude_host' do
      it 'passing a list' do
        query = described_class.exclude_host(%w[1.1.1.1 2.2.2.2]).to_sql
        expect(query).to eql("SELECT \"hostnames\".* FROM \"hostnames\" WHERE \"hostnames\".\"hostname\" NOT IN ('1.1.1.1', '2.2.2.2')")
      end
      it 'passing only one' do
        query = described_class.exclude_host(['1.1.1.1']).to_sql
        expect(query).to eql("SELECT \"hostnames\".* FROM \"hostnames\" WHERE \"hostnames\".\"hostname\" != '1.1.1.1'")
      end
      it 'passing nil' do
        query = described_class.exclude_host(nil).to_sql
        expect(query).to eql('SELECT "hostnames".* FROM "hostnames" WHERE (1=1)')
      end
    end
    context '#include_host' do
      it 'passing a list' do
        query = described_class.include_host(%w[1.1.1.1 2.2.2.2]).to_sql
        expect(query).to eql("SELECT \"hostnames\".* FROM \"hostnames\" WHERE \"hostnames\".\"hostname\" IN ('1.1.1.1', '2.2.2.2')")
      end
      it 'passing only one' do
        query = described_class.include_host(['1.1.1.1']).to_sql
        expect(query).to eql("SELECT \"hostnames\".* FROM \"hostnames\" WHERE \"hostnames\".\"hostname\" = '1.1.1.1'")
      end
      it 'passing nil' do
        query = described_class.include_host(nil).to_sql
        expect(query).to eql('SELECT "hostnames".* FROM "hostnames" WHERE (1=1)')
      end
    end
  end
end
