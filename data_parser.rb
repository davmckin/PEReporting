require 'csv'
data = CSV.foreach("planet_express_logs.csv", headers: true, header_converters:
:symbol)

class Delivery
  attr_accessor :destination, :what_got_shipped, :number_of_crates, :money_we_made, :pilot, :bonus

  def initialize(destination:, what_got_shipped:, number_of_crates:, money_we_made:)
    @destination = destination.downcase
    @what_got_shipped = what_got_shipped
    @number_of_crates = number_of_crates.to_f
    @money_we_made = money_we_made.to_f
    @pilot = find_pilot
    @bonus = find_bonus
  end


def find_pilot
  case destination
  when 'earth' then 'fry'
  when 'mars' then 'amy'
  when 'uranus' then 'bender'
  else 'leela'
  end
end
end

new_delivery = []

data.each {|row| new_delivery << Delivery.new(row)}

sum = new_delivery.inject(0) {|sum, data| sum + data.money_we_made}
puts sum

group_by_pilot = new_delivery.group_by {|job| job.pilot}

group_by_pilot.select{|name| name.pilot.include? }
