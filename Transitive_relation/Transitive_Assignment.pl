check_transitive(R) :-
  write('Please input the set:'),
  nl,
  read(S),
  write('Please input the relation:'),
  nl,
  read(R),
  write_check_result(check_relation_on_set(R,S)),
  call_transitive_check(R,S).
  
member(X,[X|T]). 
member(X,[H|T]) :- member(X,T).

append([],L,L). 
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).

transitive(L):-not((member((A,B),L),member((B,C),L),not(member((A,C),L)))).

check_relation_on_set(L,S) :- not((member((A,B),L),(not(member(A,S));not(member(B,S))))).

write_check_result(check_relation_on_set(R,S)):-check_relation_on_set(R,S),write('Relation is defined on the set').
write_check_result(check_relation_on_set(R,S)):-not((check_relation_on_set(R,S))), write('Relation is not defined on the set.').

transitive_result(R):-transitive(R)->(write('\nIt is transitive.'),write('\n Transitive closure is the relation itself'));(write('\nIt is not transitive.\n'),transitive_closure(R)).

call_transitive_check(R,S):-check_relation_on_set(R,S)->transitive_result(R);write('\n Cannot check for transitiveness').

transitive_closure(R):-((member((A,B),R),member((B,C),R)),(not(member((A,C),R)))->(append(R,[(A,C)],P),temp(P),transitive_closure(P));write('\n Done')).

temp(P):-transitive(P)->(write('Transitive closure = ['),printlist(P),write(']'));write('processing transitive closure...\n'). 

printlist([]).    
printlist([H|T]) :-  write('('),write(H),write(')'),write(','),printlist(T).
 
