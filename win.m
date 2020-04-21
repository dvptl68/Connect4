function [win] = win(board_display, sprite)
%Returns true if the player who just dropped a sprite won, false otherwise

win = false;

%Check vertical four in a row
for c = 1:7 %Starting positions have a range of 1 <= c <= 7
    for i = 1:3 %Range of 1 <= r <= 3
        %Loop sets vertical to true if four black/red sprites are found
        %together
        vertical = true;
        for r = i:i+3
            vertical = vertical && (board_display(r, c) == sprite);
        end
        %If vertical is true the loop breaks and win is set to true
        if vertical
            win = vertical;
            break;
        end
    end
    if win
        break;
    end
end

%Check horizontal four in a row
for r = 1:6 %Starting positions have a range of 1 <= r <= 6
    for i = 1:4 %Range of 1 <= c <= 4
        %Loop sets horizontal to true of four black/red sprites are found
        %together
        horizontal = true;
        for c = i:i+3
            horizontal = horizontal && (board_display(r, c) == sprite);
        end
        %If horizontal is true the loop breaks and win is set to true
        if horizontal
            win = horizontal;
            break;
        end
    end
    if win
        break;
    end
end

%Check diagonal (negative slope) four in a row
for r = 1:3 %Starting positions have a range of 1 <= r <= 3
    for c = 1:4 %Range of 1 <= c <= 4
        %Loop sets diagonal to true if four black/red sprites are found
        %together
        diagonal = true;
        for i = 0:3
            diagonal = diagonal && (board_display(r + i, c + i) == sprite);
        end
        %If diagonal is true the loop breaks and win is set to true
        if diagonal
            win = diagonal;
            break;
        end
    end
    if win
        break;
    end
end

%Check diagonal (positive slope) four in a row
for r = 1:3 %Starting positions have a range of 1 <= r <= 3
    for c = 4:7 %Range of 1 <= c <= 4
        %Loops sets diagonal to true if four black/red sprites are found
        %together
        diagonal = true;
        for i = 0:3
            diagonal = diagonal && (board_display(r + i, c - i) == sprite);
        end
        %If diagonal is true the loop breaks and win is set to true
        if diagonal
            win = diagonal;
            break;
        end
    end
    if win
        break;
    end
end

end
