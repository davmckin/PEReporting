require 'csv'
data = CSV.foreach("planet_express_logs.csv", headers: true, header_converters:
:symbol)

class Delivery
  attr_accessor :destination, :what_got_shipped, :number_of_crates, :money_we_made, :pilot

  def initialize(destination:, what_got_shipped:, number_of_crates:, money_we_made: pilot:)
    @destination = destination
    @what_got_shipped = what_got_shipped
    @number_of_crates = number_of_crates.to_f
    @money_we_made = money_we_made.to_f
    @pilot = pilot
  end
end

new_delivery = []

data.each {|row| new_delivery << Delivery.new(row)}

sum = new_delivery.inject(0) {|sum, data| sum + data.money_we_made}

planet = case object
when earth
  'fry'
when mars
  'amy'
when bender
  'uranus'
else
  'leela'
end
