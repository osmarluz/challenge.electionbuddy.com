require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  let(:question) { questions(:one) }

  describe 'after create' do
    it 'creates an audit with new information' do
      audit = Audit.with_auditable(Question.create election: elections(:one)).last

      assert_equal audit.operation, 'create'
      assert audit.fields.key?('election_id')
    end
  end

  describe 'after update' do
    it 'creates an audit with updated information' do
      question.update name: 'Updated Name'

      audit = Audit.with_auditable(question).last

      assert_equal audit.operation, 'update'
      assert audit.fields.key?('name')
    end
  end

  describe 'after destroy' do
    it 'creates an audit with updated information' do
      question.destroy

      audit = Audit.with_auditable(question).last

      assert_equal audit.operation, 'destroy'
    end
  end

  describe 'after commit' do
    it 'updates the created audit with election relation' do
      question.save

      audit = Audit.with_auditable(question).last

      assert_equal audit.entity, question.election
    end
  end
end
