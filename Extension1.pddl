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

    ;mes m anterior a mes m2
    (mesAnterior ?m - mes ?m2 - mes)

    (libroPlanificadoMes ?l - libro ?m - mes) ;; te dice en que mes a sido planificado un libro (importante para los predecesores)
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
  :parameters (?l - libro ?m - mes)
  :precondition (and (not(libroPlanificado ?l)) (libroAPlanificar ?l))
  ;Cuando no existe un libro predecesor que no se haya planificado.
  ;Cuando no exise un libro predecesor que se haya planificado y en un mes no anterior al mes actual.
  :effect (when (not (exists (?l2 - libro)
                      (and(esPredecesor ?l2 ?l)
                          ; (libroAPlanificar ?l2)
                        (or (and (not (libroPlanificado ?l2)) (not (libroleido ?l2)))
                            ; (not (libroLeido ?l2))
                            (and (libroPlanificado ?l2 )
                              (exists (?m2 - mes)
                                  (and (libroPlanificadoMes ?l2 ?m2)
                                  (not (mesAnterior ?m2 ?m))
                                  ; (mesAnterior ?m ?m2)
                                  (not (libroleido ?l2))
                                  )
                              )
                            )
                        )
                      )
                    )
                  )
          (and
           (libroPlanificado ?l)
           (libroPlanificadoMes ?l ?m)))
    )
)
