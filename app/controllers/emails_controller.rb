class EmailsController < ApplicationController
	skip_before_action  :verify_authenticity_token

	def create
		unless(request.body.read.empty?)
			data = JSON.parse(request.body.read)
			params = {
				address: data['Address'],
				category: data['EmailType'],
				event: data['Event']
			}

			Email.create(params)
			render inline: 'Webhook captured'
		else
			raise 'Error capturing webhook'
		end
	end
end
