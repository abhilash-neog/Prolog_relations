# Prolog_1

This is a Prolog program, written to test whether a given relation R on a finite set S is transitive or not. The program also includes rules to find out the transitive
closure of the relation.

*****Query Format*****
1. The program is started with the command - check_transitive(R). , where R refers to the relation(Need not input the relation, just the variable R).

2. After the initial command, the program prompts the user to input the set S and relation R(after pressing Enter Key on S input).
   2.1 Format of input
       #for numbers
          S - [1,2,3]. 
          R - [(1,2),(2,3)].
       #for characters
          S - ['Ram','Ravi', 'Arun'].
          R - [('Ram','Ravi'),('Ravi','Arun'),('Ram','Arun'),('Arun','Ram')].

3. It then prints out whether the relation is defined on the set or not, or if it is,then whether it is transitive or not. It also prints the transitive closure of the relation
   if R is defined on the set. * 

4. To check transitiveness of any arbitrary relation(assuming defined on a particular set), the command is - transitive(R). Here, R is not a variable, it should be a list in the format specified above.
   It outputs 'true' or 'false' accordingly.

5. To check transitive closure of any arbitrary relation(assuming defined on a particular set), the command is - transitive_closure(R). Here, R is not a variable, it should be a list in the format specified above.
   It outputs(in all cases) - 'Done' after processing the closure and 'true' indicating the successful execution. It does not display the transitive closure if R already transitive.
   But prints the closure if R is not already transitive. 

*It always prints out the relation R given by user at the end.

****Execution****

The program can be runned on SWI Prolog. Can download it from here: [Download SWI Prolog](http://www.swi-prolog.org/download/stable)
 
****Predicates_Meaning****

1. check_transitive(R) - The program starts with the call to this rule. It prompts the user for set and relation input. After reading the inputs it calls write_check_result(check_relation_on_set(R,S))
			 to check and print out whether the relation is defined on the set. Then call_transitive(R,S) is executed which checks transitiveness if R defined on set, and prints the closure.

2. member(X,[List]) - It checks whether an element belongs to the list or not.

3. check_relation_on_set(R,S)  - It checks whether the elements present in the relation R exists in the set S or not.

4. write_check_result(check_relation_on_set(R,S)) - It prints whether relation is defined on the set or not by checking the output of check_relation_on_set(R,S).

5. call_transitive_check(R,S) - If the relation is defined on the set, it calls transitive_result(R) to compute the transitiveness else prints out that transitiveness cannot be calculated.

6. transitive_result(R) - It checks transitive(R). It then prints out whether it is transitive or not. If not, then it calls transitive_closure(R).

7. append(L1,L2,L3) - This predicate appends L1 to L2 to produce new list L3.

8. transitive_closure(R) - It checks what all elements are missing from the relation and appends accordingly. It uses a reccursive definition in order to check for all the pairs missing.
		           It then, appends the pair ,not present, to R and sends the new list to temp(P), by calling this predicate.

9. temp(P) - P refers to the new list obtained after appending a pair to R. Every time temp(P) recieves a new list it checks whether that list (P) is transitive or not. When the new list obtained
	     is transitive, i.e. when all the required pairs are appended, it prints the transitive closure.

10. printlist(L) - It prints out list L using reccursion.

****Scope****

The program can be implemented to check for equivalence relations and calculate the closures as well.
