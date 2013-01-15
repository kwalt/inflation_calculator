require 'csv'

class InflationCalculator
	def load_file
		@datafile = CSV.open('inflation_data.csv', {:headers => true, :header_converters => :symbol})
		@inflation_data = []
		@datafile.each do |line|
			@inflation_data << line
		end
		#puts @inflation_data
	end

	def get_variables
		puts "Please enter the year (1913 or later) that the original amount is from:"
		@year_original = gets.chomp.to_i
		puts "Please enter the target year for adjustment:"
		@year_adjusted = gets.chomp.to_i
		puts "Please enter the original dollar amount:"
		@amount_original = gets.chomp.delete("$").to_f
	end

	def calculate
		base_year = @inflation_data[0][0].to_i
		index_level_original = @inflation_data[@year_original-base_year][1].to_f
		index_level_adjusted = @inflation_data[@year_adjusted-base_year][1].to_f
		amount_adjusted = @amount_original*(index_level_adjusted/index_level_original)
		puts "$#{@amount_original} in #{@year_original} is equivalent to $#{amount_adjusted} in #{@year_adjusted}."
	end


end

palatial = InflationCalculator.new
palatial.get_variables
palatial.load_file
palatial.calculate