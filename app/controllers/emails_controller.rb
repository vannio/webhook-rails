class EmailsController < ApplicationController
	def create
		p request.body.read
		# p JSON.parse(req)
	end
end
