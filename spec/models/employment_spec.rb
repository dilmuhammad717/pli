# frozen_string_literal: true

# spec/models/employment_spec.rb

require 'rails_helper'

RSpec.describe Employment, type: :model do
  subject(:employment) { described_class.new }

  it 'is valid with valid attributes' do
    person = Person.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      nickname: Faker::Name.name,
      email: Faker::Internet.free_email,
      phone: '555-111-5555'
    )
    employment.person = person
    employment.employer = 'Company XYZ'
    employment.date_started = Date.today - 1.month
    employment.date_ended = Date.today
    expect(employment).to be_valid
  end

  it 'is not valid without an employer' do
    employment.date_started = Date.today - 1.month
    employment.date_ended = Date.today
    expect(employment).not_to be_valid
  end

  it 'is not valid without a start date' do
    employment.employer = 'Company XYZ'
    employment.date_ended = Date.today
    expect(employment).not_to be_valid
  end

  it 'is not valid without an end date' do
    employment.employer = 'Company XYZ'
    employment.date_started = Date.today - 1.month
    expect(employment).not_to be_valid
  end

  it 'is not valid with an end date before the start date' do
    employment.employer = 'Company XYZ'
    employment.date_started = Date.today
    employment.date_ended = Date.today - 1.month
    expect(employment).not_to be_valid
  end

  context 'with 2 employments' do
    it "Create person and it's two employments" do
      person = Person.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        nickname: Faker::Name.name,
        email: Faker::Internet.free_email,
        phone: '555-111-5555'
      )
      employment1 = person.employments.create!(
        employer: Faker::Name.name,
        date_started: Date.today - 6.month,
        date_ended: Date.today
      )
      employment2 = person.employments.create!(
        employer: Faker::Name.name,
        date_started: Date.today - 1.year,
        date_ended: Date.today - 6.month
      )
      expect(person.reload.employments.count).to eq(2)
    end
  end
end
