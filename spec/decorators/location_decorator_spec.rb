require "rails_helper"

RSpec.describe LocationDecorator do
  subject(:decorator) { LocationDecorator.decorate(location) }
  let(:location) { build :location }

  describe "#full_address" do
    let(:location) do
      build_stubbed :location,
        street_address_1: street_1, street_address_2: street_2,
        city: city, state: state, zip_code: zip_code
    end
    let(:street_1) { "11 Beacon Street" }
    let(:street_2) { "Suite 1300" }
    let(:city) { "Boston" }
    let(:state) { "MA" }
    let(:zip_code) { "02108" }

    its(:full_address) { should eq "11 Beacon Street, Suite 1300\nBoston, MA 02108" }

    context "with no second line of street address" do
      let(:street_2) { nil }

      its(:full_address) { should eq "11 Beacon Street\nBoston, MA 02108" }
    end

    context "specifying the delimeter" do
      it "separates lines by the delimeter specified" do
        expect(decorator.full_address("-")).to eq "11 Beacon Street, Suite 1300-Boston, MA 02108"
      end
    end
  end
end
