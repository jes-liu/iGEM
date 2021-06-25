hold on
% I believe GMOs are bad for the environment
% I believe GM foods are less nutritious
% How much do you know about bioengineered or GMO foods?
% I believe GM foods are healthy
% I believe GM foods are harmful when consumed
% I believe GMOs cause cancer
x = categorical({'Strongly Agree','Agree','Neutral','Disagree','Strongly Disagree'});
x = reordercats(x,{'Strongly Agree','Agree','Neutral','Disagree','Strongly Disagree'});
y=[25 12.5 4.2 8.3 12.5 4.2;
   50 37.5 8.3 25 21 21;
   12.5 25 54 21 37.5 42;
   12.5 25 21 25 25 17;
   0 0 4.2 21 4.2 17];
a=bar(x,y,'k');
a(1).FaceColor='y';
a(3).FaceColor='r';
a(5).FaceColor='b';
xlabel('Choice')
ylabel('Percent')
title('GMO survey')
legend('I believe GMOs are bad for the environment','I believe GM foods are less nutritious','How much do you know about bioengineered or GMO foods?','I believe GM foods are healthy','I believe GM foods are harmful when consumed','I believe GMOs cause cancer','location','northoutside')
hold off
