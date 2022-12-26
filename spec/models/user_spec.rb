require 'rails_helper'

RSpec.describe User, type: :model do
  context "association test" do
    it "should has many corses" do
      t = User.reflect_on_association(:corses)
      expect(t.macro).to eq(:has_many)
    end
  end

  context "association test" do
    it "should has many corses" do
      t = User.reflect_on_association(:contacts)
      expect(t.macro).to eq(:has_many)
    end
  end
end
