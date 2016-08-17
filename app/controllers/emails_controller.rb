class EmailsController < ApplicationController
	skip_before_action  :verify_authenticity_token

	def create
		p JSON.parse(request.body.read)
		render inline: 'Webhook captured'
	end
end
