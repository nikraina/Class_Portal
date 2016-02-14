json.array!(@instructors) do |instructor|
  json.extract! instructor, :id
  json.url instructor_url(instructor, format: :json)
end
