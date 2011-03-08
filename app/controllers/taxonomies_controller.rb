class TaxonomiesController < ApplicationController
    before_filter :require_user
    helper_method :sort_column, :sort_direction
    helper :all
  # GET /taxonomies
  # GET /taxonomies.xml
  def index
    @per_page = params[:per_page] || Experiment.per_page || 10
    @search=Taxonomy.search(params[:search])
    @taxonomies=@search.find(:all,:order=>(sort_column + " "+ sort_direction)).paginate(:per_page => @per_page, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taxonomies }
    end
  end

  # GET /taxonomies/1
  # GET /taxonomies/1.xml
  def show
    @taxonomy = Taxonomy.find(params[:id])

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
  
  
   private 
   def sort_column
       Taxonomy.column_names.include?(params[:sort]) ? params[:sort] : "id"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
end
