class GenresController < InheritedResources::Base

  before_filter :setup
  
  def setup
    authorize! :manage, @genres
  end
  
end
