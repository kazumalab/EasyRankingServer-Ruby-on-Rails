class AppropriateValidator < ActiveModel::EachValidator
  REX_MATCH = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  def validate_each(record, attribute, value)
    record.errors.add attribute, 'Inappropriate string' unless value.match(REX_MATCH)
  end
end