require 'rails_helper'

describe "a user can visit a vending machine page and see associated snacks and average price" do
  it "sees snacks price and average" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    kate = owner.machines.create(location: "Kate's Mixed Drinks")
    tim  = owner.machines.create(location: "Tim's Mixed Drinks")
    snack =Snack.create(name: 'yum', price: 1.00)
    snack_vend_1 = SnackVending.create(machine_id: dons.id, snack_id: snack.id)
    snack_vend_2 = SnackVending.create(machine_id: kate.id, snack_id: snack.id)
    snack_vend_3 = SnackVending.create(machine_id: tim.id, snack_id: snack.id)

    visit snack_path(snack)

    expect(page).to have_content (snack.name)
    expect(page).to have_content (snack.price)
    expect(page).to have_content ("Don's Mixed Drinks")
    expect(page).to have_content ("Kate's Mixed Drinks")
    expect(page).to have_content ("Tim's Mixed Drinks")
    expect(page).to have_content (dons.average_snack_price)
    expect(page).to have_content (kate.average_snack_price)
    expect(page).to have_content (tim.average_snack_price)
    expect(page).to have_content (dons.count_snacks)
    expect(page).to have_content (kate.count_snacks)
    expect(page).to have_content (tim.count_snacks)
    save_and_open_page
  end
end