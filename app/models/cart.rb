class Cart < ApplicationRecord
  # has_many() method is used to define a one-to-many relationship between the Cart model and the LineItem model. It came from the ActiveRecord module, which is included in the ApplicationRecord class.
  # The dependent: :destroy option is used to ensure that the removal of a cart will result in the removal of all of its associated line items. 'dependent:' is a parameter that can be passed to the has_many() method. It can take one of the following values: :destroy, :delete, :nullify, :restrict_with_exception, :restrict_with_error. In this case, :destroy is used to ensure that the removal of a cart will result in the removal of all of its associated line items.
  has_many :line_items, dependent: :destroy
end
