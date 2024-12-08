X_SIZE = 50;
Y_SIZE = 25;

PIXEL_SCALE = 40;

alive[1250];
alive_next[1250];

alive_neighbors = 0;
table_x = 0;
table_y = 0;

cur_x = 0;
cur_y = 0;

x = 0;
y = 0;

neighbors_function_counter = 0;

var_neighbors_x = 0;
var_neighbors_y = 0;

routine begin neighbors
    neighbors_function_counter = neighbors_function_counter + 1;
    alive_neighbors = 0;
    table_x = 0;
    table_y = 0;

    var_neighbors_y = cur_y - 1;
    jump loop_y;
    loop_y:
    if var_neighbors_y <= (cur_y + 1) then iteration_y else loop_y_end
    iteration_y:

        # for y body

        var_neighbors_x = cur_x - 1;
        jump loop_x;
        loop_x:
        if var_neighbors_x <= (cur_x + 1) then iteration_x else loop_x_end
        iteration_x:

            # for x body
            table_x = var_neighbors_x;
            table_y = var_neighbors_y;

            if (var_neighbors_x < 0) then x_less_zero else x_less_zero_ifend
            x_less_zero:
                table_x = X_SIZE + var_neighbors_x;
                jump x_less_zero_ifend;
            x_less_zero_ifend:

            if (var_neighbors_x >= X_SIZE) then x_greater_x_size else x_greater_x_size_ifend
            x_greater_x_size:
                table_x = var_neighbors_x - X_SIZE;
                jump x_greater_x_size_ifend;
            x_greater_x_size_ifend:

            if (var_neighbors_y < 0) then y_less_zero else y_less_zero_ifend
            y_less_zero:
                table_y = Y_SIZE + var_neighbors_y;
                jump y_less_zero_ifend;
            y_less_zero_ifend:


            if (var_neighbors_y >= Y_SIZE) then y_greater_y_size else y_greater_y_size_ifend
            y_greater_y_size:
                table_y = var_neighbors_y - Y_SIZE;
                jump y_greater_y_size_ifend;
            y_greater_y_size_ifend:


            if ((var_neighbors_x == cur_x) && (var_neighbors_y == cur_y)) then loop_x_continue else loop_x_continue_ifend
            loop_x_continue_ifend:

            alive_neighbors = alive_neighbors + alive[table_y * X_SIZE + table_x];
            # for x body end
            jump loop_x_continue;
            loop_x_continue:

            var_neighbors_x = var_neighbors_x + 1;
            jump loop_x;
        loop_x_end:

        # for y body end

        var_neighbors_y = var_neighbors_y + 1;
        jump loop_y;
    loop_y_end:
routine end

step_y_counter = 0;
step_x_counter = 0;

var_step_x = 0;
var_step_y = 0;


routine begin step
    alive_neighbors = 0;

    var_step_y = 0;
    jump lxxp_y;
    lxxp_y:
    if var_step_y < Y_SIZE then step_y else lxxp_y_end
    step_y:
        step_y_counter = step_y_counter + 1;
        # for y body

        var_step_x = 0;
        jump lxxp_x;
        lxxp_x:
        if var_step_x < X_SIZE then step_x else lxxp_x_end
        step_x:
            step_x_counter = step_x_counter + 1;
            # for x body
            cur_x = var_step_x;
            cur_y = var_step_y;

            call routine neighbors;

            if alive[var_step_y * X_SIZE + var_step_x] then cell_alive else cell_dead
            cell_alive:

                if alive_neighbors == 2 || alive_neighbors == 3 then next_cell_alive else next_cell_dead
                next_cell_alive:
                    alive_next[var_step_y * X_SIZE + var_step_x] = 1;
                    jump next_cell_endif;
                next_cell_dead:
                    alive_next[var_step_y * X_SIZE + var_step_x] = 0;
                    jump next_cell_endif;

                next_cell_endif:
                jump cell_endif;
            cell_dead:

                if alive_neighbors == 3 then alive_next_cell else dead_next_cell
                alive_next_cell:
                    alive_next[var_step_y * X_SIZE + var_step_x] = 1;
                    jump cell_next_endif;

                dead_next_cell:
                    alive_next[var_step_y * X_SIZE + var_step_x] = 0;
                    jump cell_next_endif;

                cell_next_endif:

                jump cell_endif;
            cell_endif:

            # for x body end
            var_step_x = var_step_x + 1;
            jump lxxp_x;
        lxxp_x_end:

        # for y body end
        var_step_y = var_step_y + 1;
        jump lxxp_y;
    lxxp_y_end:

routine end

i = 0;
tmp = 0;

routine begin swappp
    i = 0;
    tmp = 0;

    jump copy_loop;
    copy_loop:
    if i < 1250 then copy_iteration else copy_end
    copy_iteration:
        tmp = alive[i];
        alive[i] = alive_next[i];
        alive_next[i] = alive[i];

        i = i + 1;
        jump copy_loop;
    copy_end:

routine end


s = 0;

counter_black_cells = 0;
counter_white_cells = 0;

routine begin main

    # alive[1 * X_SIZE + 2] = 1;
    # alive[2 * X_SIZE + 3] = 1;
    # alive[2 * X_SIZE + 4] = 1;
    # alive[3 * X_SIZE + 2] = 1;
    # alive[3 * X_SIZE + 3] = 1;

    alive[1 * X_SIZE + 26] = 1;
    alive[2 * X_SIZE + 24] = 1;
    alive[2 * X_SIZE + 26] = 1;
    alive[3 * X_SIZE + 14] = 1;
    alive[3 * X_SIZE + 15] = 1;
    alive[3 * X_SIZE + 22] = 1;
    alive[3 * X_SIZE + 23] = 1;
    alive[3 * X_SIZE + 36] = 1;
    alive[3 * X_SIZE + 37] = 1;
    alive[4 * X_SIZE + 13] = 1;
    alive[4 * X_SIZE + 17] = 1;
    alive[4 * X_SIZE + 22] = 1;
    alive[4 * X_SIZE + 23] = 1;
    alive[4 * X_SIZE + 36] = 1;
    alive[4 * X_SIZE + 37] = 1;
    alive[5 * X_SIZE + 2] = 1;
    alive[5 * X_SIZE + 3] = 1;
    alive[5 * X_SIZE + 12] = 1;
    alive[5 * X_SIZE + 18] = 1;
    alive[5 * X_SIZE + 22] = 1;
    alive[5 * X_SIZE + 23] = 1;
    alive[6 * X_SIZE + 2] = 1;
    alive[6 * X_SIZE + 3] = 1;
    alive[6 * X_SIZE + 12] = 1;
    alive[6 * X_SIZE + 16] = 1;
    alive[6 * X_SIZE + 18] = 1;
    alive[6 * X_SIZE + 19] = 1;
    alive[6 * X_SIZE + 24] = 1;
    alive[6 * X_SIZE + 26] = 1;
    alive[7 * X_SIZE + 12] = 1;
    alive[7 * X_SIZE + 18] = 1;
    alive[7 * X_SIZE + 26] = 1;
    alive[8 * X_SIZE + 13] = 1;
    alive[8 * X_SIZE + 17] = 1;
    alive[9 * X_SIZE + 14] = 1;
    alive[9 * X_SIZE + 15] = 1;

    s = 0;
    jump loop_step;
    loop_step:
    if s < 1000 then step_iteration else loop_step_end
    step_iteration:
        # step body

        y = 0;
        jump y_loop;
        y_loop:
        if y < Y_SIZE then y_loop_iteration else y_loop_end
        y_loop_iteration:
            # y loop body

            x = 0;
            jump x_loop;
            x_loop:
            if x < X_SIZE then x_loop_iteration else x_loop_end
            x_loop_iteration:
                # x loop body
                if alive[y * X_SIZE + x] then black_cell else white_cell
                black_cell:
                    counter_black_cells = counter_black_cells + 1;
                    put(x, y, 4278190080, PIXEL_SCALE);
                    jump color_cell_endif;
                white_cell:
                    counter_white_cells = counter_white_cells + 1;
                    put(x, y, 4294967295, PIXEL_SCALE);
                    jump color_cell_endif;

                color_cell_endif:

                # x loop end

                x = x + 1;
                jump x_loop;
            x_loop_end:

            # y loop body end
            y = y + 1;
            jump y_loop;
        y_loop_end:

        flush;

        call routine step;
        call routine swappp;
        # swap alive alive_next;

        # step body end
        s = s + 1;
        jump loop_step;
    loop_step_end:

routine end
