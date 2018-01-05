require 'rails_helper'

describe "a user can visit a vending machine page and see associated snacks and average price" do
  it "sees snacks price and average" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack =Snack.create(name: 'yum', price: 1.00)
    snack_2 = Snack.create(name: 'hot', price: 2.00)
    snack_3 = Snack.create(name: 'spicy', price: 3.00)
    snack_vend_1 = SnackVending.create(machine_id: dons.id, snack_id: snack.id)
    snack_vend_2 = SnackVending.create(machine_id: dons.id, snack_id: snack_2.id)
    snack_vend_3 = SnackVending.create(machine_id: dons.id, snack_id: snack_3.id)

    visit machine_path(dons)

    expect(page).to have_content("yum: 1.0")
    expect(page).to have_content("hot: 2.0")
    expect(page).to have_content("spicy: 3.0")
    expect(page).to have_content ("Avg Price: 2.0")
  end
end