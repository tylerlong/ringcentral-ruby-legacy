require_relative './pathSegment'

# The starting segment of all endpoints
class Restapi < PathSegment
  def initialize(parent, id = nil)
    @parent = parent
    @id = id
  end

  def segment
    'restapi'
  end

  def get
    rc.get endpoint
  end
end
