// Delete the placeholder movie 'To Be Deleted' and its relationships
MATCH (m:Movie {title: 'To Be Deleted'})
DETACH DELETE m;
