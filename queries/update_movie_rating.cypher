// Update The Matrix rating to 8.7
MATCH (m:Movie {title: 'The Matrix'})
SET m.rating = 8.7
RETURN m.title AS title, m.rating AS rating;
