require 'csv'

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
    @crates = number_of_crates.to_i
    @revenue = money_we_made.to_i
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
end

deliveries = CSV.foreach('planet_express_logs.csv', headers: true, header_converters: :symbol).collect { |row| Delivery.new(row) }

puts "We made #{deliveries.inject(0) { |sum, data| sum + data.revenue }} this week"


puts deliveries.select { |deliveries| deliveries.find_pilot == pilot }.inject(0) { |sum, data| sum + data.bonus }

puts "#{pilot} made #{deliveries.count} deliveries"

deliveries.group_by(&:pilot).each do |pilot, deliveries|
end
