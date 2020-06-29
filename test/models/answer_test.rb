require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  let(:answer) { answers(:one) }

  describe 'after create' do
    it 'creates an audit with new information' do
      audit = Audit.with_auditable(Answer.create question: questions(:one)).last

      assert_equal audit.operation, 'create'
      assert audit.fields.key?('question_id')
    end
  end

  describe 'after update' do
    it 'creates an audit with updated information' do
      answer.update name: 'Updated Name'

      audit = Audit.with_auditable(answer).last

      assert_equal audit.operation, 'update'
      assert audit.fields.key?('name')
    end
  end

  describe 'after destroy' do
    it 'creates an audit with updated information' do
      answer.destroy

      audit = Audit.with_auditable(answer).last

      assert_equal audit.operation, 'destroy'
    end
  end

  describe 'after commit' do
    it 'updates the created audit with election relation' do
      answer.save

      audit = Audit.with_auditable(answer).last

      assert_equal audit.entity, answer.question.election
    end
  end
end
