class Subject < User
  def signed_in?
    if current_subject
      true
    else
      false
    end
  end
end
