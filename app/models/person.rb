# frozen_string_literal: true

# app/models/person.rb
class Person < ApplicationRecord
  has_many :employments, inverse_of: :person, dependent: :destroy
  attr_accessor :first_name, :last_name, :nickname, :phone, :street, :city, :state, :zip

  validates :first_name, presence: true, length: {
    maximum: 25, message: 'too long (maximum is 25 characters)'
  }
  validates :last_name, presence: true, length: {
    maximum: 50, message: 'too long (maximum is 50 characters)'
  }

  validates_presence_of :email, :phone
  validates_format_of :email,
                      with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, multiline: true,
                      message: 'invalid email address', unless: -> { email.blank? }
  validates_format_of :phone,
                      with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
                      message: 'invalid phone number', unless: -> { phone.blank? }

  after_validation :compile_personal_info

  accepts_nested_attributes_for :employments

  def compile_personal_info
    self.personal_info = { name: full_name, nickname: nickname, phone: phone }
    self.address = { street: street, city: city, state: state, zip: zip }
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
