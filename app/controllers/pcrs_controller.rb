class PcrsController < ApplicationController
  # GET /pcrs
  # GET /pcrs.xml

    helper_method :sort_column, :sort_direction
    helper :all
  def index
		if params[:term]
			@pcrs=Pcr.search(params[:term])
		 elsif params[:project_id]
			@pcrs = Pcr.project(params[:project_id]).paginate(:per_page => @per_page, :page => params[:page])
		else
	    	@pcrs = Pcr.paginate(:per_page => @per_page, :page => params[:page])
	  	end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pcrs.to_xml(:include=>:tubes) }
	  format.json {render :json=>@pcrs.to_json}
    end
  end

  # GET /pcrs/1
  # GET /pcrs/1.xml
  def show
    @pcr = Pcr.find(params[:id])
    if @pcr.dnasample_id!=nil
      @dnasample=Dnasample.find(@pcr.dnasample_id)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pcr.to_xml(:include => :tubes) }
	  format.js {render :json=>@pcr.to_json}
 	

    end
  end

  # GET /pcrs/new
  # GET /pcrs/new.xml
  def new
    @pcr = Pcr.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pcr }
    end
  end

  # GET /pcrs/1/edit
  def edit
    @pcr = Pcr.find(params[:id])
  end

  # POST /pcrs
  # POST /pcrs.xml


  def create

	 
	@pcr = Pcr.new(params[:pcr])
	# if(params[:tube][:id])
	# 	@pcr.attributes={:tube=>@pcr.tube=(Tube.find(params[:tube][:id]))}
	# else
	# 	flash[:error] = "Must choose tube"
	# end
    respond_to do |format|
      if params[:dnasample][:id]
        @pcr.dnasample_id=params[:dnasample][:id]
      end
      
      if @pcr.save
        format.html { redirect_to(@pcr, :notice => 'Pcr was successfully created.') }
        format.xml  { render :xml => @pcr, :status => :created, :location => @pcr }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pcr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pcrs/1
  # PUT /pcrs/1.xml
	def update
 		@pcr = Pcr.find(params[:id])
		@tubeAddTransactions={}
		@tubeRemoveTransaction={}
		if params[:pcr]
			if params[:pcr][:tubesToAdd]
				@tubeAddTransactions=Pcr.add_tubes(params,@pcr)
				params[:pcr].delete :tubesToAdd
			end
			if params[:pcr][:tubesToRemove]
				@tubeRemoveTransactions=Pcr.remove_tubes(params,@pcr)
				params[:pcr].delete :tubesToRemove
			end
		end
		
		if params[:tubes]
			if params[:tubes][:primerID]
				Tube.createNewTube(params,@pcr)
				params[:tubes].delete :primerID
			end
		end

		


	    respond_to do |format|
			if @pcr.update_attributes(params[:pcr])
	        	format.html { redirect_to(@pcr) }
		        format.xml  { head :ok }
		    else
	        	format.html { render :action => "edit" }
	        	format.xml  { render :xml => @pcr.errors, :status => :unprocessable_entity }
	      	end
		end
  end


  # DELETE /pcrs/1
  # DELETE /pcrs/1.xml
  def destroy
    @pcr = Pcr.find(params[:id])
    @pcr.destroy

    respond_to do |format|
      format.html { redirect_to(pcrs_url) }
      format.xml  { head :ok }
    end
  end
  
  def getdnasample

     @pcr=Pcr.find(params[:pcrid])
     @dna=Dnasample.find(params[:id])
     @pcr.dnasamples<<@dna
     
     

      # render :update do |page|
      #     page.replace "primerh", :object => @primerh
      # end
      flash[:notice] = "updating" 
      respond_to do |with|
            with.js
    end 
  end
  
  def submitdnasample
       @pcr=Pcr.find(params[:pcrid])
     @dna=Dnasample.find(params[:pcr][:dnasamples])
     @pcr.dnasamples<<@dna
     flash[:notice] = "Added DNA Sample #{@dna.dna_accession} to PCR Tube #{@pcr.pcr_tube_number}" 
        request.env["HTTP_REFERER"] ? (redirect_to :back) :(redirect_to :root)
 end
 
 def removednasample
           @pcr=Pcr.find(params[:pcrid])
     @dna=Dnasample.find(params[:pcr][:dnasamples])
     @pcr.dnasamples.delete(@dna)
     flash[:notice] = "Removed DNA Sample #{@dna.dna_accession} to PCR Tube #{@pcr.pcr_tube_number}" 
        request.env["HTTP_REFERER"] ? (redirect_to :back) :(redirect_to :root)
 end
 
 def getprimersequence
    @primer=Primer.find(params[:id])
    
    respond_to do |with|
        with.js
        end 
     
 end

def getdnasamplestats
	@dnasample=Dnasample.find(params[:id])
	@taxonomy=@dnasample.taxonomy
	logger.debug "GETDNASAMPLESTATS"
	respond_to do |with|
		with.js
	end
end

def remove_tube_from_pcr
     pcr = Pcr.find(params[:pcr_id])
     tube = pcr.tubes.find(params[:tube_id])
     if tube
        pcr.tubes.delete(tube)
     end
	redirect_to pcr_url(pcr)
 end

  private 
   def sort_column
       Pcr.column_names.include?(params[:sort]) ? params[:sort] : "date"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
end
