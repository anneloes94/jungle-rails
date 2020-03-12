require 'rails_helper'

RSpec.feature "Visitor clicks on product in homepage", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

    end
  end

    # it block
    scenario "They can select the link and get forwarded to the View Product page" do
      # ACT
      visit root_path
      find_link('Details', match: :first).click
  
      # DEBUG
      save_screenshot
  
      #VERIFY
      expect(page).to have_css 'article.product-detail', count: 1
      save_screenshot
    end

end
