module GigsHelper

def delivery_time
  arr = []
  (1..29).to_a.each do |day|
    arr.push(pluralize(day, 'day'))
  end
  arr
end

def list_of_categories
  arr = []
  arr.push('Graphics & Design', 'Digital Marketing', 'Writing & Translation', 'Video & Animation', 'Music & Audio', 'Programming & Tech', 'Business', 'Fun & Lifestyle', 'Sports & Fitness', 'Photographer', 'Model')
  arr
end

end
