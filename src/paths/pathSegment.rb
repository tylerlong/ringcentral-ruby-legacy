# parent class for all path segments
class PathSegment
  def initialize(rc)
    @_rc = rc
  end

  def segment
    ''
  end

  def endpoint
    if @parent
      temp = File.join(@parent.endpoint, segment, @id || '')
      temp = temp[0...-1] if temp.end_with? '/'
      temp
    else
      segment
    end
  end

  def rc
    if @parent
      @parent.rc
    else
      @_rc
    end
  end
end
