json.array!(@reservations) do |reservation|
  json.title reservation.package.package_name + "/" + reservation.name
  json.start reservation.start_date
  json.end reservation.end_date
  json.url adminside_show_reservation_url(reservation.id, reservation: :html)
end