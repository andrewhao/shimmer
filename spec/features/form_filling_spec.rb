require "spec_helper"

RSpec.describe "form filling", type: :feature do
  before do
    visit "/form.html"
  end

  { text: "Artisanal kale",
    email: "bootstrap@example.com"
  }.each do |input_type, initial_value|
    context "#{input_type} inputs" do
      let(:selector) { "#example-#{input_type}-input" }
      it "reads value" do
        result = find(selector)
        expect(result.value).to eq initial_value
      end

      it "sets value" do
        find(selector).set("Foobar")
        updated_result = find(selector)
        expect(updated_result.value).to eq "Foobar"
      end

      it "sends_keys to set value" do
        find(selector).send_keys("Foobar")
        updated_result = find(selector)
        expect(updated_result.value).to eq "Foobar"
      end
    end
  end

  context "select dropdowns" do
  end
end
