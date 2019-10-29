class StaticPagesController < ApplicationController
  require 'will_paginate/array'

  def home
  end

  def photos
    @person = Flickr.people.find(params[:search][:id])
    @photos =  Flickr.photos.search(user_id: @person.id, page: params[:page], per_page: 21)
  end
end
