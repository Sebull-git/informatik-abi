# 2.1 Relationen überführen
Relation(PK, Attribut, ..., Fk#)

Verleih(vid, name, adresse)
Film(fid, title, laenge, fsk, original_sprache, vid#, gid#)
Schauspieler(sid, name, vorname, gebDatum)
Genre(gid, bezeichnung)
Trailer(tid, laenge, bezeichnung, sprache, fid#)
spieltIn(fid#, sid#)
