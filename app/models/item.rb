class Item < ActiveRecord::Base
	has_many :categories
	mount_uploader :portfolio_image, PortfolioImageUploader

	def self.delete_old_records
		items = Item.where('created_at < ?', 1.week.ago) #? los neerzetten is een stuk veiliger.

		items.each do |item|
			item.destroy
			#print item.url
		end

		UserMailer.cron_mail.deliver_now
	end

	def self.search(search)
		where("title LIKE ?", "%#{search}")
	end

end
