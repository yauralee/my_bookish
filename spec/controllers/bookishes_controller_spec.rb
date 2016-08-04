RSpec.describe BookishesController, type: :controller do
  render_views
  describe 'GET #index' do
    it 'should return bookishes' do
      bookish = FactoryGirl.create(:bookish)
      get :index
      expect(response).to be_success
      expect(JSON.parse(response.body).length).to eq(1)
      expect(json).to match([
                                {}
                            ])
    end
  end
  let(:json) { JSON.parse(response.body, symbolize_names: true) }
end
