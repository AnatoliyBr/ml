CREATE (C:course{name:'Big Data'}),
(S:course{name:'Clustering Algorithms'}),
(I:course{name:'Data Processing'}),
(E:person{name:'Elena'}),
(N:person{name:'Natalia'}),
(V:person{name:'Victoria'}),
(O:person{name:'Olga'}),
(St:person{name:'Stas'}),
(A:person{name:'Andrey'}),
(D:person{name:'Dan'}),
(Al:person{name:'Alex'}),
(Dm:person{name:'Dmitry'}),
(K:person{name:'Katarina'}),
(Elena:student{name:'Lily'}),
(Nina:student{name:'Nina'}),
(Victor:student{name:'Victor'}),
(Olga:student{name:'Olga'}),
(Stas:student{name:'Stas'}),
(Anna:student{name:'Teresa'}),
(Denis:student{name:'Denis'}),
(Alexandr:student{name:'Alexandr'}),
(Dmitry:student{name:'Dmitry'}),
(Konstantin:student{name:'Konstantin'}),
(Roman:student{name:'Roman'}),
(Ilia:student{name:'Ilia'}),
(E)-[:author]->(C),
(N)-[:author]->(C),
(A)-[:author]->(S),
(A)-[:author]->(I),
(Al)-[:author]->(I),
(Dm)-[:author]->(I),
(O)-[:speaker]->(C),
(St)-[:editor]->(C),
(V)-[:designer]->(C),
(D)-[:speaker]->(S),
(St)-[:editor]->(S),
(V)-[:designer]->(S),
(D)-[:speaker]->(I),
(St)-[:editor]->(I),
(K)-[:designer]->(I),
(Elena)-[:learn]->(I),
(Elena)-[:learn]->(C),
(Nina)-[:learn]->(S),
(Nina)-[:learn]->(C),
(Victor)-[:learn]->(S),
(Victor)-[:learn]->(C),
(Olga)-[:learn]->(S),
(Olga)-[:learn]->(C),
(Stas)-[:learn]->(I),
(Stas)-[:learn]->(C),
(Stas)-[:learn]->(S),
(Anna)-[:learn]->(I),
(Anna)-[:learn]->(C),
(Anna)-[:learn]->(S),
(Denis)-[:learn]->(I),
(Alexandr)-[:learn]->(C),
(Alexandr)-[:learn]->(S),
(Dmitry)-[:learn]->(I),
(Dmitry)-[:learn]->(C),
(Konstantin)-[:learn]->(S),
(Roman)-[:learn]->(C),
(Ilia)-[:learn]->(C)

MATCH (p:student)-[:learn]->(course)
WHERE course.name = 'Big Data'
RETURN p.name
ORDER BY p.name

MATCH (p:student)-[:learn]->(course)
WHERE course.name = 'Clustering Algorithms'
RETURN p.name
ORDER BY p.name

Alexandr, Konstantin, Nina, Olga, Stas, Teresa, Victor