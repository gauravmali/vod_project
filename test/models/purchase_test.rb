require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test "Create an Purchase successfully" do
    purchase = purchases(:one)
    assert purchase
  end

  test "Do not create Purchase without quality and user" do
    purchase = Purchase.new(price: "2.99")
    assert_not purchase.save
  end

  test "save_validity" do
    purchase = Purchase.new(price: "2.99")
    assert purchase.send(:save_validity)
  end

  test "alive?" do
    purchase = purchases(:one)
    assert_same false, purchase.alive?
  end
end
