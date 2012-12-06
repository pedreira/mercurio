class PeopleController < InheritedResources::Base

  def index
    @people = Person.search(params[:query], params[:page])
  end
  
  def new
    @status = true
    super
  end
  
  def emails
    @people = Person.all
  end

end