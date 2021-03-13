class PageView < Impression

	# TODO
	# 	Define Scope for Most popular pages, page ranks by count, by uniq count

	scope :for_type, -> (type) do
		where(impressionable_type: type)
	end

	def self.for_date_range(start_date, end_date)
		where(created_at: start_date.beginning_of_day..end_date.end_of_day)
	end

	def self.uniq_count_by_date(start_date, end_date)
		results = for_date_range(start_date, end_date)
			.select(:ip_address).distinct
			.group('date(created_at)').count

			with_zeros(start_date, end_date, results)
	end

	def self.count_by_date(start_date, end_date)
		results = for_date_range(start_date, end_date)
			.group('date(created_at)')
			.count
		with_zeros(start_date, end_date, results)
	end

	def self.with_zeros(start_date, end_date, results_hash)
		date_range = (start_date.to_date..end_date.to_date).map do |date|
			date.strftime('%Y-%m-%d')
		end
		hash_with_zeros = {}
		date_range.each do |date|
			hash_with_zeros[date] = results_hash[date] || 0
		end
		hash_with_zeros
	end
	
end