module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :audits, as: :auditable

    after_create -> { create_audit 'create', previous_changes }
    after_update -> { create_audit 'update', saved_changes }
    after_destroy -> { create_audit 'destroy' }
  end

  private

  def create_audit(operation, changes = nil)
    Audit.create operation: operation, fields: changes, auditable: self
  end

  def add_association_to_audit(entity)
    audit = Audit.where(auditable: self).last
    audit.entity = entity
    audit.save(validate: false)
  end
end
