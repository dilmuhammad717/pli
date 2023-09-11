# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeopleHelper, type: :helper do
  describe PeopleHelper do
    describe 'format address' do
      it 'format address from json object' do
        expected_address = 'Street # 1, Lahore, Punjab, 5400'
        input_data = { 'street' => 'Street # 1', 'city' => 'Lahore', 'state' => 'Punjab', 'zip' => '5400' }
        expect(helper.normalize_address(input_data)).to eq(expected_address)
      end
    end
  end
end
