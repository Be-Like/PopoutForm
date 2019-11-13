10.times do |n|
  Event.create(name: "Event #{n + 1}")
end

InfoForm.create(name: 'Person One', event: Event.last)
