class PcrsController < ApplicationController
  # GET /pcrs
  # GET /pcrs.xml

    helper_method :sort_column, :sort_direction
    helper :all
  def index

    @per_page = params[:per_page] || Pcr.per_page || 10

      @pcrs=Pcr.paginate(:per_page => @per_page, :page => params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pcrs.to_xml(:include=>:tubes) }
    end
  end

  # GET /pcrs/1
  # GET /pcrs/1.xml
  def show
    @pcr = Pcr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pcr.to_xml(:include => :tubes) }
 	

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
	if(params[:tube][:id])
		@pcr.attributes={:tube=>@pcr.tube=(Tube.find(params[:tube][:id]))}
	else
		flash[:error] = "Must choose tube"
	end
    respond_to do |format|
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
    if(params[:tube][:id])
		@pcr.attributes={:tube=>@pcr.tube=(Tube.find(params[:tube][:id]))}
	end
	
    respond_to do |format|
      if @pcr.update_attributes(params[:pcr])
        format.html { redirect_to(@pcr, :notice => 'Pcr was successfully updated.') }
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
  private 
   def sort_column
       Pcr.column_names.include?(params[:sort]) ? params[:sort] : "date"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
end
