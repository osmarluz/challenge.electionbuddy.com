require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  let(:voter) { voters(:one) }

  describe 'after create' do
    it 'creates an audit with new information' do
      audit = Audit.with_auditable(Voter.create election: elections(:one)).last

      assert_equal audit.operation, 'create'
      assert audit.fields.key?('election_id')
    end
  end

  describe 'after update' do
    it 'creates an audit with updated information' do
      voter.update name: 'Updated Name'

      audit = Audit.with_auditable(voter).last

      assert_equal audit.operation, 'update'
      assert audit.fields.key?('name')
    end
  end

  describe 'after destroy' do
    it 'creates an audit with updated information' do
      voter.destroy

      audit = Audit.with_auditable(voter).last

      assert_equal audit.operation, 'destroy'
    end
  end

  describe 'after commit' do
    it 'updates the created audit with election relation' do
      voter.save

      audit = Audit.with_auditable(voter).last

      assert_equal audit.entity, voter.election
    end
  end
end
