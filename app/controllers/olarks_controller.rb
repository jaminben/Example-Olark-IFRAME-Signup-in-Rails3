class OlarksController < ApplicationController
  # GET /olarks
  # GET /olarks.xml
  def index
    @olarks = Olark.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @olarks }
    end
  end

  # GET /olarks/1
  # GET /olarks/1.xml
  def show
    @olark = Olark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @olark }
    end
  end

  # GET /olarks/new
  # GET /olarks/new.xml
  def new
    @olark = Olark.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @olark }
    end
  end

  # GET /olarks/1/edit
  def edit
    @olark = Olark.find(params[:id])
  end

  # POST /olarks
  # POST /olarks.xml
  def create
    @olark = Olark.new(params[:olark])

    respond_to do |format|
      if @olark.save
        format.html { redirect_to(@olark, :notice => 'Olark was successfully created.') }
        format.xml  { render :xml => @olark, :status => :created, :location => @olark }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @olark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /olarks/1
  # PUT /olarks/1.xml
  def update
    @olark = Olark.find(params[:id])

    respond_to do |format|
      if @olark.update_attributes(params[:olark])
        format.html { redirect_to(@olark, :notice => 'Olark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @olark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /olarks/1
  # DELETE /olarks/1.xml
  def destroy
    @olark = Olark.find(params[:id])
    @olark.destroy

    respond_to do |format|
      format.html { redirect_to(olarks_url) }
      format.xml  { head :ok }
    end
  end
end
