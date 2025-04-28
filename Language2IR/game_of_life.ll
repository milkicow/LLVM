; ModuleID = 'top'
source_filename = "top"

@X_SIZE = external global i32
@Y_SIZE = external global i32
@PIXEL_SCALE = external global i32
@alive = external global [1250 x i32]
@alive_next = external global [1250 x i32]
@alive_neighbors = external global i32
@table_x = external global i32
@table_y = external global i32
@cur_x = external global i32
@cur_y = external global i32
@x = external global i32
@y = external global i32
@neighbors_function_counter = external global i32
@var_neighbors_x = external global i32
@var_neighbors_y = external global i32
@step_y_counter = external global i32
@step_x_counter = external global i32
@var_step_x = external global i32
@var_step_y = external global i32
@i = external global i32
@tmp = external global i32
@s = external global i32
@counter_black_cells = external global i32
@counter_white_cells = external global i32

declare void @llvm.arch52.putdisplaypixel(i32, i32, i32)

declare void @llvm.arch52.flush()

define void @neighbors() {
entry:
  %0 = load i32, ptr @neighbors_function_counter, align 4
  %1 = add i32 %0, 1
  store i32 %1, ptr @neighbors_function_counter, align 4
  store i32 0, ptr @alive_neighbors, align 4
  store i32 0, ptr @table_x, align 4
  store i32 0, ptr @table_y, align 4
  %2 = load i32, ptr @cur_y, align 4
  %3 = sub i32 %2, 1
  store i32 %3, ptr @var_neighbors_y, align 4
  br label %loop_y

loop_y:                                           ; preds = %loop_x_end, %entry
  %4 = load i32, ptr @var_neighbors_y, align 4
  %5 = load i32, ptr @cur_y, align 4
  %6 = add i32 %5, 1
  %7 = icmp sle i32 %4, %6
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %iteration_y, label %loop_y_end

iteration_y:                                      ; preds = %loop_y
  %10 = load i32, ptr @cur_x, align 4
  %11 = sub i32 %10, 1
  store i32 %11, ptr @var_neighbors_x, align 4
  br label %loop_x

loop_y_end:                                       ; preds = %loop_y
  ret void

loop_x:                                           ; preds = %loop_x_continue, %iteration_y
  %12 = load i32, ptr @var_neighbors_x, align 4
  %13 = load i32, ptr @cur_x, align 4
  %14 = add i32 %13, 1
  %15 = icmp sle i32 %12, %14
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %iteration_x, label %loop_x_end

iteration_x:                                      ; preds = %loop_x
  %18 = load i32, ptr @var_neighbors_x, align 4
  store i32 %18, ptr @table_x, align 4
  %19 = load i32, ptr @var_neighbors_y, align 4
  store i32 %19, ptr @table_y, align 4
  %20 = load i32, ptr @var_neighbors_x, align 4
  %21 = icmp slt i32 %20, 0
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %x_less_zero, label %x_less_zero_ifend

loop_x_end:                                       ; preds = %loop_x
  %24 = load i32, ptr @var_neighbors_y, align 4
  %25 = add i32 %24, 1
  store i32 %25, ptr @var_neighbors_y, align 4
  br label %loop_y

x_less_zero:                                      ; preds = %iteration_x
  %26 = load i32, ptr @X_SIZE, align 4
  %27 = load i32, ptr @var_neighbors_x, align 4
  %28 = add i32 %26, %27
  store i32 %28, ptr @table_x, align 4
  br label %x_less_zero_ifend

x_less_zero_ifend:                                ; preds = %x_less_zero, %iteration_x
  %29 = load i32, ptr @var_neighbors_x, align 4
  %30 = load i32, ptr @X_SIZE, align 4
  %31 = icmp sge i32 %29, %30
  %32 = zext i1 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %x_greater_x_size, label %x_greater_x_size_ifend

x_greater_x_size:                                 ; preds = %x_less_zero_ifend
  %34 = load i32, ptr @var_neighbors_x, align 4
  %35 = load i32, ptr @X_SIZE, align 4
  %36 = sub i32 %34, %35
  store i32 %36, ptr @table_x, align 4
  br label %x_greater_x_size_ifend

x_greater_x_size_ifend:                           ; preds = %x_greater_x_size, %x_less_zero_ifend
  %37 = load i32, ptr @var_neighbors_y, align 4
  %38 = icmp slt i32 %37, 0
  %39 = zext i1 %38 to i32
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %y_less_zero, label %y_less_zero_ifend

y_less_zero:                                      ; preds = %x_greater_x_size_ifend
  %41 = load i32, ptr @Y_SIZE, align 4
  %42 = load i32, ptr @var_neighbors_y, align 4
  %43 = add i32 %41, %42
  store i32 %43, ptr @table_y, align 4
  br label %y_less_zero_ifend

y_less_zero_ifend:                                ; preds = %y_less_zero, %x_greater_x_size_ifend
  %44 = load i32, ptr @var_neighbors_y, align 4
  %45 = load i32, ptr @Y_SIZE, align 4
  %46 = icmp sge i32 %44, %45
  %47 = zext i1 %46 to i32
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %y_greater_y_size, label %y_greater_y_size_ifend

y_greater_y_size:                                 ; preds = %y_less_zero_ifend
  %49 = load i32, ptr @var_neighbors_y, align 4
  %50 = load i32, ptr @Y_SIZE, align 4
  %51 = sub i32 %49, %50
  store i32 %51, ptr @table_y, align 4
  br label %y_greater_y_size_ifend

y_greater_y_size_ifend:                           ; preds = %y_greater_y_size, %y_less_zero_ifend
  %52 = load i32, ptr @var_neighbors_x, align 4
  %53 = load i32, ptr @cur_x, align 4
  %54 = icmp eq i32 %52, %53
  %55 = zext i1 %54 to i32
  %56 = load i32, ptr @var_neighbors_y, align 4
  %57 = load i32, ptr @cur_y, align 4
  %58 = icmp eq i32 %56, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %55, %59
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %loop_x_continue, label %loop_x_continue_ifend

loop_x_continue:                                  ; preds = %loop_x_continue_ifend, %y_greater_y_size_ifend
  %62 = load i32, ptr @var_neighbors_x, align 4
  %63 = add i32 %62, 1
  store i32 %63, ptr @var_neighbors_x, align 4
  br label %loop_x

loop_x_continue_ifend:                            ; preds = %y_greater_y_size_ifend
  %64 = load i32, ptr @alive_neighbors, align 4
  %65 = load i32, ptr @table_y, align 4
  %66 = load i32, ptr @X_SIZE, align 4
  %67 = mul i32 %65, %66
  %68 = load i32, ptr @table_x, align 4
  %69 = add i32 %67, %68
  %70 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %69
  %71 = load i32, ptr %70, align 4
  %72 = add i32 %64, %71
  store i32 %72, ptr @alive_neighbors, align 4
  br label %loop_x_continue
}

define void @step() {
entry:
  store i32 0, ptr @alive_neighbors, align 4
  store i32 0, ptr @var_step_y, align 4
  br label %lxxp_y

lxxp_y:                                           ; preds = %lxxp_x_end, %entry
  %0 = load i32, ptr @var_step_y, align 4
  %1 = load i32, ptr @Y_SIZE, align 4
  %2 = icmp slt i32 %0, %1
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %step_y, label %lxxp_y_end

step_y:                                           ; preds = %lxxp_y
  %5 = load i32, ptr @step_y_counter, align 4
  %6 = add i32 %5, 1
  store i32 %6, ptr @step_y_counter, align 4
  store i32 0, ptr @var_step_x, align 4
  br label %lxxp_x

lxxp_y_end:                                       ; preds = %lxxp_y
  ret void

lxxp_x:                                           ; preds = %cell_endif, %step_y
  %7 = load i32, ptr @var_step_x, align 4
  %8 = load i32, ptr @X_SIZE, align 4
  %9 = icmp slt i32 %7, %8
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %step_x, label %lxxp_x_end

step_x:                                           ; preds = %lxxp_x
  %12 = load i32, ptr @step_x_counter, align 4
  %13 = add i32 %12, 1
  store i32 %13, ptr @step_x_counter, align 4
  %14 = load i32, ptr @var_step_x, align 4
  store i32 %14, ptr @cur_x, align 4
  %15 = load i32, ptr @var_step_y, align 4
  store i32 %15, ptr @cur_y, align 4
  call void @neighbors()
  %16 = load i32, ptr @var_step_y, align 4
  %17 = load i32, ptr @X_SIZE, align 4
  %18 = mul i32 %16, %17
  %19 = load i32, ptr @var_step_x, align 4
  %20 = add i32 %18, %19
  %21 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %20
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %cell_alive, label %cell_dead

lxxp_x_end:                                       ; preds = %lxxp_x
  %24 = load i32, ptr @var_step_y, align 4
  %25 = add i32 %24, 1
  store i32 %25, ptr @var_step_y, align 4
  br label %lxxp_y

cell_alive:                                       ; preds = %step_x
  %26 = load i32, ptr @alive_neighbors, align 4
  %27 = icmp eq i32 %26, 2
  %28 = zext i1 %27 to i32
  %29 = load i32, ptr @alive_neighbors, align 4
  %30 = icmp eq i32 %29, 3
  %31 = zext i1 %30 to i32
  %32 = or i32 %28, %31
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %next_cell_alive, label %next_cell_dead

cell_dead:                                        ; preds = %step_x
  %34 = load i32, ptr @alive_neighbors, align 4
  %35 = icmp eq i32 %34, 3
  %36 = zext i1 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %alive_next_cell, label %dead_next_cell

next_cell_alive:                                  ; preds = %cell_alive
  %38 = load i32, ptr @var_step_y, align 4
  %39 = load i32, ptr @X_SIZE, align 4
  %40 = mul i32 %38, %39
  %41 = load i32, ptr @var_step_x, align 4
  %42 = add i32 %40, %41
  %43 = getelementptr [1250 x i32], ptr @alive_next, i32 0, i32 %42
  store i32 1, ptr %43, align 4
  br label %next_cell_endif

next_cell_dead:                                   ; preds = %cell_alive
  %44 = load i32, ptr @var_step_y, align 4
  %45 = load i32, ptr @X_SIZE, align 4
  %46 = mul i32 %44, %45
  %47 = load i32, ptr @var_step_x, align 4
  %48 = add i32 %46, %47
  %49 = getelementptr [1250 x i32], ptr @alive_next, i32 0, i32 %48
  store i32 0, ptr %49, align 4
  br label %next_cell_endif

next_cell_endif:                                  ; preds = %next_cell_dead, %next_cell_alive
  br label %cell_endif

cell_endif:                                       ; preds = %cell_next_endif, %next_cell_endif
  %50 = load i32, ptr @var_step_x, align 4
  %51 = add i32 %50, 1
  store i32 %51, ptr @var_step_x, align 4
  br label %lxxp_x

alive_next_cell:                                  ; preds = %cell_dead
  %52 = load i32, ptr @var_step_y, align 4
  %53 = load i32, ptr @X_SIZE, align 4
  %54 = mul i32 %52, %53
  %55 = load i32, ptr @var_step_x, align 4
  %56 = add i32 %54, %55
  %57 = getelementptr [1250 x i32], ptr @alive_next, i32 0, i32 %56
  store i32 1, ptr %57, align 4
  br label %cell_next_endif

dead_next_cell:                                   ; preds = %cell_dead
  %58 = load i32, ptr @var_step_y, align 4
  %59 = load i32, ptr @X_SIZE, align 4
  %60 = mul i32 %58, %59
  %61 = load i32, ptr @var_step_x, align 4
  %62 = add i32 %60, %61
  %63 = getelementptr [1250 x i32], ptr @alive_next, i32 0, i32 %62
  store i32 0, ptr %63, align 4
  br label %cell_next_endif

cell_next_endif:                                  ; preds = %dead_next_cell, %alive_next_cell
  br label %cell_endif
}

define void @swappp() {
entry:
  store i32 0, ptr @i, align 4
  store i32 0, ptr @tmp, align 4
  br label %copy_loop

copy_loop:                                        ; preds = %copy_iteration, %entry
  %0 = load i32, ptr @i, align 4
  %1 = icmp slt i32 %0, 1250
  %2 = zext i1 %1 to i32
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %copy_iteration, label %copy_end

copy_iteration:                                   ; preds = %copy_loop
  %4 = load i32, ptr @i, align 4
  %5 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %4
  %6 = load i32, ptr %5, align 4
  store i32 %6, ptr @tmp, align 4
  %7 = load i32, ptr @i, align 4
  %8 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %7
  %9 = load i32, ptr @i, align 4
  %10 = getelementptr [1250 x i32], ptr @alive_next, i32 0, i32 %9
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %8, align 4
  %12 = load i32, ptr @i, align 4
  %13 = getelementptr [1250 x i32], ptr @alive_next, i32 0, i32 %12
  %14 = load i32, ptr @i, align 4
  %15 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %14
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %13, align 4
  %17 = load i32, ptr @i, align 4
  %18 = add i32 %17, 1
  store i32 %18, ptr @i, align 4
  br label %copy_loop

copy_end:                                         ; preds = %copy_loop
  ret void
}

define void @main() {
entry:
  %0 = load i32, ptr @X_SIZE, align 4
  %1 = mul i32 1, %0
  %2 = add i32 %1, 26
  %3 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %2
  store i32 1, ptr %3, align 4
  %4 = load i32, ptr @X_SIZE, align 4
  %5 = mul i32 2, %4
  %6 = add i32 %5, 24
  %7 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %6
  store i32 1, ptr %7, align 4
  %8 = load i32, ptr @X_SIZE, align 4
  %9 = mul i32 2, %8
  %10 = add i32 %9, 26
  %11 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %10
  store i32 1, ptr %11, align 4
  %12 = load i32, ptr @X_SIZE, align 4
  %13 = mul i32 3, %12
  %14 = add i32 %13, 14
  %15 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %14
  store i32 1, ptr %15, align 4
  %16 = load i32, ptr @X_SIZE, align 4
  %17 = mul i32 3, %16
  %18 = add i32 %17, 15
  %19 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %18
  store i32 1, ptr %19, align 4
  %20 = load i32, ptr @X_SIZE, align 4
  %21 = mul i32 3, %20
  %22 = add i32 %21, 22
  %23 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %22
  store i32 1, ptr %23, align 4
  %24 = load i32, ptr @X_SIZE, align 4
  %25 = mul i32 3, %24
  %26 = add i32 %25, 23
  %27 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %26
  store i32 1, ptr %27, align 4
  %28 = load i32, ptr @X_SIZE, align 4
  %29 = mul i32 3, %28
  %30 = add i32 %29, 36
  %31 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %30
  store i32 1, ptr %31, align 4
  %32 = load i32, ptr @X_SIZE, align 4
  %33 = mul i32 3, %32
  %34 = add i32 %33, 37
  %35 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %34
  store i32 1, ptr %35, align 4
  %36 = load i32, ptr @X_SIZE, align 4
  %37 = mul i32 4, %36
  %38 = add i32 %37, 13
  %39 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %38
  store i32 1, ptr %39, align 4
  %40 = load i32, ptr @X_SIZE, align 4
  %41 = mul i32 4, %40
  %42 = add i32 %41, 17
  %43 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %42
  store i32 1, ptr %43, align 4
  %44 = load i32, ptr @X_SIZE, align 4
  %45 = mul i32 4, %44
  %46 = add i32 %45, 22
  %47 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %46
  store i32 1, ptr %47, align 4
  %48 = load i32, ptr @X_SIZE, align 4
  %49 = mul i32 4, %48
  %50 = add i32 %49, 23
  %51 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %50
  store i32 1, ptr %51, align 4
  %52 = load i32, ptr @X_SIZE, align 4
  %53 = mul i32 4, %52
  %54 = add i32 %53, 36
  %55 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %54
  store i32 1, ptr %55, align 4
  %56 = load i32, ptr @X_SIZE, align 4
  %57 = mul i32 4, %56
  %58 = add i32 %57, 37
  %59 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %58
  store i32 1, ptr %59, align 4
  %60 = load i32, ptr @X_SIZE, align 4
  %61 = mul i32 5, %60
  %62 = add i32 %61, 2
  %63 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %62
  store i32 1, ptr %63, align 4
  %64 = load i32, ptr @X_SIZE, align 4
  %65 = mul i32 5, %64
  %66 = add i32 %65, 3
  %67 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %66
  store i32 1, ptr %67, align 4
  %68 = load i32, ptr @X_SIZE, align 4
  %69 = mul i32 5, %68
  %70 = add i32 %69, 12
  %71 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %70
  store i32 1, ptr %71, align 4
  %72 = load i32, ptr @X_SIZE, align 4
  %73 = mul i32 5, %72
  %74 = add i32 %73, 18
  %75 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %74
  store i32 1, ptr %75, align 4
  %76 = load i32, ptr @X_SIZE, align 4
  %77 = mul i32 5, %76
  %78 = add i32 %77, 22
  %79 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %78
  store i32 1, ptr %79, align 4
  %80 = load i32, ptr @X_SIZE, align 4
  %81 = mul i32 5, %80
  %82 = add i32 %81, 23
  %83 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %82
  store i32 1, ptr %83, align 4
  %84 = load i32, ptr @X_SIZE, align 4
  %85 = mul i32 6, %84
  %86 = add i32 %85, 2
  %87 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %86
  store i32 1, ptr %87, align 4
  %88 = load i32, ptr @X_SIZE, align 4
  %89 = mul i32 6, %88
  %90 = add i32 %89, 3
  %91 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %90
  store i32 1, ptr %91, align 4
  %92 = load i32, ptr @X_SIZE, align 4
  %93 = mul i32 6, %92
  %94 = add i32 %93, 12
  %95 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %94
  store i32 1, ptr %95, align 4
  %96 = load i32, ptr @X_SIZE, align 4
  %97 = mul i32 6, %96
  %98 = add i32 %97, 16
  %99 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %98
  store i32 1, ptr %99, align 4
  %100 = load i32, ptr @X_SIZE, align 4
  %101 = mul i32 6, %100
  %102 = add i32 %101, 18
  %103 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %102
  store i32 1, ptr %103, align 4
  %104 = load i32, ptr @X_SIZE, align 4
  %105 = mul i32 6, %104
  %106 = add i32 %105, 19
  %107 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %106
  store i32 1, ptr %107, align 4
  %108 = load i32, ptr @X_SIZE, align 4
  %109 = mul i32 6, %108
  %110 = add i32 %109, 24
  %111 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %110
  store i32 1, ptr %111, align 4
  %112 = load i32, ptr @X_SIZE, align 4
  %113 = mul i32 6, %112
  %114 = add i32 %113, 26
  %115 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %114
  store i32 1, ptr %115, align 4
  %116 = load i32, ptr @X_SIZE, align 4
  %117 = mul i32 7, %116
  %118 = add i32 %117, 12
  %119 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %118
  store i32 1, ptr %119, align 4
  %120 = load i32, ptr @X_SIZE, align 4
  %121 = mul i32 7, %120
  %122 = add i32 %121, 18
  %123 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %122
  store i32 1, ptr %123, align 4
  %124 = load i32, ptr @X_SIZE, align 4
  %125 = mul i32 7, %124
  %126 = add i32 %125, 26
  %127 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %126
  store i32 1, ptr %127, align 4
  %128 = load i32, ptr @X_SIZE, align 4
  %129 = mul i32 8, %128
  %130 = add i32 %129, 13
  %131 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %130
  store i32 1, ptr %131, align 4
  %132 = load i32, ptr @X_SIZE, align 4
  %133 = mul i32 8, %132
  %134 = add i32 %133, 17
  %135 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %134
  store i32 1, ptr %135, align 4
  %136 = load i32, ptr @X_SIZE, align 4
  %137 = mul i32 9, %136
  %138 = add i32 %137, 14
  %139 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %138
  store i32 1, ptr %139, align 4
  %140 = load i32, ptr @X_SIZE, align 4
  %141 = mul i32 9, %140
  %142 = add i32 %141, 15
  %143 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %142
  store i32 1, ptr %143, align 4
  store i32 0, ptr @s, align 4
  br label %loop_step

loop_step:                                        ; preds = %y_loop_end, %entry
  %144 = load i32, ptr @s, align 4
  %145 = icmp slt i32 %144, 1000
  %146 = zext i1 %145 to i32
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %step_iteration, label %loop_step_end

step_iteration:                                   ; preds = %loop_step
  store i32 0, ptr @y, align 4
  br label %y_loop

loop_step_end:                                    ; preds = %loop_step
  ret void

y_loop:                                           ; preds = %x_loop_end, %step_iteration
  %148 = load i32, ptr @y, align 4
  %149 = load i32, ptr @Y_SIZE, align 4
  %150 = icmp slt i32 %148, %149
  %151 = zext i1 %150 to i32
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %y_loop_iteration, label %y_loop_end

y_loop_iteration:                                 ; preds = %y_loop
  store i32 0, ptr @x, align 4
  br label %x_loop

y_loop_end:                                       ; preds = %y_loop
  call void @llvm.arch52.flush()
  call void @step()
  call void @swappp()
  %153 = load i32, ptr @s, align 4
  %154 = add i32 %153, 1
  store i32 %154, ptr @s, align 4
  br label %loop_step

x_loop:                                           ; preds = %color_cell_endif, %y_loop_iteration
  %155 = load i32, ptr @x, align 4
  %156 = load i32, ptr @X_SIZE, align 4
  %157 = icmp slt i32 %155, %156
  %158 = zext i1 %157 to i32
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %x_loop_iteration, label %x_loop_end

x_loop_iteration:                                 ; preds = %x_loop
  %160 = load i32, ptr @y, align 4
  %161 = load i32, ptr @X_SIZE, align 4
  %162 = mul i32 %160, %161
  %163 = load i32, ptr @x, align 4
  %164 = add i32 %162, %163
  %165 = getelementptr [1250 x i32], ptr @alive, i32 0, i32 %164
  %166 = load i32, ptr %165, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %black_cell, label %white_cell

x_loop_end:                                       ; preds = %x_loop
  %168 = load i32, ptr @y, align 4
  %169 = add i32 %168, 1
  store i32 %169, ptr @y, align 4
  br label %y_loop

black_cell:                                       ; preds = %x_loop_iteration
  %170 = load i32, ptr @counter_black_cells, align 4
  %171 = add i32 %170, 1
  store i32 %171, ptr @counter_black_cells, align 4
  %172 = load i32, ptr @x, align 4
  %173 = load i32, ptr @y, align 4
  call void @llvm.arch52.putdisplaypixel(i32 %172, i32 %173, i32 -16777216)
  br label %color_cell_endif

white_cell:                                       ; preds = %x_loop_iteration
  %174 = load i32, ptr @counter_white_cells, align 4
  %175 = add i32 %174, 1
  store i32 %175, ptr @counter_white_cells, align 4
  %176 = load i32, ptr @x, align 4
  %177 = load i32, ptr @y, align 4
  call void @llvm.arch52.putdisplaypixel(i32 %176, i32 %177, i32 -1)
  br label %color_cell_endif

color_cell_endif:                                 ; preds = %white_cell, %black_cell
  %180 = load i32, ptr @x, align 4
  %181 = add i32 %180, 1
  store i32 %181, ptr @x, align 4
  br label %x_loop
}
