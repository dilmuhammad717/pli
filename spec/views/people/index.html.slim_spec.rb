# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/index', type: :view do
  before(:each) do
    assign(:people, [
             Person.create!(
               first_name: 'Dil', last_name: 'Muhammad', nickname: 'DM', phone: '111-222-3333',
               street: 'Street #1', city: 'Lahore', state: 'Punjab', zip: '5400',
               email: 'dilmuhammad717@gmail.com'
             ),
             Person.create!(
               first_name: 'Dil', last_name: 'Muhammad', nickname: 'DM', phone: '111-222-3333',
               street: 'Street #1', city: 'Lahore', state: 'Punjab', zip: '5400',
               email: 'dil@gmail.com'
             )
           ])
  end

  it 'renders a list of people' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'tr>td' : 'div>p'
    assert_select cell_selector, text: Regexp.new('Dil Muhammad'), count: 2
    assert_select cell_selector, text: Regexp.new('111-222-3333'), count: 2
    assert_select cell_selector, text: Regexp.new('dilmuhammad717@gmail.com'), count: 1
    assert_select cell_selector, text: Regexp.new('dil@gmail.com'), count: 1
  end
end
