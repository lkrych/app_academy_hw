import React, { Component } from 'react';

import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends Component {
  constructor(props){
    super(props);
    this.state = {
      hidden: true
    };

    this.updateTodo = this.updateTodo.bind(this);
    this.toggleView = this.toggleView.bind(this);
  }

  updateTodo(e){
    e.preventDefault();
    let newTodo = Object.assign({},this.props.item);
    newTodo.done = !this.props.item.done;
    this.props.receiveTodo(newTodo);
  }

  toggleView(e){
    e.preventDefault();
    let newState = !this.state.hidden;
    this.setState({hidden: newState});
  }

  render(){
    return (
      <li>
        <h1 onClick={this.toggleView}>{this.props.item.title}</h1>
        <button onClick ={this.updateTodo}> {this.props.item.done ? "UNDO" : "DONE"}</button>
        <TodoDetailViewContainer hidden={this.state.hidden} item={this.props.item} />
      </li>
    );
  }
}

export default TodoListItem;
