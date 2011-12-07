class GenesController < ApplicationController

  # GET /genes
  # GET /genes.xml
  def index
	@per_page = params[:per_page] || 20
		if params[:term]

			@genes=Gene.search(params[:term])
		 else
	    	@genes = Gene.paginate(:per_page => @per_page, :page => params[:page])
	  	end



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @genes }
	  format.json { render :json=>@genes.to_json}
    end
  end

  # GET /genes/1
  # GET /genes/1.xml
  def show
    @gene = Gene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gene }
    end
  end

  # GET /genes/new
  # GET /genes/new.xml
  def new
    @gene = Gene.new
    @primers=Primer.find(:all)
    @primer=Primer.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gene }
      format.js
    end
  end

  # GET /genes/1/edit
  def edit
    @gene = Gene.find(params[:id])
  end

  # POST /genes
  # POST /genes.xml
  def create
    @gene = Gene.new(params[:gene])
    
      if params[:gene][:primerl]!=""
        @primer=Primer.find(params[:gene][:primerl])
        @gene.primerl=@primer.primerl
    end
    
    if params[:gene][:primerh]!=""
        @primer=Primer.find(params[:gene][:primerh])
        @gene.primerh=@primer.primerh
    end
    respond_to do |format|
      if @gene.save
        format.html { redirect_to(@gene, :notice => 'Gene was successfully created.') }
        format.xml  { render :xml => @gene, :status => :created, :location => @gene }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gene.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /genes/1
  # PUT /genes/1.xml
  def update
    @gene = Gene.find(params[:id])
         
    respond_to do |format|
      

      if @gene.update_attributes(params[:gene])

        format.html { redirect_to(@gene, :notice => 'Gene was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gene.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.xml
  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy

    respond_to do |format|
      format.html { redirect_to(genes_url) }
      format.xml  { head :ok }
    end
  end
  
  def getprimerpair
      @primer=Primer.find(params[:id])
      @primerh=@primer.primerh
      @primerl=@primer.primerl

      # render :update do |page|
      #     page.replace "primerh", :object => @primerh
      # end
      flash[:notice] = "updating" 
      respond_to do |with|
            with.js
                    logger.debug "here"
                end

    end
    
    private 
   def sort_column
       Gene.column_names.include?(params[:sort]) ? params[:sort] : "date"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
end
