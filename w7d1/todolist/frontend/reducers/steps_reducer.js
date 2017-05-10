import {RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP} from "../actions/step_actions";


const initialState = {
  1: { // this is the step with id = 1
    id: 1,
    title: "walk to store",
    done: false,
    todo_id: 1
  },
  2: { // this is the step with id = 2
    id: 2,
    title: "buy soap",
    done: false,
    todo_id: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);

  const newState = {};

  switch(action.type){
    case RECEIVE_STEPS:
      action.steps.forEach((el) => (newState[el.id] = el));
      return newState;

    case RECEIVE_STEP:
      Object.assign(newState, state);
      newState[action.step.id] = action.step;
      return newState;

    case REMOVE_STEP:
      Object.assign(newState, state);
      delete newState[action.id];
      return newState;

    default:
      return state;
  }
};

export default stepsReducer;
