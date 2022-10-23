# frozen_string_literal: true



class ItemController < ApplicationController
  def index
    base_url = "https://us.api.blizzard.com/profile/wow/character"
    realm = params[:realm]
    character_name = params[:character_name]
    end_url = "equipment?namespace=profile-us&locale=en_US&access_token=#{token}"
    url = "#{base_url}/#{realm}/#{character_name}/#{end_url}"
    HTTParty.get(url).parsed_response
    puts params
    @items = Item.search(params[:search])
  end



  def item_params
    params.require(:item).permit(:name, :item_id, :item_class, :item_subclass, :search)
  end
end
