SELECT reservations.*, properties.*, avg(rating) as average_rating
FROM reservations
  JOIN properties ON properties.id = reservations.property_id
  JOIN property_reviews ON property_reviews.property_id = reservations.property_id
WHERE reservations.guest_id = 1
GROUP BY reservations.id, properties.id, properties.title, cost_per_night
ORDER BY start_date DESC
LIMIT 10;