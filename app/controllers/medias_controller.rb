class MediasController < InheritedResources::Base
  
  def index
    authorize! :read, @medias
    @medias = Media.search(params[:query], params[:page])
  end
  
  def new
    authorize! :create, @medias
    @media_types = MediaType.all
    @genres = Genre.all
    super
  end 
  
  def create
    authorize! :create, @medias
    @media_types = MediaType.all
    @genres = Genre.all
    super
  end
  
  def edit
    authorize! :update, @medias
    @media_types = MediaType.all
    @genres = Genre.all
    super
  end
  
  def update
    authorize! :update, @medias
    @media_types = MediaType.all
    @genres = Genre.all
    super
  end
  
end
