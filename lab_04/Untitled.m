a = [0, 2, 1, 2; 1, 4 ,2, 1; 2, 6, 1, 3; 2, 5, 2, 2];
b = [1; 2; 5; 3];

n = 4;
e = eye(n);
a_b = [a, b]
a_e = [a, e];



disp(Gaus(a_b, n))
disp(Reverse_matrix(a_e, b, n))

function check_matrix

function reverse_matrix_answer = Reverse_matrix(a_b, b, n)
    start = 2;
    for col = 1:n
        for row = start:1:n
            l = -a_b(row, col)/a_b(col,col);
            a_b(row, :) = a_b(row, :) + l*a_b(col,:);
        end
        start = start + 1;
    end
    
    start = 3;
    for col = n:-1:1
        for row = start:-1:1
            l = -a_b(row, col)/a_b(col,col);
            a_b(row, :) = a_b(row, :) + l*a_b(col,:);
        end
        start = start - 1;
    end
    
    for row = 1:1:n
        l = a_b(row, row);
        a_b(row, :) = a_b(row, :)/ l; 
    end
    a_b
    reverse_matrix_answer = a_b(:, [5:(n*2)]) * b;
    
    
end

function straight_stroke_answer = Straight_stroke(a_b, n)
    start = 2;
    for col = 1:n
        for row = start:1:n
            l = -a_b(row, col)/a_b(col,col);
            a_b(row, :) = a_b(row, :) + l*a_b(col,:);
        end
        start = start + 1;
    end
    straight_stroke_answer = a_b
end

function reverse_stroke_answer = Reverse_stroke(a_b, n)
    x_answers = ones(1, (n+1));
    for row = n:-1:1
        for col = n:-1:1
            a_b(row,:) = a_b(row, :) .* x_answers(1, :);
            for i = 1:1:n
                
                if i == row
                    continue
                end
                a_b(row, (n+1)) =  a_b(row, (n+1)) - a_b(row,i);
            end
            x_answers(1,row) = a_b(row, (n+1))/a_b(row, row);
            break
        end
    end
    reverse_stroke_answer = x_answers(1, [1, 2, 3, 4]);
end

function gaus_answer = Gaus(a_b, n)
    gaus_answer = Reverse_stroke(Straight_stroke(a_b, n), n);
end