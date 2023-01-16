require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:api_key) }
    it { should validate_uniqueness_of(:email) }
    it { should have_many(:favorites) }
   end
end