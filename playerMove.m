function [board_display] = playerMove(board_display, my_scene, sprite)
%Allows the player to pick a column to place their marker

%Loop runs until a valid move is returned
validMove = false;
while ~validMove
    [r, c] = getMouseInput(my_scene);
    %Move is valid if the box clicked on is an empty sprite
    if board_display(r, c) == 1
        
        %Loop finds the lowest open position for the sprite
        j = 0;
        while j + 1 <= 6 && board_display(j + 1, c) == 1
            j = j + 1;
        end
        
        %"Animates" the sprite dropping into position
        for k = 1:j
            %Sets the location of the sprite to the top of the board first,
            %then moves it down one position with each iteration
            board_display(k,c) = sprite;
            if k > 1
                board_display(k-1,c) = 1;
            end
            %Adds a 0.1 second pause between each loop iteration to add
            %animation effect
            pause(0.1);
            drawScene(my_scene,board_display);
        end
    validMove = true;
    end
end

end
