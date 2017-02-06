class Delivery
  attr_accessor :planet,
                :shipment,
                :crates,
                :revenue,
                :pilot,
                :bonus

  def initialize(destination:, what_got_shipped:, number_of_crates:, money_we_made:)
      @planet = destination.downcase
      @shipment = what_got_shipped
      @crates = number_of_crates.to_f
      @revenue = money_we_made.to_f
      @bonus = revenue * 0.1
      @pilot = find_pilot
  end

  def find_pilot
    case planet
    when 'earth' then 'Fry'
    when 'mars' then 'Amy'
    when 'uranus' then 'Bender'
    else 'Leela'
  end


end

require 'csv'
deliveries = CSV.foreach("planet_express_logs.csv", headers: true, header_converters: :symbol)
end

new_delivery = []

data.each {|row| new_delivery << Delivery.new(row)}

pilot = "Fry"

sum = new_delivery.inject(0) {|sum, data| sum + deliveries.revenue}
puts sum

deliveries.group_by(&:pilot).each do |pilot, deliveries|

puts deliveries.select{|delivery| deliveries.pilot == pilot}.inject(0) {|sum, data| sum + data.bonus}

puts "#{pilot} is owed #{deliveries.inject(0) {|sum, deliveries|} sum + deliveries.bonus} bonus"

puts "#{pilot} made #{deliveries.count} deliveries"
end
