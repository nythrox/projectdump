// src/components/Submenu/index.js
import "./Submenu.css";
import React from "react";
import { Link } from "react-router-dom";

class Submenu extends React.Component {
  render() {
    return (
      <nav className="submenu">
        <div className="submenu-content">
          <ul>
          {this.props.tags.map((
                counter,
                key //counter is each element in counters with the info
              ) => (
               
               <li key={key} >
               <Link to={"tags/"+counter.name}>{counter.name}</Link>
             </li>
              ))}
          </ul>
        </div>
      </nav>
    );
  }
}
export default Submenu;
