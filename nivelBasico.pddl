(define (domain nivelBasico)
  (:requirements :fluents :adl ::typing)

  (:types
    libro - object
    mes - object
  )

  (:predicates
    (esPredecesor ?l - libro ?l2 - libro)
    (libroPlanificado ?l - libro)
    (libroLeido ?l - libro)
    (libroALeer ?l - libro)
  )

  (:functions
    (tiempo ?m - mes)
  )

; action : planificar-libro-con-predecesor
;   precondicion : el libro se quiere leer y no ha sido planificado y tiene algun predecesor
;                  si el predecesor no ha sido planificado, se planifica
;   efecto : el libro se planifica y se deja de querer leer

(:action planificar-libro-con-predecesor-no-leido
  :parameters (?libro - libro ?predecesor - libro)
  :precondition (and 
                 (libroALeer ?libro)
                 (esPredecesor ?predecesor ?libro)
                 (not (libroPlanificado ?libro))
                 (not (libroLeido ?predecesor))
                 (not (libroPlanificado ?predecesor)))
  :effect (and 
           (libroPlanificado ?libro)
           (not (libroALeer ?libro))
           (libroALeer ?predecesor)))


(:action planificar-libro-con-predecesor-leido
  :parameters (?libro - libro ?predecesor - libro)
  :precondition (and 
                 (libroALeer ?libro)
                 (esPredecesor ?predecesor ?libro)
                 (not (libroPlanificado ?libro))
                 (libroLeido ?predecesor)
                 (not (libroPlanificado ?predecesor)))
  :effect (and 
           (libroPlanificado ?libro)
           (not (libroALeer ?libro))))



  (:action establecer-Orden-Sin-Predecesor
    :parameters (?l - libro)
    :precondition (and (not (exists (?l2 - libro) (esPredecesor ?l2 ?l)))
                       (not (libroPlanificado ?l))
                       (libroALeer ?l)
    )
    :effect (and (libroPlanificado ?l) (not (libroALeer ?l)))
  )
)

