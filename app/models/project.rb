class Project < ActiveRecord::Base
  has_and_belongs_to_many :pcrs, :uniq=>true
  has_many :dnasamples, :through=>:pcrs
  
  validates_presence_of :project_name
  validates_uniqueness_of :project_name
  accepts_nested_attributes_for :dnasamples, :allow_destroy=>true
  accepts_nested_attributes_for :pcrs, :allow_destroy=>true

  
  
  

	def self.search(term)
		projects=Project.arel_table
		projects = Project.where(projects[:project_name].matches("%#{term}%"))
		return projects
	end
	
	def self.add_pcrs(params,project)
		puts "params #{params.inspect}"
		puts "p project#{params[:project].inspect}"
		puts "p pcrs #{params[:project][:pcrs].inspect}"
		pcrTransactions={:yes=>[],:no=>[]}
		if params[:project][:pcrs].include? ","
			pcrs=params[:project][:pcrs]
			pcrsSplit=pcrs.split(',')
			pcrsSplit.each do |pcr| 
				if Pcr.exists?(pcr)
					@p=Pcr.find(pcr)
					project.pcrs<<@p
					pcrTransactions[:yes]<<pcr
				else
					pcrTransactions[:no]<<pcr
				end
			puts "PcrTransactions #{pcrTransactions.inspect}"

			end
		elsif params[:project][:pcrs].include? "-"
			pcrs=params[:project][:pcrs]
			pcrsSplit=pcrs.split('-')
			currentPcr=pcrsSplit[0].to_i
			lastPcr=pcrsSplit[1].to_i
			while currentPcr<=lastPcr
				if Pcr.exists?(currentPcr)
					p=Pcr.find(currentPcr)
					project.pcrs<<p
					pcrTransactions[:yes]<<currentPcr
				else
					pcrTransactions[:no]<<currentPcr
				end
				currentPcr=currentPcr+1
			end
		else params[:project][:pcrs]
			puts "length 1"
			currentPcr=params[:project][:pcrs]
			if Pcr.exists?(currentPcr)
				p=Pcr.find(currentPcr)
				project.pcrs<<p
				pcrTransactions[:yes]<<currentPcr
			else
				pcrTransactions[:no]<<currentPcr
			end				
		end
		puts "PCR TRANS #{pcrTransactions.inspect}"
		return pcrTransactions
	end
	
	def self.remove_pcrs(params,project)
		pcrTransactions={:yes=>[],:no=>[]}
		if params[:project][:pcrsToRemove].include? ","
			pcrs=params[:project][:pcrsToRemove]
			pcrsSplit=pcrs.split(',')
			pcrsSplit.each do |pcr| 
				if Pcr.exists?(pcr)
					@p=Pcr.find(pcr)
					project.pcrs.delete(@p)
					pcrTransactions[:yes]<<pcr
				else
					pcrTransactions[:no]<<pcr
				end
			puts "PcrTransactions #{pcrTransactions.inspect}"

			end
		elsif params[:project][:pcrsToRemove].include? "-"
			pcrs=params[:project][:pcrsToRemove]
			pcrsSplit=pcrs.split('-')
			currentPcr=pcrsSplit[0].to_i
			lastPcr=pcrsSplit[1].to_i
			while currentPcr<=lastPcr
				if Pcr.exists?(currentPcr)
					p=Pcr.find(currentPcr)
					project.pcrs.delete(p)
					pcrTransactions[:yes]<<currentPcr
				else
					pcrTransactions[:no]<<currentPcr
				end
				currentPcr=currentPcr+1
			end
		else params[:project][:pcrsToRemove]
			currentPcr=params[:project][:pcrsToRemove]
			if Pcr.exists?(currentPcr)
				p=Pcr.find(currentPcr)
				project.pcrs.delete(p)
				pcrTransactions[:yes]<<currentPcr
			else
				pcrTransactions[:no]<<currentPcr
			end				
		end
		puts "PCR TRANS #{pcrTransactions.inspect}"
		return pcrTransactions
	end
end
