class PcrsController < ApplicationController
  # GET /pcrs
  # GET /pcrs.xml
  def index
    @pcrs = Pcr.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pcrs }
    end
  end

  # GET /pcrs/1
  # GET /pcrs/1.xml
  def show
    @pcr = Pcr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pcr }
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
end
