(define (problem nivelBasico) (:domain nivelBasico)
(:objects 
  book book1 book2 book3 book4 book5 book6 - libro
)
(:init
    ;todo: put the initial state's facts and numeric values here
    ; (esPredecesor book book1)
    ; (esPredecesor book1 book2)
    ; (esPredecesor book2 book3)
    ; (esPredecesor book3 book4)
    ; (esPredecesor book4 book5)
    ; (esPredecesor book5 book6)
    (esPredecesor book3 book4)
    (esPredecesor book2 book3)
    (esPredecesor book5 book6)
    (esPredecesor book4 book5)
    (esPredecesor book1 book2)
    ; (libroPlanificado book4)
    ; (libroPlanificado book5)
    ; (libroPlanificado book6)
    ; (libroPlanificado book)
    
)

(:goal (and 
  (forall (?l - libro) (libroPlanificado ?l) )
    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
