class Audit < ApplicationRecord
  belongs_to :auditable, polymorphic: true
  belongs_to :entity, polymorphic: true, optional: true

  scope :with_auditable, -> (auditable) { where(auditable: auditable) }
  scope :with_entity, -> (entity) { where(entity: entity) }
  scope :descending_order_by_creation_date, -> { order(created_at: :desc) }

  def formatted_fields
    fields&.except('id', 'created_at', 'updated_at')&.map do |key, value|
      "#{key.split('_').map(&:capitalize).join(' ')} was changed from #{value.first.present? ? value.first : 'EMPTY'} to #{value.second}"
    end
  end
end
