(define (problem nivelBasico) (:domain nivelBasico)
(:objects 
  book book1 book2 book3 book4 book5 book6 book7 - libro
)
(:init
    ; ;todo: put the initial state's facts and numeric values here
    ; (esPredecesor book1 book)
    ; (esPredecesor book1 book2)
    ; (esPredecesor book2 book3)
    (esPredecesor book3 book4)
    (esPredecesor book4 book5)
    (esPredecesor book4 book6)
    ; (esPredecesor book5 book6)
    ; (libroLeido book5)
    (libroAPlanificar book6)
)

(:goal (not (exists (?l - libro) 
              (and (libroAPlanificar ?l) (not (libroPlanificado ?l)))
            )
        )
)

)