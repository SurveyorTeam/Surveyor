@order = 0
@current_survey = 0
def question_manipulator
  if @current_survey == 0;
    @current_survey = rand(150)+Project.first.id
  end
  @order+=1
  new_survey = rand(5)
  if new_survey == 1
    @order = 1
    @current_survey = rand(150)+Project.first.id
  end
  q_arr = Array.new(6)
  tbr = rand(3)
  q_arr[0] = Faker::Company.catch_phrase
  if tbr == 0
    q_arr[1] = 0
  elsif tbr==1
    q_arr[1]=1
    q_arr[2] = 'Yes'
    q_arr[3] = 'No'
  else
    q_arr[1]=2
    q_arr[4]=1
    q_arr[5]=10
  end
end