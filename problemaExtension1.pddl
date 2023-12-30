(define (problem extension1) (:domain extension1)
(:objects 
  book book1 book2 book3 book4 book5 book6 book7 - libro
  enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes
)
(:init
    (mesAnterior enero febrero)
    (mesAnterior febrero marzo)
    (mesAnterior marzo abril)
    (mesAnterior abril mayo)
    (mesAnterior mayo junio)
    (mesAnterior junio julio)
    (mesAnterior julio agosto)
    (mesAnterior agosto septiembre)
    (mesAnterior septiembre octubre)
    (mesAnterior octubre noviembre)
    (mesAnterior noviembre diciembre)

    ; ; ;todo: put the initial state's facts and numeric values here
    ; (esPredecesor book book1)
    ; (esPredecesor book1 book2)
    ; (esPredecesor book2 book3)
    ; (esPredecesor book3 book4)
    ; (esPredecesor book4 book5)

    (esPredecesor book2 book3)
    (esPredecesor book3 book6)
    (esPredecesor book4 book5)
    (esPredecesor book5 book6)
    ; (libroLeido book)
    (libroLeido book2)
    (libroLeido book5)
    (libroLeido book3)
    (libroAPlanificar book6)
)

  (:goal (not (exists (?l - libro) 
                (and (libroAPlanificar ?l) (not (libroPlanificado ?l)))
              )
          )
    )

)