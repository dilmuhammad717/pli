# frozen_string_literal: true

# This module provides helper methods for working with people-related views and controllers.
module PeopleHelper
  def normalize_address(address_json)
    address = "#{address_json['street']}, #{address_json['city']}, #{address_json['state']}, #{address_json['zip']}"
    address.gsub(', ,', ', ')
  end
end
