# https://github.com/rails/rails/blob/20f60f276fe3d455b2a9b9fdd1f902fd00f3558e/activemodel/lib/active_model/dirty.rb
#
class Book
  attr_accessor :name
  include ActiveModel::Dirty
  define_attribute_methods :name

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
