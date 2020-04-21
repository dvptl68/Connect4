clc
clear
warning('off','all');

% Initialize scene
my_scene = simpleGameEngine('ConnectFour.png',86,101);
% Set up variables to name the various sprites
empty_sprite = 1;
red_sprite = 2;
black_sprite= 3;
% Display empty board
board_display = empty_sprite * ones(6,7);
drawScene(my_scene,board_display)

player1Win = false;
player2Win = false;

%Player and AI play until one wins or the game ends in a tie
while ~(player1Win || player2Win || tie(board_display, empty_sprite))
    
    %Player 1 does their move and it is checked whether they won or not
    fprintf('Player 1 (red)''s turn\n\n');
    [board_display] = playerMove(board_display, my_scene, red_sprite);
    player1Win = win(board_display, red_sprite);
    
    %If player 1 won, player 2 does not go
    if ~player1Win
        %Player 2 does their move and it is checked whether they won or not
        fprintf('Player 2 (black)''s turn\n\n');
        [board_display] = playerMove(board_display, my_scene, black_sprite);
        player2Win = win(board_display, black_sprite);
    end
end

if player1Win
    fprintf('Player 1 (red) wins!\n');
else
    fprintf('Player 2 (black) wins!\n');
end