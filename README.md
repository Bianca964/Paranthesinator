
# TASK 1 - CHECK_PARANTHESIS
        Prima functie implementata este cea de testare a unui sir de paranteze
    daca sunt corect potrivite, returnand 0 daca paranteze sunt corect potrivite
    si 1 in caz contrar . Functia `int check_parantheses(char *str)` utilizeaza
    stiva pentru verificarea parantezelor, tratand separat fiecare tip de
    paranteza. Dupa ce am incarcat stringul in registrul `esi` incep loop-ul.
        La fiecare iteratie a buclei : 
    ~ retin caracterul curent din sir in registrul `al`
    ~ verific daca se ajunge la sfarsitul sirului (`al` este 0), caz in care se
    iese din bucla si se trece la eticheta `check_end`, insemnand ca tot sirul
    a fost procesat. Aceasta verifica, deopotriva, daca stiva e goala (caz in
    care toate paranteze au corespuns si returneaza 0), iar daca nu e goala
    intoarce 1 (sirul generat nu e corect intrucat au ramas pe stiva paranteze
    deschise fara corespondent)
    ~ daca nu se ajunge la sfarsitul sirului, se continua cu cele 2 cazuri :
        ~ daca caracterul curent este paranteza deschisa se pune pe stiva
        ~ daca caracterul curent este paranteza inchisa, se verifica cu ultima
    paranteza de pe stiva in fiecare din cele 3 cazuri (paranteza rotunda,
    patrata sau acolada); daca corespund se trece la urmatorul caracter (nu
    inainte de a fi scoasa de pe stiva ultima paranteza deschisa), iar daca nu
    corespund se sare la eticheta `mismatch` care returneaza prin registrul
    `eax` valoarea 1 (sirul generat nu este corect)
