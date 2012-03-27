class Pcr < ActiveRecord::Base
	belongs_to :dnasample
  	has_and_belongs_to_many :projects ,:uniq => true
	has_many :tubes
	
	accepts_nested_attributes_for :tubes, :allow_destroy=>true


	def self.project(term)
		@project=Project.find(term)
		pcrs = @project.pcrs
		return pcrs
	end
	
	def self.search(term)
		pcrs=Pcr.arel_table
		pcrs =Pcr.where(pcrs[:pcr_tube_number].matches("%#{term}%"))
		puts "pcrs #{pcrs.inspect}"
		return pcrs
	end
	
	def self.add_tubes(params,pcr)
		tubeTransactions={:yes=>[],:no=>[]}
		if params[:pcr][:tubesToAdd].include? ","
			tubes=params[:pcr][:tubesToAdd]
			tubesSplit=tubes.split(',')
			tubesSplit.each do |tube| 
				if Tube.exists?(tube)
					@t=Tube.find(tube)
					pcr.tubes<<@t
					tubeTransactions[:yes]<<tube
				else
					tubeTransactions[:no]<<tube
				end


			end
		elsif params[:pcr][:tubesToAdd].include? "-"
			tubes=params[:pcr][:tubesToAdd]
			tubesSplit=tubes.split('-')
			currentTube=tubesSplit[0].to_i
			lastTube=tubesSplit[1].to_i
			while currentTube<=lastTube
				if Tube.exists?(currentTube)
					t=Tube.find(currentTube)
					pcr.tubes<<t
					tubeTransactions[:yes]<<currentTube
				else
					tubeTransactions[:no]<<currentTube
				end
				currentTube=currentTube+1
			end
		else params[:pcr][:tubesToAdd]
			currentTube=params[:pcr][:tubesToAdd]
			if Tube.exists?(currentTube)
				t=Tube.find(currentTube)
				pcr.tubes<<t
				tubeTransactions[:yes]<<currentTube
			else
				tubeTransactions[:no]<<currentTube
			end				
		end
		return tubeTransactions
	end
	
	def self.remove_tubes(params,pcr)
		tubeTransactions={:yes=>[],:no=>[]}
		if params[:pcr][:tubesToRemove].include? ","
			tubes=params[:pcr][:tubesToRemove]
			tubesSplit=tubes.split(',')
			tubesSplit.each do |tube| 
				if Tube.exists?(tube)
					@t=Tube.find(tube)
					pcr.tubes.delete(@t)
					tubeTransactions[:yes]<<tube
				else
					tubeTransactions[:no]<<tube
				end
			end
		elsif params[:pcr][:tubesToRemove].include? "-"
			tubes=params[:pcr][:tubesToRemove]
			tubesSplit=tubes.split('-')
			currentTube=tubesSplit[0].to_i
			lastTube=tubesSplit[1].to_i
			while currentTube<=lastTube
				if Tube.exists?(currentTube)
					t=Tube.find(currentTube)
					pcr.tubes.delete(t)
					tubeTransactions[:yes]<<currentTube
				else
					tubeTransactions[:no]<<currentTube
				end
				currentTube=currentTube+1
			end
		elsif params[:pcr][:tubesToRemove].include? "all"

			pcr=Pcr.find(params[:id])
			if pcr.tubes
				pcr.tubes=[]
			end
		else params[:pcr][:tubesToRemove]
			currentTube=params[:pcr][:tubesToRemove]
			if Tube.exists?(currentTube)
				t=Tube.find(currentTube)
				pcr.tubes.delete(t)
				tubeTransactions[:yes]<<currentTube
			else
				tubeTransactions[:no]<<currentTube
			end				
		end		
		return tubeTransactions
	end
end
