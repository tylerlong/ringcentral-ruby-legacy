require_relative './pathSegment'

# The starting segment of all endpoints
class Restapi < PathSegment
  def segment
    'restapi'
  end
end
