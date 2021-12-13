import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
import reportWebVitals from "./reportWebVitals";
import store from "./redux/store";
import { Provider } from "react-redux";
import "./styles/reset.css";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Mint from "./mint"
import Home from "./home"

ReactDOM.render(
      
    <Provider store={store}>
    <Router>
      <Routes>
        
        <Route path="/" element={<Home />}/>
        <Route path="/mint" element={<Mint />} />
      </Routes>
    </Router>
  </Provider>,
  
    document.getElementById("root") 
  
);



// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
