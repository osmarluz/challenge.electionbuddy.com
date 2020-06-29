require 'test_helper'

class ElectionTest < ActiveSupport::TestCase
  let(:election) { elections(:one) }

  describe 'after create' do
    it 'creates an audit with new information' do
      audit = Audit.with_auditable(Election.create user: users(:one)).last

      assert_equal audit.operation, 'create'
      assert audit.fields.key?('user_id')
    end
  end

  describe 'after update' do
    it 'creates an audit with updated information' do
      election.update name: 'Updated Name'

      audit = Audit.with_auditable(election).last

      assert_equal audit.operation, 'update'
      assert audit.fields.key?('name')
    end
  end

  describe 'after destroy' do
    it 'creates an audit with updated information' do
      election.destroy

      audit = Audit.with_auditable(election).last

      assert_equal audit.operation, 'destroy'
    end
  end
end
