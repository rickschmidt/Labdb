class TaxonomiesController < ApplicationController

    helper_method :sort_column, :sort_direction
    helper :all
  # GET /taxonomies
  # GET /taxonomies.xml
  def index
    @per_page = params[:per_page] || 20

		if params[:term]
		    @taxonomies = Taxonomy.find(:all,:conditions => ['species LIKE ?', "#{params[:term]}%"])
		 else
	    	@taxonomies = Taxonomy.paginate(:per_page => @per_page, :page => params[:page])
	  	end



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taxonomies }
	format.json {render :json=>@taxonomies.to_json}
    end
  end

  # GET /taxonomies/1
  # GET /taxonomies/1.xml
  def show
    @taxonomy = Taxonomy.find(params[:id])
    @taxonomydnasamples=@taxonomy.dnasamples
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taxonomy }
    end
  end

  # GET /taxonomies/new
  # GET /taxonomies/new.xml
  def new
    @taxonomy = Taxonomy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @taxonomy }
    end
  end

  # GET /taxonomies/1/edit
  def edit
    @taxonomy = Taxonomy.find(params[:id])
  end

  # POST /taxonomies
  # POST /taxonomies.xml
  def create
    @taxonomy = Taxonomy.new(params[:taxonomy])

    respond_to do |format|
      if @taxonomy.save
        format.html { redirect_to(@taxonomy, :notice => 'Taxonomy was successfully created.') }
        format.xml  { render :xml => @taxonomy, :status => :created, :location => @taxonomy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @taxonomy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /taxonomies/1
  # PUT /taxonomies/1.xml
  def update
    @taxonomy = Taxonomy.find(params[:id])

    respond_to do |format|
      if @taxonomy.update_attributes(params[:taxonomy])
        format.html { redirect_to(@taxonomy, :notice => 'Taxonomy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @taxonomy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /taxonomies/1
  # DELETE /taxonomies/1.xml
  def destroy
    @taxonomy = Taxonomy.find(params[:id])
    @taxonomy.destroy

    respond_to do |format|
      format.html { redirect_to(taxonomies_url) }
      format.xml  { head :ok }
    end
  end
  
  def submitdnasample
          @taxonomy=Taxonomy.find(params[:taxonomyid]) 
     @dnasample=Dnasample.find(params[:taxonomy][:dnasamples])
     @taxonomy.dnasamples<<@dnasample
          flash[:notice] = "Added DNA Sample #{@dnasample.dna_accession} to #{@taxonomy.id}." 
        request.env["HTTP_REFERER"] ? (redirect_to :back) :(redirect_to :root) 
      
  end
  
    def removednasample
          @taxonomy=Taxonomy.find(params[:taxonomyid]) 
     @dnasample=Dnasample.find(params[:taxonomy][:dnasamples])
     @taxonomy.dnasamples.delete(@dnasample)
          flash[:notice] = "Removed DNA Sample #{@dnasample.dna_accession} to #{@taxonomy.id}." 
        request.env["HTTP_REFERER"] ? (redirect_to :back) :(redirect_to :root) 
      
  end
  
  
   private 
   def sort_column
       Taxonomy.column_names.include?(params[:sort]) ? params[:sort] : "id"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
end
