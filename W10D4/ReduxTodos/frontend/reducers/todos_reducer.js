
import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "pair program",
    body: "with Alvin and Jenn",
    done: true
  },
  2: {
    id: 2,
    title: "homework",
    body: "learn middleware and think about project ideas",
    done: false
  }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state); // pure function, don't mutate state!!
  let nextState = Object.assign({}, state) // create copy of state
  switch (action.type) {
    case RECEIVE_TODOS:
      nextState = action.todos;
      return nextState;
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;
    default:
      return state;
  }
};
      
      
export default todosReducer;
