(define (domain nivelBasico)
  (:requirements :fluents :adl ::typing)

  (:types  ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    libro - object
  )

  (:predicates
    ;libro ?l es predecesor de ?l2 (hay que leer l antes que l2)
    (esPredecesor ?l - libro ?l2 - libro)

    ;libro ?l está planificado para leer
    (libroPlanificado ?l - libro)

    ;libro ?l está leido
    (libroLeido ?l - libro)

    ;libro ?l esta por leer (el usuario tiene unos libros "objetivos por leer")
    (libroALeer ?l - libro)
  )

  ;La entrada son dos libros cualquieras
  ;La condicion dice que si el libro 1 ya ha sido planificado/leido y el libro 2 falta por planificarlo y ademas el libro 1 es predecesor del libro 2
  ; y ademas el l2 es un libro objetivo por leer
  ;El efecto es que el libro 2 se planifica
  (:action establecer-Orden
    :parameters (?l - libro ?l2 - libro)
    :precondition (and (esPredecesor ?l ?l2) (or (libroPlanificado ?l) (libroLeido ?l)) (not (libroLeido ?l2)) (not (libroPlanificado ?l2)) (libroALeer ?l2))
    :effect (libroPlanificado ?l2)
  )

  ;La entrada es un libro cualquiera
  ;La condicion dice que si el libro no tiene predecesores y no ha sido leido y ademas es un libro objetivo por leer
  ;El efecto es que el libro se planifica
  (:action establecer-Orden-Sin-Predecesor
    :parameters (?l - libro)
    :precondition (and (not (exists (?l2 - libro) (esPredecesor ?l2 ?l))) (not (libroLeido ?l)) (libroALeer ?l))
    :effect (libroPlanificado ?l)
  )
)
