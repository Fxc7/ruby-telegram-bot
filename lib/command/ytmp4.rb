require_relative '../helper'
require_relative '../webUrl'

class Ytmp4
  def initialize
    @ytmp4 = {}
  end

  private

  attr_accessor = :ytmp4

  def get_ytmp4(v)
    web = "yt2/video?url=#{v}"
    res = Request.new_request(Url.new.hadi_api(web))
    @ytmp4 = res['result']
  end

  public

  def display_ytmp4(url)
    get_ytmp4(url)
    @ytmp4
  end
end

Ytmp4.new.display_ytmp4('https://youtu.be/GIVqwuSetVw')
