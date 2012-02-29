class TubesController < ApplicationController
	# GET /tubes
  	# GET /tubes.xml


  helper_method :sort_column, :sort_direction
  helper :all

  
  def index
      @per_page = params[:per_page] || 20

		if params[:term]

			@tubes=Tube.search(params[:term])
		 else
	    	@tubes = Tube.paginate(:per_page => @per_page, :page => params[:page])
	  	end



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tubes }
	format.json {render :json=>@tubes.to_json}
    end
  end

  # GET /tubes/1
  # GET /tubes/1.xml
  def show
    @tube = Tube.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tube }
    end
  end

  # GET /tubes/new
  # GET /tubes/new.xml
 def new
    @tube = Tube.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tube }
    end
  end
  # GET /tubes/1/edit
  def edit
    @tube = Tube.find(params[:id])
  end

  # POST /tubes
  # POST /tubes.xml
  def create
    @tube = Tube.new(params[:tube])

    respond_to do |format|
      if @tube.save
        format.html { redirect_to(@tube, :notice => 'Tube was successfully created.') }
        format.xml  { render :xml => @prime, :status => :created, :location => @tube}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tube.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tubes/1
  # PUT /tubes/1.xml
  def update
    @tube = Tube.find(params[:id])

    respond_to do |format|
      if @tube.update_attributes(params[:tube])
        format.html { redirect_to(@tube, :notice => 'Tube was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tube.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tubes/1
  # DELETE /tubes/1.xml
  def destroy
    @tube = Tube.find(params[:id])
    @tube.destroy

    respond_to do |format|
      format.html { redirect_to(tubes_url) }
      format.xml  { head :ok }
    end
  end

end
