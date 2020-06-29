class Answer < ApplicationRecord
  include Auditable

  belongs_to :question

  after_commit -> { add_association_to_audit(question.election) }
end
