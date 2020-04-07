
import React, { Component } from 'react'
import './App.css';
import axios from "axios";
import { LineChart, Line, CartesianGrid, XAxis, YAxis, Tooltip } from 'recharts';

const electron = window.require("electron")
const {remote,ipcRenderer} = window.require('electron');
const { BrowserWindow, dialog, shell } = remote;

class App extends Component {
  
  constructor(props) {
    super(props);
    this.state = {
      test:1,
      data:[]
    };
  }

  

  componentDidMount() {
    ipcRenderer.on('asynchronous-reply', (event, message) => { 
               console.log(message,'msg from main process') 
           });

    console.log('compononent did mount');
    axios.get('http://localhost:4000/mezoko/orders')
  .then(res =>{
    this.setState({data:res.data.result})
  })
  .catch(function (error) {
    // handle error
    console.log(error);
  })
  
  }
  
  
  tester = () => {
    this.setState({test:4})
  }

  printPDF = async () => {
    ipcRenderer.send('asynchronous-message', 'ping');
  }

  render() {

    let renderLineChart;
    if(this.state.data.length>0){
      renderLineChart = (
        <LineChart width={1200} height={400} data={this.state.data}>
          <Line type="monotone" dataKey="sum" stroke="#8884d8" />
          <CartesianGrid stroke="#ccc" strokeDasharray="5 5" />
          <XAxis dataKey="year" />
            <YAxis />
            <Tooltip />
        </LineChart>

      );
    }else{
      renderLineChart = <p>nope</p>
    }


    console.log(this.state.data)
    return (
      <div>
        <button type="button" onClick={() => this.tester()}>Test</button>
      {renderLineChart}
      <button onClick={() => this.printPDF()}>Label</button>
      </div>
    );
  }
}

//https://github.com/jerairrest/react-chartjs-2

export default App;

