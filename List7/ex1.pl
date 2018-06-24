merge(IN1, IN2, OUT) :-
	freeze(IN1, 
		freeze(IN2,
			(IN1 = [H1 | T1]
				-> (IN2 = [H2 | T2]
					-> ( H1 =< H2
						-> OUT = [H1 | OUT1],
						merge(T1, IN2, OUT1)
						;  OUT = [H2 | OUT2],
						merge(IN1, T2, OUT2)
						)
					;  OUT = IN1
					)
				;  OUT = IN2 ))).