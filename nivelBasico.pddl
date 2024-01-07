(define (domain nivelBasico)
  (:requirements :fluents :adl :typing )

  (:types
    libro - object
    mes - object
  )


  (:functions
    ;dado un mes devuelve su numero tipo enero -> 1
    (mesANumero ?m - mes)
    ;mes en el que se planifica el libro l
    ;es como unas asignaciones de libro a mes los cuales estan inicialmente a 0 (aun no planificados)
    (mesLibroPlanificado ?l - libro)
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
                          (not (libroLeido ?l))
                          (libroAPlanificar ?l2)
                    )
      :effect (libroAplanificar ?l)
  )

(:action planificar-libro
    :parameters (?l - libro ?m - mes)
    :precondition (and (not (libroPlanificado ?l))
                   (libroAPlanificar ?l))              

    :effect (when (not (exists (?l2 - libro)
                  (and (esPredecesor ?l2 ?l)
                        (or (and (not (libroPlanificado ?l2)) (not (libroleido ?l2)))
                            (>= (mesLibroPlanificado ?l2) (mesANumero ?m))
                        )
                      )
                    )
                  )
              (and
                (libroPlanificado ?l)
                (assign (mesLibroPlanificado ?l) (mesANumero ?m))
              )
            )  
  )
)