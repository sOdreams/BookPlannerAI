(define (domain nivelBasico1)
  (:requirements :fluents :adl :typing )

  (:types
    libro - object
  )

  (:predicates
    ;l es predecesor de l2
    (esPredecesor ?l - libro ?l2 - libro)
    ;libro l leido
    (libroLeido ?l - libro)
    ;libro l a planificar
    (libroAPlanificar ?l - libro)
    ;libro l planificado
    (libroPlanificado ?l - libro)
  )

; en caso de que el libro l2 se tiene que leer despues de leer l
(:action planificar-predecesor
    :parameters (?l - libro ?l2 - libro)
    :precondition (and (esPredecesor ?l ?l2)
                        (not (libroPlanificado ?l))
                        (not (libroLeido ?l))
                        (libroAPlanificar ?l2)
                  )
    :effect (libroAplanificar ?l)
)

(:action planificar-libro
  :parameters (?l - libro)
  :precondition (and (not(libroPlanificado ?l)) (libroAPlanificar ?l))
  :effect (when (not (exists (?l2 - libro)
                  (and (esPredecesor ?l2 ?l)
                       (not (libroLeido ?l2)) 
                           (not (libroPlanificado ?l2)))))
             (libroPlanificado ?l))
  )
)