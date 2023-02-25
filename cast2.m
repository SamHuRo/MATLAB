function cast2(~)

plot(P(1,1),P(1,2),'o')
hold on, grid on, axis equal 
plot(P(2,1),P(2,2),'o'), plot(P(3,1),P(3,2),'o')
line(P(:,1),P(:,2))
PI=P(1,:); PF=P(3,:);
for t= .1:.1:.9
    Q=P([1 2],:)+t*(P([2 3],:)-P([1 2],:));
    q1=plot(Q(1,1),Q(1,2),'*');
    q2=plot(Q(2,1),Q(2,2),'*');
    h=line(Q(:,1),Q(:,2));
    R=Q(1,:)+t*(Q(2,:)-Q(1,:));
    plot(R(1),R(2),'o')
    line([PI(1),R(1)],[PI(2),R(2)])
    pause
    PI=R;
    delete(h), delete(q1), delete(q2)
end
line([R(1),PF(1)],[R(2),PF(2)])