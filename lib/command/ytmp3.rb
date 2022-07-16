require_relative '../helper'
require_relative '../webUrl'

class Ytmp3
  def initialize
    @ytmp3 = {}
  end

  private

  attr_accessor = :ytmp3

  def get_ytmp3(v)
    web = "yt2/audio?url=#{v}"
    res = Request.new_request(Url.new.hadi_api(web))
     @ytmp3 = res['result']
  end

  public

  def display_ytmp3(url)
    get_ytmp3(url)
    @ytmp3
  end
end
