// Create V for Vendetta and connect Hugo Weaving (+ Wachowskis as directors)
// Idempotent via MERGE; safe to run multiple times

MERGE (m:Movie {title: 'V for Vendetta'})
SET m.released = 2005,
    m.tagline = 'People should not be afraid of their governments. Governments should be afraid of their people.';

MATCH (p:Person {name: 'Hugo Weaving'})
MATCH (m:Movie {title: 'V for Vendetta'})
MERGE (p)-[:ACTED_IN {roles: ['V']}]->(m);

MATCH (lana:Person {name: 'Lana Wachowski'})
MATCH (m:Movie {title: 'V for Vendetta'})
MERGE (lana)-[:DIRECTED]->(m);

MATCH (lilly:Person {name: 'Lilly Wachowski'})
MATCH (m:Movie {title: 'V for Vendetta'})
MERGE (lilly)-[:DIRECTED]->(m);
