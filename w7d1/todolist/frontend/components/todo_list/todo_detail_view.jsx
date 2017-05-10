import React, { Component } from "react";

class TodoDetailView extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    if (this.props.hidden){
      return (
        <div></div>
      );
    }
    return (
      <div>
        <p>{this.props.item.body}</p>
        <button onClick={() => this.props.removeTodo(this.props.item.id)}>Delete Todo</button>
      </div>
    );
  }
}

export default TodoDetailView;
