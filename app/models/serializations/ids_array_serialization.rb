class IdsArraySerialization
  
  def dump(ids)
    Array(ids).delete_if{|x| x == ''}.join(',')
  end

  def load(ids)
    ids.to_s.split(',').map(&:to_i)
  end


end
