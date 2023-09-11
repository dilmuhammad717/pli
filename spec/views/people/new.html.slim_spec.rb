# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/new', type: :view do
  before(:each) do
    assign(:person, Person.new(
                      address: '',
                      personal_info: '',
                      email: 'MyString'
                    ))
  end

  it 'renders new person form' do
    render

    assert_select 'form[action=?][method=?]', people_path, 'post' do
      assert_select 'input[name=?]', 'person[first_name]'
      assert_select 'input[name=?]', 'person[last_name]'
      assert_select 'input[name=?]', 'person[nickname]'
      assert_select 'input[name=?]', 'person[email]'
      assert_select 'input[name=?]', 'person[phone]'
      assert_select 'input[name=?]', 'person[street]'
      assert_select 'input[name=?]', 'person[city]'
      assert_select 'input[name=?]', 'person[state]'
      assert_select 'input[name=?]', 'person[zip]'
    end
  end
end
