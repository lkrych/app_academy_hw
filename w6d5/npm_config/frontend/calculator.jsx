import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {  result: 0,
                    num1: '',
                    num2: ''
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.clear = this.clear.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  setNum1(e) {
    event.preventDefault();
    if(e.target.value === ''){
      this.setState( {num1: e.target.value});
    }else{
      this.setState( {num1: parseInt(e.target.value)});
    }
  }

  setNum2(e) {
    event.preventDefault();
    if(e.target.value === ''){
      this.setState( {num2: e.target.value});
    }else{
      this.setState( {num2: parseInt(e.target.value)});
    }
  }

  add(e){
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({result});
  }

  subtract(e){
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }

  multiply(e){
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  divide(e){
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }

  clear(e){
    e.preventDefault();
    this.setState({
      result: 0,
      num1: '',
      num2: ''
    });
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange ={this.setNum1} value={this.state.num1}/>
        <input type="text" onChange ={this.setNum2} value={this.state.num2}/>
        <button type="button" onClick = {this.clear} >Clear</button>
        <br />
        <button type="button" onClick = {this.add}  >+</button>
        <button type="button" onClick = {this.subtract} value="-" >-</button>
        <button type="button" onClick = {this.multiply} value="*" >*</button>
        <button type="button" onClick = {this.divide} value="/" >/</button>
      </div>
    );
  }
}

export default Calculator;
