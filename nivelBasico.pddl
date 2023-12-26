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
)

  (:action establecerOrden
    :parameters (?l - libro ?l2 - libro)
    :precondition (and (esPredecesor ?l ?l2) (not (libroPlanificado ?l2)) (libroPlanificado ?l))
    :effect (libroPlanificado ?l2)
  )

  (:action establecerOrdenSinPredecesor
    :parameters (?l - libro)
    :precondition (not (exists (?l2 - libro) (esPredecesor ?l2 ?l)))  ; No tiene predecesores
    :effect (libroPlanificado ?l)
  )
)