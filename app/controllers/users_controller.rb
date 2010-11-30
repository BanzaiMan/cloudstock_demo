class UsersController < ApplicationController

  def set_content_type
    headers['Content-type'] = 'image/svg+xml'
  end

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
    color = params[:color] || 'red'

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
      format.svg {
        require 'java'
        require 'batik'

        java_import org.apache.batik.svggen.SVGGraphics2D
        java_import org.apache.batik.dom.GenericDOMImplementation

        dom = GenericDOMImplementation.getDOMImplementation
        svg_ns = 'http://www.w3.org/2000/svg'
        doc = dom.createDocument svg_ns, 'svg', nil
        svg_gen = SVGGraphics2D.new( doc )

        svg_gen.set_paint java.awt.Color.send(color)
        svg_gen.fill java.awt.Rectangle.new(10,10,100,100)

        out = java.io.StringWriter.new
        svg_gen.stream(out, true)
        render :inline =>  out.to_string
      }
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
