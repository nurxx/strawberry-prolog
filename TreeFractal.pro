?-
window(title("Fraktal"),size(1000,800),backgr(rgb(0,0,0))).


win_func(mouse_click(X,Y)) :-
	drawTree(D,500, 500, -90, 9).
 
 
drawTree(_D,_X, _Y, _Angle, 0).
 
drawTree(D,X1, Y1, Angle, Depth) :-
	pen(2,rgb(234,123,33)),
        X2 is X1 + cos(Angle * pi / 180.0) * Depth * 10.0,
        Y2 is Y1 + sin(Angle * pi / 180.0) * Depth * 10.0,
	 line(X1, Y1, X2, Y2),
	A1 is Angle - 30,
	A2 is Angle + 30,
	De is Depth - 1,
        drawTree(D,X2, Y2, A1, De),
        drawTree(D,X2, Y2, A2, De).