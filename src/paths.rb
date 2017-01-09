require_relative './pathSegment'


# The starting segment of all endpoints
class Restapi < PathSegment
  def segment
    'restapi'
  end

  def dictionary
    Dictionary.new(@rc, self)
  end
end


# /rest/v1.0/dictionary
class Dictionary < PathSegment
  def segment
    'dictionary'
  end
end
