# frozen_string_literal: true

# app/models/employment.rb
class Employment < ApplicationRecord
  belongs_to :person, inverse_of: :employments
  validates_presence_of :employer, :date_started, :date_ended, message: "can't be blank"
  validates_comparison_of :date_ended, greater_than_or_equal_to: :date_started,
                                       message: 'must be after or equal to the date started'
end
