// Top 5 people by total relationship degree (undirected)
// Neo4j 5.18 compatible: counts all incident relationships correctly
MATCH (p:Person)
OPTIONAL MATCH (p)-[r]-()
RETURN p.name AS name, count(r) AS degree
ORDER BY degree DESC, name ASC
LIMIT 5;
