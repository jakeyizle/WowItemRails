# frozen_string_literal: true

client_id = "client_id=#{Rails.application.credentials.client_id}"
client_secret = "client_secret=#{Rails.application.credentials.client_secret}"
secret_body = "#{client_id}&#{client_secret}&grant_type=client_credentials"
@access_token = HTTParty.post("https://us.battle.net/oauth/token", {
                                body: secret_body,
                                headers: {
                                  "Content-Type" => "application/x-www-form-urlencoded"
                                }
                              }).parsed_response["access_token"]

def get_wow_api(endpoint)
  url = "https://us.api.blizzard.com/data/wow#{endpoint}?namespace=static-us&locale=en_US&access_token=#{@access_token}"
  HTTParty.get(url).parsed_response
end

zones = []
bosses = []
items = []
stats = []
get_wow_api("/journal-expansion/499")["dungeons"].each do |zone|
  zones.push({ zone_id: zone["id"], name: zone["name"] })
  get_wow_api("/journal-instance/#{zone['id']}")["encounters"].each do |boss|
    bosses.push({ boss_id: boss["id"], name: boss["name"], zone_id: zone["id"] })
    get_wow_api("/journal-encounter/#{boss['id']}")["items"].each do |item|
      item_id = item["item"]["id"]
      item_data = get_wow_api("/item/#{item_id}")["preview_item"]
      items.push({
                   boss_id: boss["id"],
                   item_id: item_data["item"]["id"],
                   name: item_data["name"],
                   item_class: item_data["item_class"]["id"],
                   item_subclass: item_data["item_subclass"]["id"],
                   item_type: item_data["inventory_type"]["name"]
                 })
      item_data["stats"]&.each do |stat|
        stats.push({
                     item_id: item_data["item"]["id"],
                     stat_type: stat["type"]["name"],
                     value: stat["value"]
                   })
      end
    end
  end
end

Zone.insert_all(zones)
Boss.insert_all(bosses)
Item.insert_all(items)
Stat.insert_all(stats)
