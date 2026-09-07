// ============================================================
// Movie Knowledge Graph - Seed Script
// Neo4j 5.18 compatible | Idempotent via MERGE + IF NOT EXISTS
// Order: Constraints -> Genres -> People -> Movies -> Relationships
// ============================================================

// ------------------------------------------------------------
// 1. Constraints (unique, idempotent)
// ------------------------------------------------------------
CREATE CONSTRAINT movie_title IF NOT EXISTS
FOR (m:Movie) REQUIRE m.title IS UNIQUE;

CREATE CONSTRAINT person_name IF NOT EXISTS
FOR (p:Person) REQUIRE p.name IS UNIQUE;

CREATE CONSTRAINT genre_name IF NOT EXISTS
FOR (g:Genre) REQUIRE g.name IS UNIQUE;

// ------------------------------------------------------------
// 2. Genres
// ------------------------------------------------------------
MERGE (genreSciFi:Genre {name: 'Sci-Fi'});
MERGE (genreAction:Genre {name: 'Action'});

// ------------------------------------------------------------
// 3. People
// ------------------------------------------------------------
MERGE (keanu:Person {name: 'Keanu Reeves'})
SET keanu.born = 1964;

MERGE (hugo:Person {name: 'Hugo Weaving'})
SET hugo.born = 1960;

MERGE (carrie:Person {name: 'Carrie-Anne Moss'})
SET carrie.born = 1967;

MERGE (laurence:Person {name: 'Laurence Fishburne'})
SET laurence.born = 1961;

MERGE (lana:Person {name: 'Lana Wachowski'})
SET lana.born = 1965;

MERGE (lilly:Person {name: 'Lilly Wachowski'})
SET lilly.born = 1967;

MERGE (joel:Person {name: 'Joel Silver'})
SET joel.born = 1952;

// ------------------------------------------------------------
// 4. Movies
// ------------------------------------------------------------
MERGE (matrix:Movie {title: 'The Matrix'})
SET matrix.released = 1999,
    matrix.tagline = 'Welcome to the Real World';

MERGE (johnwick:Movie {title: 'John Wick'})
SET johnwick.released = 2014,
    johnwick.tagline = "Don't set him off.";

MERGE (tbd:Movie {title: 'To Be Deleted'})
SET tbd.released = 2024;

// ------------------------------------------------------------
// 5. Relationships - HAS_GENRE
// ------------------------------------------------------------
MATCH (matrix:Movie {title: 'The Matrix'})
MATCH (sciFi:Genre {name: 'Sci-Fi'})
MERGE (matrix)-[:HAS_GENRE]->(sciFi);

MATCH (johnwick:Movie {title: 'John Wick'})
MATCH (action:Genre {name: 'Action'})
MERGE (johnwick)-[:HAS_GENRE]->(action);

// ------------------------------------------------------------
// 6. Relationships - ACTED_IN (with roles)
// ------------------------------------------------------------
MATCH (keanu:Person {name: 'Keanu Reeves'})
MATCH (matrix:Movie {title: 'The Matrix'})
MERGE (keanu)-[:ACTED_IN {roles: ['Neo']}]->(matrix);

MATCH (hugo:Person {name: 'Hugo Weaving'})
MATCH (matrix:Movie {title: 'The Matrix'})
MERGE (hugo)-[:ACTED_IN {roles: ['Agent Smith']}]->(matrix);

MATCH (carrie:Person {name: 'Carrie-Anne Moss'})
MATCH (matrix:Movie {title: 'The Matrix'})
MERGE (carrie)-[:ACTED_IN {roles: ['Trinity']}]->(matrix);

MATCH (laurence:Person {name: 'Laurence Fishburne'})
MATCH (matrix:Movie {title: 'The Matrix'})
MERGE (laurence)-[:ACTED_IN {roles: ['Morpheus']}]->(matrix);

MATCH (keanu:Person {name: 'Keanu Reeves'})
MATCH (johnwick:Movie {title: 'John Wick'})
MERGE (keanu)-[:ACTED_IN {roles: ['John Wick']}]->(johnwick);

// ------------------------------------------------------------
// 7. Relationships - DIRECTED
// ------------------------------------------------------------
MATCH (lana:Person {name: 'Lana Wachowski'})
MATCH (matrix:Movie {title: 'The Matrix'})
MERGE (lana)-[:DIRECTED]->(matrix);

MATCH (lilly:Person {name: 'Lilly Wachowski'})
MATCH (matrix:Movie {title: 'The Matrix'})
MERGE (lilly)-[:DIRECTED]->(matrix);

// ------------------------------------------------------------
// 8. Relationships - PRODUCED
// ------------------------------------------------------------
MATCH (joel:Person {name: 'Joel Silver'})
MATCH (matrix:Movie {title: 'The Matrix'})
MERGE (joel)-[:PRODUCED]->(matrix);
