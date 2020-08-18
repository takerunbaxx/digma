json.array!(@events) do |event|
  json.extract! event, :id, :day_title, :day_detail
  json.start event.day_start   
  json.end event.day_end
  json.url event_url(event, format: :html) 
end