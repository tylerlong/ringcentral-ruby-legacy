# parent class for all path segments
class PathSegment
  def initialize(rc, parent, id = nil)
    @rc = rc
    @parent = parent
    @id = id
  end

  def segment
    ''
  end

  def endpoint
    result = segment
    if @parent
      result = File.join @parent.endpoint, result
    end
    if @id
      result = File.join result, @id
    end
    result
  end

  def getResponse(params = nil)
    @rc.get endpoint, params
  end

  def postResponse(payload, params = nil)
    @rc.post endpoint, payload, params
  end

  def putResponse(payload, params = nil)
    @rc.put endpoint, payload, params
  end

  def deleteResponse(params = nil)
    @rc.delete endpoint, params
  end
end
