class PropertiesController < ApplicationController
  def show
    @properties = Property.all
  end
end
