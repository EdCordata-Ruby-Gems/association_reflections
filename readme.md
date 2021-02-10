# Association Reflections (Rails)
This gem lets you access form parameters in your model.


<br/>


## Why would you want that?
- See associations marked for deletion
- See all form parameters


<br/>


## Installation
```ruby
gem 'association_reflections'
```


<br/>


## Full example
```ruby
class User < ApplicationRecord
  include AssociationReflections::Concern
  
  has_many :projects
  
  accepts_nested_attributes_for :projects, allow_destroy: true
  
  validate :validate_associations
  
  private
  
  def validate_associations
  
    reflection = self.association_reflections
    # => <AssociationReflections::Association>
  
    reflection.params
    # {
    #   "email"               => "",
    #   "projects_attributes" => {
    #     "0" => {
    #       "id"                    => "1",
    #       "name"                  => "",
    #       "_destroy"              => "1",
    #       "categories_attributes" => {
    #         "0" => {
    #           "name" => ""
    #         }
    #       }
    #     }
    #   }
    # }
    
  end
end
```
```ruby
class Project < ApplicationRecord
  belongs_to :user
  has_many   :categories
  
  accepts_nested_attributes_for :categories, allow_destroy: true
  
  validate :validate_associations
  
  private
  
  def validate_associations
    reflection = self.user.association_reflections
  end
  
end
```
```ruby
class Category < ApplicationRecord
  belongs_to :project
  
  validate :validate_associations
  
  private
  
  def validate_associations
    reflection = self.project.user.association_reflections
  end
  
end
```

<br/>


## Note
It must be noted that this only works when using `update` and `create`
methods.
