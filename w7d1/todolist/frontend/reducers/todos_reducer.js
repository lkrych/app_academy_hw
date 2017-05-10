import merge from "lodash/merge";

import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);

  const newState = {};

  switch(action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach((el) => (newState[el.id] = el));
      return newState;

    case RECEIVE_TODO:
      Object.assign(newState, state);
      newState[action.todo.id] = action.todo;
      return newState;

    case REMOVE_TODO:
      Object.assign(newState, state);
      delete newState[action.id];
      return newState;

    default:
      return state;
  }
};

export default todosReducer;
