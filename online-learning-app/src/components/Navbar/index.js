// src/components/Navbar/index.js
import "./Navbar.css";
import React from "react";
import { NavLink } from "react-router-dom";
import Submenu from "../Submenu";
class Navbar extends React.Component {
  state = {
    tag: [
      {
        name: "Livros",
        link: "tags/livros"
      },
      {
        name: "Arduino",
        link: "tags/arduino"
      },
      {
        name: "Desenho",
        link: "tags/desenho"
      }
    ]
  };

  render() {
    return (
      <div>
        {" "}
        <nav className="navbar sticky-top	menu navbar-expand-lg navbar-dark">
          <NavLink to="/">C A M P U S</NavLink>
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon" />
          </button>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav">
              <li className="nav-item active">
                <NavLink to="/">
                  Home <span className="sr-only">(current)</span>
                </NavLink>
              </li>{" "}
              <li className="nav-item active">
                <NavLink to="/">
                  Home <span className="sr-only">(current)</span>
                </NavLink>
              </li>{" "}
              <li className="nav-item active">
                <NavLink to="/">
                  Home <span className="sr-only">(current)</span>
                </NavLink>
              </li>{" "}
              <li className="nav-item active">
                <NavLink to="/">
                  Home <span className="sr-only">(current)</span>
                </NavLink>
              </li>
            </ul>
          </div>
        </nav>
        <Submenu tags={this.state.tag} />
      </div>
    );
  }
}
export default Navbar;
