(define (domain nivelBasico)
(:requirements :fluents :adl ::typing)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    libro - object
)

(:predicates ;todo: define predicates here
    ;establecer predecesores del libro
    (esPredecesor ?l - libro ?l2 - libro)
    ;establece un libro en el plan de libros
    (libroPlanificado ?l - libro)
    ;libro ya leido
    (libroLeido ?l - libro)
)

  (:action establecer-Orden
    :parameters (?l - libro ?l2 - libro)
    :precondition (and (esPredecesor ?l ?l2) (or (libroPlanificado ?l) (libroLeido ?l)) (not (libroPlanificado ?l2) ) (not (libroLeido ?l2)))
    :effect (libroPlanificado ?l2)
  )

  ;libro sin predecesores, es decir, el libro no tiene predecesores y no ha sido leido
  (:action establecer-Orden-Sin-Predecesor
    :parameters (?l - libro)
    :precondition (and (not (exists (?l2 - libro) (esPredecesor ?l2 ?l))) (not (libroLeido ?l)))  ; No tiene predecesores
    :effect (libroPlanificado ?l)
  )
)