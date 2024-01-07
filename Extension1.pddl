(define (domain extension1)
  (:requirements :fluents :adl :typing )

  (:types
    libro - object
    mes - object
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

  (:functions
    ;dado un mes devuelve su numero tipo enero -> 1
    (mesANumero ?m - mes)
    ;mes en el que se planifica el libro l
    ;es como unas asignaciones de libro a mes los cuales estan inicialmente a 0 (aun no planificados)
    (mesLibroPlanificado ?l - libro)
  )

  ; en caso de que el libro l2 se tiene que leer despues de leer l
  (:action planificar-predecesor
      :parameters (?l - libro ?l2 - libro)
      :precondition (and (esPredecesor ?l ?l2)
                          (not (libroAPlanificar ?l))
                          (not (libroLeido ?l))
                          (libroAPlanificar ?l2)
                    )
      :effect (libroAplanificar ?l)
  )

  (:action planificar-libro
    :parameters (?l - libro ?m - mes)
    :precondition (and (not (libroPlanificado ?l))
                   (libroAPlanificar ?l))              
    ;Cuando no existe un libro predecesor que no se haya planificado.
    ;Cuando no exise un libro predecesor que se haya planificado y en un mes no anterior al mes actual.
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
