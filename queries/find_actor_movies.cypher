// Find all movies Keanu Reeves acted in
MATCH (p:Person {name: 'Keanu Reeves'})-[:ACTED_IN]->(m:Movie)
RETURN m.title AS title
ORDER BY title;
