require 'rails_helper'

RSpec.describe DealsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories/1/deals').to route_to('deals#index', category_id: '1')
    end

    it 'routes to #new' do
      expect(get: 'categories/1/deals/new').to route_to('deals#new', category_id: '1')
    end

    it 'routes to #show' do
      expect(get: 'categories/1/deals/1').to route_to('deals#show', id: '1', category_id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'categories/1/deals/1/edit').to route_to('deals#edit', id: '1', category_id: '1')
    end

    it 'routes to #create' do
      expect(post: 'categories/1/deals').to route_to('deals#create', category_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'categories/1/deals/1').to route_to('deals#update', id: '1', category_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'categories/1/deals/1').to route_to('deals#update', id: '1', category_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'categories/1/deals/1').to route_to('deals#destroy', id: '1', category_id: '1')
    end
  end
end
