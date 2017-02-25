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


puts "Fry made #{deliveries.count {|trip| trip.pilot.include? "Fry"}} trips, and made #{deliveries.select { |deliveries| deliveries.find_pilot == "Fry" }.inject(0) { |sum, data| sum + data.bonus }} bonus"
puts "Amy made #{deliveries.count {|trip| trip.pilot.include? "Amy"}} trips, and made #{deliveries.select { |deliveries| deliveries.find_pilot == "Amy" }.inject(0) { |sum, data| sum + data.bonus }} bonus"
puts "Bender made #{deliveries.count {|trip| trip.pilot.include? "Bender"}} trips, and made #{deliveries.select { |deliveries| deliveries.find_pilot == "Bender" }.inject(0) { |sum, data| sum + data.bonus }} bonus"
puts "Leela made #{deliveries.count {|trip| trip.pilot.include? "Leela"}} trips, and made #{deliveries.select { |deliveries| deliveries.find_pilot == "Leela" }.inject(0) { |sum, data| sum + data.bonus }} bonus"
