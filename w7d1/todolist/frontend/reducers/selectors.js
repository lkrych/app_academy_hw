export const allTodos = (state) => (
  Object.keys(state.todos).map(id => state.todos[id])
);

export const stepsByTodoId = (state, todoId) => (
  Object.keys(state.steps).map(id => state.steps[id]).filter(obj => obj.todo_id === todoId)
);
