class DnasamplesController < ApplicationController
  # GET /dnasamples
  # GET /dnasamples.xml

  helper_method :sort_column, :sort_direction
   helper :all
   def index
		@per_page = params[:per_page]  ||= 10

       	@dnasamples=Dnasample.paginate(:page => params[:page], :per_page=>@per_page)
		@recent=Dnasample.order("updated_at DESC").limit(5)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dnasamples }
    end
  end

  # GET /dnasamples/1
  # GET /dnasamples/1.xml
  def show
    @dnasample = Dnasample.find(params[:id])


	@coords=geocode(@dnasample.location_collected)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dnasample }
    end
  end

  # GET /dnasamples/new
  # GET /dnasamples/new.xml
  def new
    @dnasample = Dnasample.new	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dnasample }
    end
  end

  # GET /dnasamples/1/edit
  def edit
	
    @dnasample = Dnasample.find(params[:id])


  end

  # POST /dnasamples
  # POST /dnasamples.xml
  def create
    	if (params[:dnasample][:taxonomies]!='')
    		params[:dnasample][:taxonomies]=[Taxonomy.find(params[:dnasample][:taxonomies])]
    	else
    		params[:dnasample][:taxonomies]=[]
    	end
        @dnasample = Dnasample.new(params[:dnasample])
        respond_to do |format|
          if @dnasample.save
    
    		# 	@dnasample.taxonomies<<@taxonomy
    		# end
    						
            format.html { redirect_to(@dnasample, :notice => 'Dnasample was successfully created.') }
            format.xml  { render :xml => @dnasample, :status => :created, :location => @dnasample }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @dnasample.errors, :status => :unprocessable_entity }
          end
        end
      end

  # PUT /dnasamples/1
  # PUT /dnasamples/1.xml
  def update
	if (params[:dnasample][:taxonomies]!='')
		params[:dnasample][:taxonomies]=[Taxonomy.find(params[:dnasample][:taxonomies])]
	else
		params[:dnasample][:taxonomies]=[]
	end
    @dnasample = Dnasample.find(params[:id])

    respond_to do |format|
      if @dnasample.update_attributes(params[:dnasample])
        format.html { redirect_to(@dnasample, :notice => 'Dnasample was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dnasample.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dnasamples/1
  # DELETE /dnasamples/1.xml
  def destroy
    @dnasample = Dnasample.find(params[:id])
    @dnasample.destroy

    respond_to do |format|
      format.html { redirect_to(dnasamples_url) }
      format.xml  { head :ok }
    end
  end
  
  def submitgene
     @dnasample=Dnasample.find(params[:dnasampleid]) 
     @gene=Gene.find(params[:dnasample][:genes])
     @dnasample.genes<<@gene
          flash[:notice] = "Added gene #{@gene.genbank} to DNA sample #{@dnasample.dna_accession}. " 
        request.env["HTTP_REFERER"] ? (redirect_to :back) :(redirect_to :root)
      
  end
  
  def removegene
     @dnasample=Dnasample.find(params[:dnasampleid]) 
     @gene=Gene.find(params[:dnasample][:genes])
     @dnasample.genes.delete(@gene)
          flash[:notice] = "Removed gene #{@gene.genbank} to DNA sample #{@dnasample.dna_accession}. " 
        request.env["HTTP_REFERER"] ? (redirect_to :back) :(redirect_to :root)
  end
  private 
   def sort_column
       Project.column_names.include?(params[:sort]) ? params[:sort] : "date"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
end
