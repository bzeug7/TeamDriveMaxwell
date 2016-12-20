function [] = main_func(filename)
    DATA = importdata(filename,',',1);
    selectPoints(DATA(1),Data(2),DATA(3),DATA(4),DATA(5),DATA(6),1,2,5);
    
end