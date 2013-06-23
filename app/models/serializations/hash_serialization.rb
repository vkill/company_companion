class HashSerialization
  
  def dump(hash)
    ::JSON.dump(hash || {})
  end

  def load(hash)
    HashWithIndifferentAccess.new ::JSON.load(hash || "{}")
  end


end
