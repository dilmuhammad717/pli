# frozen_string_literal: true

# spec/models/person_spec.rb

require 'rails_helper'

RSpec.describe Person, type: :model do
  subject(:person) { described_class.new }

  it 'is valid with valid attributes' do
    person.first_name = 'Dil'
    person.last_name = 'Muhammad'
    person.email = 'dilmuhammad717@gmail.com'
    person.phone = '123-456-7890'
    expect(person).to be_valid
  end

  it 'is not valid without a first name' do
    person.last_name = 'Muhammad'
    expect(person).not_to be_valid
  end

  it 'is not valid without a last name' do
    person.first_name = 'Dil'
    expect(person).not_to be_valid
  end

  it 'is not valid with a long first name' do
    person.first_name = 'D' * 26
    expect(person).not_to be_valid
  end

  it 'is not valid with a long last name' do
    person.last_name = 'M' * 51
    expect(person).not_to be_valid
  end

  it 'is valid without a nickname' do
    person.first_name = 'Dil'
    person.last_name = 'Muhammad'
    person.email = 'dilmuhammad717@gmail.com'
    person.phone = '123-456-7890'
    expect(person).to be_valid
  end

  it 'is not valid without an email' do
    person.first_name = 'Dil'
    person.last_name = 'Muhammad'
    person.phone = '123-456-7890'
    expect(person).not_to be_valid
  end

  it 'is not valid without a valid email format' do
    person.first_name = 'Dil'
    person.last_name = 'Muhammad'
    person.email = 'dilmuhammad717'
    person.phone = '123-456-7890'
    expect(person).not_to be_valid
  end

  it 'is not valid without a phone number' do
    person.first_name = 'Dil'
    person.last_name = 'Muhammad'
    person.email = 'dilmuhammad717@gmail.com'
    expect(person).not_to be_valid
  end

  it 'is not valid without a valid phone number format' do
    person.first_name = 'Dil'
    person.last_name = 'Muhammad'
    person.email = 'dilmuhammad717@gmail.com'
    person.phone = '123456789'
    expect(person).not_to be_valid
  end

  it 'compiles personal info correctly' do
    person.first_name = 'Dil'
    person.last_name = 'Muhammad'
    person.nickname = 'DM'
    person.phone = '123-456-7890'
    person.compile_personal_info
    expect(person.personal_info).to eq({ 'name' => 'Dil Muhammad', 'nickname' => 'DM', 'phone' => '123-456-7890' })
  end

  it 'compiles address correctly' do
    person.street = 'street # 1'
    person.city = 'Lahore'
    person.state = 'Punjab'
    person.zip = '5400'
    person.compile_personal_info
    expect(person.address).to eq({ 'street' => 'street # 1', 'city' => 'Lahore', 'state' => 'Punjab', 'zip' => '5400' })
  end
end
