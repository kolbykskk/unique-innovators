module GigsHelper

def delivery_time
  arr = []
  (1..29).to_a.each do |day|
    arr.push(pluralize(day, 'day'))
  end
  arr
end

end
