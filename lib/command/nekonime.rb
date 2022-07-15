require_relative '../helper'
require_relative '../webUrl'

class Neko
  def initialize
    @neko = ''
  end

  def display_neko
    get_neko()
    neko
  end

  private

  attr_accessor :neko

  def get_neko
    web = "api/neko"
    res = Request.new_request(Url.new.nekos(web))
    @neko = res['neko']
  end
end
