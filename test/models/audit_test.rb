require 'test_helper'

class AuditTest < ActiveSupport::TestCase
  let(:election_audit) { audits :election }
  let(:answer_audit) { audits :answer }
  let(:election) { election_audit.auditable }
  let(:answer) { answer_audit.auditable }

  describe '.with_auditable' do
    describe 'when the auditable is an election' do
      it 'returns the election audits' do
        assert_includes Audit.with_auditable(election), election_audit
      end
    end

    describe 'when the auditable is an answer' do
      it 'returns the answer audits' do
        assert_includes Audit.with_auditable(answer), answer_audit
      end
    end
  end

  describe '.with_entity' do
    describe 'when the entity is an election' do
      it 'returns the answer audits' do
        assert_includes Audit.with_entity(election), answer_audit
      end
    end

    describe 'when the entity is an answer' do
      it 'returns empty' do
        assert_empty Audit.with_entity(answer)
      end
    end
  end

  describe '.descending_order_by_creation_date' do
    it 'returns the audits sorted' do
      assert_equal Audit.descending_order_by_creation_date, Audit.all.order(created_at: :desc)
    end
  end

  test '#formatted_fields' do
    describe 'when fields are empty' do
      let(:election_with_empty_fields) { audits :election_with_empty_fields }

      it 'returns empty' do
        assert_empty election_with_empty_fields.formatted_fields
      end
    end

    describe 'when fields are present' do
      it 'formats the fields' do
        assert_includes election_with_empty_fields.formatted_fields,
          "Name was changed from EMPTY to Election 1"
      end
    end
  end
end
