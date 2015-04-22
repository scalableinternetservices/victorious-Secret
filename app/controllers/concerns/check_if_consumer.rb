module CheckIfConsumer
	extend ActiveSupport::Concern
	private
	def check(id)
		
		
	rescue ActiveRecord::RecordNotFound
		new_consumer_url
	end
end