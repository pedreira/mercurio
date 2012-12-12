class MediaTypesController < InheritedResources::Base

  before_filter :setup
  
  def setup
    authorize! :manage, @media_types
  end
  
  actions :index, :show, :edit, :update
  
end