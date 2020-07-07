?-

X:=820,
Y:=600,
window(title("Sierpinski Triangle"), size(X,Y), backgr(rgb(0,0,0))).

win_func(mouse_click(X,Y)):-
	sierpinski(400,20,20,400,780,400), fail.

sierpinski(X1, Y1, X2, Y2, X3, Y3):-
    pen(1, rgb(255,255,255)),
    line(integer(X1), integer(Y1), integer(X2), integer(Y2)),
    line(integer(X1), integer(Y1), integer(X3), integer(Y3)),
    line(integer(X2), integer(Y2), integer(X3), integer(Y3)),
    subTriangle(1,
	(X1 + X2) / 2,
	(Y1 + Y2) / 2,
 	(X1 + X3) / 2,
	(Y1 + Y3) / 2,
	(X2 + X3) / 2,
	(Y2 + Y3) / 2).

subTriangle(N, XX1, YY1, XX2, YY2, XX3, YY3) :-
  %Draw the 3 sides as black lines
    line(integer(XX1), integer(YY1), integer(XX2), integer(YY2)),
    line(integer(XX1), integer(YY1), integer(XX3), integer(YY3)),
    line(integer(XX2), integer(YY2), integer(XX3), integer(YY3)),

  %Calls itself 3 times with new corners, but only if the current number of recursions is smaller than the maximum depth
  (N < 8 -> 
    subTriangle(
      N + 1,
      (XX1 + XX2) / 2 + (XX2 - XX3) / 2,
      (YY1 + YY2) / 2 + (YY2 - YY3) / 2, 
      (XX1 + XX2) / 2 + (XX1 - XX3) / 2,
      (YY1 + YY2) / 2 + (YY1 - YY3) / 2,
      (XX1 + XX2) / 2, 
      (YY1 + YY2) / 2 
    ),
    subTriangle(
      N + 1, 
      (XX3 + XX2) / 2 + (XX2 - XX1) / 2, 
      (YY3 + YY2) / 2 + (YY2 - YY1) / 2,
      (XX3 + XX2) / 2 + (XX3 - XX1) / 2,
      (YY3 + YY2) / 2 + (YY3 - YY1) / 2, 
      (XX3 + XX2) / 2,
	 (YY3 + YY2) / 2
	),
    subTriangle(
      N + 1, 
      (XX1 + XX3) / 2 + (XX3 - XX2) / 2, 
      (YY1 + YY3) / 2 + (YY3 - YY2) / 2, 
      (XX1 + XX3) / 2 + (XX1 - XX2) / 2,
      (YY1 + YY3) / 2 + (YY1 - YY2) / 2,
      (XX1 + XX3) / 2,
      (YY1 + YY3) / 2
    )).
