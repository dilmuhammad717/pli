# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeopleController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/people').to route_to('people#index')
    end

    it 'routes to #new' do
      expect(get: '/people/new').to route_to('people#new')
    end

    it 'routes to #create' do
      expect(post: '/people').to route_to('people#create')
    end
  end
end
