require "rexml/document"
require "net/http"
class ApplicationController < ActionController::Base
  protect_from_forgery

	protected
	
	def layout_by_resource
    	if devise_controller?

	    else
	      "application"
	    end
  	end

def geocode(*args)
	args.delete_if{|a| a==""}
	x=args.join(",+")
	address=CGI.escape(x)
	
	response=Net::HTTP.get(URI.parse("http://maps.googleapis.com/maps/api/geocode/xml?address=#{address}&sensor=false"))
		logger.debug "response #{response.inspect}"
	# result=JSON.parse(response)
	# puts "json #{result['results'].class}"
	# 	result['results'].each do |r|
	# 		puts r.inspect
		# end
		xml_doc=REXML::Document.new(response)
		lng,lat ='',''
		xml_doc.root.elements.each('result/geometry/location/lng'){|node| lng=node.text}
		xml_doc.root.elements.each('result/geometry/location/lat'){|node| lat=node.text}
		#long=xml_doc('/result/geometry/location/lng').get_text
		coords={}
		coords['lng']=lng
		coords['lat']=lat
		return coords
	

end
	def ipad?
		request.user_agent =~/Mobile/
	end
	helper_method :ipad?
end



