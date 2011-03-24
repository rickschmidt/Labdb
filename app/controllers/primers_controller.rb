class PrimersController < ApplicationController
# GET /pcrs
  # GET /pcrs.xml
  def index
    @primers = Primer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @primers }
    end
  end

  # GET /pcrs/1
  # GET /pcrs/1.xml
  def show
    @primer = Primer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @primer }
    end
  end

  # GET /pcrs/new
  # GET /pcrs/new.xml
 def new
    @primer = Primer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @primer }
    end
  end
  # GET /pcrs/1/edit
  def edit
    @primer = Primer.find(params[:id])
  end

  # POST /pcrs
  # POST /pcrs.xml
  def create
    @primer = Primer.new(params[:primer])

    respond_to do |format|
      if @primer.save
        format.html { redirect_to(@primer, :notice => 'Primer was successfully created.') }
        format.xml  { render :xml => @primer, :status => :created, :location => @primer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @primer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pcrs/1
  # PUT /pcrs/1.xml
  def update
    @primer = Primer.find(params[:id])

    respond_to do |format|
      if @primer.update_attributes(params[:primer])
        format.html { redirect_to(@primer, :notice => 'Primer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @primer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pcrs/1
  # DELETE /pcrs/1.xml
  def destroy
    @primer = Primer.find(params[:id])
    @primer.destroy

    respond_to do |format|
      format.html { redirect_to(primerss_url) }
      format.xml  { head :ok }
    end
  end


end
