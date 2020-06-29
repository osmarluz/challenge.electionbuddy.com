class Voter < ApplicationRecord
  include Auditable

  belongs_to :election

  after_commit -> { add_association_to_audit(election) }
end
