require('json')

class Player
  def initialize
    @src = '../../database/player.json'
    file = File.open(@src)
    content = file.read
    @json = JSON.parse(content)
  end
  def isPlayer(id)
    players = @json.to_s.include? id
    if players == false
      temp = {
        "id": id,
        "health": 100,
	"power": 5,
	"defense": 0,
	"inventory": {
	  "axe": {
	    "count": 0,
	    "durability": 20
	  }
	},
        "equipment": {
	  "armor": {
	    "used": false,
	    "durability": 45
	  }
	}
      }
      @json["data"] << temp
      File.open(@src, 'w') do |f|
        f.puts JSON.pretty_generate(@json)
      end
      return true
    else
      return true
    end
  end
  def isAlive(id)
    inc = @json.to_s.include? id
    if inc == false
      isPlayer(id)
      return true
    else
      @json["data"].index {|h|
        health = @json["data"]["#{h["id"] == id}".to_i]["health"]
        return health > 0
      }
    end
  end
  def get_health(id)
    inc = @json.to_s.include? id
    if inc == false
      isPlayer(id)
      return 100
    else
      @json["data"].index {|h|
        return @json["data"]["#{h["id"] == id}".to_i]["health"]
      }
    end
  end
  def get_power(id)
    @json["data"].index {|h|
      pos = h["id"] == id
      return @json["data"]["#{h["id"] == id}".to_i]["power"]
    }
  end
  def get_defense(id)
    @json["data"].index {|h|
      pos = h["id"] == id
      return @json["data"]["#{h["id"] == id}".to_i]["defense"]
    }
  end
  def get_item(id, item)
    @json["data"].index {|h|
      pos = h["id"] == id
      inventory = @json["data"]["#{h["id"] == id}".to_i]["inventory"]
      if item == "axe"
        axe = inventory["axe"]
        if axe["count"] > 1
	  durability = axe["durability"]
	  return "- Axe : #{axe["count"]}\n-> Durability : ${durability}"
	else
	  return false
        end
      end
    }
  end
  def add_item(id, item, amount)
    @json["data"].index {|h|
      pos = h["id"] == id
      inventory = @json["data"]["#{h["id"] == id}".to_i]["inventory"]
      if item == "axe"
        if amount == nil
          inventory["axe"]["count"] += 1
        else
          begin
            floated = amount.to_f
            isNaN = floated.nan?
            if isNaN
              return "Not a number!"
            end
            inventory["axe"]["count"] += amount
            File.open(@src, 'w') do |f|
              f.puts JSON.pretty_generate(@json)
            end
            return "Added"
          rescue
            return "Not a number!"
          end
        end
      end
    }
  end
  def del_item(id, item, amount)
    @json["data"].index {|h|
      pos = h["id"] == id
      inventory = @json["data"]["#{h["id"] == id}".to_i]["inventory"]
      if item == "axe"
        if amount == nil
          inventory["axe"]["count"] -= 1
        else
          begin
            floated = amount.to_f
            isNaN = floated.nan?
            if isNaN
              return "Not a number!"
            end
            inventory["axe"]["count"] -= amount
            File.open(@src, 'w') do |f|
              f.puts JSON.pretty_generate(@json)
            end
            return "Deleted"
          rescue
            return "Not a number!"
          end
        end
      end
    }
  end
end
