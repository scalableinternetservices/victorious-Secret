module CheckIfConsumer
	extend ActiveSupport::Concern
	private
	def check
		
		consumer_url
	rescue ActiveRecord::RecordNotFound
		new_consumer_url
	end
end