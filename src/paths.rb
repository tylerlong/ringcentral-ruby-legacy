require_relative './pathSegment'


# /restapi/v1.0
class Restapi < PathSegment
  def segment
    'restapi'
  end

  def dictionary
    Dictionary.new(@rc, self)
  end

  def get
    JSON.parse(getResponse)
  end
end


# /restapi/v1.0/dictionary
class Dictionary < PathSegment
  def segment
    'dictionary'
  end

  def country(id = nil)
    Country.new(@rc, self, id)
  end
end


# /restapi/v1.0/dictionary/country/46
class Country < PathSegment
  def segment
    'country'
  end

  def get
    JSON.parse(getResponse)
  end
end
