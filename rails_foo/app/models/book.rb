# http://culttt.com/2015/11/11/what-is-active-model/
# https://github.com/rails/rails/blob/20f60f276fe3d455b2a9b9fdd1f902fd00f3558e/activemodel/lib/active_model/dirty.rb
# https://github.com/rails/rails/blob/20f60f276fe3d455b2a9b9fdd1f902fd00f3558e/activemodel/lib/active_model/serialization.rb
#
class Book
  attr_accessor :name
  include ActiveModel::Dirty
  include ActiveModel::Serialization
  include ActiveModel::Serializers::Xml
  define_attribute_methods :name

  def attributes
    { name: nil }
  end

  def name=(value)
    name_will_change! if value != @name
    @name = value
  end

  def save
    change_applied
  end

  def reload!
    clear_changes_information
  end

  def rollback!
    restore_attributes
  end
end
