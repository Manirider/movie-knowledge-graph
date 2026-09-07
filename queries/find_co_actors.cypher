// Find co-actors who acted in The Matrix alongside Hugo Weaving (exclude Hugo)
MATCH (target:Person {name: 'Hugo Weaving'})-[:ACTED_IN]->(movie:Movie {title: 'The Matrix'})
MATCH (coActor:Person)-[:ACTED_IN]->(movie)
WHERE coActor <> target
RETURN coActor.name AS name
ORDER BY name;
