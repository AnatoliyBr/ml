CREATE (Vasileostrovskaya:station{name: 'Vasileostrovskaya'}),
(NevskyProspekt:station{name: 'Nevsky Prospekt'}),
(GostinyDvor:station{name: "Gostiny Dvor"}),
(Vasileostrovskaya)-[:CONNECTION {duration:4}]->(NevskyProspekt),
(NevskyProspekt)-[:CONNECTION {duration:4}]->(Vasileostrovskaya),
(NevskyProspekt)-[:CROSSING {duration:2}]->(GostinyDvor),
(GostinyDvor)-[:CROSSING {duration:2}]->(NevskyProspekt)

CREATE INDEX ON :station(name)

CREATE (C:course{name:'Big Data'}),
(S:course{name:'Statistics'}),
(E:person{name:'Elena'}),
(N:person{name:'Natalia'}),
(V:person{name:'Victoria'}),
(O:person{name:'Olga'}),
(Y:person{name:'Stas'}),
(A:person{name:'Anton'}),
(D:person{name:'Dan'}),
(E)-[:author]->(C),
(N)-[:author]->(C),
(A)-[:author]->(S),
(O)-[:speaker]->(C),
(Y)-[:editor]->(C),
(V)-[:designer]->(C),
(D)-[:speaker]->(S),
(S)-[:editor]->(S),
(V)-[:designer]->(S),
(D)-[:speaker]->(C)

MATCH (p:person {name: 'Elena'}) RETURN p

MATCH (p:person) WHERE p.name = 'Elena' RETURN p

MATCH (p:course {name: 'Statistics'}) <-[:author]-(person_node)
RETURN person_node.name

MATCH (p:course) <-[:author]-(person_node)
WHERE p.name = 'Statistics'
RETURN person_node.name

MATCH (p:course) <-[:author]-(person_node)
RETURN p.name, person_node.name
ORDER BY p.name, person_node.name

MATCH (p:Star) <-[:ORBIT*]-(orbit_node)
WHERE p.name = 'Sun'
RETURN orbit_node.name
ORDER BY orbit_node.name

MATCH (p:course) RETURN p.name
MATCH (p:person) -[:author]-> (course_node) RETURN p.name