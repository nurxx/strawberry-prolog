?-
window(title("Koch's curve"),
	size(820,600),backgr(rgb(70,130,180))).

win_func(mouse_click(X,Y)) :-
	kochCurve(0,500,810,500,5),fail.


kochCurve(X1,Y1,X2,Y2,T):-
	pen(2,rgb(255,255,255)),
	Angle is pi/3,
 
	T>0-> (X3 is (2*X1 + X2)/3,
		  Y3 is (2*Y1 +Y2)/3,
		  X5 is (2*X2+X1)/3,
		  Y5 is (2*Y2 + Y1)/3,
X4 is (X3 + (X5 - X3)* cos(Angle) + (Y5 - Y3)*sin(Angle)),
Y4 is (Y3 - (X5 -X3)*sin(Angle) + (Y5 - Y3)*cos(Angle)),
draw_point(X3,Y3,rgb(255,255,255)),
draw_point(X5,Y5,rgb(255,255,255)),
draw_point(X4,Y4,rgb(255,255,255)),
 
		kochCurve(X1,Y1,X3,Y3,T-1),
		kochCurve(X3,Y3,X4,Y4,T-1),
		kochCurve(X4,Y4,X5,Y5,T-1),
		kochCurve(X5,Y5,X2,Y2,T-1))
	
 else(
		line(X1,Y1,X2,Y2)).
	
