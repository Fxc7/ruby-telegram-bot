class Url
  def initialize
    @url = ''
  end

  def nekos(v)
    @url = "https://nekos.life/#{v}"
  end

  def hadi_api(v)
    @url = "http://hadi-api.herokuapp.com/api/#{v}"
  end
end
