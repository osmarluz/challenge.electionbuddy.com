class Election < ApplicationRecord
  include Auditable

  has_many :voters, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :user

  serialize :settings, Hash

  def visibility
    settings['visibility']
  end

  def visibility=(value)
    settings['visibility'] = value
  end

  def audits
    Audit.with_auditable(self)
         .or(Audit.with_entity(self))
         .descending_order_by_creation_date
  end
end
