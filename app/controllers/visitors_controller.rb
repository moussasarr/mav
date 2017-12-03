class VisitorsController < ApplicationController
	def index
		@slides = Slide.all.where('id != ?', 1)
		@last_slide = Slide.last
		@first_slide = Slide.find(1)

	end 
end
