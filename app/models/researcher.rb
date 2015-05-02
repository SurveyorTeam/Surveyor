class Researcher < User
  def signed_in?
    if self
      true
    else
      false
    end
  end
end
