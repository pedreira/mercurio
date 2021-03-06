class Person < ActiveRecord::Base

  validates_length_of :name, :minimum => 7
  
  default_scope order('name')
  scope :active, where(:status => true)
  
  def status_description
    self.status ? :active : :inactive
  end
  
  def is_active
    self.status
  end
  
  def is_active_and_has_email
    !(self.email.nil? or self.email.empty?) and self.is_active
  end
  
  def self.search(query, page = 1)    
    if query
      Person.where('upper(name) LIKE upper(:query) or birth_date LIKE upper(:query)', :query => "%#{query}%").paginate :page => page, :per_page => 50
    else
      Person.paginate :page => page, :per_page => 50
    end
  end
  
end