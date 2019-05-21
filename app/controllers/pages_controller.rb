class PagesController < ApplicationController
  
  # shows all of the pages
  # Read
  def index
    @pages = Page.all
    # render index.html.erb
  end

  # shows a single page
  def show
    @page = Page.find(params[:id])
    # render show.html.erb
  end

  # shows the create form
  # new page in memory
  def new
    @page = Page.new
    # render new.html.erb
  end

  # POST
  # try add onto the database
  def create
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  # shows the edit form
  def edit

  end

  private
    def pages_params
    # attr_accessors
    # { page: { title: 'New' ... }}
      params.require(:page).permit(:title, :author, :body)
    end

end
