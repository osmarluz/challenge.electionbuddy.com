class Question < ApplicationRecord
  include Auditable

  belongs_to :election
  has_many :answers, dependent: :destroy

  after_commit -> { add_association_to_audit(election) }
end
