function [tie] = tie(board_display, empty_sprite)
%Checks the board_display matrix and returns true if the game has ended in a tie

%Iterates through the entire matrix until an empty sprite is found
emptyExists = false;
for i = 1:6
    for j = 1:7
        if board_display(i, j) == empty_sprite
            emptyExists = true;
            break;
        end
    end
end

%If an empty sprite is found, the game is not over and a tie has not been
%reached
tie = ~emptyExists;

end

