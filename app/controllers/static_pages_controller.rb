class StaticPagesController < ApplicationController
  def home
  end

  def photos
    @person = Flickr.people.find(params[:search][:id])
    @photos =  Flickr.photos.search(user_id: @person.id)
  end
end
