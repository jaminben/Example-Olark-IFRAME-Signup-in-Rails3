require 'open-uri'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def connect_to_olark
    @user = User.find(params[:id])
    # shows the Olark iframe
    @olark_code = @user.olark
    
    if not @olark_code
      # call olark's server
      olark_config = JSON.parse( open("https://integration.olark.com/prepare.json").read)
      @olark_code = Olark.create(
        :olark_key => olark_config['olark_key'], 
        :olark_secret => olark_config['olark_secret'], 
        :olark_html => olark_config['olark_html'],
        :user_id => @user.id       
      )
      @olark_code.save!
    end
    
    arguments = {
      :olark_key => @olark_code.olark_key,
      :olark_secret => @olark_code.olark_secret,
      :height => "640",
      :width => "480"
    }
    @olark_iframe_url = "https://integration.olark.com/setup.frame?#{arguments.to_query}"  
  end


  def show_olark
    @user = User.find(params[:id])
    @olark_include_code = @user.olark.olark_html
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
